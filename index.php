<?php
require_once("system/conn.php");
if (isset($_SESSION['id'])) {
    $q1 = dd_q("SELECT * FROM users WHERE id = ? LIMIT 1", [$_SESSION['id']]);
    if ($q1->rowCount() == 1) {
        $user = $q1->fetch(PDO::FETCH_ASSOC);
    } else {
        $_GET['page'] = "login";
    }
}

$logo = "img/logo.png";
$name = "Pxite654274123 | Website 24/7";
?>
<!DOCTYPE html>
<html>
<head>
<title>PBRU RUNNING</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="js/jquery-3.7.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script src="js/bootstrap.bundle.min.js"></script>
</head>

<body>

<nav class="navbar navbar-expand-lg alert alert-secondary mt-0 shadow-sm mb-1 mt-2 p-2" style="border-radius:5vh;">
    <div class="container-sm pt-1 pb-1 ps-4 text-white">
        <a class="navbar-brand button rounded bg-white text-primary px-2 py-2" href="/?page=home">
         PBRU
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarhide" aria-controls="navbarhide" aria-expanded="false">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarhide">
            <ul class="navbar-nav mx-auto me-auto mb-2 mb-lg-1">
                <li class="nav-item align-self-center ms-lg-3">
                    <a class="nav-link underline-active align-self-center h5 text-strong text-dark " aria-current="page" href="/?page=home">หน้าหลัก</a>
                </li>
                <li class="nav-item align-self-center ms-lg-3">
                    <a class="nav-link underline-active align-self-center h5 text-strong text-dark" aria-current="page" href="/?page=alert">ประกาศ</a>
                </li>
                <li class="nav-item align-self-center ms-lg-3">
                    <a class="nav-link underline-active align-self-center h5 text-strong text-dark" aria-current="page" href="/?page=check">ตรวจสอบรายชื่อผู้สมัคร</a>
                </li>
               
            </ul>              
            <?php if (!isset($_SESSION['id'])) { ?>
               
                <ul class="navbar-nav text-center mb-1 mb-lg-0">
            <li class="nav-item align-self-center ms-lg-3 dropdown" style="list-style: none;">
            
                <a class="nav-link active text-white" href="?page=login">
                    
                    <small class="bg-primary text-white p-2 px-2 py-2 mt-lg-2" style="border-radius: 2vh;"> เข้าสู่ระบบ</small>
                </a>

                <a class="nav-link active text-white" href="?page=register">
                    
                    <small class="bg-danger text-white p-2 px-2 py-2 mt-lg-2" style="border-radius: 2vh;"> สมัครสมาชิก</small>
                </a>
            </li>
            </ul>
            <?php } else { ?>
    
        <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
            <li class="nav-item align-self-center ms-lg-3 dropdown" style="list-style: none;">
            
                <a class="nav-link active text-white" href="#" id="navuser" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    
                    <small class="bg-primary text-white p-2 px-2 py-2 mt-lg-2" style="border-radius: 2vh;"> <?php echo $user['username']; ?> : $<?php echo $user['price']; ?> </small>
                </a>
                <ul class="dropdown-menu p-4 pt-2 pb-2 lign-self-center" style="border-radius: 0px;" aria-labelledby="navuser">
                    <li><a class="dropdown-item align-self-center text-dark mb-1" href="?page=history"><small>ประวัติการลงทะเบียน</small></a></li>
                   
                    <div class="dropdown-divider"></div>
                    <li><a class="dropdown-item align-self-center text-dark mb-2" href="?page=logout"><small>ออกจากระบบ</small></a></li>
                </ul>
            </li>
        </ul>
    

            <?php } ?>
        </div>
    </div>
    
</nav>

<div class="container p-2">
  <?php


    if (isset($_GET['page']) && $_GET['page'] == "menu") {
        require_once('page/home.php');
    } elseif (isset($_GET['page']) && $_GET['page'] == "login" && !isset($_SESSION['id'])) {
        require_once('page/login.php');
    } elseif (isset($_GET['page']) && $_GET['page'] == "register" && !isset($_SESSION['id'])) {
        require_once('page/register.php');
    } elseif (isset($_GET['page']) && $_GET['page'] == "logout" && isset($_SESSION['id'])) {
        session_destroy();
        echo "<script>window.location.href = '';</script>";
   
    } elseif (isset($_GET['page']) && $_GET['page'] == "history" && isset($_SESSION['id'])) {
        require_once('page/history.php');
    } elseif (isset($_GET['page']) && $_GET['page'] == "alert") {
        require_once('page/alert.php');

    } elseif (isset($_GET['page']) && $_GET['page'] == "check") {
            require_once('page/check.php');
    } else {
        require_once('page/simple.php');   
    }
    ?>
<img src="../pbrun/img.jpg" class="w-100 rounded">

</body>
</html>