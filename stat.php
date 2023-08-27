<?php
session_start();
$user_id = $_SESSION['user_id'];
$txtKeyword = "";
if(isset($_GET['txtKeyword'])){
    $txtKeyword = $_GET['txtKeyword'];
} else {
    $_GET['txtKeyword'] = "";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.2.1/chart.min.js" integrity="sha512-v3ygConQmvH0QehvQa6gSvTE2VdBZ6wkLOlmK7Mcy2mZ0ZF9saNbbk19QeaoTHdWIEiTlWmrwAL4hS8ElnGFbA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <title>Document</title>
</head>

<body>
<?php include 'navbar.php'?>
<?php include 'conn.php'?>

<?php
// Execute the query to count male students
$sql_male = "SELECT COUNT(*) AS male_count FROM student
INNER JOIN faculty ON 
student.fac_id = faculty.fac_id
INNER JOIN branch ON 
student.branch_id = branch.branch_id
WHERE (stu_gender LIKE '%ชาย%' and (fac_name LIKE '%".$_GET["txtKeyword"]."%' or branch_name LIKE '%".$_GET["txtKeyword"]."%') )";
$result_male = mysqli_query($conn, $sql_male);
$row_male = mysqli_fetch_assoc($result_male);
$count_male = $row_male["male_count"];

// Execute the query to count female students
$sql_female = "SELECT COUNT(*) AS female_count FROM student
INNER JOIN faculty ON 
student.fac_id = faculty.fac_id
INNER JOIN branch ON 
student.branch_id = branch.branch_id
WHERE (stu_gender LIKE '%หญิง%' and (fac_name LIKE '%".$_GET["txtKeyword"]."%' or branch_name LIKE '%".$_GET["txtKeyword"]."%') )";
$result_female = mysqli_query($conn, $sql_female);
$row_female = mysqli_fetch_assoc($result_female);
$count_female = $row_female["female_count"];

// Close the MySQL connection
mysqli_close($conn);

?>


<div class="container">
<br><br><br>

<center><h3>จำนวนนิสิต</h3></center>
<form class="d-flex" method="get">
    <input class="form-control me-2" type="text" placeholder="ค้นหา..." aria-label="Search" name="txtKeyword" value="<?=$txtKeyword?>">
    <button class="btn btn-outline-success" type="submit">ค้นหา</button>
</form>




<div>
  <canvas id="myChartNum" width="500" height="100">
  </canvas>
  <p><?php echo 'จำนวนนิสิตทั้งหมด: '.($count_male+$count_female) ?></p>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


<script>
  const ctx = document.getElementById('myChartNum');

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['ชาย', 'หญิง'],
      datasets: [{
        label: 'จำนวนนิสิต',
        data: [<?php echo $count_male ?>,<?php echo $count_female ?>],
        backgroundColor: [
      'rgba(255, 99, 132, 0.2)',
      'rgba(255, 159, 64, 0.2)'
    ],
    borderColor: [
      'rgb(255, 99, 132)',
      'rgb(255, 159, 64)'
    ],
    borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
</script>
</div>

</body>
</html>