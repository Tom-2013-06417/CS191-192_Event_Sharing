-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2015 at 07:05 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `events_sharing`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `account_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_initial` char(5) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `profile_picture` text,
  `account_type` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `first_name`, `middle_initial`, `last_name`, `birthdate`, `email`, `username`, `password`, `profile_picture`, `account_type`) VALUES
(2, 'Matthew', 'S.', 'Lopez', '1997-03-09', 'airbreather7@gmail.com', 'airbreather7', 'ComputerMajor', NULL, 'REGULAR');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE IF NOT EXISTS `complaint` (
  `complaint_id` int(11) NOT NULL,
  `complaint_name` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `complaint_type` varchar(50) NOT NULL,
  `complaint_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `event_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `subtitle` varchar(50) DEFAULT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `venue` varchar(100) NOT NULL,
  `going` int(11) NOT NULL,
  `organization_id` varchar(50) NOT NULL,
  `pubmat` text NOT NULL,
  `tag` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `title`, `subtitle`, `description`, `date`, `time`, `venue`, `going`, `organization_id`, `pubmat`, `tag`) VALUES
(1, 'The Future of Technology in Startup Culture', NULL, 'UP CURSOR''s year-long series of seminars and workshops for students about awesome Computer Science topics not found in you typical class syllabus!', '2015-10-15', '13:00:00', 'AECH, 2F DCS, UP AECH, UP Diliman, Quezon City', 20, 'UP Association of Computer Science Majors', 'https://z-n.ak.fbcdn.net/sphotos-c.ak/hphotos-ak-xat1/t31.0-8/s960x960/12068553_499512830210264_8549170489875322300_o.png', '');

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE IF NOT EXISTS `organization` (
  `organization_id` varchar(100) NOT NULL,
  `organization_short_name` varchar(50) NOT NULL,
  `organization_profile_picture` text,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`organization_id`, `organization_short_name`, `organization_profile_picture`, `description`) VALUES
('UP Association for Computing Machinery', 'UP ACM', NULL, 'The Association for Computing Machinery – UP Diliman Student Chapter Inc. is a University-wide Computer Science organization. It is the country’s first ACM Student Chapter.'),
('UP Association of Computer Science Majors', 'UP CURSOR', NULL, 'The University of the Philippines Association of Computer Science Majors (UP CURSOR) is a nonprofit, nonsectarian socio-academic student organization based in the College of Engineering. Formed in 1983, the organization''s 15 founding members aimed to extend the training of its members beyond school; to integrate efforts in pursuit of academic growth and excellence; to foster goodwill, friendship, cooperation, and dedication among its members; to foster harmonious relationship and work hand-in-hand with other organizations in the university and to provide a channel for the promotion of general interests in the field of Computer Science.\r\n\r\nUP CURSOR never settles for less and continues to be at its finest through the years of its existence, providing not only an organization but a learning milieu to its members. With its unrelenting pursuit for excellence, UP CURSOR will always remain to be one of the College’s premiere organizations.');

-- --------------------------------------------------------

--
-- Table structure for table `organization_admins`
--

CREATE TABLE IF NOT EXISTS `organization_admins` (
  `organization_id` varchar(100) NOT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organization_admins`
--

INSERT INTO `organization_admins` (`organization_id`, `account_id`) VALUES
('UP Association for Computing Machinery', 2);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE IF NOT EXISTS `subscriptions` (
  `organization_id` varchar(100) NOT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`organization_id`, `account_id`) VALUES
('UP Association for Computing Machinery', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`), ADD KEY `organization_id` (`organization_id`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`organization_id`);

--
-- Indexes for table `organization_admins`
--
ALTER TABLE `organization_admins`
  ADD PRIMARY KEY (`organization_id`,`account_id`), ADD KEY `admin:account_org_2` (`account_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`organization_id`,`account_id`), ADD KEY `subscription:org_account_2` (`account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `event`
--
ALTER TABLE `event`
ADD CONSTRAINT `event:event_org` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`);

--
-- Constraints for table `organization_admins`
--
ALTER TABLE `organization_admins`
ADD CONSTRAINT `admin:account_org_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`),
ADD CONSTRAINT `admin:account_org_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
ADD CONSTRAINT `subscription:org_account_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`),
ADD CONSTRAINT `subscription:org_account_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
