-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2026 at 09:13 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university_student_management`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetStudentDetails` (IN `adm_no` VARCHAR(20))   BEGIN
    SELECT
        s.admission_number,
        s.first_name,
        s.last_name,
        s.gender,
        s.date_of_birth,
        s.phone,
        s.email,
        d.department_name
    FROM students s
    INNER JOIN departments d
        ON s.department_id = d.department_id
    WHERE s.admission_number = adm_no;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `credit_hours` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_code`, `course_name`, `credit_hours`, `department_id`) VALUES
(1, 'BIT2301', 'Advanced Database Management', 3, 1),
(2, 'BIT2302', 'Computer Networks', 3, 1),
(3, 'BIT2303', 'Java Programming', 3, 1),
(4, 'CS2301', 'Artificial Intelligence', 3, 2),
(5, 'CS2302', 'Data Structures and Algorithms', 3, 2),
(6, 'BA2301', 'Principles of Management', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`) VALUES
(1, 'Information Technology'),
(2, 'Computer Science'),
(3, 'Business Administration'),
(4, 'Education');

-- --------------------------------------------------------

--
-- Table structure for table `examinations`
--

CREATE TABLE `examinations` (
  `examination_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `examination_name` varchar(100) NOT NULL,
  `examination_date` date NOT NULL,
  `semester` varchar(20) NOT NULL,
  `academic_year` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `examinations`
--

INSERT INTO `examinations` (`examination_id`, `course_id`, `examination_name`, `examination_date`, `semester`, `academic_year`) VALUES
(1, 1, 'CAT 1', '2026-11-15', 'Semester 1', '2026/2027'),
(2, 1, 'Final Examination', '2026-12-10', 'Semester 1', '2026/2027'),
(3, 2, 'CAT 1', '2026-11-17', 'Semester 1', '2026/2027'),
(4, 2, 'Final Examination', '2026-12-12', 'Semester 1', '2026/2027'),
(5, 3, 'CAT 1', '2026-11-19', 'Semester 1', '2026/2027'),
(6, 4, 'CAT 1', '2026-11-20', 'Semester 1', '2026/2027'),
(7, 5, 'CAT 1', '2026-11-22', 'Semester 1', '2026/2027'),
(8, 6, 'CAT 1', '2026-11-24', 'Semester 1', '2026/2027');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `fee_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(30) NOT NULL,
  `receipt_number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`fee_id`, `student_id`, `amount_paid`, `payment_date`, `payment_method`, `receipt_number`) VALUES
(1, 1, 25000.00, '2026-09-10', 'M-Pesa', 'REC001'),
(2, 2, 30000.00, '2026-09-11', 'Bank', 'REC002'),
(3, 3, 28000.00, '2026-09-12', 'M-Pesa', 'REC003'),
(4, 4, 35000.00, '2026-09-13', 'Bank', 'REC004'),
(5, 5, 22000.00, '2026-09-14', 'M-Pesa', 'REC005'),
(6, 1, 15000.00, '2026-10-05', 'M-Pesa', 'REC006'),
(7, 2, 10000.00, '2026-10-06', 'Bank', 'REC007');

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `registration_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `registration_date` date NOT NULL,
  `semester` varchar(20) NOT NULL,
  `academic_year` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`registration_id`, `student_id`, `course_id`, `registration_date`, `semester`, `academic_year`) VALUES
(1, 1, 1, '2026-09-05', 'Semester 1', '2026/2027'),
(2, 1, 2, '2026-09-05', 'Semester 1', '2026/2027'),
(3, 1, 3, '2026-09-05', 'Semester 1', '2026/2027'),
(4, 2, 1, '2026-09-06', 'Semester 1', '2026/2027'),
(5, 2, 2, '2026-09-06', 'Semester 1', '2026/2027'),
(6, 3, 4, '2026-09-07', 'Semester 1', '2026/2027'),
(7, 3, 5, '2026-09-07', 'Semester 1', '2026/2027'),
(8, 4, 4, '2026-09-07', 'Semester 1', '2026/2027'),
(9, 4, 5, '2026-09-07', 'Semester 1', '2026/2027'),
(10, 5, 6, '2026-09-08', 'Semester 1', '2026/2027');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `result_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `examination_id` int(11) NOT NULL,
  `marks` decimal(5,2) NOT NULL,
  `grade` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`result_id`, `student_id`, `examination_id`, `marks`, `grade`) VALUES
(1, 1, 1, 78.00, 'B+'),
(2, 2, 1, 65.00, 'B'),
(3, 1, 2, 82.00, 'A'),
(4, 2, 2, 71.00, 'B+'),
(5, 1, 3, 88.00, 'A'),
(6, 2, 3, 74.00, 'B+'),
(7, 3, 6, 69.00, 'B'),
(8, 4, 6, 81.00, 'A'),
(9, 3, 7, 76.00, 'B+'),
(10, 4, 7, 64.00, 'B');

--
-- Triggers `results`
--
DELIMITER $$
CREATE TRIGGER `CheckMarksBeforeInsert` BEFORE INSERT ON `results` FOR EACH ROW BEGIN
    IF NEW.marks < 0 OR NEW.marks > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Marks must be between 0 and 100';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `admission_number` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `admission_number`, `first_name`, `last_name`, `gender`, `date_of_birth`, `phone`, `email`, `department_id`) VALUES
(1, 'BIT001', 'Hannah', 'Ndungu', 'Female', '2004-05-12', '0712345678', 'hannah@example.com', 1),
(2, 'BIT002', 'Brian', 'Mwangi', 'Male', '2003-08-20', '0723456789', 'brian@example.com', 1),
(3, 'CS001', 'Grace', 'Wanjiku', 'Female', '2004-02-15', '0734567890', 'grace@example.com', 2),
(4, 'CS002', 'Kevin', 'Kamau', 'Male', '2003-11-10', '0745678901', 'kevin@example.com', 2),
(5, 'BA001', 'Mary', 'Achieng', 'Female', '2004-07-25', '0756789012', 'mary@example.com', 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `student_examination_results`
-- (See below for the actual view)
--
CREATE TABLE `student_examination_results` (
`admission_number` varchar(20)
,`student_name` varchar(101)
,`course_code` varchar(20)
,`course_name` varchar(100)
,`examination_name` varchar(100)
,`examination_date` date
,`marks` decimal(5,2)
,`grade` varchar(2)
);

-- --------------------------------------------------------

--
-- Structure for view `student_examination_results`
--
DROP TABLE IF EXISTS `student_examination_results`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_examination_results`  AS SELECT `s`.`admission_number` AS `admission_number`, concat(`s`.`first_name`,' ',`s`.`last_name`) AS `student_name`, `c`.`course_code` AS `course_code`, `c`.`course_name` AS `course_name`, `e`.`examination_name` AS `examination_name`, `e`.`examination_date` AS `examination_date`, `r`.`marks` AS `marks`, `r`.`grade` AS `grade` FROM (((`results` `r` join `students` `s` on(`r`.`student_id` = `s`.`student_id`)) join `examinations` `e` on(`r`.`examination_id` = `e`.`examination_id`)) join `courses` `c` on(`e`.`course_id` = `c`.`course_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD UNIQUE KEY `course_code` (`course_code`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `examinations`
--
ALTER TABLE `examinations`
  ADD PRIMARY KEY (`examination_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`fee_id`),
  ADD UNIQUE KEY `receipt_number` (`receipt_number`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`registration_id`),
  ADD UNIQUE KEY `student_id` (`student_id`,`course_id`,`semester`,`academic_year`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`result_id`),
  ADD UNIQUE KEY `student_id` (`student_id`,`examination_id`),
  ADD KEY `examination_id` (`examination_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `admission_number` (`admission_number`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `idx_student_name` (`last_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `examinations`
--
ALTER TABLE `examinations`
  MODIFY `examination_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `fee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `registration_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);

--
-- Constraints for table `examinations`
--
ALTER TABLE `examinations`
  ADD CONSTRAINT `examinations_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `registrations_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `registrations_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`examination_id`) REFERENCES `examinations` (`examination_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
