<?php
include 'conn.php';
?>
<?php
    // Get the form data
    $cou_id = $_POST['cou_id'];
    $cou_name = $_POST['cou_name'];
    $cou_num = $_POST['cou_num'];
    $cou_sec = $_POST['cou_sec'];
    $cou_secper = $_POST['cou_secpergroup'];

    

    // Insert the data into the database
    $sql = "INSERT INTO course (cou_id, cou_name, cou_credit, cou_num_of_group, cou_num_of_student) 
            VALUES ('$cou_id', '$cou_name', '$cou_num ', '$cou_sec', '$cou_secper')";
    $result = mysqli_query($conn, $sql);
    // echo "$result" ;
    if($result){
        echo "<script>alert('บันทึกข้อมูลสำเร็จ');</script>";
        echo "<script>window.location='Course_add.php';</script>";
    } else{
        echo "<script>alert('ไม่สามารถบันทึกข้อมูล!');</script>";
        echo "<script>window.location='Course_add.php';</script>";
    }

// Close the database connection
mysqli_close($conn);
?>