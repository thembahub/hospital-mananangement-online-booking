<?php if(isset($_POST [ ' FORM_SUBMITTED ']))
	
$severname = "localhost";
$database ="hospital";
$username ="username";
$password ="password ";	

   $link = mysql_connect("localhost" , "hospital ","username ","password");
   if($link === false){ die("error couldnt connect." . mysqli_connect_error());
   }
    //USER_INPUT
   $first_name = mysqli_real_escape_string($link, $_POST[ 'first_name']);
   $last_name =mysqli_real_escape_string($link, $_POST['last_name']);
   $email =mysqli_real_escape_string($link, $_POST['email']);
   $patient_Id =mysqli_real_escape_string($link, $_POST['patient_Id']);
   $patient_Address= mysqli_real_escape_string($link,$_POST['patient_Address']);
   $patient_Number=mysqli_real_escape_string($link,$_POST['patient_Number']);
   $patient_Sympt =mysqli_real_escape_string($link,$_POST['patient_Sympt']);
   $patient_appoint= mysqli_real_escape_integer($link,$_POST['patient_appoint']);  


$sql="Insert into Patient (patient_id,lastname,name  ,address,phone , symptoms,appointmentdate )
values ( $patient_Id,' $last_name','$first_name',
' $patient_Address','patient_Number','$patient_Sympt','  $patient_appoint')";
   if(mysqli_query($link,$sql)){
   echo "Records added successfuly.";
    } else{ echo "error: Could not be able to execute $sql. " . mysqli_error($link);
	 }
	 mysqli_close($link);
   
:
? > 
