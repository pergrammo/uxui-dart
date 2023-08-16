<?php
    header("Access-Control-Allow-Origin: *");
    include("connect.php");
    $result = json_decode($_POST["member_name"]);
    if (json_last_error() === JSON_ERROR_NONE) {
        $_POST = json_decode(file_get_contents('php://input'), true);
    }
    $name = $_POST["member_name"];
    $user = $_POST["member_email"];
    $pass = $_POST["member_pass"];
    if ($name == null) {
        $ret = array("status" => "fail", "message" => "format error");
    } else {
        $mySQL = "Insert Into tbl_member (member_name, member_email, member_pass) Values ('$name', '$user', '$pass')";

        if ($con->query($mySQL) === TRUE) {
            $ret = array("status" => "Success", "message" => "Member was create");
        } else {
            $ret = array("status" => "fail", "message" => "Insert member error");
        }
    }
    echo json_encode($ret);
?>