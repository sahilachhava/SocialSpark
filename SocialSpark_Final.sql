-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 06, 2021 at 10:27 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `SocialSpark`
--

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `userID` int(11) NOT NULL,
  `friendID` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`userID`, `friendID`, `status`) VALUES
(1, 4, 1),
(1, 5, 1),
(1, 2, 1),
(1, 3, 0),
(2, 8, 1),
(2, 7, 1),
(2, 3, 1),
(2, 4, 1),
(2, 9, 1),
(3, 7, 1),
(3, 6, 1),
(3, 4, 0),
(3, 8, 1),
(4, 8, 1),
(4, 6, 1),
(4, 7, 1),
(4, 5, 1),
(5, 3, 0),
(5, 2, 0),
(5, 9, 1),
(5, 8, 1),
(6, 7, 0),
(6, 9, 1),
(6, 1, 0),
(6, 2, 0),
(7, 1, 0),
(7, 8, 0),
(7, 9, 0),
(8, 1, 0),
(9, 1, 1),
(9, 4, 0),
(9, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `postID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`postID`, `userID`) VALUES
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(8, 1),
(9, 1),
(10, 2),
(10, 4),
(12, 4),
(11, 4),
(11, 3),
(13, 5),
(12, 5),
(10, 5),
(13, 6),
(12, 6),
(10, 6),
(15, 7),
(13, 7),
(12, 7),
(11, 7),
(10, 7),
(15, 8),
(14, 8),
(13, 8),
(11, 8),
(10, 8),
(15, 9),
(14, 9),
(13, 9),
(10, 9),
(11, 9),
(15, 1),
(14, 1),
(13, 1),
(12, 1),
(11, 1),
(16, 2),
(15, 2),
(13, 2),
(12, 2),
(16, 3),
(15, 3),
(13, 3),
(17, 2),
(17, 4),
(17, 5),
(17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `senderID` int(11) NOT NULL,
  `receiverID` int(11) NOT NULL,
  `msgText` varchar(1000) NOT NULL,
  `msgTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`senderID`, `receiverID`, `msgText`, `msgTime`) VALUES
(1, 2, 'Hey, how\'s your extra class going?', '2021-05-05 15:41:26'),
(4, 1, 'Thank you, izuku for accepting.', '2021-05-05 15:42:25'),
(1, 4, 'thanks, you too', '2021-05-05 15:43:14'),
(4, 1, 'what are you doing after class?', '2021-05-05 15:43:40'),
(1, 4, 'gonna practice with Tenya, why do you ask?', '2021-05-05 15:44:03'),
(4, 1, 'nothing special, enjoy', '2021-05-05 15:44:34'),
(1, 4, 'Uh okay, thanks', '2021-05-05 15:44:43'),
(2, 1, 'boring... you guys will leave me behind, I am sure', '2021-05-05 15:45:33'),
(1, 2, 'don\'t worry about it, you will catch up soon', '2021-05-05 15:45:50'),
(2, 1, 'yeah', '2021-05-05 15:45:56'),
(1, 5, 'ready for practice, after today\'s class?', '2021-05-05 15:46:19'),
(5, 1, 'yes, meet you after class', '2021-05-05 15:46:41'),
(1, 5, 'okay', '2021-05-05 15:46:45'),
(1, 2, 'hello', '2021-05-05 19:41:43'),
(2, 1, 'hii', '2021-05-05 19:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `nID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `friendID` int(11) NOT NULL,
  `nType` varchar(25) NOT NULL,
  `nTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`nID`, `userID`, `friendID`, `nType`, `nTime`) VALUES
(1, 1, 2, 'FR', '2021-05-05 15:30:30'),
(2, 2, 3, 'FR', '2021-05-05 15:31:44'),
(3, 1, 4, 'FR', '2021-05-05 15:32:42'),
(4, 2, 4, 'FR', '2021-05-05 15:32:45'),
(5, 1, 5, 'FR', '2021-05-05 15:33:34'),
(6, 4, 5, 'FR', '2021-05-05 15:33:36'),
(7, 3, 6, 'FR', '2021-05-05 15:35:04'),
(8, 4, 6, 'FR', '2021-05-05 15:35:07'),
(9, 4, 7, 'FR', '2021-05-05 15:36:09'),
(10, 2, 7, 'FR', '2021-05-05 15:36:13'),
(11, 3, 7, 'FR', '2021-05-05 15:36:15'),
(12, 2, 8, 'FR', '2021-05-05 15:37:06'),
(13, 3, 8, 'FR', '2021-05-05 15:37:08'),
(14, 4, 8, 'FR', '2021-05-05 15:37:11'),
(15, 5, 8, 'FR', '2021-05-05 15:37:14'),
(16, 2, 9, 'FR', '2021-05-05 15:37:26'),
(17, 5, 9, 'FR', '2021-05-05 15:37:29'),
(18, 6, 9, 'FR', '2021-05-05 15:37:31'),
(19, 2, 1, 'LP', '2021-05-05 15:52:32'),
(20, 3, 1, 'LP', '2021-05-05 15:52:38'),
(21, 4, 1, 'LP', '2021-05-05 15:52:43'),
(22, 5, 1, 'LP', '2021-05-05 15:52:48'),
(23, 8, 1, 'LP', '2021-05-05 15:52:52'),
(24, 9, 1, 'LP', '2021-05-05 15:52:55'),
(25, 1, 2, 'LP', '2021-05-05 16:03:53'),
(26, 9, 3, 'FR', '2021-05-05 16:04:32'),
(27, 1, 4, 'LP', '2021-05-05 16:06:07'),
(28, 3, 4, 'LP', '2021-05-05 16:06:13'),
(29, 2, 4, 'LP', '2021-05-05 16:10:21'),
(30, 2, 3, 'LP', '2021-05-05 16:10:40'),
(31, 4, 5, 'LP', '2021-05-05 16:10:59'),
(32, 3, 5, 'LP', '2021-05-05 16:11:02'),
(33, 1, 5, 'LP', '2021-05-05 16:11:05'),
(34, 4, 6, 'LP', '2021-05-05 16:12:13'),
(35, 3, 6, 'LP', '2021-05-05 16:12:16'),
(36, 1, 6, 'LP', '2021-05-05 16:12:22'),
(37, 6, 7, 'LP', '2021-05-05 16:12:58'),
(38, 4, 7, 'LP', '2021-05-05 16:13:02'),
(39, 3, 7, 'LP', '2021-05-05 16:13:12'),
(40, 2, 7, 'LP', '2021-05-05 16:13:15'),
(41, 1, 7, 'LP', '2021-05-05 16:13:19'),
(42, 6, 8, 'LP', '2021-05-05 16:14:06'),
(43, 5, 8, 'LP', '2021-05-05 16:14:09'),
(44, 4, 8, 'LP', '2021-05-05 16:14:14'),
(45, 2, 8, 'LP', '2021-05-05 16:14:18'),
(46, 1, 8, 'LP', '2021-05-05 16:14:22'),
(47, 6, 9, 'LP', '2021-05-05 16:15:20'),
(48, 5, 9, 'LP', '2021-05-05 16:15:23'),
(49, 4, 9, 'LP', '2021-05-05 16:15:27'),
(50, 1, 9, 'LP', '2021-05-05 16:15:30'),
(51, 2, 9, 'LP', '2021-05-05 16:15:36'),
(52, 6, 1, 'LP', '2021-05-05 16:16:03'),
(53, 5, 1, 'LP', '2021-05-05 16:16:11'),
(54, 4, 1, 'LP', '2021-05-05 16:16:19'),
(55, 3, 1, 'LP', '2021-05-05 16:16:23'),
(56, 2, 1, 'LP', '2021-05-05 16:16:27'),
(57, 9, 2, 'LP', '2021-05-05 16:16:44'),
(58, 6, 2, 'LP', '2021-05-05 16:16:52'),
(59, 4, 2, 'LP', '2021-05-05 16:16:59'),
(60, 3, 2, 'LP', '2021-05-05 16:17:04'),
(61, 9, 3, 'LP', '2021-05-05 16:17:27'),
(62, 6, 3, 'LP', '2021-05-05 16:17:29'),
(63, 4, 3, 'LP', '2021-05-05 16:17:34'),
(64, 1, 2, 'LP', '2021-05-05 16:24:33'),
(65, 1, 4, 'LP', '2021-05-05 16:24:48'),
(66, 1, 5, 'LP', '2021-05-05 16:25:16'),
(69, 9, 1, 'FR', '2021-05-05 19:42:34');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `postID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `postText` varchar(1000) NOT NULL,
  `postPhoto` varchar(100) DEFAULT NULL,
  `postDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `isMedia` tinyint(1) NOT NULL,
  `isVideo` tinyint(1) NOT NULL,
  `postVisibility` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`postID`, `userID`, `postText`, `postPhoto`, `postDateTime`, `isMedia`, `isVideo`, `postVisibility`) VALUES
(1, 1, 'My first post guys', NULL, '2021-05-05 15:52:04', 0, 0, 0),
(2, 2, 'My first post guys', NULL, '2021-05-05 15:52:04', 0, 0, 0),
(3, 3, 'My first post guys', NULL, '2021-05-05 15:52:04', 0, 0, 0),
(4, 4, 'My first post guys', NULL, '2021-05-05 15:52:04', 0, 0, 0),
(5, 5, 'My first post guys', NULL, '2021-05-05 15:52:04', 0, 0, 0),
(6, 6, 'My first post guys', NULL, '2021-05-05 15:52:04', 0, 0, 0),
(7, 7, 'My first post guys', NULL, '2021-05-05 15:52:04', 0, 0, 0),
(8, 8, 'My first post guys', NULL, '2021-05-05 15:52:04', 0, 0, 0),
(9, 9, 'My first post guys', NULL, '2021-05-05 15:52:04', 0, 0, 0),
(10, 1, 'My new move guys..', 'assets/images/posts/1/10.png', '2021-05-05 16:01:24', 1, 0, 0),
(11, 2, 'Feeling good.', 'assets/images/posts/2/11.png', '2021-05-05 16:03:47', 1, 0, 1),
(12, 3, 'I will  blast you all.', 'assets/images/posts/3/12.png', '2021-05-05 16:05:28', 1, 0, 0),
(13, 4, 'Happy times.', 'assets/images/posts/4/13.jpg', '2021-05-05 16:06:02', 1, 0, 0),
(14, 5, 'My class.', 'assets/images/posts/5/14.png', '2021-05-05 16:11:30', 1, 0, 1),
(15, 6, 'Wanted....', 'assets/images/posts/6/15.jpg', '2021-05-05 16:12:36', 1, 0, 0),
(16, 9, 'Why she ', 'assets/images/posts/9/16.jpg', '2021-05-05 16:15:16', 1, 0, 0),
(17, 1, 'Me vs Shoto ', 'assets/images/posts/1/17.mp4', '2021-05-05 16:24:16', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `saves`
--

CREATE TABLE `saves` (
  `postID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `saves`
--

INSERT INTO `saves` (`postID`, `userID`) VALUES
(10, 4),
(12, 6),
(15, 7),
(12, 7),
(15, 1),
(14, 1),
(13, 1),
(15, 2),
(15, 3),
(17, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `userFName` varchar(20) NOT NULL,
  `userLName` varchar(20) NOT NULL,
  `userPhoto` varchar(100) NOT NULL DEFAULT 'assets/images/profilePic/default.jpg',
  `userBio` varchar(50) DEFAULT NULL,
  `userEmail` varchar(50) NOT NULL,
  `userPhone` varchar(10) DEFAULT NULL,
  `userPassword` varchar(128) NOT NULL,
  `userCity` varchar(50) DEFAULT NULL,
  `userCountry` varchar(50) DEFAULT NULL,
  `recoveryCode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `userFName`, `userLName`, `userPhoto`, `userBio`, `userEmail`, `userPhone`, `userPassword`, `userCity`, `userCountry`, `recoveryCode`) VALUES
(1, 'Izuku', 'Midoriya', 'assets/images/profilePic/Izuku9999999999.png', 'One For All', 'izuku@spark.com', '9999999999', '827ccb0eea8a706c4c34a16891f84e7b', 'Musutafu', 'Japan', '926893'),
(2, 'Shoto', 'Todoroki', 'assets/images/profilePic/Shoto8888888888.png', 'Half Cold, Half Hot', 'shoto@spark.com', '8888888888', '827ccb0eea8a706c4c34a16891f84e7b', 'Musutafu', 'Japan', '848141'),
(3, 'Katsuki', 'Bakugo', 'assets/images/profilePic/Katsuki7777777777.png', 'Explosion', 'katsuki@spark.com', '7777777777', '827ccb0eea8a706c4c34a16891f84e7b', 'Musutafu', 'Japan', '308227'),
(4, 'Ochaco', 'Uraraka', 'assets/images/profilePic/Ochaco6666666666.png', 'Zero Gravity', 'ochaco@spark.com', '6666666666', '827ccb0eea8a706c4c34a16891f84e7b', 'Musutafu', 'Japan', '745253'),
(5, 'Tenya', 'Ida', 'assets/images/profilePic/Tenya5555555555.png', 'Engine', 'tenya@spark.com', '5555555555', '827ccb0eea8a706c4c34a16891f84e7b', 'Musutafu', 'Japan', '645390'),
(6, 'Denki', 'Kaminari', 'assets/images/profilePic/Denki4444444444.png', 'Electrification', 'denki@spark.com', '4444444444', '827ccb0eea8a706c4c34a16891f84e7b', 'Musutafu', 'Japan', '385456'),
(7, 'Eijiro', 'Kirishima', 'assets/images/profilePic/Eijiro3333333333.png', 'Hardening', 'eijiro@spark.com', '3333333333', '827ccb0eea8a706c4c34a16891f84e7b', 'Musutafu', 'Japan', '908161'),
(8, 'Kyoka', 'Jiro', 'assets/images/profilePic/Kyoka2222222222.png', 'Earphone Jack', 'kyoka@spark.com', '2222222222', '827ccb0eea8a706c4c34a16891f84e7b', 'Musutafu', 'Japan', '979036'),
(9, 'Fumikage', 'Tokoyami', 'assets/images/profilePic/Fumikage1111111111.png', 'Dark Shadow', 'fumikage@spark.com', '1111111111', '827ccb0eea8a706c4c34a16891f84e7b', 'Musutafu', 'Japan', '942241');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD KEY `userID` (`userID`,`friendID`),
  ADD KEY `friendID` (`friendID`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD KEY `postID` (`postID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD KEY `senderID` (`senderID`),
  ADD KEY `messages_ibfk_2` (`receiverID`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`nID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `friendID` (`friendID`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`postID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `saves`
--
ALTER TABLE `saves`
  ADD KEY `postID` (`postID`),
  ADD KEY `saves_ibfk_2` (`userID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `userID` (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `nID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`friendID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`postID`) REFERENCES `posts` (`postID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`senderID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiverID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`friendID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `saves`
--
ALTER TABLE `saves`
  ADD CONSTRAINT `saves_ibfk_1` FOREIGN KEY (`postID`) REFERENCES `posts` (`postID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `saves_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
