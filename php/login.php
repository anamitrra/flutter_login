<?php
include 'conn.php';
$email=$_POST['email'];
$password =$_POST['password'];
$sql="SELECT * FROM `users` WHERE email= '$email' AND password= '$password' ";
$result= mysqli_query($conn,$sql);
$count=mysqli_num_rows($result);
      if($count > 0)
{
        while ($row=mysqli_fetch_array($result))
        {
           echo json_encode("success");
            mysqli_close($conn);
        }
    }
    else
    {
        
             echo json_encode("error");
            
    }

?>
