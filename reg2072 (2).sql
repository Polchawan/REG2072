-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2023 at 10:42 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reg2072`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_id` varchar(6) NOT NULL,
  `branch_name` varchar(30) NOT NULL,
  `fac_id` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_id`, `branch_name`, `fac_id`) VALUES
('100011', 'วิทยาการคอมพิวเตอร์', '100010'),
('100012', 'เทคโนโลยีสารสนเทศ', '100010'),
('100013', 'คณิตศาสตร์', '100010'),
('200021', 'ภาษาไทย', '200020'),
('200022', 'ภาษาอังกฤษ', '200020'),
('200023', 'ภาษาจีน', '200020'),
('200024', 'IP', '100010');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `cou_id` varchar(6) NOT NULL,
  `cou_name` varchar(30) NOT NULL,
  `cou_credit` int(1) NOT NULL,
  `cou_num_of_group` int(20) NOT NULL,
  `cou_num_of_student` int(10) NOT NULL,
  `cou_building` varchar(30) NOT NULL,
  `sche_Emp_id` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`cou_id`, `cou_name`, `cou_credit`, `cou_num_of_group`, `cou_num_of_student`, `cou_building`, `sche_Emp_id`) VALUES
('100002', 'ภาษาอังกฤษพื้นฐาน', 3, 2, 10, 'sc1', '8'),
('110001', 'แคลคูลัส', 3, 1, 10, 'sc1', '1'),
('110002', 'สถิติวิเคราะห์', 3, 1, 10, 'sc2', '2'),
('110003', 'พื้นฐาน Coding', 3, 1, 10, 'sc3', '3'),
('111001', 'ทักษะภาษาไทย', 3, 2, 10, 'sc3', '7'),
('221001', 'การอ่านเชิงวิจารณ์', 3, 1, 5, 'sc3', '4'),
('221002', 'ศิลปะการเขียน', 3, 1, 5, 'sc2', '4'),
('222001', 'การแปลอังกฤษ', 3, 1, 5, 'sc1', '5'),
('222002', 'การเขียนรายงานอังกฤษ', 3, 1, 5, 'sc1', '5'),
('223001', 'การเขียนภาษาจีน', 3, 1, 5, 'sc3', '6'),
('223002', 'ไวยากรณ์จีน', 3, 1, 5, 'sc2', '6');

-- --------------------------------------------------------

--
-- Table structure for table `cou_date_time`
--

CREATE TABLE `cou_date_time` (
  `cdt_id` int(30) NOT NULL,
  `cou_id` varchar(6) DEFAULT NULL,
  `cdt_date` varchar(30) NOT NULL,
  `cdt_startTime` time NOT NULL,
  `cdt_endTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cou_date_time`
--

INSERT INTO `cou_date_time` (`cdt_id`, `cou_id`, `cdt_date`, `cdt_startTime`, `cdt_endTime`) VALUES
(2, '111001', 'Monday', '10:00:00', '12:00:00'),
(4, '110002', 'Tuesday', '09:00:00', '11:00:00'),
(5, '110003', 'Wednesday', '13:00:00', '15:00:00'),
(6, '221001', 'Friday', '14:00:00', '15:00:00'),
(7, '100002', 'Thursday', '13:00:00', '15:00:00'),
(23, '110001', 'Friday', '08:00:00', '10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `user_id` varchar(8) NOT NULL,
  `emp_fname` varchar(30) NOT NULL,
  `emp_lname` varchar(30) NOT NULL,
  `ra_id` varchar(2) NOT NULL,
  `emp_phone` varchar(10) NOT NULL,
  `emp_enroll` date NOT NULL,
  `emp_email` text NOT NULL,
  `emp_address` text NOT NULL,
  `emp_birth` date DEFAULT NULL,
  `fac_id` varchar(8) NOT NULL,
  `emp_gender` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`user_id`, `emp_fname`, `emp_lname`, `ra_id`, `emp_phone`, `emp_enroll`, `emp_email`, `emp_address`, `emp_birth`, `fac_id`, `emp_gender`) VALUES
('27100001', 'เพ็ญศรี', 'จันทร์เพ็ญ', '1', '630000007', '0000-00-00', 'pensri@reg.ac.th', '17 ต.ท่าเงิน', '0000-00-00', '200020', 'ชาย'),
('27100002', 'ดารา', 'ดาวเด่น', '1', '630000008', '0000-00-00', 'dara@reg.ac.th', '18 ต.ท่าเงิน', '0000-00-00', '200020', 'ชาย'),
('27110001', 'ใจดี', 'มาดี', '1', '630000001', '0000-00-00', 'jaidee@reg.ac.th', '11 ต.ท่าเงิน', '0000-00-00', '100010', 'ชาย'),
('27110002', 'อาทิตย์', 'สวยงาม', '1', '630000002', '0000-00-00', 'athid@reg.ac.th', '12 ต.ท่าเงิน', '0000-00-00', '100010', 'ชาย'),
('27110003', 'อังคาร', 'สดใส', '1', '630000003', '0000-00-00', 'angkan@reg.ac.th', '13 ต.ท่าเงิน', '0000-00-00', '100010', 'ชาย'),
('27221001', 'แคทลียา', 'พาที', '1', '630000004', '0000-00-00', 'katreeya@reg.ac.th', '14 ต.ท่าเงิน', '0000-00-00', '200020', 'ชาย'),
('27222001', 'อัยยา', 'อิงฤทธิ์', '1', '630000005', '0000-00-00', 'aiya@reg.ac.th', '15 ต.ท่าเงิน', '0000-00-00', '200020', 'ชาย'),
('27223001', 'มาลี', 'แซ่หนิง', '1', '630000006', '0000-00-00', 'malee@reg.ac.th', '16 ต.ท่าเงิน', '0000-00-00', '200020', 'ชาย');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `fac_id` varchar(8) NOT NULL,
  `fac_name` varchar(30) NOT NULL,
  `fac_tel` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`fac_id`, `fac_name`, `fac_tel`) VALUES
('100010', 'วิทยาศาสตร์', '980100010'),
('200020', 'มนุษย์ศาสตร์', '980200020');

-- --------------------------------------------------------

--
-- Table structure for table `rank`
--

CREATE TABLE `rank` (
  `ra_id` varchar(2) NOT NULL,
  `ra_name` varchar(30) NOT NULL,
  `ra_salary` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rank`
--

INSERT INTO `rank` (`ra_id`, `ra_name`, `ra_salary`) VALUES
('1', 'อาจารย์', 38000),
('2', 'ฝ่ายทะเบียน', 45000),
('3', 'อธิการ', 50000),
('4', 'นิสิต', 0);

-- --------------------------------------------------------

--
-- Table structure for table `registra`
--

CREATE TABLE `registra` (
  `reg_id` int(10) NOT NULL,
  `user_id` varchar(8) DEFAULT NULL,
  `cou_id` varchar(6) DEFAULT NULL,
  `reg_score` int(11) NOT NULL,
  `grade` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registra`
--

INSERT INTO `registra` (`reg_id`, `user_id`, `cou_id`, `reg_score`, `grade`) VALUES
(1, '63112001', '111001', 100, 4),
(2, '63112001', '100002', 80, 4),
(4, '63111001', '110002', 80, 4),
(20, '63111002', '111001', 76, 3.5),
(28, '00000004', '111001', 73, 3),
(30, '63111002', '110002', 85, 4),
(31, '63111002', '110003', 66, 2.5),
(33, '63111002', '110001', 63, 3),
(35, '63111001', '110001', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reg_val`
--

CREATE TABLE `reg_val` (
  `user_id` varchar(8) NOT NULL,
  `cou_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reg_val`
--

INSERT INTO `reg_val` (`user_id`, `cou_id`) VALUES
('63111001', '110002'),
('63111001', '110002'),
('63111001', '110002'),
('63111001', '110002'),
('63111001', '110002'),
('63111001', '110002');

-- --------------------------------------------------------

--
-- Table structure for table `sche_employee`
--

CREATE TABLE `sche_employee` (
  `sche_Emp_id` varchar(8) NOT NULL,
  `user_id` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sche_employee`
--

INSERT INTO `sche_employee` (`sche_Emp_id`, `user_id`) VALUES
('1', '27100001'),
('7', '27100001'),
('8', '27100002'),
('2', '27110002'),
('3', '27110003'),
('4', '27221001'),
('5', '27222001'),
('6', '27223001');

-- --------------------------------------------------------

--
-- Table structure for table `sche_student`
--

CREATE TABLE `sche_student` (
  `sche_stu_id` varchar(8) NOT NULL,
  `fac_id` varchar(8) NOT NULL,
  `fac_name` varchar(30) NOT NULL,
  `branch_id` varchar(6) NOT NULL,
  `branch_name` varchar(30) NOT NULL,
  `semester` varchar(1) NOT NULL,
  `aca_years` year(4) NOT NULL,
  `cou_id` varchar(6) DEFAULT NULL,
  `cou_name` varchar(30) NOT NULL,
  `cou_no_group` int(8) NOT NULL,
  `cou_time` date NOT NULL,
  `cou_building` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `user_id` varchar(8) NOT NULL,
  `stu_fname` varchar(30) NOT NULL,
  `stu_lname` varchar(30) NOT NULL,
  `stu_gender` varchar(30) NOT NULL,
  `stu_phone` varchar(10) NOT NULL,
  `stu_gpa` int(11) NOT NULL,
  `stu_address` varchar(100) NOT NULL,
  `stu_email` varchar(30) NOT NULL,
  `stu_birth` date NOT NULL,
  `fac_id` varchar(8) NOT NULL,
  `branch_id` varchar(8) NOT NULL,
  `ra_id` varchar(2) NOT NULL,
  `advicer_id` varchar(8) DEFAULT NULL,
  `stu_year` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`user_id`, `stu_fname`, `stu_lname`, `stu_gender`, `stu_phone`, `stu_gpa`, `stu_address`, `stu_email`, `stu_birth`, `fac_id`, `branch_id`, `ra_id`, `advicer_id`, `stu_year`) VALUES
('00000004', 'นักศึกษา', 'นิสิต', 'หญิง', '0555555550', 0, '33', 'raiden@reg.ac.th', '2001-01-01', '100010', '100011', '4', '27100001', 1),
('63111001', 'สมมติ', 'นามแฝง', 'ชาย', '0899998999', 1, '21 ต.ท่าพระจันทร์', 'sommud63@reg.ac.th', '0000-00-00', '100010', '100011', '4', '27100001', 2),
('63111002', 'มานี', 'มานะ', 'หญิง', '0899999000', 3, '22 ต.ท่าพระจันทร์', 'manee63@reg.ac.th', '0000-00-00', '100010', '100011', '4', '27100001', 1),
('63111003', 'ยานี', 'มีดี', 'ชาย', '0899999001', 4, '23 ต.ท่าพระจันทร์', 'yanee63@reg.ac.th', '0000-00-00', '100010', '100011', '4', '27222001', 2),
('63112001', 'มานาว', 'ใจดี', 'หญิง', '0899999002', 4, '24 ต.ท่าพระจันทร์', 'manaw63@reg.ac.th', '0000-00-00', '100010', '100012', '4', NULL, 3),
('63112002', 'สาระ', 'เทคโน', 'ชาย', '0899999003', 4, '25 ต.ท่าพระจันทร์', 'sara63@reg.ac.th', '0000-00-00', '100010', '100012', '4', NULL, 4),
('63112003', 'วิทยา', 'ซาฟารี', 'หญิง', '0899999004', 2, '26 ต.ท่าพระจันทร์', 'witthaya63@reg.ac.th', '0000-00-00', '100010', '100012', '4', NULL, 4),
('63113001', 'คณิต', 'คำนวณ', 'ชาย', '0899999005', 2, '27 ต.ท่าพระจันทร์', 'kanit63@reg.ac.th', '0000-00-00', '100010', '100013', '4', NULL, 3),
('63113002', 'ดอกคูณ', 'แสนหาร', 'หญิง', '0899999006', 3, '28 ต.ท่าพระจันทร์', 'dokkun63@reg.ac.th', '0000-00-00', '100010', '100013', '4', NULL, 4),
('63113003', 'ตรีโกณ', 'มิติ', 'ชาย', '0899999007', 3, '29 ต.ท่าพระจันทร์', 'trikon63@reg.ac.th', '0000-00-00', '100010', '100013', '4', NULL, 2),
('63221001', 'แข', 'เดือนเพ็ญ', 'หญิง', '0899999008', 3, '30 ต.ท่าพระจันทร์', 'kae63@reg.ac.th', '0000-00-00', '200020', '200021', '4', NULL, 1),
('63221002', 'ชาติชาย', 'เผ่าไทย', 'ชาย', '0899999009', 3, '31 ต.ท่าพระจันทร์', 'chadchai63@reg.ac.th', '0000-00-00', '200020', '200021', '4', NULL, 3),
('63221003', 'สมหญิง', 'รักเรียน', 'หญิง', '0899999010', 3, '32 ต.ท่าพระจันทร์', 'somying@reg.ac.th', '0000-00-00', '200020', '200021', '4', NULL, 1),
('63222001', 'แมทธิว', 'ไผ่ทอง', 'ชาย', '0899999011', 3, '33 ต.ท่าพระจันทร์', 'matthew63@reg.ac.th', '0000-00-00', '200020', '200022', '4', NULL, 2),
('63222002', 'มาเรีย', 'แอนเดรีย', 'หญิง', '0899999012', 4, '34 ต.ท่าพระจันทร์', 'maria63@reg.ac.th', '0000-00-00', '200020', '200022', '4', NULL, NULL),
('63222003', 'คาร์ล', 'ชาร์ลี', 'ชาย', '0899999013', 4, '35 ต.ท่าพระจันทร์', 'carl63@reg.ac.th', '0000-00-00', '200020', '200022', '4', NULL, NULL),
('63223001', 'อวิ๋นจิ่น', 'อวิ๋นฮั่น', 'หญิง', '0899999014', 4, '36 ต.ท่าพระจันทร์', 'yunjin63@reg.ac.th', '0000-00-00', '200020', '200023', '4', NULL, NULL),
('63223002', 'หยาง', 'แซ่หนิง', 'ชาย', '0899999015', 3, '37 ต.ท่าพระจันทร์', 'yang63@reg.ac.th', '0000-00-00', '200020', '200023', '4', NULL, NULL),
('63223003', 'เหยาเหยา', 'แซ่ลี', 'หญิง', '0899999016', 3, '38 ต.ท่าพระจันทร์', 'yaoyao63@reg.ac.th', '0000-00-00', '200020', '200023', '4', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_gpa`
--

CREATE TABLE `student_gpa` (
  `gpa_id` varchar(8) NOT NULL,
  `cou_grade_id` varchar(8) NOT NULL,
  `cou_id` varchar(6) DEFAULT NULL,
  `cou_name` varchar(30) NOT NULL,
  `cou_credit` varchar(1) NOT NULL,
  `gpa` decimal(10,0) NOT NULL,
  `aca_year` year(4) NOT NULL,
  `semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_table`
--

CREATE TABLE `student_table` (
  `student_table_id` varchar(8) NOT NULL,
  `user_id` varchar(8) NOT NULL,
  `stu_fname` varchar(30) NOT NULL,
  `stu_lname` varchar(30) NOT NULL,
  `sche_stu_id` varchar(8) NOT NULL,
  `fac_id` varchar(8) NOT NULL,
  `fac_name` varchar(30) NOT NULL,
  `branch_id` varchar(8) NOT NULL,
  `branch_name` varchar(30) NOT NULL,
  `semester` varchar(1) NOT NULL,
  `aca_year` year(4) NOT NULL,
  `cou_no_group` varchar(1) NOT NULL,
  `cou_time` date NOT NULL,
  `cou_building` varchar(30) NOT NULL,
  `cou_id` varchar(6) DEFAULT NULL,
  `cou_name` varchar(30) NOT NULL,
  `cou_credit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stu_score_edit`
--

CREATE TABLE `stu_score_edit` (
  `cou_grade_id` varchar(8) NOT NULL,
  `cou_id` varchar(8) NOT NULL,
  `cou_no_group` varchar(1) NOT NULL,
  `semester` int(11) NOT NULL,
  `aca_years` year(4) NOT NULL,
  `user_id` varchar(8) NOT NULL,
  `stu_fname` varchar(30) NOT NULL,
  `stu_lname` varchar(30) NOT NULL,
  `fac_id` varchar(8) NOT NULL,
  `branch_id` varchar(8) NOT NULL,
  `stu_scores` varchar(4) NOT NULL,
  `stu_grade` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` varchar(8) NOT NULL,
  `password` varchar(30) NOT NULL,
  `ra_id` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `password`, `ra_id`) VALUES
('00000004', '00000004', '4'),
('22000001', '22000001', '2'),
('22000021', '22000021', '2'),
('27100001', '27100001', '1'),
('27100002', '27100002', '1'),
('27110001', '27110001', '1'),
('27110002', '27110002', '1'),
('27110003', '27110003', '1'),
('27221001', '27221001', '1'),
('27222001', '27222001', '1'),
('27223001', '27223001', '1'),
('35000001', '35000001', '3'),
('63111001', '63111001', '4'),
('63111002', '63111002', '4'),
('63111003', '63111003', '4'),
('63112001', '63112001', '4'),
('63112002', '63112002', '4'),
('63112003', '63112003', '4'),
('63113001', '63113001', '4'),
('63113002', '63113002', '4'),
('63113003', '63113003', '4'),
('63221001', '63221001', '4'),
('63221002', '63221002', '4'),
('63221003', '63221003', '4'),
('63222001', '63222001', '4'),
('63222002', '63222002', '4'),
('63222003', '63222003', '4'),
('63223001', '63223001', '4'),
('63223002', '63223002', '4'),
('63223003', '63223003', '4'),
('admin', 'admin', '2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `fac_id` (`fac_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`cou_id`),
  ADD KEY `sche_Emp_id` (`sche_Emp_id`);

--
-- Indexes for table `cou_date_time`
--
ALTER TABLE `cou_date_time`
  ADD PRIMARY KEY (`cdt_id`),
  ADD KEY `cou_date_time_ibfk_1` (`cou_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fac_id` (`fac_id`),
  ADD KEY `ra_id` (`ra_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`fac_id`);

--
-- Indexes for table `rank`
--
ALTER TABLE `rank`
  ADD PRIMARY KEY (`ra_id`);

--
-- Indexes for table `registra`
--
ALTER TABLE `registra`
  ADD PRIMARY KEY (`reg_id`),
  ADD KEY `cou_id` (`cou_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sche_employee`
--
ALTER TABLE `sche_employee`
  ADD PRIMARY KEY (`sche_Emp_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sche_student`
--
ALTER TABLE `sche_student`
  ADD PRIMARY KEY (`sche_stu_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `fac_id` (`fac_id`),
  ADD KEY `cou_id` (`cou_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fac_id` (`fac_id`),
  ADD KEY `ra_id` (`ra_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `advicer_id` (`advicer_id`);

--
-- Indexes for table `student_gpa`
--
ALTER TABLE `student_gpa`
  ADD PRIMARY KEY (`gpa_id`),
  ADD KEY `cou_id` (`cou_id`),
  ADD KEY `cou_grade_id` (`cou_grade_id`);

--
-- Indexes for table `student_table`
--
ALTER TABLE `student_table`
  ADD PRIMARY KEY (`student_table_id`),
  ADD KEY `fac_id` (`fac_id`),
  ADD KEY `sche_stu_id` (`sche_stu_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cou_id` (`cou_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `stu_score_edit`
--
ALTER TABLE `stu_score_edit`
  ADD PRIMARY KEY (`cou_grade_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `cou_id` (`cou_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fac_id` (`fac_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `ra_id` (`ra_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cou_date_time`
--
ALTER TABLE `cou_date_time`
  MODIFY `cdt_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `registra`
--
ALTER TABLE `registra`
  MODIFY `reg_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`fac_id`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`sche_Emp_id`) REFERENCES `sche_employee` (`sche_Emp_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `cou_date_time`
--
ALTER TABLE `cou_date_time`
  ADD CONSTRAINT `cou_date_time_ibfk_1` FOREIGN KEY (`cou_id`) REFERENCES `course` (`cou_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`fac_id`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`ra_id`) REFERENCES `rank` (`ra_id`),
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `registra`
--
ALTER TABLE `registra`
  ADD CONSTRAINT `registra_ibfk_1` FOREIGN KEY (`cou_id`) REFERENCES `course` (`cou_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `registra_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `student` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sche_employee`
--
ALTER TABLE `sche_employee`
  ADD CONSTRAINT `sche_employee_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `employee` (`user_id`);

--
-- Constraints for table `sche_student`
--
ALTER TABLE `sche_student`
  ADD CONSTRAINT `sche_student_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  ADD CONSTRAINT `sche_student_ibfk_3` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`fac_id`),
  ADD CONSTRAINT `sche_student_ibfk_4` FOREIGN KEY (`cou_id`) REFERENCES `course` (`cou_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`fac_id`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`ra_id`) REFERENCES `rank` (`ra_id`),
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  ADD CONSTRAINT `student_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `student_ibfk_5` FOREIGN KEY (`advicer_id`) REFERENCES `employee` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `student_gpa`
--
ALTER TABLE `student_gpa`
  ADD CONSTRAINT `student_gpa_ibfk_2` FOREIGN KEY (`cou_grade_id`) REFERENCES `stu_score_edit` (`cou_grade_id`),
  ADD CONSTRAINT `student_gpa_ibfk_3` FOREIGN KEY (`cou_id`) REFERENCES `course` (`cou_id`);

--
-- Constraints for table `student_table`
--
ALTER TABLE `student_table`
  ADD CONSTRAINT `student_table_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `student_table_ibfk_2` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`fac_id`),
  ADD CONSTRAINT `student_table_ibfk_3` FOREIGN KEY (`sche_stu_id`) REFERENCES `sche_student` (`sche_stu_id`),
  ADD CONSTRAINT `student_table_ibfk_6` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  ADD CONSTRAINT `student_table_ibfk_7` FOREIGN KEY (`cou_id`) REFERENCES `course` (`cou_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `stu_score_edit`
--
ALTER TABLE `stu_score_edit`
  ADD CONSTRAINT `stu_score_edit_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  ADD CONSTRAINT `stu_score_edit_ibfk_2` FOREIGN KEY (`cou_id`) REFERENCES `course` (`cou_id`),
  ADD CONSTRAINT `stu_score_edit_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `stu_score_edit_ibfk_4` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`fac_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`ra_id`) REFERENCES `rank` (`ra_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
