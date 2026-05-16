<?php
require_once('db.php');
require_once('mail.php');
$mail = new mail();

class User extends db
{

    function generateRandomString($length = 6)
    {
        $characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    public function checkUser($userid, $field, $searchvalue)
    {
        $sql = "CALL sp_checkuser({$userid},'{$field}','{$searchvalue}')";
        $rst = $this->getData($sql);
        if ($rst->rowCount()) {
            return true;
        } else {
            return false;
        }
    }

    public function saveUser($userid, $username, $password, $salt, $firstname, $middlename, $lastname, $mobile, $email, $role, $accountactive, $changepasswordonlogon, $profilephoto)
    {
        // check username
        if ($this->checkUser($userid, 'username', $username)) {
            return ["status" => "exists", "message" => "Sorry, the username is already in use.", 'category' => 'username'];
        } else if ($this->checkUser($userid, 'email', $email)) {
            //check email 
            return ["status" => "exists", "message" => "Sorry, the email address is already in use.", 'category' => 'email'];
        } else if ($this->checkUser($userid, 'mobile', $mobile)) {
            // check mobile
            return ["status" => "exists", "message" => "Sorry, the mobile phone number is already in use.", 'category' => 'mobile'];
        } else {
            $password = hash('SHA256', $password . $salt);
            $sql = "CALL  sp_saveuser({$userid},'{$password}','{$salt}',{$role},'{$username}','{$firstname}','{$middlename}','{$lastname}','{$email}','{$mobile}',{$changepasswordonlogon},{$accountactive},'{$profilephoto}',{$_SESSION['userid']},'{$this->platform}')";
            // echo $sql."<br/>";
            $rst = $this->getData($sql);
            //echo $sql."<br/>";.
            // $row=$rst->fetch(PDO::FETCH_ASSOC);
            do {
                $row = $rst->fetch();
                if (array_key_exists("userid", $row)) {
                    return ["status" => "success", "userid" => $row['userid']];
                }
            } while ($rst->nextRowset());
        }
    }

    public function getUserNameFromId($id)
    {
        $sql = "CALL sp_getuserbyid ({$id})";
        $rst = $this->connect()->query($sql);
        if ($rst->rowCount()) {
            $row = $rst->fetch();
            return $row['username'];
        } else {
            return '';
        }
    }

    public function validateLoginDetails($username, $password)
    {
        $sql = "CALL sp_getuserdetails ('{$username}')";
        $rst = $this->connect()->query($sql);
        if ($rst->rowCount() > 0) {
            while ($row = $rst->fetch()) {
                if ($row['password'] == hash('SHA256', $password . $row['salt'])) {
                    return ["status" => "success", "message" => "ok"];
                } else {
                    return ["status" => "failed", "message" => "invalid password"];
                }
            }
        } else {
            return ["status" => "failed", "message" => "invalid username"];
        }
    }


    public function checkUserAccount($id, $username)
    {
        $sql = "CALL sp_checkuser ({$id},'{$username}')";
        $rst = $this->connect()->query($sql);
        if ($rst->rowCount()) {
            return true;
        } else {
            return false;
        }
    }

    public function disableUserAccount($id, $reason)
    {
        $sql = "CALL sp_disableuseraccount ({$id},'{$reason}',{$this->userid},'{$this->platform}')";
        $rst = $this->connect()->query($sql);
        return ["status" => "success", "message" => "user account disabled successfully"];
    }

    public function enableUserAccount($id)
    {
        $sql = "CALL sp_enableuseraccount ({$id},{$this->userid},'{$this->platform}')";
        $rst = $this->connect()->query($sql);
        return ["status" => "success", "message" => "user account enabled successfully"];
    }

    public function changeUserPassword($id, $oldpassword, $newpassword, $changepasswordonlogon)
    {
        $username = $this->getUserNameFromId($id);
        $salt = $this->uniqidReal(30);
        // echo $this->validateLoginDetails($username,$password);

        if ($this->validateLoginDetails($username, $oldpassword)["status"] == "success") {
            $newpassword = hash('SHA256', $newpassword . $salt);
            $sql = "CALL sp_changeuserpassword ({$id},'{$newpassword}','{$salt}',{$changepasswordonlogon})";
            $rst = $this->connect()->query($sql);

            // email user informing them their password was changed
            $username = $this->getUserNameFromId($id);
            $sql = "CALL sp_getuserdetails('{$username}')";
            $rst = $this->connect()->query($sql)->fetch();
            $fullname = "{$rst['firstname']} {$rst['middlename']}";
            $emailaddress = $rst['email'];

            // Get company details for template
            $compSql = "SELECT companyname, physicaladdress, email as supportemail, phonenumber as supportphone FROM companydetails LIMIT 1";
            $compRst = $this->connect()->query($compSql)->fetch();
            $companyname = $compRst['companyname'] ?? 'Jukam Farm';
            $physicaladdress = $compRst['physicaladdress'] ?? '';
            $supportemail = $compRst['supportemail'] ?? 'support@jukamfarm.com';
            $supportphone = $compRst['supportphone'] ?? '+254 700 000 000';

            // Load and populate template
            $templatePath = __DIR__ . "/../templates/emails/passwordchangednotification.html";
            $message = file_get_contents($templatePath);

            $placeholders = [
                '{{fullname}}' => $fullname,
                '{{companyname}}' => $companyname,
                '{{documenttitle}}' => 'Password Security Update',
                '{{year}}' => date('Y'),
                '{{physicaladdress}}' => $physicaladdress,
                '{{supportemail}}' => $supportemail,
                '{{supportphonenumber}}' => $supportphone
            ];

            foreach ($placeholders as $key => $value) {
                $message = str_replace($key, $value, $message);
            }

            $subject = "Security Notification: Password Changed Successfully";
            $GLOBALS['mail']->sendEmail($emailaddress, $subject, $message, 'Security Updates');

            $_SESSION['must_change_password'] = false;
            return ["status" => "success", "message" => "user password changed successfully"];
        } else {
            return ["status" => "failed", "message" => "invalid old pasword"];
        }

    }

    public function loginuser($username, $password)
    {
        $sql = "CALL sp_getuserdetails ('{$username}')";
        // echo $sql."<br/>";
        $rst = $this->connect()->query($sql);
        if ($rst->rowCount()) {
            $row = $rst->fetch();
            // echo $row['password'].'\n\n';
            // echo hash('SHA256',$password.$row['salt']);
            if ($row['password'] === hash('SHA256', $password . $row['salt'])) {
                if ($row['status'] == 'active') {
                    $_SESSION['userid'] = $row['userid'];
                    $_SESSION['username'] = $row['username'];
                    $_SESSION['firstname'] = $row['firstname'];
                    $_SESSION['middlename'] = $row['middlename'];
                    $_SESSION['lastname'] = $row['lastname'];
                    $_SESSION['roleid'] = $row['roleid'];
                    $_SESSION['rolename'] = $row['rolename'] ?? $row['category'];
                    $_SESSION['category'] = $row['category'];
                    $_SESSION['profilephoto'] = $row['profilephoto'] ?? "";
                    if ($row['changepasswordonlogon'] == true) {
                        $_SESSION['must_change_password'] = true;
                        return ["status" => "change password", "message" => "change password", "userid" => $row['userid'], "category" => $row['category']];
                    } else {
                        $_SESSION['must_change_password'] = false;
                        return ["status" => "success", "message" => "login successful", "userid" => $row['userid'], "category" => $row['category']];
                    }
                } else {
                    return ["status" => "inactive", "message" => "account inactive", "userid" => $row['userid']];
                }
            } else {
                return ["status" => "invalid", "message" => "invalid credentials"];
            }
        } else {
            return ["status" => "invalid", "message" => "invalid credentials"];
        }
    }

    public function logUserOut()
    {
        session_destroy();
    }

    public function getUsers()
    {
        $sql = "CALL sp_getallusers()";
        $rst = $this->connect()->query($sql);
        echo json_encode($rst->fetchAll(PDO::FETCH_ASSOC));
    }

    public function getUserDetails($userid)
    {
        $username = $this->getUserNameFromId($userid);
        $sql = "CALL sp_getuserdetails('{$username}')";
        return $this->getJSON($sql);
    }

    public function deleteUser($userid)
    {
        $sql = "CALL sp_deleteuser ({$userid},{$_SESSION['userid']})";
        $rst = $this->connect()->query($sql);
        return ["status" => "success", "message" => "The user has been deleted successfully."];
    }

    public function getLoggedInUserName()
    {
        return json_encode(isset($_SESSION['username']) ? $_SESSION['username'] : "");
    }

    public function getloggedinUserId()
    {
        return json_encode(isset($_SESSION['userid']) ? $_SESSION['userid'] : "");
    }

    public function logoffUser()
    {
        session_unset();
    }

    public function saveUserPrivilege($userid, $object, $valid)
    {
        $sql = "CALL sp_saveuserprivilege ({$userid},{$object},{$valid},{$_SESSION['userid']})";
        $rst = $this->connect()->query($sql);
        return ["status" => "success", "message" => "user privilege saved successfully"];
    }

    public function checkUserPrivilege($objectcode)
    {
        $userid = $this->userid;
        $sql = "CALL sp_validateuserprivilege({$userid},'{$objectcode}')";
        // echo $sql."<br/>";
        $rst = $this->connect()->query($sql);
        if ($rst->rowCount()) {
            return $rst->fetch()['allowed'];
        } else {
            return 0;
        }
    }

    public function getUsersList()
    {
        $sql = "CALL sp_getallusers()";
        return $this->getJSON($sql);
    }

    public function getUserRoles($userid)
    {
        $sql = "CALL sp_getuserroles({$userid})";
        return $this->getJSON($sql);
    }

    public function getObjects($moduleid)
    {
        $sql = "CALL sp_getobjects('{$moduleid}')";
        return $this->getJSON($sql);
    }

    public function getModulePrivileges($module)
    {
        $sql = "CALL sp_getmoduleprivileges('{$module}')";
        return $this->getJSON($sql);
    }

    function getRoles()
    {
        $sql = "CALL sp_getroles()";
        return $this->getJSON($sql);
    }

    function getRoleUsers($roleid)
    {
        $sql = "CALL sp_getroleusers({$roleid})";
        return $this->getJSON($sql);
    }

    function getRoleDetails($roleid)
    {
        $sql = "CALL sp_getroledetails({$roleid})";
        return $this->getJSON($sql);
    }

    function getRolesForAssignment()
    {
        $sql = "CALL sp_getrolesforuserassignment()";
        return $this->addUserToRolegetJSON($sql);

    }

    function getRolePrivileges($roleid, $module = 'ALL')
    {
        $sql = "CALL sp_getroleprivileges({$roleid},'{$module}')";
        return $this->getJSON($sql);
    }

    function getUserNonRoles($userid)
    {
        $sql = "CALL sp_getnonuserroles({$userid})";
        return $this->getJSON($sql);
    }

    function removeUserRole($userroleid)
    {
        $sql = "CALL `sp_removeuserrole`({$userroleid},{$this->userid},'{$this->platform}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "user role removed successfully"];
    }

    function getUserPrivileges($userid)
    {
        $sql = "CALL sp_getuserprivileges({$userid})";
        return $this->getJSON($sql);
    }

    function getUsernameFromUserId($userid)
    {
        $sql = "CALL sp_getusernamefromuserid({$userid})";
        //echo $sql."<br/>";
        $rst = $this->getData($sql);
        return $rst->rowCount() ? $rst->fetch()['username'] : '';
    }

    function getuseridfromname($username)
    {
        $sql = "CALL sp_getuserdetails ('{$username}')";
        $rst = $this->getData($sql);
        return $rst->rowCount() ? $rst->fetch()['userid'] : '';
    }

    function saveTempPrivileges($refno, $id, $objectid, $valid)
    {
        // id is either userid or role id
        $sql = "CALL sp_savetempprivilege('{$refno}',{$id},{$objectid},{$valid})";
        $rst = $this->getData($sql);
        if ($rst) {
            return ["status" => "success", "message" => 'temp privilege saved successfully'];
        }
    }

    function checkRole($roleid, $rolename)
    {
        $sql = "CALL spcheckrole({$roleid},'{$rolename}')";
        $rst = $this->getData($sql);
        return $rst->rowCount();
    }

    function savePrivileges($refno, $userid, $category)
    {
        // category is either user or role
        $sql = "CALL sp_saveprivileges({$userid},'{$category}','{$refno}',{$_SESSION['userid']})";
        //echo $sql."<br/>";
        $rst = $this->getData($sql);
        return ["status" => "success", "message" => "user privileges saved successfully"];
    }

    function saveRole($roleid, $rolename, $roledescription)
    {
        if ($this->checkRole($roleid, $rolename)) {
            return ["status" => "exists", "message" => "role exists in the system"];
        } else {
            $sql = "CALL sp_saverole({$roleid},'{$rolename}','{$roledescription}',{$_SESSION['userid']})";
            //echo $sql;
            $rst = $this->getData($sql);
            //if($rst->rowCount()){
            $row = $rst->fetch(PDO::FETCH_ASSOC);
            return ["status" => "success", "roleid" => $row['roleid'], "message", "role saved successfully"];
        }
    }

    function resetUserPassword($id, $newpassword, $category = "user", $sendemail = 1)
    {
        $logFile = "c:/xampp/htdocs/dairyfarm/debug.log";
        error_log("--- Starting resetUserPassword for ID: $id ---\n", 3, $logFile);
        try {
            $userid = $id;
            $salt = $this->uniqidReal(30);
            if ($newpassword == '') {
                $newpassword = $this->generateRandomString(6);
            }

            $encryptedpassword = hash('SHA256', $newpassword . $salt);
            $sql = "CALL sp_changeuserpassword ({$id},'{$encryptedpassword}','{$salt}',1)";
            error_log("Executing: $sql\n", 3, $logFile);
            $this->connect()->query($sql);

            if ($sendemail == 1) {
                // get users details
                $username = $this->getUserNameFromId($userid);
                error_log("Fetching details for username: $username\n", 3, $logFile);
                $sql = "CALL sp_getuserdetails('{$username}')";
                $rst = $this->connect()->query($sql)->fetch();

                if (!$rst) {
                    error_log("User details NOT FOUND for username: $username\n", 3, $logFile);
                }

                $fullname = isset($rst['firstname']) ? "{$rst['firstname']} {$rst['middlename']} {$rst['lastname']}" : "User";
                $emailaddress = isset($rst['email']) ? $rst['email'] : "";

                // Fetch company details
                $compSql = "SELECT companyname, emailaddress as supportemail, mobileno as supportphone, logopath FROM companydetails LIMIT 1";
                $compRst = $this->connect()->query($compSql)->fetch();

                $companyname = isset($compRst['companyname']) ? $compRst['companyname'] : "JUKAM Dairy Limited";
                $supportphone = isset($compRst['supportphone']) ? $compRst['supportphone'] : "+254 722 000 999";
                $supportemail = isset($compRst['supportemail']) ? $compRst['supportemail'] : "admin@jukamdairy.co.ke";
                $companylogo = isset($compRst['logopath']) ? $compRst['logopath'] : "images/logo.png";

                // email the user their password change
                $template_file = "../templates/emails/resetuserpasswordnotification.html";
                if (file_exists($template_file)) {
                    $emailmessage = file_get_contents($template_file);
                    $documenttitle = ($category == "user") ? "System Password Reset Notification" : "Employee Portal Password Reset Notification";

                    // Fetch current admin details for signature
                    $adminId = $_SESSION['userid'] ?? 5;
                    $adminSql = "SELECT u.firstname, u.lastname, u.profilephoto, r.rolename 
                                    FROM user u 
                                    LEFT JOIN roles r ON u.roleid = r.roleid 
                                    WHERE u.userid = $adminId LIMIT 1";
                    $adminRst = $this->connect()->query($adminSql)->fetch();

                    $adminName = isset($adminRst['firstname']) ? "{$adminRst['firstname']} {$adminRst['lastname']}" : "System Administrator";
                    $adminRole = isset($adminRst['rolename']) ? $adminRst['rolename'] : "Administrator";
                    $adminPhoto = isset($adminRst['profilephoto']) && !empty($adminRst['profilephoto']) ? $adminRst['profilephoto'] : "images/blankavatar.jpg";

                    $swap_var = array(
                        "{{companyname}}" => $companyname,
                        "{{companylogo}}" => $companylogo,
                        "{{documenttitle}}" => $documenttitle,
                        "{{employeename}}" => $fullname,
                        "{{newpassword}}" => $newpassword,
                        "{{username}}" => $username,
                        "{{supportemail}}" => $supportemail,
                        "{{supportphonenumber}}" => $supportphone,
                        "{{year}}" => date("Y"),
                        "{{adminname}}" => $adminName,
                        "{{adminrole}}" => strtoupper($adminRole),
                        "{{adminphoto}}" => $adminPhoto
                    );

                    // search and replace all swap variables with actual contents
                    foreach (array_keys($swap_var) as $key) {
                        if (strlen($key) > 2 && trim($key) !== "") {
                            $emailmessage = str_replace($key, $swap_var[$key], $emailmessage);
                        }
                    }

                    error_log("Calling sendEmail for $emailaddress\n", 3, $logFile);
                    $mailObj = new mail();
                    $embedded = [
                        'adminphoto' => __DIR__ . '/../' . $adminPhoto
                    ];
                    $response = $mailObj->sendEmail($emailaddress, $documenttitle, $emailmessage, 'General', '', '', '', $embedded);
                    error_log("sendEmail response: " . json_encode($response) . "\n", 3, $logFile);
                } else {
                    error_log("Email template NOT FOUND: $template_file\n", 3, $logFile);
                }
            }
            return ["status" => "success", "message" => "user password reset succesfully"];
        } catch (\Exception $e) {
            error_log("FATAL ERROR in resetUserPassword: " . $e->getMessage() . "\n", 3, $logFile);
            return ["status" => "error", "message" => "Critical error: " . $e->getMessage()];
        }
    }

    function addUserToRole($userid, $roleid)
    {
        $sql = "CALL sp_saveroleusers({$userid},{$roleid},{$_SESSION['userid']})";
        //echo $sql."<br/>";
        $rst = $this->getData($sql);
        if ($rst) {
            return ["status" => "success", "message" => "user added to role successfully"];
        }
    }

    function getsystemadmins()
    {
        $sql = "CALL `sp_getsystemadmins`()";
        return $this->getJSON($sql);
    }

    function saveusercompany($userid, $companyid)
    {
        $sql = "CALL `sp_addusercompamy`({$userid},{$companyid},{$this->userid},'{$this->platform}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "user added to company successfully"];
    }

    function getuserassignedcompanies($userid)
    {
        $sql = "CALL `sp_getusercompanies`({$userid})";
        return $this->getJSON($sql);
    }

    function getuserunassignedcompanies($userid)
    {
        $sql = "CALL `sp_getusernonassignedcompanies`({$userid})";
        // echo $sql."<br/>";
        return $this->getJSON($sql);
    }

    function saveuserunit($userid, $unitid, $allowed)
    {
        $sql = "CALL `sp_saveuserunit`({$userid},{$unitid},{$allowed},{$this->userid},'{$this->platform}')";
        // echo $sql;
        $this->getData($sql);
        return ["status" => "success", "message" => "unit attached successfully to the user"];
    }

    function getuserunits($userid)
    {
        $sql = "CALL `sp_getuserunits`({$userid})";
        return $this->getJSON($sql);
    }

    function removeuserunit($userunitid)
    {
        $sql = "CALL `sp_removeusercompany`({$userunitid},{$this->userid},'{$this->platform}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "user unit removed successfully"];
    }

    public function saveUserPrivileges($userid, $privileges)
    {
        // 1. Clear existing privileges
        $sql = "CALL sp_clearuserprivileges({$userid})";
        $this->connect()->query($sql);

        // 2. Save new privileges
        if (!empty($privileges)) {
            foreach ($privileges as $objectid) {
                $sql = "CALL sp_saveuserprivilege({$userid}, {$objectid}, {$_SESSION['userid']})";
                $this->connect()->query($sql);
            }
        }
        return ["status" => "success", "message" => "User privileges saved successfully"];
    }

    public function validatePrivilege($userid, $objectcode)
    {
        $sql = "CALL sp_validateuserprivilege($userid, '$objectcode')";
        $rst = $this->connect()->query($sql);
        if ($rst) {
            $row = $rst->fetch();
            return ($row['allowed'] == 1);
        }
        return false;
    }

    public function logAccessDenied($userid, $objectcode)
    {
        $narration = "Access Denied for object code: $objectcode";
        $sql = "INSERT INTO audittrail (userid, operation, narration, timestamp, platform) 
                    VALUES ($userid, 'Access Denied', '$narration', NOW(), '{$this->platform}')";
        $this->getData($sql);
    }

    public function getDistributionPoints()
    {
        $sql = "CALL sp_getdistributionpoints()";
        $rst = $this->connect()->query($sql);
        return $rst ? $rst->fetchAll(PDO::FETCH_ASSOC) : [];
    }

    public function getDistributionPoint($id)
    {
        $id = (int) $id;
        $sql = "SELECT * FROM distributionpoints WHERE distributionpointid = $id";
        $rst = $this->connect()->query($sql);
        return $rst ? $rst->fetch(PDO::FETCH_ASSOC) : null;
    }

    public function saveDistributionPoint($id, $name, $location, $contactperson, $contactphone, $userid)
    {
        $id = (int) $id;
        $sql = "CALL sp_savedistributionpoint($id, '$name', '$location', '$contactperson', '$contactphone', $userid)";
        $rst = $this->connect()->query($sql);
        if ($rst) {
            return $rst->fetch(PDO::FETCH_ASSOC);
        }
        return ["status" => "error", "message" => "Could not save distribution point"];
    }

    public function deleteDistributionPoint($id, $userid)
    {
        $id = (int) $id;
        $sql = "CALL sp_deletedistributionpoint($id, $userid)";
        $rst = $this->connect()->query($sql);
        if ($rst) {
            return $rst->fetch(PDO::FETCH_ASSOC);
        }
        return ["status" => "error", "message" => "Could not delete distribution point"];
    }

    public function getDisbursements($start = null, $end = null)
    {
        $start = $start ? "'$start'" : "NULL";
        $end = $end ? "'$end'" : "NULL";
        $sql = "CALL sp_getmilkdisbursements($start, $end)";
        $rst = $this->connect()->query($sql);
        return $rst ? $rst->fetchAll(PDO::FETCH_ASSOC) : [];
    }

    public function getDistributionStats()
    {
        $sql = "CALL sp_getdistributionstats()";
        $rst = $this->connect()->query($sql);
        return $rst ? $rst->fetch(PDO::FETCH_ASSOC) : null;
    }

    public function saveDisbursement($id, $pointid, $volume, $ref, $collector, $userid)
    {
        $date = date('Y-m-d');
        $sql = "CALL sp_savemilkdisbursement($id, '$date', $pointid, $volume, 0, '$ref', '$collector', $userid)";
        $rst = $this->connect()->query($sql);
        if ($rst) {
            return $rst->fetch(PDO::FETCH_ASSOC);
        }
        return ["status" => "error", "message" => "Could not save disbursement"];
    }

    public function getDistributionTrends()
    {
        $sql = "CALL sp_getdistributiontrends()";
        $rst = $this->connect()->query($sql);
        return $rst ? $rst->fetchAll(PDO::FETCH_ASSOC) : [];
    }

    public function getHubMarketShare()
    {
        $sql = "CALL sp_gethubmarketshare()";
        $rst = $this->connect()->query($sql);
        return $rst ? $rst->fetchAll(PDO::FETCH_ASSOC) : [];
    }

    // --- Poultry Distribution & Egg Logistics ---

    function getPoultryDistributionPoints()
    {
        $branchid = $_SESSION['branchid'] ?? 1;
        $sql = "SELECT * FROM poultry_distribution_points WHERE branchid = $branchid AND deleted = 0 ORDER BY pointname ASC";
        return $this->getData($sql)->fetchAll(PDO::FETCH_ASSOC);
    }

    function getPoultryDistributionPoint($id)
    {
        $sql = "SELECT * FROM poultry_distribution_points WHERE pointid = $id";
        return $this->getData($sql)->fetch(PDO::FETCH_ASSOC);
    }

    function savePoultryDistributionPoint($id, $name, $location, $contactperson, $contactphone, $userid)
    {
        try {
            $branchid = $_SESSION['branchid'] ?? 1;
            $db = $this->connect();
            $stmt = $db->prepare("CALL sp_savepoultrydistributionpoint(?, ?, ?, ?, ?, ?, ?)");
            $stmt->execute([$id, $name, $location, $contactperson, $contactphone, $branchid, $userid]);
            return ["status" => "success", "message" => "Distribution point saved successfully"];
        } catch (Exception $e) {
            return ["status" => "error", "message" => "Database error: " . $e->getMessage()];
        }
    }

    function deletePoultryDistributionPoint($id, $userid)
    {
        $sql = "UPDATE poultry_distribution_points SET deleted = 1 WHERE pointid = $id";
        $this->getData($sql);
        return ["status" => "success", "message" => "Distribution point deleted"];
    }

    function getEggDisbursements()
    {
        $branchid = $_SESSION['branchid'] ?? 1;
        $sql = "SELECT e.*, p.pointname 
                    FROM egg_disbursements e 
                    JOIN poultry_distribution_points p ON e.pointid = p.pointid 
                    WHERE e.branchid = $branchid AND e.deleted = 0 
                    ORDER BY e.disbursementdate DESC, e.dateadded DESC";
        return $this->getData($sql)->fetchAll(PDO::FETCH_ASSOC);
    }

    function saveEggDisbursement($id, $pointid, $quantity, $collector, $batch, $narration, $userid)
    {
        try {
            $branchid = $_SESSION['branchid'] ?? 1;
            $date = date('Y-m-d');
            $db = $this->connect();
            $stmt = $db->prepare("CALL sp_saveeggdisbursement(?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->execute([$id, $pointid, $date, $quantity, $collector, $narration, $batch, $branchid, $userid]);
            return ["status" => "success", "message" => "Egg disbursement recorded successfully"];
        } catch (Exception $e) {
            return ["status" => "error", "message" => "Database error: " . $e->getMessage()];
        }
    }

    function deleteEggDisbursement($id, $userid)
    {
        $sql = "UPDATE egg_disbursements SET deleted = 1 WHERE disbursementid = $id";
        $this->getData($sql);
        return ["status" => "success", "message" => "Disbursement record deleted"];
    }

    function getPoultryDistributionStats()
    {
        $branchid = $_SESSION['branchid'] ?? 1;
        $sql = "CALL sp_getpoultrydistributionstats($branchid)";
        $rst = $this->getData($sql);
        $stats = $rst ? $rst->fetch(PDO::FETCH_ASSOC) : null;

        $pointsSql = "SELECT COUNT(*) as total FROM poultry_distribution_points WHERE branchid = $branchid AND deleted = 0";
        $points = $this->getData($pointsSql)->fetch(PDO::FETCH_ASSOC);

        if ($stats) {
            $stats['total_points'] = $points['total'] ?? 0;
        } else {
            $stats = ['total_today' => 0, 'total_month' => 0, 'peak_hub' => 'N/A', 'peak_vol' => 0, 'total_points' => $points['total'] ?? 0];
        }
        return $stats;
    }

    function getPoultryDistributionTrends()
    {
        $branchid = $_SESSION['branchid'] ?? 1;
        $sql = "CALL sp_getpoultrydistributiontrends($branchid)";
        return $this->getData($sql)->fetchAll(PDO::FETCH_ASSOC);
    }

    function getPoultryHubMarketShare()
    {
        $branchid = $_SESSION['branchid'] ?? 1;
        $sql = "CALL sp_getpoultryhubmarketshare($branchid)";
        return $this->getData($sql)->fetchAll(PDO::FETCH_ASSOC);
    }
}


?>