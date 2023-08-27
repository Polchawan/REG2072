<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['ra_id'] != 2) {
  header("Location: logout.php");
  exit();
}
$user_id = $_SESSION['user_id'];
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <title>   </title>
    <a href="   ">   </a>
</head>

</head>
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg fixed-top" style="background-color: #fe965a;">
      <div class="container">
        <a class="navbar-brand text-light" href="../login/index-emp.php">ระบบลงทะเบียนเรียน</a>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item <?=$active_admin?>">
          <a class="nav-link text-light"     href=""></a></li>   
      </ul>
      </div>
    </nav>
  </div>
  
  <h1>Dashboard</h1>
  <p>Welcom :D  You are logged in as editor  <?php echo $user_id; ?>. <a href="logout.php">Log out</a></p>
</body>
</html>