-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 15, 2020 at 04:43 PM
-- Server version: 5.7.31-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `SkinCancer`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments_table`
--

CREATE TABLE `appointments_table` (
  `id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  `link_to` varchar(100) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cancer_types`
--

CREATE TABLE `cancer_types` (
  `id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `home_remedy` varchar(10000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `departments_table`
--

CREATE TABLE `departments_table` (
  `id` int(11) NOT NULL,
  `department` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments_table`
--

INSERT INTO `departments_table` (`id`, `department`) VALUES
(1, 'Dermatologist'),
(2, 'Dermatology');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_details`
--

CREATE TABLE `doctor_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `qual_id` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `doc_exp` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor_details`
--

INSERT INTO `doctor_details` (`id`, `user_id`, `qual_id`, `dept_id`, `hospital_id`, `doc_exp`) VALUES
(1, 2, 1, 1, 1, '38'),
(2, 3, 2, 1, 2, ''),
(3, 4, 3, 1, 3, '5'),
(4, 5, 4, 1, 4, '5'),
(5, 6, 1, 1, 5, '14'),
(6, 7, 5, 1, 6, '10'),
(7, 8, 6, 1, 7, '3'),
(8, 9, 7, 1, 8, '9'),
(9, 10, 8, 1, 9, ''),
(10, 11, 9, 1, 10, '2'),
(11, 12, 10, 1, 11, '15'),
(12, 13, 11, 1, 12, '6'),
(13, 14, 12, 1, 13, '8'),
(14, 15, 1, 1, 14, '7'),
(16, 17, 14, 1, 16, '17'),
(17, 18, 15, 1, 17, '45'),
(18, 19, 16, 1, 5, '35'),
(19, 20, 17, 1, 18, '22'),
(20, 21, 18, 1, 14, '29'),
(21, 22, 19, 1, 19, '6'),
(22, 23, 20, 1, 20, '17'),
(23, 24, 21, 1, 21, '30'),
(24, 25, 22, 1, 22, '27'),
(25, 26, 23, 1, 23, '30'),
(27, 28, 25, 1, 25, '33'),
(28, 29, 26, 1, 26, '8'),
(29, 30, 12, 1, 27, '3'),
(30, 31, 27, 1, 28, '17'),
(31, 32, 28, 1, 9, '8'),
(32, 33, 29, 1, 29, '11'),
(33, 34, 30, 1, 15, '6'),
(34, 35, 31, 1, 1, '17'),
(35, 36, 32, 1, 20, '18'),
(36, 37, 1, 1, 20, '17'),
(37, 38, 33, 1, 30, '33'),
(38, 39, 34, 1, 31, '18'),
(39, 40, 35, 1, 9, ''),
(40, 41, 36, 1, 11, '20'),
(41, 42, 37, 1, 17, '30'),
(42, 43, 38, 1, 32, '13'),
(43, 44, 39, 1, 33, '11'),
(44, 45, 3, 1, 3, '4'),
(45, 46, 40, 2, 34, ''),
(46, 47, 41, 1, 35, '9'),
(47, 48, 42, 1, 23, '5'),
(48, 49, 43, 1, 17, '15'),
(49, 50, 44, 1, 20, '32'),
(50, 51, 45, 1, 15, '24'),
(51, 52, 46, 1, 32, '18'),
(52, 53, 47, 1, 3, '4'),
(53, 54, 48, 1, 23, '19'),
(54, 55, 19, 1, 3, '1'),
(55, 56, 49, 1, 1, '20'),
(56, 57, 19, 1, 3, '1'),
(57, 58, 50, 1, 36, '17'),
(58, 59, 51, 1, 5, '34'),
(59, 60, 52, 1, 17, '23'),
(60, 61, 53, 1, 37, '7'),
(61, 62, 54, 1, 3, '1'),
(62, 63, 55, 1, 15, '21'),
(63, 64, 56, 1, 10, '15'),
(64, 65, 57, 1, 38, '10'),
(65, 66, 58, 1, 39, '13'),
(67, 68, 60, 1, 9, '10'),
(68, 69, 61, 1, 17, '9'),
(69, 70, 62, 1, 20, '12'),
(70, 71, 54, 1, 9, ''),
(71, 72, 63, 1, 15, '29'),
(72, 73, 64, 1, 40, ''),
(73, 74, 65, 1, 3, '5'),
(74, 75, 66, 1, 5, '30'),
(75, 76, 40, 2, 34, ''),
(77, 78, 19, 1, 3, '4'),
(78, 79, 68, 1, 8, '6'),
(79, 80, 69, 1, 22, '27'),
(80, 81, 70, 1, 41, '16'),
(81, 82, 1, 1, 12, '17'),
(82, 83, 71, 1, 17, '21'),
(83, 84, 19, 1, 3, '6'),
(84, 85, 72, 1, 24, '15'),
(85, 86, 73, 1, 42, '11'),
(86, 87, 74, 1, 43, '15'),
(87, 88, 1, 1, 44, '1'),
(88, 89, 75, 1, 45, '15'),
(89, 90, 76, 1, 46, '3'),
(90, 91, 77, 1, 47, ''),
(91, 92, 78, 1, 48, '3'),
(92, 93, 79, 1, 49, '3'),
(93, 94, 80, 1, 50, '27'),
(94, 95, 81, 1, 51, '3'),
(95, 96, 4, 1, 52, '5'),
(96, 97, 82, 1, 53, '10'),
(97, 98, 6, 1, 54, '3'),
(98, 99, 83, 1, 55, '20'),
(99, 100, 84, 1, 56, '4'),
(100, 101, 85, 1, 57, '28'),
(101, 102, 10, 1, 58, '15'),
(102, 103, 1, 1, 59, '7'),
(103, 104, 86, 1, 60, '25'),
(104, 105, 87, 1, 61, '12'),
(105, 106, 88, 1, 62, '9'),
(106, 107, 89, 1, 63, '6'),
(107, 108, 80, 1, 48, '8'),
(108, 109, 90, 1, 55, '17'),
(109, 110, 91, 1, 64, '4'),
(110, 111, 33, 1, 65, '43'),
(111, 112, 92, 1, 66, '11'),
(112, 113, 36, 1, 67, '20'),
(113, 114, 40, 2, 56, ''),
(114, 115, 93, 1, 68, '36'),
(115, 116, 94, 1, 55, '12'),
(116, 117, 95, 1, 69, '5'),
(117, 118, 1, 1, 52, '25'),
(118, 119, 96, 1, 44, '9'),
(119, 120, 97, 1, 54, '2'),
(120, 121, 98, 1, 44, '4'),
(121, 122, 99, 1, 70, '27'),
(122, 123, 80, 1, 71, '3'),
(123, 124, 80, 1, 48, '5'),
(124, 125, 100, 1, 61, '1'),
(125, 126, 101, 1, 50, '6'),
(126, 127, 102, 1, 72, '8'),
(127, 128, 103, 1, 48, ''),
(128, 129, 104, 1, 51, '2'),
(129, 130, 105, 1, 48, ''),
(130, 131, 106, 1, 73, '6'),
(131, 132, 107, 1, 74, '3'),
(132, 133, 47, 1, 75, '4'),
(133, 134, 80, 1, 76, '3'),
(134, 135, 108, 1, 77, '7'),
(135, 136, 40, 2, 78, ''),
(136, 137, 109, 1, 53, '34'),
(137, 138, 110, 1, 67, '28'),
(138, 139, 111, 1, 79, '10'),
(139, 140, 112, 1, 47, ''),
(140, 141, 113, 1, 59, '2'),
(141, 142, 40, 2, 56, ''),
(142, 143, 114, 1, 79, ''),
(143, 144, 115, 1, 55, '14'),
(144, 145, 85, 1, 75, '26'),
(145, 146, 116, 1, 80, '16'),
(146, 147, 117, 1, 77, '5'),
(147, 148, 117, 1, 81, '11'),
(148, 149, 118, 1, 62, '11'),
(149, 150, 119, 1, 82, '2'),
(150, 151, 36, 1, 83, ''),
(151, 152, 120, 1, 78, '2'),
(152, 153, 121, 1, 48, '4'),
(153, 154, 78, 1, 63, '26'),
(154, 155, 95, 1, 70, '1'),
(155, 156, 122, 1, 78, '4'),
(156, 157, 123, 1, 48, ''),
(157, 158, 36, 1, 83, ''),
(158, 159, 36, 1, 47, ''),
(159, 160, 1, 1, 70, '12'),
(160, 161, 124, 1, 62, '9'),
(161, 162, 125, 1, 60, '1'),
(162, 163, 126, 1, 61, '6'),
(163, 164, 126, 1, 84, '5'),
(164, 165, 127, 1, 63, '2'),
(165, 166, 128, 1, 85, ''),
(166, 167, 54, 1, 45, '2');

-- --------------------------------------------------------

--
-- Table structure for table `hospitals_table`
--

CREATE TABLE `hospitals_table` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospitals_table`
--

INSERT INTO `hospitals_table` (`id`, `name`) VALUES
(1, 'Apollo Hospitals Secunderabad, Secbad'),
(2, 'Apollo Hospitals Ramnagar Vizag, Ram Nagar'),
(3, 'Apollo Teleclinic, Jubilee Hills'),
(4, 'Apollo Cradle Jubileehills, Jubileehills'),
(5, 'Apollo Hospitals Delhi, Sarita Vihar'),
(6, 'Apollo Hospitals International Limited Ahmedabad, Gandhinagar'),
(7, 'The Apollo Heart Centre, Greams Road'),
(8, 'Apollo Medical Centre Karapakkam, Karapakkam'),
(9, 'Apollo Hospitals Noida, Sector 26'),
(10, 'Apollo Firstmed Hospital, Poonamallee High Road'),
(11, 'Apollo Hospitals Guwahati, Guwahati'),
(12, 'Apollo Cosmetic Clinics Mrc Nagar, R A Puram'),
(13, 'Apollo Speciality Hospitals O M R, Old Mahabalipuram Road'),
(14, 'Apollo Spectra Hospitals Koramangala, Koramangala'),
(15, 'Apollo Gleneagles Hospital Limited, Canal Circular Road'),
(16, 'Apollo Bsr Hospitals, Junwani Road'),
(17, 'Apollo Hospitals Greams Road Chennai, GREAMS ROAD'),
(18, 'Apollo Bgs Hospitals Mysore, Kuvempunagar'),
(19, 'Apollo Hospitals D R D O, kanchanbagh'),
(20, 'Apollo Hospitals Navi Mumbai, Navi Mumbai'),
(21, 'Apollo Hospitals Hyderguda, Hyderguda'),
(22, 'Apollo Hospitals Bannerghatta Road, BANNERGHATTA ROAD'),
(23, 'Apollo Health City Jubilee Hills, Jubileehills'),
(24, 'Apollo Hospitals Sheshadripuram, Sheshadripuram'),
(25, 'Apollo Cancer Institutes, Annasalai'),
(26, 'Apollo Cradle Amritsar, Court Road'),
(27, 'Apollo Specialty Hospitals Nellore, Pinakini Nagar'),
(28, 'Apollo Speciality Hospitals Trichy, Tiruchirappalli'),
(29, 'R J N Apollo Spectra Hospital, Vikas Nagar'),
(30, 'Apollo Spectra Hospitals Kailash Colony, Kailash Colony'),
(31, 'Apollo Hospitals Bilaspur, Seepat Road'),
(32, 'Apollo Speciality Hospitals Vanagaram, Vanagaram'),
(33, 'Apollo Spectra Hospitals Chembur, Chembur'),
(34, 'Jehangir Hospital, SASSOON ROAD'),
(35, 'Apollo Speciality Hospitals Madurai, KK Nagar'),
(36, 'Apollo Cradle Brookefield, Marthahalli'),
(37, 'Apollo Adlux Hospital, Karukutty'),
(38, 'Apollo Hospitals Bhubaneswar, Bhubaneshwar Road'),
(39, 'Apollomedics Super Specialty Hospitals, Kanpur Road'),
(40, 'Apollo Hospital Karur, Allwyn Nagar'),
(41, 'Apollo Children Hospital Chennai, Greams Road'),
(42, 'Apollo Speciality Hospitals Jayanagar Bangalore, Jayanagar'),
(43, 'Apollo Clinic Dehradun, Dehradun'),
(44, 'Apollo Clinic Nigdipradhikaran, Nigdipradhikaran'),
(45, 'Apollo Clinic Electronic City, Neeladri Nagar'),
(46, 'Apollo Clinic J P Nagar, Hobli'),
(47, 'Apollo Clinic Prince Anwar Shah Road, Anwar Shah Road'),
(48, 'Apollo Clinic Marathahalli, Marathahalli'),
(49, 'Apollo Clinic Ramrajatala, NEAR BHANUMOTI SCHOOL, OPP BSNL OFFICE, RAMRAJATALA'),
(50, 'Apollo Medical Centre Anna Nagar, Anna Nagar'),
(51, 'Apollo Clinic H S R Layout, HSR Layout'),
(52, 'Apollo Medical Center Kondapur, kondapur'),
(53, 'Apollo Spectra Hospitals Mrc Nagar, MRC Nagar'),
(54, 'Apollo Clinic T Nagar, Pondy Bazaar'),
(55, 'Apollo Clinic Narendrapur, Narendrapur'),
(56, 'Apollo Clinic New Town, Rajarhat'),
(57, 'Apollo Clinic Indirapuram, Vaibhav Khand'),
(58, 'Guwahati Ulubari, Guwahati'),
(59, 'Apollo Clinic Koramangala, Koramangala'),
(60, 'Apollo Clinic Barrackpore, Barrackpore'),
(61, 'Apollo Clinic Manikonda, Manikonda'),
(62, 'Apollo Clinic Bellandur, Varthur'),
(63, 'Apollo Clinic Velachery, Guindy'),
(64, 'Apollo Clinic Siliguri,'),
(65, 'Apollo Clinic Sodepur, Sodepur'),
(66, 'Apollo Clinic Nizampet, Qutbullapur'),
(67, 'Apollo Clinic Seethammapeta Vizag, Seethammapeta'),
(68, 'Apollo Medical Centre Kotturpuram, Kotturpuram'),
(69, 'Apollo Clinic Uppal, Uppal'),
(70, 'Apollo Clinic Indiranagar, Indiranagar'),
(71, 'Apollo Clinic Wanowrie, Taluka Haveli'),
(72, 'Apollo Clinic Salt Lake, Salt Lake'),
(73, 'Apollo Clinic Chanda Nagar, Madeenaguda'),
(74, 'Apollo Clinic Mysore, VV Mohlla'),
(75, 'Apollo Clinic A S Rao Nagar, A S Rao Nagar'),
(76, 'Apollo Clinic Sarjapur Road, Kaikondanahalli'),
(77, 'Apollo Clinic Nagpur, Nagpur'),
(78, 'Apollo Spectra Hospitals Alwarpet, Alwarpet'),
(79, 'Apollo Clinic Aundh Pune, Aundh'),
(80, 'Apollo Clinic Viman Nagar Pune, Vimannagar'),
(81, 'Apollo Clinic Kharadi,'),
(82, 'Apollo Clinic Basavanagudi, Bull Temple Road'),
(83, 'Apollo Clinic Jessore Road, Jessore Road'),
(84, 'Apollo Clinic Valasaravakam, Prakasam Salai'),
(85, 'Apollo Sugar Clinic Rohini, Rohini');

-- --------------------------------------------------------

--
-- Table structure for table `languages_table`
--

CREATE TABLE `languages_table` (
  `id` int(11) NOT NULL,
  `language` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lang_doc`
--

CREATE TABLE `lang_doc` (
  `doc_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `locality_table`
--

CREATE TABLE `locality_table` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locality_table`
--

INSERT INTO `locality_table` (`id`, `name`) VALUES
(1, 'Secbad , Hyderabad'),
(2, 'Ram Nagar & Arilova , Visakhapatnam'),
(3, 'Jubilee Hills , Hyderabad'),
(4, 'Jubileehills & kondapur , Hyderabad'),
(5, 'Sarita Vihar & Sector 26 , Delhi'),
(6, 'Gandhinagar , Ahmedabad'),
(7, 'Greams Road , Chennai'),
(8, 'Karapakkam & Old Mahabalipuram Road , Chennai'),
(9, 'Sector 26 , Noida'),
(10, 'Poonamallee High Road , Chennai'),
(11, 'Guwahati , Guwahati'),
(12, 'R A Puram , Chennai'),
(13, 'Old Mahabalipuram Road , Chennai'),
(14, 'Koramangala , Bangalore'),
(15, 'Canal Circular Road , Kolkata'),
(16, 'Junwani Road , Bhilai'),
(17, 'GREAMS ROAD & Greams Road , Chennai'),
(18, 'Sarita Vihar , Delhi'),
(19, 'Kuvempunagar , Mysore'),
(20, 'kanchanbagh , Hyderabad'),
(21, 'Navi Mumbai , Mumbai'),
(22, 'Hyderguda , Hyderabad'),
(23, 'BANNERGHATTA ROAD , Bangalore'),
(24, 'Jubileehills , Hyderabad'),
(25, 'Sheshadripuram , Bangalore'),
(26, 'Annasalai , Chennai'),
(27, 'Court Road , Amritsar'),
(28, 'Pinakini Nagar , Nellore'),
(29, 'Tiruchirappalli , Trichy'),
(30, 'Vikas Nagar , Gwalior'),
(31, 'Kailash Colony , Delhi'),
(32, 'Seepat Road , Bilaspur'),
(33, 'Vanagaram , Chennai'),
(34, 'Chembur , Mumbai'),
(35, 'Jehangir Hospital, SASSOON ROAD'),
(36, 'KK Nagar , Madurai'),
(37, 'Marthahalli , Bangalore'),
(38, 'GREAMS ROAD & Annasalai & Greams Road , Chennai'),
(39, 'Karukutty , Cochin'),
(40, 'Bhubaneshwar Road , Bhubaneswar'),
(41, 'Kanpur Road , Lucknow'),
(42, 'GREAMS ROAD & Annasalai , Chennai'),
(43, 'Allwyn Nagar , Karur'),
(44, 'Jayanagar , Bangalore'),
(45, 'Dehradun , Dehradun'),
(46, 'Nigdipradhikaran , Pune'),
(47, 'Neeladri Nagar , Bangalore'),
(48, 'Hobli , Bangalore'),
(49, 'Anwar Shah Road , Kolkata'),
(50, 'Marathahalli , Bangalore'),
(51, 'NEAR BHANUMOTI SCHOOL, OPP BSNL OFFICE, RAMRAJATALA , Kolkata'),
(52, 'Anna Nagar , Chennai'),
(53, 'HSR Layout , Bangalore'),
(54, 'kondapur , Hyderabad'),
(55, 'MRC Nagar , Chennai'),
(56, 'Pondy Bazaar , Chennai'),
(57, 'Narendrapur , Kolkata'),
(58, 'Rajarhat , Kolkata'),
(59, 'Vaibhav Khand , Ghaziabad'),
(60, 'Barrackpore , Kolkata'),
(61, 'Manikonda , Hyderabad'),
(62, 'Varthur & Kaikondanahalli , Bangalore'),
(63, 'Guindy & Kotturpuram , Chennai'),
(64, ', Kolkata'),
(65, 'Sodepur , Kolkata'),
(66, 'Qutbullapur & Madeenaguda , Hyderabad'),
(67, 'Seethammapeta , Visakhapatnam'),
(68, 'Apollo Clinic New Town, Rajarhat'),
(69, 'Kotturpuram , Chennai'),
(70, 'Uppal , Hyderabad'),
(71, 'Indiranagar , Bangalore'),
(72, 'Taluka Haveli , Pune'),
(73, 'Salt Lake & Rajarhat , Kolkata'),
(74, 'Madeenaguda , Hyderabad'),
(75, 'VV Mohlla , Mysore'),
(76, 'A S Rao Nagar , Hyderabad'),
(77, 'Kaikondanahalli , Bangalore'),
(78, 'Nagpur , Nagpur'),
(79, 'Apollo Spectra Hospitals Alwarpet, Alwarpet'),
(80, 'Aundh , Pune'),
(81, 'Vimannagar , Pune'),
(82, ', Pune'),
(83, 'Varthur , Bangalore'),
(84, 'Bull Temple Road , Bangalore'),
(85, 'Jessore Road , Kolkata'),
(86, 'Alwarpet , Chennai'),
(87, 'Guindy , Chennai'),
(88, 'Prakasam Salai , Chennai'),
(89, 'Rohini , Delhi');

-- --------------------------------------------------------

--
-- Table structure for table `notifications_table`
--

CREATE TABLE `notifications_table` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `link_to` varchar(100) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions_table`
--

CREATE TABLE `prescriptions_table` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `desc` varchar(10000) DEFAULT NULL,
  `image_path` varchar(10000) DEFAULT NULL,
  `cancer_probability` float DEFAULT NULL,
  `malignant_probability` float DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `time_of_examination` datetime DEFAULT NULL,
  `cancer` varchar(10) NOT NULL,
  `affected_area` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `qualifications_table`
--

CREATE TABLE `qualifications_table` (
  `id` int(11) NOT NULL,
  `qualification` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qualifications_table`
--

INSERT INTO `qualifications_table` (`id`, `qualification`) VALUES
(1, 'MBBS, MD'),
(2, 'MBBS, MD Dermatology, Venereology & Leprology'),
(3, 'MD ( Dermatology )'),
(4, 'MBBS,DDVL,FAM'),
(5, 'MBBS, MD(DERMATOLOGY), DNB(Dermatology & Venereology)'),
(6, 'MBBS, MD- Dermatology'),
(7, 'MBBS from Stanley Medical College , DDVL from Madras Medical College'),
(8, 'MBBS, MD (Dermatology and Venerology)'),
(9, 'MBBS, MD (Dermatology Venereology and Leprosy)'),
(10, 'MD MBBS'),
(11, 'MBBS, MD Dermatology Venerology & Leprosy'),
(12, 'MBBS, MD(DVL)'),
(14, 'M.B.B.S, DVD'),
(15, 'MBBS; MD DV&D'),
(16, 'MBBS, MD (Dermatology), DLO (ENT)'),
(17, 'MBBS, MD, FRUGHS'),
(18, 'MBBS, DNB (Dermatology)'),
(19, 'MD DVL'),
(20, 'MBBS,DNB,DVD,FCPS'),
(21, 'MD, DD'),
(22, 'MBBS, MD(Dermatology & Venereology)'),
(23, 'MBBS; DD (Diploma in Dermatology); MD (Dermatology); DNB'),
(25, 'M.D. (Dermatology) D.D.,'),
(26, 'MBBS, MD ( Dermatology )'),
(27, 'MBBS, D.D. (Diploma in Dermatology)'),
(28, 'MBBS - 2007 - Ch. Charan Singh University MD - 2011- Ch. Charan Singh University'),
(29, 'M.B.B.S., M.D., DNB'),
(30, 'MBBS, MD[DVL][Bangalore]'),
(31, 'DD, MD, MBBS'),
(32, 'DNB(Dermatology), DVD(Mumbai), MBBS'),
(33, 'MBBS, DVD'),
(34, 'MBBS, D.V. & D'),
(35, 'MBBS (MAMC), MD (DELHI), DNB, MNAMS (Gold Medalist)'),
(36, 'MD'),
(37, 'MD(DERM); DIP CLINICAL IMMUNOLOGY'),
(38, 'FRCP (UK), MRCP (Dermatology), CCT (UK), MD (Dermatology).'),
(39, 'MBBS, DNB (Dermatology & Venereology)'),
(40, 'Dermatologist'),
(41, 'MD.,(DVL ) F.C.D.'),
(42, 'MBBS, MD, DVL, FDLS'),
(43, 'MBBS; MD (Dermatology)'),
(44, 'MD, PhD, FRCP(Glasg.),DVD, FAADV'),
(45, 'MBBS, DVD(CAL), FIAD, FFAADV, FRCP(Glasgow), FRCP(Edin), FRCP(London)'),
(46, 'MBBS, M.D(Dermatology)'),
(47, 'MBBS, Dermatology, Venereology and Leprosy'),
(48, 'MBBS; MD (Skin & VD); DDV; FCPS'),
(49, 'MD, MBBS'),
(50, 'MBBs, DVDL ( Diploma in Dermatology, Venereology and Leprosy )'),
(51, 'MBBS, MD, DVD, DTMH, FAMS'),
(52, 'Bsc, MD, DD, M.Derm'),
(53, 'MBBS, MD, DNB, MRCP (SCE) Dermatology, PDF Lasers and Dermatosurgery(JIPMER)'),
(54, 'MBBS,MD'),
(55, 'F.A.A.D (USA),MD(Dermat,1999), MBBS (1995)'),
(56, 'MBBS, MD(DVIL), FAGE, FDLS(SINGAPORE)'),
(57, 'MBBS ; M.D. Dermatology Venerology and Leprology'),
(58, 'M.D.(Skin,V.D. & Leprosy) Shri M. P. Shah Medical College,Jamnagar, Gujarat(Saurashtra University)'),
(60, 'MBBS, DDVI, FDHT(Thailand) FISHRS(USA)'),
(61, 'MBBS; MD; DNB'),
(62, 'M.B.B.S, MD(DERMATOLOY,VENEREOLOGY AND LEPROSY)'),
(63, 'MBBS(1986),MD (1991),MRCP(1999)FRCP (GLASGOW)'),
(64, 'MBBS, DD, DHI'),
(65, 'MBBS ,MD DVL'),
(66, 'MD, DIS, FDS (FRANCE), DV DTMSH (UK)'),
(68, 'MBBS, MD(DVL), FAM, FAAD'),
(69, 'MBBS,PG Diploma in Dermatology,Venerology and Leprosy, PG in Practical Dermatology.'),
(70, 'M.D (DERMATOLOGY), MBBS, P.G.C.I.H, A.F.I.H.'),
(71, 'MBBS, MD, AFIH,PGCIH,'),
(72, 'MBBS, MD ( Dermatology & Leprosy & Venereolgy), DNB (Dermatology & Venereolgy)'),
(73, 'MBBS; MD'),
(74, 'MBBS, PGCCHM, D.Sc.'),
(75, 'MBBS,DVD,MD(DVL)'),
(76, 'MBBS,MD in Dermatology'),
(77, 'MD.FAGE'),
(78, 'MBBS, MD (Dermatology)'),
(79, 'MBBS,MD (DERMA)'),
(80, 'MBBS, DDVL'),
(81, 'MBBS, MD Dermatology Venereology & Leperology'),
(82, 'MBBS, MD Dermatology'),
(83, 'MBBS, MD (SKIN & VD)'),
(84, 'M.B.B.S,'),
(85, 'MD (DERMATOLOGY)'),
(86, 'MD(DERMA)'),
(87, 'MBBS,DDVL,PGDMC'),
(88, 'MBBS, DDVL, DNB(DERMA)'),
(89, 'MBBS,DDVL'),
(90, 'MBBS, DCH, MD(DERMATOLOGY)'),
(91, 'MBBS FAM'),
(92, 'MBBS DDVL'),
(93, 'M.D, D.D, FAMS'),
(94, 'MBBS,MD (Dermatology, Venereology and Leprosy)'),
(95, 'MBBS,MD,DVL'),
(96, 'MBBS, MD(Dermatology), DDVL, SCE(UK)'),
(97, 'MBBS., MD.DVL.,FAM.'),
(98, 'MBBS,DVD'),
(99, 'MBBS, MD, DVD, DDV'),
(100, 'MBBS, MDDVL'),
(101, 'MBBS, MD (DVL)'),
(102, 'M.B.B.S,M.D (Dermatology, Venereology, & Leprosy):'),
(103, 'MD / MS'),
(104, 'MBBS, MD Dermatology Venereology & Leprosy'),
(105, 'MBBS, MD ,FRGUHS,FIADVL'),
(106, 'MD (DVL) , Fellow ship in Cosmetology, Trichology'),
(107, 'MBBS. DDVL. FRGUHS'),
(108, 'MBBS, DDV, ECFMG'),
(109, 'MBBS, PG DIP. In DIAB, MHSC (DIAB)'),
(110, 'MBBS,DDLV'),
(111, 'MBBS, DV & D, D.D.V, FCPS SKIN & VD (Mumbai)'),
(112, 'MD.FAGE.FAAD'),
(113, 'M.B.B.S, M.D'),
(114, 'MD(skin)'),
(115, 'MBBS'),
(116, 'MBBS DVD'),
(117, 'MBBS, DDV'),
(118, 'DNB, DDVL(Dermatology)'),
(119, 'MD DERMATOLOGY'),
(120, 'MMBS ,MD'),
(121, 'MBBS, DVDL'),
(122, 'MBBS., MD., DVL'),
(123, 'MBBS, DDVL FRUGHS'),
(124, 'MBBS, MD(dermatology)'),
(125, 'MBBS,MD(DERMATOLOGY,VENEREOLOGY & LAPAROSCOPY)'),
(126, 'MBBS, MD, DVL'),
(127, 'MBBS, MD DVL'),
(128, 'MD, MD (Microbiology (Infectious Disease), Diploma (Skin & Veneral Diseases DVD), Diploma inHM, MPH');

-- --------------------------------------------------------

--
-- Table structure for table `TABLE 1`
--

CREATE TABLE `TABLE 1` (
  `id` int(11) NOT NULL,
  `image_name` varchar(12) DEFAULT NULL,
  `patient_id` varchar(10) DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `age_approx` varchar(3) DEFAULT NULL,
  `anatom_site_general_challenge` varchar(15) DEFAULT NULL,
  `diagnosis` varchar(34) DEFAULT NULL,
  `benign_malignant` varchar(9) DEFAULT NULL,
  `target` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `locality_id` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `user_activated` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`id`, `name`, `email`, `gender`, `dob`, `password`, `image`, `locality_id`, `role`, `user_activated`) VALUES
(2, 'Dr A S Kumar', 'ASKumar@testmail.com', 'M', '1970-01-01', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-a-s-kumar-dermatology-in-hyderabad.jpg', 1, 2, 1),
(3, 'Dr Aishwarya Malladi', 'AishwaryaMalladi@testmail.com', 'M', '1970-01-02', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-aishwarya-malladi-dermatology-in-visakhapatnam.jpeg', 2, 2, 1),
(4, 'Dr Ajay Mujja', 'AjayMujja@testmail.com', 'F', '1970-01-03', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 3, 2, 1),
(5, 'Dr Alekya Singapore', 'AlekyaSingapore@testmail.com', 'F', '1970-01-04', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-alekya-singapore-dermatology-in-hyderabad.jpg', 4, 2, 1),
(6, 'Dr Anju Mangla', 'AnjuMangla@testmail.com', 'F', '1970-01-05', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-anju-mangla-dermatology-in-noida.jpg', 5, 2, 1),
(7, 'Dr Anshul Warman', 'AnshulWarman@testmail.com', 'F', '1970-01-06', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-anshul-warman-dermatology-in-ahmedabad.jpg', 6, 2, 1),
(8, 'Dr Antionetta Ashwini J', 'AntionettaAshwiniJ@testmail.com', 'F', '1970-01-07', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 7, 2, 1),
(9, 'Dr Anuj Singh', 'AnujSingh@testmail.com', 'F', '1970-01-08', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-anuj-singh-dermatology-in-chennai.jpg', 8, 2, 1),
(10, 'Dr Anuja Aggarwal', 'AnujaAggarwal@testmail.com', 'F', '1970-01-09', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-anuja-aggarwal-dermatology-in-noida.jpg', 9, 2, 1),
(11, 'Dr Apoorva Raghavan', 'ApoorvaRaghavan@testmail.com', 'M', '1970-01-10', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-apoorva-raghavan-dermatology-in-chennai.jpg', 10, 2, 1),
(12, 'Dr Arun Agarwal', 'ArunAgarwal@testmail.com', 'M', '1970-01-11', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-arun-agarwal-dermatology-in-guwahati.jpg', 11, 2, 1),
(13, 'Dr Ashiq Mohamed', 'AshiqMohamed@testmail.com', 'M', '1970-01-12', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-ashiq-mohamed-dermatology-in-chennai.jpg', 12, 2, 1),
(14, 'Dr Ashwak Ahmed', 'AshwakAhmed@testmail.com', 'M', '1970-01-13', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-ashwak-ahmed-dermatology-in-chennai.jpg', 13, 2, 1),
(15, 'Dr Asmita Dhekne Chebbi', 'AsmitaDhekneChebbi@testmail.com', 'M', '1970-01-14', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 14, 2, 1),
(17, 'Dr Bharat Chawda', 'BharatChawda@testmail.com', 'M', '1970-01-16', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-bharat-chawda-dermatology-in-bhilai.jpg', 16, 2, 1),
(18, 'Dr Col Rajagopal A', 'ColRajagopalA@testmail.com', 'M', '1970-01-17', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-col-rajagopal-a-dermatology-in-chennai.jpg', 17, 2, 1),
(19, 'Dr D M Mahajan', 'DMMahajan@testmail.com', 'F', '1970-01-18', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-d-m-mahajan-dermatology-in-delhi.jpg', 18, 2, 1),
(20, 'Dr Dayananda T R', 'DayanandaTR@testmail.com', 'F', '1970-01-19', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-dayananda-t-r-dermatology-in-mysore.jpg', 19, 2, 1),
(21, 'Dr Elizebeth Jaysheelan', 'ElizebethJaysheelan@testmail.com', 'F', '1970-01-20', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-elizebeth-jaysheelan-dermatology-in-bangalore.jpg', 14, 2, 1),
(22, 'Dr Fariya Rasheed', 'FariyaRasheed@testmail.com', 'F', '1970-01-21', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 20, 2, 1),
(23, 'Dr Gautam Dethe', 'GautamDethe@testmail.com', 'M', '1970-01-22', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-gautam-dethe-dermatology-in-mumbai.jpg', 21, 2, 1),
(24, 'Dr Gavvala Manmohan', 'GavvalaManmohan@testmail.com', 'F', '1970-01-23', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-gavvala-manmohan-dermatology-in-hyderabad.jpg', 22, 2, 1),
(25, 'Dr Girish Panth', 'GirishPanth@testmail.com', 'F', '1970-01-24', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-girish-panth-dermatology-in-bangalore.jpg', 23, 2, 1),
(26, 'Dr I S Reddy', 'ISReddy@testmail.com', 'F', '1970-01-25', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-i-s-reddy-dermatology-in-hyderabad.jpg', 24, 2, 1),
(28, 'Dr Jayaraaman A M', 'JayaraamanAM@testmail.com', 'F', '1970-01-27', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 26, 2, 1),
(29, 'Dr Jyotisterna Mittal', 'JyotisternaMittal@testmail.com', 'F', '1970-01-28', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 27, 2, 1),
(30, 'Dr K Surya', 'KSurya@testmail.com', 'F', '1970-01-29', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-k-surya-dermatology-in-nellore.jpg', 28, 2, 1),
(31, 'Dr Kamal Uddin', 'KamalUddin@testmail.com', 'M', '1970-01-30', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 29, 2, 1),
(32, 'Dr Kapil Arora', 'KapilArora@testmail.com', 'M', '1970-01-31', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-kapil-arora-dermatology-in-noida.jpg', 9, 2, 1),
(33, 'Dr Khozema Saify', 'KhozemaSaify@testmail.com', 'M', '1970-02-01', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-khozema-saify-dermatology-in-gwalior.jpg', 30, 2, 1),
(34, 'Dr Khushbu Tantia', 'KhushbuTantia@testmail.com', 'F', '1970-02-02', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-khushbu-tantia-dermatology-in-kolkata.jpg', 15, 2, 1),
(35, 'Dr Lahary A K', 'LaharyAK@testmail.com', 'F', '1970-02-03', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-lahary-a-k-dermatology-in-hyderabad.jpg', 1, 2, 1),
(36, 'Dr Manish V Gautam', 'ManishVGautam@testmail.com', 'F', '1970-02-04', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-manish-v-gautam-dermatology-in-mumbai.png', 21, 2, 1),
(37, 'Dr Manjyot Gautam', 'ManjyotGautam@testmail.com', 'M', '1970-02-05', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-manjyot-gautam-dermatology-in-mumbai.jpg', 21, 2, 1),
(38, 'Dr Manu Saksena', 'ManuSaksena@testmail.com', 'F', '1970-02-06', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-manu-saksena-dermatology-in-delhi.jpg', 31, 2, 1),
(39, 'Dr Mohan Gupta', 'MohanGupta@testmail.com', 'M', '1970-02-07', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology-venereology-and-leprology/dr-mohan-gupta-dermatology-venereology-and-leprology-in-bilaspur.jpg', 32, 2, 1),
(40, 'Dr Monika Rajpal', 'MonikaRajpal@testmail.com', 'F', '1970-02-08', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-monika-rajpal-dermatology-in-noida.jpg', 9, 2, 1),
(41, 'Dr Mousumi Das Goswami', 'MousumiDasGoswami@testmail.com', 'M', '1970-02-09', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-mousumi-das-goswami-dermatology-in-guwahati.jpg', 11, 2, 1),
(42, 'Dr Murlidhar Rajagopalan', 'MurlidharRajagopalan@testmail.com', 'F', '1970-02-10', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-murlidhar-rajagopalan-dermatology-in-chennai.jpg', 7, 2, 1),
(43, 'Dr Muthu Subramaniam S', 'MuthuSubramaniamS@testmail.com', 'M', '1970-02-11', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-muthu-subramaniam-s-dermatology-in-chennai.jpg', 33, 2, 1),
(44, 'Dr Nandini Gupta', 'NandiniGupta@testmail.com', 'F', '1970-02-12', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 34, 2, 1),
(45, 'Dr Navaneetha Reddy', 'NavaneethaReddy@testmail.com', 'M', '1970-02-13', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 3, 2, 1),
(46, 'Dr P Vaidya', 'PVaidya@testmail.com', 'M', '1970-02-14', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 35, 2, 1),
(47, 'Dr Padmavathy M', 'PadmavathyM@testmail.com', 'M', '1970-02-15', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-padmavathy-m-dermatology-in-madurai.jpg', 36, 2, 1),
(48, 'Dr Pallavi Gaddam Reddy', 'PallaviGaddamReddy@testmail.com', 'M', '1970-02-16', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-pallavi-gaddam-reddy-dermatology-in-hyderabad.jpg', 24, 2, 1),
(49, 'Dr Priya K', 'PriyaK@testmail.com', 'M', '1970-02-17', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-priya-k-dermatology-in-chennai.jpg', 7, 2, 1),
(50, 'Dr Prof Kiran Godse', 'ProfKiranGodse@testmail.com', 'M', '1970-02-18', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-prof-kiran-godse-dermatology-in-mumbai.jpg', 21, 2, 1),
(51, 'Dr Prof Koushik Lahiri', 'ProfKoushikLahiri@testmail.com', 'F', '1970-02-19', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-prof-koushik-lahiri-dermatology-in-kolkata.jpg', 15, 2, 1),
(52, 'Dr Pushpa Gnanaraj', 'PushpaGnanaraj@testmail.com', 'F', '1970-02-20', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-pushpa-gnanaraj-dermatology-in-chennai.jpg', 33, 2, 1),
(53, 'Dr RADHA PENUMATSA', 'RADHAPENUMATSA@testmail.com', 'M', '1970-02-21', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-radha-penumatsa-dermatology-in-hyderabad.jpg', 3, 2, 1),
(54, 'Dr Radha Shah', 'RadhaShah@testmail.com', 'M', '1970-02-22', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-radha-shah-dermatology-in-hyderabad.jpg', 24, 2, 1),
(55, 'Dr Raghavendra Reddy', 'RaghavendraReddy@testmail.com', 'F', '1970-02-23', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 3, 2, 1),
(56, 'Dr Rajyalaxmi Konathan', 'RajyalaxmiKonathan@testmail.com', 'F', '1970-02-24', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-rajyalaxmi-konathan-dermatology-in-hyderabad.jpg', 1, 2, 1),
(57, 'Dr Ram Sushruth Pathuri', 'RamSushruthPathuri@testmail.com', 'F', '1970-02-25', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 3, 2, 1),
(58, 'Dr Rashmi Manjunath', 'RashmiManjunath@testmail.com', 'M', '1970-02-26', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 37, 2, 1),
(59, 'Dr Ravi K Joshi', 'RaviKJoshi@testmail.com', 'M', '1970-02-27', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-ravi-k-joshi-dermatology-in-delhi.jpg', 18, 2, 1),
(60, 'Dr Ravichandran G', 'RavichandranG@testmail.com', 'M', '1970-02-28', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-ravichandran-g-dermatology-in-chennai.jpg', 38, 2, 1),
(61, 'Dr Resmi M R', 'ResmiMR@testmail.com', 'M', '1970-03-01', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 39, 2, 1),
(62, 'Dr Roshni Kakitha', 'RoshniKakitha@testmail.com', 'F', '1970-03-02', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 3, 2, 1),
(63, 'Dr Sachin Varma', 'SachinVarma@testmail.com', 'M', '1970-03-03', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-sachin-varma-dermatology-in-kolkata.jpg', 15, 2, 1),
(64, 'Dr Sajai Varghese', 'SajaiVarghese@testmail.com', 'M', '1970-03-04', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-sajai-varghese-dermatology-in-chennai.jpg', 10, 2, 1),
(65, 'Dr Satyabrata Tripathy', 'SatyabrataTripathy@testmail.com', 'F', '1970-03-05', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology-venereology-and-leprology/dr-satyabrata-tripathy-dermatology-venereology-and-leprology-in-bhubaneswar.jpg', 40, 2, 1),
(66, 'Dr Shafali Yadav', 'ShafaliYadav@testmail.com', 'F', '1970-03-06', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-shafali-yadav-dermatology-in-lucknow.jpg', 41, 2, 1),
(68, 'Dr Shobit Caroli', 'ShobitCaroli@testmail.com', 'F', '1970-03-08', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 9, 2, 1),
(69, 'Dr Shraddha M', 'ShraddhaM@testmail.com', 'F', '1970-03-09', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-shraddha-m-dermatology-in-chennai.jpg', 42, 2, 1),
(70, 'Dr Shweta Agarwal', 'ShwetaAgarwal@testmail.com', 'F', '1970-03-10', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-shweta-agarwal-dermatology-in-mumbai.jpg', 21, 2, 1),
(71, 'Dr Sonali Langer', 'SonaliLanger@testmail.com', 'M', '1970-03-11', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-sonali-langer-dermatology-in-noida.jpg', 9, 2, 1),
(72, 'Dr Srabani Ghosh Zoha', 'SrabaniGhoshZoha@testmail.com', 'M', '1970-03-12', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-srabani-ghosh-zoha-dermatology-in-kolkata.jpg', 15, 2, 1),
(73, 'Dr Srinivasan G', 'SrinivasanG@testmail.com', 'M', '1970-03-13', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 43, 2, 1),
(74, 'Dr Subbareddy Bovilla', 'SubbareddyBovilla@testmail.com', 'F', '1970-03-14', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 3, 2, 1),
(75, 'Dr Sumit Kumar Bose', 'SumitKumarBose@testmail.com', 'M', '1970-03-15', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 18, 2, 1),
(76, 'Dr Sunil Tolat', 'SunilTolat@testmail.com', 'M', '1970-03-16', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 35, 2, 1),
(78, 'Dr Swetha Sanagavarapu', 'SwethaSanagavarapu@testmail.com', 'M', '1970-03-18', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-swetha-sanagavarapu-dermatology-in-hyderabad.jpeg', 3, 2, 1),
(79, 'Dr Tejaswi Cherukuri', 'TejaswiCherukuri@testmail.com', 'F', '1970-03-19', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-tejaswi-cherukuri-dermatology-in-chennai.jpg', 8, 2, 1),
(80, 'Dr Vanita Mathew', 'VanitaMathew@testmail.com', 'F', '1970-03-20', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 23, 2, 1),
(81, 'Dr Vengopal Reddy V', 'VengopalReddyV@testmail.com', 'F', '1970-03-21', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-vengopal-reddy-v-dermatology-in-chennai.jpg', 7, 2, 1),
(82, 'Dr Venugopal Reddy', 'VenugopalReddy@testmail.com', 'F', '1970-03-22', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-venugopal-reddy-dermatology-in-chennai.jpg', 12, 2, 1),
(83, 'Dr Venugopal Reddy V', 'VenugopalReddyV@testmail.com', 'F', '1970-03-23', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-venugopal-reddy-v-dermatology-in-chennai.jpg', 7, 2, 1),
(84, 'Dr Vijaya Bhasker', 'VijayaBhasker@testmail.com', 'M', '1970-03-24', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 3, 2, 1),
(85, 'Dr Vijendran Pragasam', 'VijendranPragasam@testmail.com', 'M', '1970-03-25', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 25, 2, 1),
(86, 'Dr Yogesh H R', 'YogeshHR@testmail.com', 'M', '1970-03-26', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-yogesh-h-r-dermatology-in-bangalore.jpg', 44, 2, 1),
(87, 'Dr A K Dhar', 'AKDhar@testmail.com', 'F', '1970-03-27', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 45, 2, 1),
(88, 'Dr Aayush Gupta', 'AayushGupta@testmail.com', 'F', '1970-03-28', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-aayush-gupta-dermatology-in-pune.jpg', 46, 2, 1),
(89, 'Dr Abdhul Samad', 'AbdhulSamad@testmail.com', 'F', '1970-03-29', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 47, 2, 1),
(90, 'Dr Abhineetha Hosthota', 'AbhineethaHosthota@testmail.com', 'M', '1970-03-30', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-abhineetha-hosthota-dermatology-in-bangalore.jpg', 48, 2, 1),
(91, 'Dr Abshishek Dey', 'AbshishekDey@testmail.com', 'M', '1970-03-31', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 49, 2, 1),
(92, 'Dr ADITHYA NAGENDRAN', 'ADITHYANAGENDRAN@testmail.com', 'M', '1970-04-01', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 50, 2, 1),
(93, 'Dr ADRIJA DATTA', 'ADRIJADATTA@testmail.com', 'M', '1970-04-02', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 51, 2, 1),
(94, 'Dr Aftab Mateen', 'AftabMateen@testmail.com', 'F', '1970-04-03', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 52, 2, 1),
(95, 'Dr AKSHI BANSAL', 'AKSHIBANSAL@testmail.com', 'M', '1970-04-04', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-akshi-bansal-dermatology-in-bangalore.jpg', 53, 2, 1),
(96, 'Dr Alekya Singapore', 'AlekyaSingapore@testmail.com', 'F', '1970-04-05', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-alekya-singapore-dermatology-in-hyderabad.jpg', 54, 2, 1),
(97, 'Dr Annie Flora G', 'AnnieFloraG@testmail.com', 'F', '1970-04-06', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-annie-flora-g-dermatology-in-chennai.jpg', 55, 2, 1),
(98, 'Dr Antionetta Ashwini J', 'AntionettaAshwiniJ@testmail.com', 'M', '1970-04-07', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 56, 2, 1),
(99, 'Dr Aparajita Ghosh', 'AparajitaGhosh@testmail.com', 'M', '1970-04-08', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-aparajita-ghosh-dermatology-in-kolkata.jpg', 57, 2, 1),
(100, 'Dr Aritra Sarkar', 'AritraSarkar@testmail.com', 'F', '1970-04-09', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-aritra-sarkar-dermatology-in-kolkata.jpg', 58, 2, 1),
(101, 'Dr Arjun Lal Das', 'ArjunLalDas@testmail.com', 'F', '1970-04-10', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-arjun-lal-das-dermatology-in-ghaziabad.jpg', 59, 2, 1),
(102, 'Dr Arun Agarwal', 'ArunAgarwal@testmail.com', 'F', '1970-04-11', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-arun-agarwal-dermatology-in-guwahati.jpg', 11, 2, 1),
(103, 'Dr Asmita Dhekne Chebbi', 'AsmitaDhekneChebbi@testmail.com', 'F', '1970-04-12', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 14, 2, 1),
(104, 'Dr Chanchal Bhar', 'ChanchalBhar@testmail.com', 'F', '1970-04-13', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-chanchal-bhar-dermatology-in-kolkata.jpg', 60, 2, 1),
(105, 'Dr CHANDANA KONDA', 'CHANDANAKONDA@testmail.com', 'M', '1970-04-14', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 61, 2, 1),
(106, 'Dr Deepa K', 'DeepaK@testmail.com', 'F', '1970-04-15', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-deepa-k-dermatology-in-bangalore.jpg', 62, 2, 1),
(107, 'Dr Deepthi M', 'DeepthiM@testmail.com', 'M', '1970-04-16', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-deepthi-m-dermatology-in-chennai.jpg', 63, 2, 1),
(108, 'Dr Deepti Walvekar', 'DeeptiWalvekar@testmail.com', 'F', '1970-04-17', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-deepti-walvekar-dermatology-in-bangalore.jpg', 50, 2, 1),
(109, 'Dr DR GOUTAM BAG', 'DRGOUTAMBAG@testmail.com', 'F', '1970-04-18', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-dr-goutam-bag-dermatology-in-kolkata.jpg', 57, 2, 1),
(110, 'Dr Ema Pradhan', 'EmaPradhan@testmail.com', 'M', '1970-04-19', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 64, 2, 1),
(111, 'Dr GANGA DHAR SWARNAKAR', 'GANGADHARSWARNAKAR@testmail.com', 'M', '1970-04-20', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-ganga-dhar-swarnakar-dermatology-in-kolkata.jpg', 65, 2, 1),
(112, 'Dr Gera Raj', 'GeraRaj@testmail.com', 'F', '1970-04-21', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-gera-raj-dermatology-in-hyderabad.jpeg', 66, 2, 1),
(113, 'Dr Gopi Chand Dadithota', 'GopiChandDadithota@testmail.com', 'F', '1970-04-22', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 67, 2, 1),
(114, 'Dr Imran Wali', 'ImranWali@testmail.com', 'M', '1970-04-23', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 68, 2, 1),
(115, 'Dr Janaki V R', 'JanakiVR@testmail.com', 'F', '1970-04-24', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-janaki-v-r-dermatology-in-chennai.jpg', 69, 2, 1),
(116, 'Dr Joyeeta Chowdhury', 'JoyeetaChowdhury@testmail.com', 'F', '1970-04-25', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-joyeeta-chowdhury-dermatology-in-kolkata.jpg', 57, 2, 1),
(117, 'Dr K Sowmya', 'KSowmya@testmail.com', 'F', '1970-04-26', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-k-sowmya-dermatology-in-hyderabad.jpg', 70, 2, 1),
(118, 'Dr M A Waheed', 'MAWaheed@testmail.com', 'F', '1970-04-27', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-m-a-waheed-dermatology-in-hyderabad.jpg', 54, 2, 1),
(119, 'Dr MADHUR ESHWAR RAO BASUDE', 'MADHURESHWARRAOBASUDE@testmail.com', 'F', '1970-04-28', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 46, 2, 1),
(120, 'Dr Malar R', 'MalarR@testmail.com', 'M', '1970-04-29', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-malar-r-dermatology-in-chennai.jpg', 56, 2, 1),
(121, 'Dr Mamta Patil', 'MamtaPatil@testmail.com', 'F', '1970-04-30', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-mamta-patil-dermatology-in-pune.jpg', 46, 2, 1),
(122, 'Dr Meera Shridhar', 'MeeraShridhar@testmail.com', 'M', '1970-05-01', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-meera-shridhar-dermatology-in-bangalore.jpg', 71, 2, 1),
(123, 'Dr MEGHA KAKANI', 'MEGHAKAKANI@testmail.com', 'F', '1970-05-02', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 72, 2, 1),
(124, 'Dr MEGHANA KARLEKAR', 'MEGHANAKARLEKAR@testmail.com', 'M', '1970-05-03', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-meghana-karlekar-dermatology-in-bangalore.jpeg', 50, 2, 1),
(125, 'Dr N KARTHINI BABA', 'NKARTHINIBABA@testmail.com', 'F', '1970-05-04', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-n-karthini-baba-dermatology-in-hyderabad.jpg', 61, 2, 1),
(126, 'Dr N Vignesh Karthik', 'NVigneshKarthik@testmail.com', 'F', '1970-05-05', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-n-vignesh-karthik-dermatology-in-chennai.jpg', 52, 2, 1),
(127, 'Dr Nidhi Jindal', 'NidhiJindal@testmail.com', 'F', '1970-05-06', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-nidhi-jindal-dermatology-in-kolkata.jpg', 73, 2, 1),
(128, 'Dr Pallavi B', 'PallaviB@testmail.com', 'F', '1970-05-07', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 50, 2, 1),
(129, 'Dr Poovamma A S', 'PoovammaAS@testmail.com', 'M', '1970-05-08', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 53, 2, 1),
(130, 'Dr Praveen Bhardwaj', 'PraveenBhardwaj@testmail.com', 'F', '1970-05-09', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 50, 2, 1),
(131, 'Dr Praveen Kumar Raju P', 'PraveenKumarRajuP@testmail.com', 'M', '1970-05-10', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-praveen-kumar-raju-p-dermatology-in-hyderabad.jpg', 74, 2, 1),
(132, 'Dr Puneetha B', 'PuneethaB@testmail.com', 'M', '1970-05-11', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-puneetha-b-dermatology-in-mysore.jpg', 75, 2, 1),
(133, 'Dr RADHA PENUMATSA', 'RADHAPENUMATSA@testmail.com', 'F', '1970-05-12', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-radha-penumatsa-dermatology-in-hyderabad.jpg', 76, 2, 1),
(134, 'Dr Radhika Venkat', 'RadhikaVenkat@testmail.com', 'F', '1970-05-13', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-radhika-venkat-dermatology-in-bangalore.jpeg', 77, 2, 1),
(135, 'Dr Rajshree Choudhary', 'RajshreeChoudhary@testmail.com', 'M', '1970-05-14', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 78, 2, 1),
(136, 'Dr Ramanan C', 'RamananC@testmail.com', 'M', '1970-05-15', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-ramanan-c-dermatology-in-chennai.png', 79, 2, 1),
(137, 'Dr Ravichandran G', 'RavichandranG@testmail.com', 'F', '1970-05-16', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 55, 2, 1),
(138, 'Dr S Venkata Satya Prasad', 'SVenkataSatyaPrasad@testmail.com', 'M', '1970-05-17', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-s-venkata-satya-prasad-dermatology-in-visakhapatnam.jpeg', 67, 2, 1),
(139, 'Dr Sachin Kurade', 'SachinKurade@testmail.com', 'F', '1970-05-18', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-sachin-kurade-dermatology-in-pune.jpg', 80, 2, 1),
(140, 'Dr Sachin Verma', 'SachinVerma@testmail.com', 'F', '1970-05-19', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 49, 2, 1),
(141, 'Dr Safia Tanyeem', 'SafiaTanyeem@testmail.com', 'F', '1970-05-20', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-safia-tanyeem-dermatology-in-bangalore.jpg', 14, 2, 1),
(142, 'Dr Sanjib Chowdhury', 'SanjibChowdhury@testmail.com', 'F', '1970-05-21', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-sanjib-chowdhury-dermatology-in-kolkata.png', 68, 2, 1),
(143, 'Dr Sarita Tippanwar', 'SaritaTippanwar@testmail.com', 'M', '1970-05-22', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 80, 2, 1),
(144, 'Dr Sarmistha Basak', 'SarmisthaBasak@testmail.com', 'M', '1970-05-23', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-sarmistha-basak-dermatology-in-kolkata.jpg', 57, 2, 1),
(145, 'Dr Satyanarayana Murthy K', 'SatyanarayanaMurthyK@testmail.com', 'F', '1970-05-24', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-satyanarayana-murthy-k-dermatology-in-hyderabad.jpg', 76, 2, 1),
(146, 'Dr Shamsunder Kaliram Agarwal', 'ShamsunderKaliramAgarwal@testmail.com', 'F', '1970-05-25', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-shamsunder-kaliram-agarwal-dermatology-in-pune.jpg', 81, 2, 1),
(147, 'Dr Shashank Bansod', 'ShashankBansod@testmail.com', 'F', '1970-05-26', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 78, 2, 1),
(148, 'Dr SHVETA SHARMA', 'SHVETASHARMA@testmail.com', 'M', '1970-05-27', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-shveta-sharma-dermatology-in-pune.jpg', 82, 2, 1),
(149, 'Dr Sindhu P S', 'SindhuPS@testmail.com', 'F', '1970-05-28', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 83, 2, 1),
(150, 'Dr Sonakshi Kumar', 'SonakshiKumar@testmail.com', 'M', '1970-05-29', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-sonakshi-kumar-dermatology-in-bangalore.jpeg', 84, 2, 1),
(151, 'Dr Soumyajit Roy Chowdhury', 'SoumyajitRoyChowdhury@testmail.com', 'M', '1970-05-30', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 85, 2, 1),
(152, 'Dr SOWMYA NAGA DOGIPARTHI', 'SOWMYANAGADOGIPARTHI@testmail.com', 'F', '1970-05-31', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 86, 2, 1),
(153, 'Dr SREE LALITHA V', 'SREELALITHAV@testmail.com', 'M', '1970-06-01', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 50, 2, 1),
(154, 'Dr Srividhya C M', 'SrividhyaCM@testmail.com', 'M', '1970-06-02', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 87, 2, 1),
(155, 'Dr SRUTHI KAREDDY', 'SRUTHIKAREDDY@testmail.com', 'M', '1970-06-03', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 71, 2, 1),
(156, 'Dr Subhashini Mohan', 'SubhashiniMohan@testmail.com', 'M', '1970-06-04', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-subhashini-mohan-dermatology-in-chennai.jpg', 86, 2, 1),
(157, 'Dr Sudha Bhadri', 'SudhaBhadri@testmail.com', 'F', '1970-06-05', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-sudha-bhadri-dermatology-in-bangalore.jpg', 50, 2, 1),
(158, 'Dr Sudip Kr Ghosh', 'SudipKrGhosh@testmail.com', 'M', '1970-06-06', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 85, 2, 1),
(159, 'Dr Sujata Sengupta', 'SujataSengupta@testmail.com', 'F', '1970-06-07', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 49, 2, 1),
(160, 'Dr SWAGATA CHAKRABARTY', 'SWAGATACHAKRABARTY@testmail.com', 'F', '1970-06-08', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-swagata-chakrabarty-dermatology-in-bangalore.jpeg', 71, 2, 1),
(161, 'Dr Syed Akhib', 'SyedAkhib@testmail.com', 'M', '1970-06-09', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-syed-akhib-dermatology-in-bangalore.jpg', 83, 2, 1),
(162, 'Dr T K Sarkar', 'TKSarkar@testmail.com', 'F', '1970-06-10', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-t-k-sarkar-dermatology-in-kolkata.jpg', 60, 2, 1),
(163, 'Dr Tina Priscilla', 'TinaPriscilla@testmail.com', 'M', '1970-06-11', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-tina-priscilla-dermatology-in-hyderabad.jpg', 61, 2, 1),
(164, 'Dr U Pallavi Rathi Vanthitha', 'UPallaviRathiVanthitha@testmail.com', 'F', '1970-06-12', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-u-pallavi-rathi-vanthitha-dermatology-in-chennai.jpg', 88, 2, 1),
(165, 'Dr VAISHNAVI SABAPATHI', 'VAISHNAVISABAPATHI@testmail.com', 'F', '1970-06-13', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicbig.jpg', 87, 2, 1),
(166, 'Dr Vinay Kumar', 'VinayKumar@testmail.com', 'F', '1970-06-14', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/DoctorImages/defaultprofilepicmale.jpg', 89, 2, 1),
(167, 'Dr Vishnu M Moodalgiri', 'VishnuMMoodalgiri@testmail.com', 'F', '1970-06-15', '9b6bc21913d2c97b94f5025be68666b2', 'https://apolloadmin.askapollo.com/Images/doctors/dermatology/dr-vishnu-m-moodalgiri-dermatology-in-bangalore.jpg', 47, 2, 1),
(168, 'Prakhar Singh', 'prakharsingh13@gmail.com', 'M', '2000-12-13', '9b6bc21913d2c97b94f5025be68666b2', NULL, NULL, 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments_table`
--
ALTER TABLE `appointments_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `cancer_types`
--
ALTER TABLE `cancer_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments_table`
--
ALTER TABLE `departments_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor_details`
--
ALTER TABLE `doctor_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `qual_id` (`qual_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `hospital_id` (`hospital_id`);

--
-- Indexes for table `hospitals_table`
--
ALTER TABLE `hospitals_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages_table`
--
ALTER TABLE `languages_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lang_doc`
--
ALTER TABLE `lang_doc`
  ADD KEY `doc_id` (`doc_id`),
  ADD KEY `lang_id` (`lang_id`);

--
-- Indexes for table `locality_table`
--
ALTER TABLE `locality_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications_table`
--
ALTER TABLE `notifications_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `prescriptions_table`
--
ALTER TABLE `prescriptions_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `qualifications_table`
--
ALTER TABLE `qualifications_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `TABLE 1`
--
ALTER TABLE `TABLE 1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locality_id` (`locality_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments_table`
--
ALTER TABLE `appointments_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cancer_types`
--
ALTER TABLE `cancer_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departments_table`
--
ALTER TABLE `departments_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `doctor_details`
--
ALTER TABLE `doctor_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;
--
-- AUTO_INCREMENT for table `hospitals_table`
--
ALTER TABLE `hospitals_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT for table `languages_table`
--
ALTER TABLE `languages_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `locality_table`
--
ALTER TABLE `locality_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT for table `notifications_table`
--
ALTER TABLE `notifications_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prescriptions_table`
--
ALTER TABLE `prescriptions_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `qualifications_table`
--
ALTER TABLE `qualifications_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT for table `TABLE 1`
--
ALTER TABLE `TABLE 1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments_table`
--
ALTER TABLE `appointments_table`
  ADD CONSTRAINT `appointments_table_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `prescriptions_table` (`id`);

--
-- Constraints for table `doctor_details`
--
ALTER TABLE `doctor_details`
  ADD CONSTRAINT `doctor_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`),
  ADD CONSTRAINT `doctor_details_ibfk_2` FOREIGN KEY (`qual_id`) REFERENCES `qualifications_table` (`id`),
  ADD CONSTRAINT `doctor_details_ibfk_3` FOREIGN KEY (`dept_id`) REFERENCES `departments_table` (`id`),
  ADD CONSTRAINT `doctor_details_ibfk_4` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals_table` (`id`);

--
-- Constraints for table `lang_doc`
--
ALTER TABLE `lang_doc`
  ADD CONSTRAINT `lang_doc_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `doctor_details` (`id`),
  ADD CONSTRAINT `lang_doc_ibfk_2` FOREIGN KEY (`lang_id`) REFERENCES `languages_table` (`id`);

--
-- Constraints for table `notifications_table`
--
ALTER TABLE `notifications_table`
  ADD CONSTRAINT `notifications_table_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`);

--
-- Constraints for table `prescriptions_table`
--
ALTER TABLE `prescriptions_table`
  ADD CONSTRAINT `prescriptions_table_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `user_table` (`id`),
  ADD CONSTRAINT `prescriptions_table_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor_details` (`id`),
  ADD CONSTRAINT `prescriptions_table_ibfk_3` FOREIGN KEY (`type`) REFERENCES `cancer_types` (`id`);

--
-- Constraints for table `user_table`
--
ALTER TABLE `user_table`
  ADD CONSTRAINT `user_table_ibfk_1` FOREIGN KEY (`locality_id`) REFERENCES `locality_table` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
