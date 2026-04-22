<?php
    require_once("db.php");
    use PHPMailer\PHPMailer\PHPMailer;
    require_once(__DIR__."/../plugins/phpmailer/PHPMailer.php");
    require_once(__DIR__."/../plugins/phpmailer/SMTP.php");
    require_once(__DIR__."/../plugins/phpmailer/Exception.php");

    class mail extends db{
        private $smtpserver;
        private $smtpport;
        private $smtpsecurity;
        private $username;
        private $password;

        function sendEmail($recipient,$subject,$message,$sender,$attachment='',$stringattachment='',$filename=''){
            
            $mail= new PHPMailer();
            $sql="CALL sp_getemailconfiguration()";
            $row=$this->getData($sql)->fetch(PDO::FETCH_ASSOC);
                $this->smtpserver=$row['smtpserver'];
                $this->smtpport=$row['smtpport'];
                $this->username=$row['emailaddress'];
                $this->password=$row['password'];
                $this->smtpsecurity=$row['usessl']==1?'ssl':'tls';

            $mail->isSMTP();
            $mail->Host=$this->smtpserver;
            $mail->SMTPAuth=true;
            $mail->Username=$this->username;
            $mail->Password=$this->password;
            $mail->Port=$this->smtpport;
            $mail->SMTPSecure=PHPMailer::ENCRYPTION_STARTTLS;//$this->smtpsecurity;

            $mail->isHTML(true);
            $mail->SetFrom($this->username,$sender);
            $mail->addAddress($recipient);
            $mail->Subject=$subject;
            $mail->Body=$message;
            
            if($attachment!=""){
                if(is_array($attachment)){
                    foreach($attachment as $attached){
                        $mail->AddAttachment($attached);
                    }
                }else{
                    $mail->AddAttachment($attachment);
                } 
                // $mail->AddAttachment($attachment);
            }

            if($stringattachment!=""){
                $mail->addStringAttachment($stringattachment,$filename);
            }

            if($mail->send()){
                return ["status"=>"success","message"=>"email sent successfully"];
            }else{
                return ["status"=>"error","message"=>$mail->ErrorInfo];
            }
        }

        function getemailparameters(){
            $sql="CALL sp_getemailconfiguration()";
            return $this->getJSON($sql);
        }

        function saveemailparameters($emailaddress,$emailpassword,$smtpserver,$smtpport,$usessl){
            $sql="CALL `sp_saveemailconfiguration`('{$emailaddress}','{$emailpassword}','{$smtpserver}',{$smtpport},{$usessl})";
            // echo $sql;   
            $this->getData($sql);
           return ["status"=>"success"];
        }

        function queueemail($module,$emailfrom,$emailto,$emailsubject,$emailmessage,$attachment=""){
            $emailfrom=str_replace("'","''",$emailfrom);
            $emailsubject=str_replace("'","''",$emailsubject);
            $emailmessage=str_replace("'","''",$emailmessage);
            $sql="CALL `sp_saveemailschedule`('{$module}','{$emailfrom}','{$emailto}','{$emailsubject}','{$emailmessage}','{$attachment}',{$_SESSION['userid']})";
            // echo $sql;
            $this->getData($sql);
            return ["status"=>"success","message"=>"email added to queue successfully"];
        }
    }
?>