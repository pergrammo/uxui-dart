<?php
    header("Access-Control-Allow-Origin: *");
    $myServer = "https://suchanaactivesystem.com";
    $myUser = "suchanaact";
    $myPass = "YgaWR25yq";
    $myDB = "suchanaact_healthverse";

    $con = mysqli_connect($myServer, $myUser, $myPass, $myDB) or die("Error: " . mysqli_error($con));
    mysqli_query($con, "SET NAMES 'urf8' ");

    if ($con->connect_error) {
        die("Connection failed: " . $con->connect_error);
    } else {
        printf('Connection success');
    }
?>