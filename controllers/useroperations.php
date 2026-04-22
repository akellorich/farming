<?php
    require_once("../models/user.php");

    $user= new user();

    if(isset($_POST['loginuser'])){
        $username=$_POST['username'];
        $password=$_POST['password'];
        echo json_encode($user->loginuser($username,$password));
    }

    if(isset($_GET['getloggedinuser'])){
        $response=[];
        if(isset($_SESSION['userid'])){
            $response=["username"=> $_SESSION['username'],
                        "firstname"=>$_SESSION['firstname'],
                        "middlename"=>$_SESSION['middlename'],
                        "lastname"=>$_SESSION['lastname'],
                        "category"=>$_SESSION['category']
            ];
        }
        echo json_encode($response);
    }

    if(isset($_POST['getuserprivilege'])){
        $objectcode=$_POST['objectcode'];
        echo $user->checkUserPrivilege($objectcode);
    }

    if(isset($_POST['saveuser'])){
        $userid=$_POST['userid'];
        $username=$_POST['username'];
        $password=$user->generateRandomString(10);
        $salt=generate_random_no(30);
        $email=$_POST['email'];
        $mobile=$_POST['mobile'];
        $firstname=$_POST['firstname'];
        $middlename=$_POST['middlename'];
        $lastname=$_POST['lastname'];

        if (empty($firstname) || empty($middlename)) {
            echo json_encode(["status" => "error", "message" => "First name and Middle name are required."]);
            exit;
        }

        $roleid=$_POST['roleid'];
        $changepasswordonlogon=$userid==0?1:0;//$_POST['changepasswordonlogon'];
        $accountactive=1;
        if(isset($_FILES['userphoto']['tmp_name'])){
            $tempname=$_FILES['userphoto']['tmp_name'];
            $profilephoto= "../user_profile_photos/{$username}_".$user->generateRandomString(30).'_'.str_replace(' ','_',$_FILES['userphoto']['name']);
            move_uploaded_file($tempname,$profilephoto);
        } else {
            if ($userid == 0) {
                echo json_encode(["status" => "error", "message" => "Profile photo is required."]);
                exit;
            }
            $profilephoto='';
        }
        $response=$user->saveUser($userid,$username,$password,$salt,$firstname,$middlename,$lastname,$mobile,$email,$roleid,$accountactive,$changepasswordonlogon,$profilephoto);
        echo json_encode($response);
    }

    if(isset($_GET['getroles'])){
        echo $user->getRoles();
    }
?>