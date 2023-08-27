<?php
// ทำการเชื่อมต่อกับฐานข้อมูล
include 'conn.php';

// รับค่าไอดีของคณะที่ถูกส่งมาจาก AJAX request
$facultyId = $_GET['fac_id'];

// คำสั่ง SQL ในการดึงตัวเลือกสาขาที่เกี่ยวข้องกับคณะที่ถูกเลือก
$sql = "SELECT * FROM branch WHERE branch.fac_id = '$facultyId'";
$result = mysqli_query($conn, $sql);

// สร้างตัวเลือกสาขา
$options = '';
while ($row = mysqli_fetch_assoc($result)) {
    $options .= '<option value="' . $row['branch_id'] . '">' . $row['branch_name'] . '</option>';
}

// ส่งตัวเลือกสาขากลับไปยัง AJAX request เพื่ออัปเดตในหน้าเว็บ
echo $options;

// ปิดการเชื่อมต่อฐานข้อมูล
mysqli_close($conn);
?>
