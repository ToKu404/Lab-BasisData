<?php
session_start();

include("connection.php");
include("functions.php");

if($_SERVER['REQUEST_METHOD' ] == "POST") {
    
    //something was posted
    $user_name = $_POST['user_name'];
    $password = $_POST['password'];

    if(!empty($user_name) && !empty($password) && !is_numeric($user_name)) {

        //read from databse
        $user_id = random_num(20);
        $query = "select * from users where user_name = '$user_name' limit 1";

        $result = mysqli_query($con, $query);

        if($result) {

            if($result && mysqli_num_rows($result) > 0) {
            
                $user_data = mysqli_fetch_assoc($result);
                
                if(password_verify($password,$user_data['password'])) {
                    $id = $_SESSION['user_id'] = $user_data['user_id'];
                    header ("Location: index.php");
                    die;
                } else {
                    echo "Please enter some valid information";
                    header("refresh:3;url=login.php");
        
                }
                
            }
        }

    } else {
        echo "Please enter some valid information";
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Sarabun:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display&display=swap" rel="stylesheet">
    <title>Login</title>
</head>

<style>
    #text{
        height: 25px;
        border-radius: 5px;
        padding: 4px;
        border: solid thin #aaa;
        font-family: 'Sarabun', sans-serif;
        width: 100%;
    }

    #button{
        padding: 10px;
        width: 100px;
        color: white;
        background-color: #778899;
        border: none;
        border-radius: 5px;
        font-family: 'Sarabun', sans-serif;
        font-size: 14px;
    }

    #box{
        background-color: #B0C4DE;
        margin: auto;
        width: 300px;
        padding: 20px;
        margin-top: 100px;
        justify-content: center;
        border-radius: 10px;
    }
</style>

<body>
    <div id="box">
        <form method="post">
            <center><div style="font-size: 30px; margin : 10px; text-decoration: underline; font-family: 'DM Serif Display', serif;">Log In</div><br></center>

            <div>
                <label style="font-family: 'Sarabun', sans-serif; font-size: 14px;">Username/Email</label>
            <input id="text" type="text" name="user_name">
            </div><br>

            <div>
                <label style="font-family: 'Sarabun', sans-serif; font-size: 14px;">Password</label>
            <input id="text" type="password" name="password">
            </div><br>

            <center><input id="button" type="submit" value="Login"><br><br>

            <div style="font-family: 'Sarabun', sans-serif; font-size: 14px;">Create an account? <a href="signup.php">Sign Up!</a></div><br></center>
        </form>
    </div>
</body>
</html>