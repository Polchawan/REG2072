<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
    <title>ตรวจสอบรายชื่อนิสิตในรายวิชาที่สอน</title>
</head>

<body>
    <nav class="navbar navbar-expand-lg fixed-top" style="background-color: #fe965a;">
        <div class="container">
            <a class="navbar-brand text-light" href="index.php">ระบบลงทะเบียนเรียน</a>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="navbar-brand text-light" href="teacher_table.php">ตารางสอน</a>
                        <a class="navbar-brand text-light" href="check_std.php">ข้อมูลรายวิชาที่สอน</a>
                        <a class="navbar-brand text-light" href="fill_in_stu_scores.php">กรอกคะแนน</a>
                        <a class="navbar-brand text-light" href="#">log out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <h2 class="text-center py-5"  style="color: #fe965a;">รายวิชาที่สอน</h2>

        <style>
            table#t01 {
                width :100%;
            }
            table#t01 tr:nth-child(even) {
                background-color: #eee;
            }
            table#t01 tr:nth-child(odd) {
            background-color:rgb(232, 196, 143);
            }
            table#t01 th {
                background-color: rgb(242, 109, 0);
                color: white;
            }
            </style>
            </head>
            <body>
                
            <table id="t01">
            <tr>
                <th>รหัสวิชา</th>
                <th>ชื่อวิชา</th>
                <th>หน่วยกิต</th>
                <th>กลุ่ม</th>
                <th></th>
            </tr>
            <tr>
                <td>001</td>
                <td>ภาษาอังกฤษ</td>
                <td>3</td>
                <td>1</td>
                <td><a href="#รายชื่อ"><font color="orange">ตรวจสอบ</font></a></td>
            </tr>
            <tr>
                <td>002</td>
                <td>ภาษาอังกฤษ</td>
                <td>3</td>
                <td>2</td>
                <td><a href="#รายชื่อ"><font color="orange">ตรวจสอบ</font></a></td>
                
                
            </tr>
            </table>
            <br> <br> <br> <br> 

            <style>
                table#t01 {
                    width :100%;
                }
                table#t01 tr:nth-child(even) {
                    background-color: #eee;
                }
                table#t01 tr:nth-child(odd) {
                background-color:rgb(232, 196, 143);
                }
                table#t01 th {
                    background-color: rgb(242, 109, 0);
                    color: white;
                }
                </style>
                </head>
                <body>
                    
                <table id="t01">
                <tr>
                    <th>กลุ่ม</th>
                    <th>วัน/เวลา</th>
                    <th>ห้อง</th>
                    <th>อาคาร</th>
                    <th>จำนวนนิสิต</th>
                    <th>รายชื่อ</th>

                    
                    
                </tr>
                <tr>
                    <td>1</td>
                    <td>wed 08.00-10.00 sc2-214</td>
                    <td>sc2-214</td>
                    <td>sc2</td>
                    <td>40/18</td>
                <td><a href="#รายชื่อ"><font color="orange">ตรวจสอบ</font></a></td>
    
                
                    
                </tr>
                <tr>
                    <td>2</td>
                    <td>tue 13.00-15.00 sc2-214</td>
                    <td>sc2-214</td>
                    <td>sc2</td>
                    <td>40/35</td>
                <td><a nmae ="#รายชื่อ"><font color="orange">ตรวจสอบ</font></a></td>
    
                
                    
                </tr>
                </table>

            </body>
            </html>
    </div>
</body>

</html>



</body>

</html>