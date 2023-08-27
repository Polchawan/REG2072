<?php include 'conn.php';?>
<?php
session_start(); 
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.2.1/chart.min.js" integrity="sha512-v3ygConQmvH0QehvQa6gSvTE2VdBZ6wkLOlmK7Mcy2mZ0ZF9saNbbk19QeaoTHdWIEiTlWmrwAL4hS8ElnGFbA==" crossorigin="anonymous" referrerpolicy="no-referrer">
    </script>
    <title>Google Charts Example</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
    <?php include 'navbar.php'?>
    <br><br><br>
    <div class='container'>
        <div class="d-flex justify-content-end">
        <h4 class='px-2' id='chartSw'>Select Charts</h4>
        <form action="#">
        <label style="color: #fe965a;">คณะ</label>
        <select name="faculty" id="facultySelect" required>
            <option value="all">ทั้งหมด</option> 
            <?php 
            $sql = "SELECT * FROM faculty ";
            $result = mysqli_query($conn, $sql);
            while ($row = mysqli_fetch_assoc($result)): 
            ?>
            <option value="<?php echo $row['fac_id']; ?>">
                <?php echo $row['fac_name']; ?>
            </option>
            <?php endwhile; ?>
        </select>

        <label style="color: #fe965a;">สาขา</label>
        
        <select name="branch" id="branchSelect" required>
        <option value="all">ทั้งหมด</option> 
        </select>

        <label style="color: #fe965a;">เพศ</label>
                <select name="gender" id='gender'required>
                    <option value="all">ทั้งหมด</option>        
                    <option value="men">ชาย</option>
                    <option value="women">หญิง</option>
                </select>
            <button style="color: white;" class="btn btn-success" 
            type="submit" name="submit" value="submit" id="chartSubmit" 
            onclick="drawChart()">ตกลง</button>
        </form>
            <div class="btn-group" role="group" aria-label="Google Charts">
                <button type="button" class="btn btn-primary" value='combo' onclick="switchToComboChart()">
                <?php ?>Combo Chart</button>
                <button type="button" class="btn btn-secondary" value='donut' onclick="switchToDonutChart()">
                <?php ?>Donut Chart</button>
                <button type="button" class="btn btn-info" value='area' onclick="switchToAreaChart()">
                <?php ?>Area Chart</button>
            </div>
            

            <br>
        </div>
        <?php
            $txtKeyword = '';

            // ตรวจสอบว่ามีการส่งค่า txtKeyword มาจากฟอร์มหรือไม่
            if (isset($_GET['txtKeyword'])) {
                $txtKeyword = $_GET['txtKeyword'];
            }
        ?>
        <?php 
        $faculty;
        $branch;
        $gender;
        // $fname;
        // $lname;
        // $id_all;
        // $cou_id;
        if (isset($_GET['faculty'])) {
            $faculty = $_GET['faculty'];
        }
        if (isset($_GET['branch'])) {
            $branch = $_GET['branch'];
        }
        if (isset($_GET['gender'])) {
        
            $gender = $_GET['gender'];
        }
        if (isset($_GET['submit'])) {
            $submit = $_GET['submit'];
        }
        
        // $stu_id = $_GET['stu_id'];
        
        
        // Modify SQL query based on URL parameters
        $sql = "SELECT *, course.cou_name AS cou_realname FROM course
                INNER JOIN registra ON course.cou_id = registra.cou_id 
                INNER JOIN student ON student.user_id = registra.user_id 
                INNER JOIN sche_employee ON sche_employee.sche_Emp_id = course.sche_Emp_id
                INNER JOIN employee ON sche_employee.user_id = employee.user_id
                INNER JOIN faculty ON faculty.fac_id = employee.fac_id
                INNER JOIN branch ON branch.fac_id = faculty.fac_id 
                WHERE 1=1 ";
        
        if (!empty($faculty)) {
            $sql .= " AND faculty.fac_id = '$faculty'";
        }
        
        if (!empty($branch)) {
            $sql .= " AND branch.branch_id = '$branch'";
        }
        // if (!empty($txtKeyword)) {
        //     $sql .= " AND (user_id LIKE '%".$_GET["txtKeyword"]."%' or branch_name LIKE '%".$_GET["txtKeyword"]
        //             ."%' or fac_name LIKE '%".$_GET["txtKeyword"]."%' or stu_fname LIKE '%".$_GET["txtKeyword"]."%'
        //             or stu_lname LIKE '%".$_GET["txtKeyword"]."%' or emp_fname LIKE '%".$_GET["txtKeyword"]."%'
        //             or emp_lname LIKE '%".$_GET["txtKeyword"]."%' or cou_id LIKE '%".$_GET["txtKeyword"]."%'
        //             or cou_name LIKE '%".$_GET["txtKeyword"]."%' or stu_email LIKE '%".$_GET["txtKeyword"]."%'
        //             or emp_email LIKE '%".$_GET["txtKeyword"]."%' )";
        // }
        $sql1 = "SELECT COUNT(*) as total FROM student WHERE 1=1 ";
        if (!empty($gender)) {
            if ($gender == 'all') {
                // ถ้าเลือกเพศเป็น 'all' ให้ไม่ใส่เงื่อนไขเพศใด ๆ
            } elseif($gender == 'men') {
                $sql1 .= " AND student.stu_gender = 'ชาย'";
            } elseif($gender == 'women') {
                $sql1 .= " AND student.stu_gender = 'หญิง'";
            }
        }
        $result = mysqli_query($conn, $sql); 

        $result_male = mysqli_query($conn, $sql1); 
        $result_female = mysqli_query($conn, $sql1);
        $resultgender = mysqli_query($conn, $sql1);

        $row_male = mysqli_fetch_assoc($result_male); 
        $row_female = mysqli_fetch_assoc($result_female);
        $rowgender = mysqli_fetch_assoc($resultgender);

        $rowCount_male = $row_male['total'];
        $rowCount_female = $row_female['total'];
        $rowCount = $rowgender['total'];

        $data = array();
        if($rowCount==0){
            $data[] = array('cou_name','GPA Student', 'Grade in Class', 'Year class', 'Course credit');
            while ($row = mysqli_fetch_assoc($result)) {
                $data[] = array(
                    $row['cou_name'], // Replace 'month' with the actual name of the column for month data in your table
                    (int)$row['stu_gpa'], // Replace 'bolivia' with the actual name of the column for Bolivia data in your table
                    (int)$row['grade'],// Replace 'madagascar' with the actual name of the column for Madagascar data in your table
                    //(int)$row['reg_score'],'score'  Replace 'papua_new_guinea' with the actual name of the column for Papua New Guinea data in your table
                    (int)$row['stu_year'], // Replace 'rwanda' with the actual name of the column for Rwanda data in your table
                    (int)$row['cou_credit'] // Replace 'average' with the actual name of the column for Average data in your table
                );
            }
        }else{
            if($rowCount_male!=0){
                $data[] = array('cou_name','GPA Student', 'Grade in Class', 'Year class', 'Course credit','male');
                while ($row = mysqli_fetch_assoc($result)) {
                    $data[] = array(
                        $row['cou_name'], // Replace 'month' with the actual name of the column for month data in your table
                        (int)$row['stu_gpa'], // Replace 'bolivia' with the actual name of the column for Bolivia data in your table
                        (int)$row['grade'],// Replace 'madagascar' with the actual name of the column for Madagascar data in your table
                        //(int)$row['reg_score'],'score'  Replace 'papua_new_guinea' with the actual name of the column for Papua New Guinea data in your table
                        (int)$row['stu_year'], // Replace 'rwanda' with the actual name of the column for Rwanda data in your table
                        (int)$row['cou_credit']
                        ,(int)$rowCount_male // Replace 'average' with the actual name of the column for Average data in your table
                    );
                }
            }if($rowCount_female!=0)
                $data[] = array('cou_name','GPA Student', 'Grade in Class', 'Year class', 'Course credit','female');
                while ($row = mysqli_fetch_assoc($result)) {
                    $data[] = array(
                        $row['cou_name'], // Replace 'month' with the actual name of the column for month data in your table
                        (int)$row['stu_gpa'], // Replace 'bolivia' with the actual name of the column for Bolivia data in your table
                        (int)$row['grade'],// Replace 'madagascar' with the actual name of the column for Madagascar data in your table
                        //(int)$row['reg_score'],'score'  Replace 'papua_new_guinea' with the actual name of the column for Papua New Guinea data in your table
                        (int)$row['stu_year'], // Replace 'rwanda' with the actual name of the column for Rwanda data in your table
                        (int)$row['cou_credit']
                        ,(int)$rowCount_female // Replace 'average' with the actual name of the column for Average data in your table
                    );
                }
            }
            

        ?>

    </div>
    

    <script type="text/javascript">
        google.charts.load("current", {packages:["corechart"]});
        google.charts.setOnLoadCallback(drawChart);

        // Function to draw the initial chart (Combo Chart)
        function drawChart() {
            google.charts.load('current', {'packages':['corechart']});
            google.charts.setOnLoadCallback(drawVisualization);

            function drawVisualization() {
                // Some raw data (not necessarily accurate)
                var data = google.visualization.arrayToDataTable(<?php echo json_encode($data); ?>);

                var options = {
                title : 'Monthly Coffee Production by Country',
                vAxis: {title: 'หน่วย'},
                hAxis: {title: 'วิชา'},
                seriesType: 'bars',
                series: {5: {type: 'line'}}
                };

                var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
                document.getElementById('chartSubmit').addEventListener('click', function() {
                // Get the selected chart type from the button value
                var chartType = document.querySelector('chartSw').value;
                // Call the appropriate function based on the selected chart type
                switch(chartType) {
                    case 'combo':
                        switchToComboChart();
                        break;
                    case 'donut':
                        switchToDonutChart();
                        break;
                    case 'area':
                        switchToAreaChart();
                        break;
                    default:
                        break;
                }
            });
        }
        // Function to switch to Combo Chart
        function switchToComboChart() {
            
            google.charts.load('current', {'packages':['corechart']});
            google.charts.setOnLoadCallback(drawVisualization);

            function drawVisualization() {
                // Some raw data (not necessarily accurate)
                var data = google.visualization.arrayToDataTable(<?php echo json_encode($data); ?>);

                var options = {
                title : 'Monthly Coffee Production by Country',
                vAxis: {title: 'หน่วย'},
                hAxis: {title: 'วิชา'},
                seriesType: 'bars',
                series: {5: {type: 'line'}}
                };

                var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        }

        // Function to switch to Donut Chart
        function switchToDonutChart() {
            google.charts.load('current', {'packages':['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = google.visualization.arrayToDataTable(<?php echo json_encode($data); ?>);

            var options = {
            title: 'Title',
            pieHole: 0.4,
            };

            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
            chart.draw(data, options);
            }
            
        }
        
        // Function to switch to Area Chart
        function switchToAreaChart() {
            google.charts.load('current', {'packages':['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = google.visualization.arrayToDataTable(<?php echo json_encode($data); ?>);

                var options = {
                title: 'Title',
                hAxis: {title: 'วิชา',  titleTextStyle: {color: '#333'}},
                vAxis: {minValue: 0}
                };

                var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
                }
    </script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>
        
            $(document).ready(function() {
                // เมื่อเลือกคณะ
                $('#facultySelect').change(function() {
                    var facultyId = $(this).val();
                    // ส่งค่าไอดีของคณะไปยังไฟล์ PHP เพื่ออัปเดตตัวเลือกสาขา
                    $.ajax({
                        url: 'statgetbranch.php', // แก้ไขเป็น URL ของไฟล์ PHP ที่ใช้ในการดึงตัวเลือกสาขา
                        type: 'GET',
                        data: {fac_id: facultyId},
                        success: function(data) {
                            // อัปเดตตัวเลือกสาขา
                            $('#branchSelect').html(data);
                        },
                        error: function() {
                            // จัดการกับข้อผิดพลาด
                        }
                    });
                });
            });
        </script>
    <div id="chart_div" style="width: 900px; height: 500px;"></div>
    <!-- Include Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>

