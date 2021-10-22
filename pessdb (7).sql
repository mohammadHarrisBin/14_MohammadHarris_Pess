-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2021 at 03:53 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pessdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `dispatch`
--

CREATE TABLE `dispatch` (
  `incidentId` int(11) NOT NULL,
  `patrolcarId` varchar(10) NOT NULL,
  `timeDispatched` datetime NOT NULL,
  `timeArrived` datetime DEFAULT NULL,
  `timeCompleted` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dispatch`
--

INSERT INTO `dispatch` (`incidentId`, `patrolcarId`, `timeDispatched`, `timeArrived`, `timeCompleted`) VALUES
(56, 'QX1234A', '2021-10-21 17:54:03', NULL, '2021-10-21 18:24:37'),
(55, 'QX8923T', '2021-10-21 17:53:58', NULL, NULL),
(54, 'QX8923T', '2021-10-21 17:53:11', NULL, NULL),
(53, 'QX8923T', '2021-10-21 17:53:08', NULL, NULL),
(52, 'QX2288D', '2021-10-21 17:53:04', NULL, NULL),
(51, 'QX8769P', '2021-10-21 17:52:41', NULL, NULL),
(50, 'QX8769P', '2021-10-21 17:50:24', NULL, NULL),
(49, 'QX2288D', '2021-10-21 17:50:20', NULL, NULL),
(48, 'QX2288D', '2021-10-21 17:46:54', NULL, NULL),
(47, 'QX2288D', '2021-10-21 17:46:51', NULL, NULL),
(46, 'QX5555D', '2021-10-21 17:46:37', NULL, NULL),
(45, 'QX1234A', '2021-10-21 17:46:32', NULL, '2021-10-21 18:24:37'),
(44, 'QX1234A', '2021-10-21 17:45:53', NULL, '2021-10-21 18:24:37'),
(43, 'QX1234A', '2021-10-21 17:45:49', NULL, '2021-10-21 18:24:37'),
(42, 'QX1234A', '2021-10-21 17:41:03', NULL, '2021-10-21 18:24:37'),
(41, 'QX1234A', '2021-10-21 16:29:14', '2021-10-21 16:29:28', '2021-10-21 16:29:32'),
(57, 'QX3456B', '2021-10-21 17:54:24', NULL, NULL),
(58, 'QX1234A', '2021-10-21 17:59:11', NULL, '2021-10-21 18:24:37'),
(59, 'QX1111J', '2021-10-21 17:59:15', NULL, NULL),
(60, 'QX2222K', '2021-10-21 17:59:18', NULL, NULL),
(61, 'QX2222K', '2021-10-21 18:01:00', NULL, NULL),
(62, 'QX5555D', '2021-10-21 18:16:05', NULL, NULL),
(63, 'QX5555D', '2021-10-21 18:16:10', NULL, NULL),
(64, 'QX5555D', '2021-10-21 18:16:19', NULL, NULL),
(65, 'QX5555D', '2021-10-21 18:17:17', NULL, NULL),
(66, 'QX2288D', '2021-10-21 18:24:32', NULL, NULL),
(67, 'QX1234A', '2021-10-27 18:23:53', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `incidentId` int(11) NOT NULL,
  `callerName` varchar(30) NOT NULL,
  `phoneNumber` varchar(10) NOT NULL,
  `incidentTypeId` varchar(3) NOT NULL,
  `incidentLocation` varchar(50) NOT NULL,
  `incidentDesc` varchar(100) NOT NULL,
  `incidentStatusId` varchar(3) NOT NULL,
  `timeCalled` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`incidentId`, `callerName`, `phoneNumber`, `incidentTypeId`, `incidentLocation`, `incidentDesc`, `incidentStatusId`, `timeCalled`) VALUES
(52, ' c', ' ddddddddd', 'Loa', 'ddddddddddddddddddddddddddddddddd', 'zgsv', '2', '2021-10-21 17:53:04'),
(51, '  c', '  dddddddd', 'Loa', 'ddddddddddddddddddddddddddddddddd', 'zgsv', '2', '2021-10-21 17:52:41'),
(50, '  c', '  dddddddd', 'Loa', 'ddddddddddddddddddddddddddddddddd', 'zgsv', '2', '2021-10-21 17:50:24'),
(49, ' c', ' ddddddddd', 'Loa', 'ddddddddddddddddddddddddddddddddd', 'zgsv', '2', '2021-10-21 17:50:20'),
(48, ' c', ' ddddddddd', 'Loa', 'ddddddddddddddddddddddddddddddddd', 'zgsv', '2', '2021-10-21 17:46:54'),
(47, ' c', ' ddddddddd', 'Loa', 'ddddddddddddddddddddddddddddddddd', 'zgsv', '2', '2021-10-21 17:46:51'),
(43, ' e', ' ee', 'Loa', 'ee', 'eee', '3', '2021-10-21 18:24:37'),
(44, ' e', ' ee', 'Loa', 'ee', 'eee', '3', '2021-10-21 18:24:37'),
(45, ' e', ' ee', 'Loa', 'ee', 'eee', '3', '2021-10-21 18:24:37'),
(46, '  e', '  ee', 'Loa', 'ee', 'eee', '2', '2021-10-21 17:46:37'),
(42, 'dd', 'dd', '070', 'ddddddddddddddddddddddddddddddddd', 'tfjft', '3', '2021-10-21 18:24:37'),
(41, ' ddddddddddddddddddddddddddddd', ' dd', 'Fir', 'dd', 'dd', '2', '2021-10-21 16:29:14'),
(53, '  c', '  dddddddd', 'Loa', 'ddddddddddddddddddddddddddddddddd', 'zgsv', '2', '2021-10-21 17:53:08'),
(54, '  c', '  dddddddd', 'Loa', 'ddddddddddddddddddddddddddddddddd', 'zgsv', '2', '2021-10-21 17:53:11'),
(55, '  c', '  dddddddd', 'Loa', 'ddddddddddddddddddddddddddddddddd', 'zgsv', '2', '2021-10-21 17:53:58'),
(56, '   c', '   ddddddd', 'Loa', 'ddddddddddddddddddddddddddddddddd', 'zgsv', '3', '2021-10-21 18:24:37'),
(57, 'dd', 'dd', '070', 'dd', 'ss', '2', '2021-10-21 17:54:24'),
(58, '   c', '   ddddddd', 'Loa', 'ddddddddddddddddddddddddddddddddd', 'zgsv', '3', '2021-10-21 18:24:37'),
(59, '    c', '    dddddd', 'Loa', 'ddddddddddddddddddddddddddddddddd', 'zgsv', '2', '2021-10-21 17:59:15'),
(60, '     c', '     ddddd', 'Loa', 'ddddddddddddddddddddddddddddddddd', 'zgsv', '2', '2021-10-21 17:59:18'),
(61, '     c', '     ddddd', 'Loa', 'ddddddddddddddddddddddddddddddddd', 'zgsv', '2', '2021-10-21 18:01:00'),
(62, ' dd', ' ddddddddd', 'Loa', 'ddddddddddddddddddddddddddddddddd', 'fff', '2', '2021-10-21 18:16:05'),
(63, ' dd', ' ddddddddd', 'Loa', 'ddddddddddddddddddddddddddddddddd', 'fff', '2', '2021-10-21 18:16:10'),
(64, ' dd', ' ddddddddd', 'Loa', 'ddddddddddddddddddddddddddddddddd', 'fff', '2', '2021-10-21 18:16:19'),
(65, ' dd', ' ddddddddd', 'Loa', 'ddddddddddddddddddddddddddddddddd', 'fff', '2', '2021-10-21 18:17:17'),
(66, ' ddddddddddddddddddddddddddddd', ' ddddddddd', 'Loa', 'ddddddddddddddddddddddddddddddddd', 's', '2', '2021-10-21 18:24:32'),
(67, 'dd', 'dd', '070', 'dd', 'dd', '2', '2021-10-27 18:23:53');

-- --------------------------------------------------------

--
-- Table structure for table `incidenttype`
--

CREATE TABLE `incidenttype` (
  `incidentTypeId` varchar(3) NOT NULL,
  `incidentTypeDesc` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incidenttype`
--

INSERT INTO `incidenttype` (`incidentTypeId`, `incidentTypeDesc`) VALUES
('070', 'Loan shark'),
('010', 'Fire'),
('020', 'Riot'),
('030', 'Burglary'),
('040', 'Domestic Violent'),
('050', 'Fallen Tree'),
('060', 'Traffic accident'),
('999', 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `incident_status`
--

CREATE TABLE `incident_status` (
  `statusId` varchar(1) NOT NULL,
  `statusDesc` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incident_status`
--

INSERT INTO `incident_status` (`statusId`, `statusDesc`) VALUES
('1', 'Pending'),
('2', 'Dispatched'),
('3', 'Completed'),
('4', 'Duplicate');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar`
--

CREATE TABLE `patrolcar` (
  `patrolcarId` varchar(10) NOT NULL,
  `patrolcarStatusId` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patrolcar`
--

INSERT INTO `patrolcar` (`patrolcarId`, `patrolcarStatusId`) VALUES
('QX1234A', '1'),
('QX3456B', '1'),
('QX1111J', '1'),
('QX2222K', '1'),
('QX5555D', '1'),
('QX2288D', '1'),
('QX8769P', '3'),
('QX1342G', '3'),
('QX8723W', '3'),
('QX8923T', '1');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar_status`
--

CREATE TABLE `patrolcar_status` (
  `statusId` varchar(1) NOT NULL,
  `statusDesc` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patrolcar_status`
--

INSERT INTO `patrolcar_status` (`statusId`, `statusDesc`) VALUES
('1', 'Dispatched'),
('2', 'Patrol'),
('3', 'Free'),
('4', 'Arrived');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD PRIMARY KEY (`incidentId`,`patrolcarId`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`incidentId`);

--
-- Indexes for table `incidenttype`
--
ALTER TABLE `incidenttype`
  ADD PRIMARY KEY (`incidentTypeId`);

--
-- Indexes for table `incident_status`
--
ALTER TABLE `incident_status`
  ADD PRIMARY KEY (`statusId`);

--
-- Indexes for table `patrolcar`
--
ALTER TABLE `patrolcar`
  ADD PRIMARY KEY (`patrolcarId`);

--
-- Indexes for table `patrolcar_status`
--
ALTER TABLE `patrolcar_status`
  ADD PRIMARY KEY (`statusId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
  MODIFY `incidentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
