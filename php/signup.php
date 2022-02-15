<?php
include 'conn.php';
$name=$_POST['name'];
$email=$_POST['email'];
$password =$_POST['password'];
$sql="INSERT INTO users (id,name,email,password)VALUES('','$name','$email','$password') ";
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
