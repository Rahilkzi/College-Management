-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2025 at 03:27 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `college1`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_infos`
--

DROP TABLE IF EXISTS `academic_infos`;
CREATE TABLE `academic_infos` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `students_id` int(10) UNSIGNED NOT NULL,
  `institution` varchar(100) DEFAULT NULL,
  `board` varchar(50) DEFAULT NULL,
  `pass_year` varchar(4) DEFAULT NULL,
  `symbol_no` varchar(15) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `division_grade` varchar(10) DEFAULT NULL,
  `major_subjects` varchar(50) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `sorting_order` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_categories`
--

DROP TABLE IF EXISTS `account_categories`;
CREATE TABLE `account_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `ac_name` varchar(100) NOT NULL,
  `ac_type` varchar(100) NOT NULL,
  `dr` varchar(100) NOT NULL,
  `cr` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_categories`
--

INSERT INTO `account_categories` (`id`, `created_at`, `updated_at`, `created_by`, `last_updated_by`, `ac_name`, `ac_type`, `dr`, `cr`, `status`) VALUES
(1, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'ACCOUNTS PAYABLE', 'Liability', 'Decrease', 'Increase', 1),
(2, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'ACCOUNTS RECEIVABLE', 'Asset', 'Increase', 'Decrease', 1),
(3, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'ACCUMULATED DEPRECIATION', 'Contra Asset', 'Decrease', 'Increase', 1),
(4, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'ADVERTISING EXPENSE', 'Expense', 'Increase', 'Decrease', 1),
(5, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'ALLOWANCE FOR UNCOLLECTIBLE ACCOUNTS', 'Contra Asset', 'Decrease', 'Increase', 1),
(6, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'AMORTIZATION EXPENSE', 'Expense', 'Increase', 'Decrease', 1),
(7, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'AVAILABLE FOR SALE SECURITIES', 'Asset', 'Increase', 'Decrease', 1),
(8, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'Bank Accounts', 'Asset', 'Increase', 'Decrease', 1),
(9, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'Bank OD A/c', 'Liability', 'Decrease', 'Increase', 1),
(10, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'BONDS PAYABLE', 'Liability', 'Decrease', 'Increase', 1),
(11, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'BUILDING', 'Asset', 'Increase', 'Decrease', 1),
(12, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'CAPITAL STOCK', 'Equity', 'Decrease', 'Increase', 1),
(13, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'CASH', 'Asset', 'Increase', 'Decrease', 1),
(14, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'CASH OVER', 'Revenue', 'Decrease', 'Increase', 1),
(15, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'CASH SHORT', 'Expense', 'Increase', 'Decrease', 1),
(16, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'CHARITABLE CONTRIBUTIONS PAYABLE', 'Liability', 'Decrease', 'Increase', 1),
(17, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'COMMON STOCK', 'Equity', 'Decrease', 'Increase', 1),
(18, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'COST OF GOODS SOLD', 'Expense', 'Increase', 'Decrease', 1),
(19, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'CURRENCY EXCHANGE GAIN', 'Gain', 'Decrease', 'Increase', 1),
(20, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'CURRENCY EXCHANGE LOSS', 'Loss', 'Increase', 'Decrease', 1),
(21, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'DEPRECIATION EXPENSE', 'Expense', 'Increase', 'Decrease', 1),
(22, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'DISCOUNT ON BONDS PAYABLE', 'Liability', 'Decrease', 'Increase', 1),
(23, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'DISCOUNT ON NOTES PAYABLE', 'Contra Liability', 'Increase', 'Decrease', 1),
(24, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'DIVIDEND INCOME', 'Revenue', 'Decrease', 'Increase', 1),
(25, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'DIVIDENDS', 'Dividend', 'Increase', 'Decrease', 1),
(26, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'DIVIDENDS PAYABLE', 'Liability', 'Decrease', 'Increase', 1),
(27, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'DOMAIN NAME', 'Asset', 'Increase', 'Decrease', 1),
(28, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'EMPLOYEE BENEFITS EXPENSE', 'Expense', 'Increase', 'Decrease', 1),
(29, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'EQUIPMENT', 'Asset', 'Increase', 'Decrease', 1),
(30, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'FEDERAL INCOME TAX PAYABLE', 'Liability', 'Decrease', 'Increase', 1),
(31, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'FEDERAL UNEMPLOYMENT TAX PAYABLE', 'Liability', 'Decrease', 'Increase', 1),
(32, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'FREIGHT-IN', 'Part of Calculation of Net Purchases', 'Increase', 'Decrease', 1),
(33, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'FREIGHT-OUT', 'Expense', 'Increase', 'Decrease', 1),
(34, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'FUEL EXPENSE', 'Expense', 'Increase', 'Decrease', 1),
(35, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'GAIN', 'Gain', 'Decrease', 'Increase', 1),
(36, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'HEALTH/CHILD FLEX PAYABLE', 'Liability', 'Decrease', 'Increase', 1),
(37, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'INCOME SUMMARY', 'Not a Financial Statement Account', 'Debited for Total Expenses', 'Credited for Total Revenues', 1),
(38, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'INSURANCE EXPENSE', 'Expense', 'Increase', 'Decrease', 1),
(39, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'INSURANCE PAYABLE', 'Liability', 'Decrease', 'Increase', 1),
(40, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'INTEREST EXPENSE', 'Expense', 'Increase', 'Decrease', 1),
(41, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'INTEREST INCOME', 'Revenue', 'Decrease', 'Increase', 1),
(42, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'INTEREST PAYABLE', 'Liability', 'Decrease', 'Increase', 1),
(43, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'INTEREST RECEIVABLE', 'Asset', 'Increase', 'Decrease', 1),
(44, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'INVENTORY', 'Asset', 'Increase', 'Decrease', 1),
(45, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'INVESTMENT IN BONDS', 'Asset', 'Increase', 'Decrease', 1),
(46, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'INVESTMENT INCOME', 'Revenue', 'Decrease', 'Increase', 1),
(47, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'INVESTMENTS', 'Asset', 'Increase', 'Decrease', 1),
(48, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'LAND', 'Asset', 'Increase', 'Decrease', 1),
(49, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'LOAN PAYABLE', 'Liability', 'Decrease', 'Increase', 1),
(50, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'LOAN & ADVANCE', 'Asset', 'Increase', 'Decrease', 1),
(51, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'LOSS', 'Loss', 'Increase', 'Decrease', 1),
(52, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'MEDICARE/MEDICAID PAYABLE', 'Liability', 'Decrease', 'Increase', 1),
(53, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'MISCELLANEOUS EXPENSE', 'Expense', 'Increase', 'Decrease', 1),
(54, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'NOTES PAYABLE', 'Liability', 'Decrease', 'Increase', 1),
(55, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'NOTES RECEIVABLE', 'Asset', 'Increase', 'Decrease', 1),
(56, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'OBLIGATION UNDER CAPITAL LEASE', 'Liability', 'Decrease', 'Increase', 1),
(57, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'PAID-IN CAPITAL IN EXCESS OF PAR – COMMON', 'Equity', 'Decrease', 'Increase', 1),
(58, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'PAID-IN CAPITAL IN EXCESS OF PAR – PREFERRED', 'Equity', 'Decrease', 'Increase', 1),
(59, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'PATENT', 'Asset', 'Increase', 'Decrease', 1),
(60, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'PAYROLL TAX EXPENSE', 'Expense', 'Increase', 'Decrease', 1),
(61, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'PETTY CASH', 'Asset', 'Increase', 'Decrease', 1),
(62, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'POSTAGE EXPENSE', 'Expense', 'Increase', 'Decrease', 1),
(63, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'PREMIUM ON BONDS PAYABLE', 'Liability Adjunct Account', 'Decrease', 'Increase', 1),
(64, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'PREPAID INSURANCE', 'Asset', 'Increase', 'Decrease', 1),
(65, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'PREPAID RENT', 'Asset', 'Increase', 'Decrease', 1),
(66, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'PURCHASE DISCOUNTS', 'Reduces Calculation of Net Purchases', 'Decrease', 'Increase', 1),
(67, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'PURCHASE DISCOUNTS LOST', 'Expense', 'Increase', 'Decrease', 1),
(68, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'PURCHASES', 'Part of Calculation of Net Purchases', 'Increase', 'Decrease', 1),
(69, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'PURCHASE RETURNS', 'Reduces Calculation of Net Purchases', 'Decrease', 'Increase', 1),
(70, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'RENT EXPENSE', 'Expense', 'Increase', 'Decrease', 1),
(71, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'REPAIR EXPENSE', 'Expense', 'Increase', 'Decrease', 1),
(72, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'RETAINED EARNINGS', 'Equity', 'Decrease', 'Increase', 1),
(73, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'RETIREMENT CONTRIBUTION PAYABLE', 'Liability', 'Decrease', 'Increase', 1),
(74, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'REVENUE', 'Revenue', 'Decrease', 'Increase', 1),
(75, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'SALARIES EXPENSE', 'Expense', 'Increase', 'Decrease', 1),
(76, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'SALARIES PAYABLE', 'Liability', 'Decrease', 'Increase', 1),
(77, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'SALES', 'Revenue', 'Decrease', 'Increase', 1),
(78, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'SALES DISCOUNTS', 'Contra Revenue', 'Increase', 'Decrease', 1),
(79, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'SALES RETURNS', 'Contra Revenue', 'Increase', 'Decrease', 1),
(80, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'SERVICE CHARGE', 'Expense', 'Increase', 'Decrease', 1),
(81, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'SERVICE REVENUE', 'Revenue', 'Decrease', 'Increase', 1),
(82, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'SOCIAL SECURITY PAYABLE', 'Liability', 'Decrease', 'Increase', 1),
(83, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'STATE INCOME TAX PAYABLE', 'Liability', 'Decrease', 'Increase', 1),
(84, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'STATE UNEMPLOYMENT TAX PAYABLE', 'Liability', 'Decrease', 'Increase', 1),
(85, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'SUNDRY CREDITORS', 'Current liabilities', 'Decrease', 'Increase', 1),
(86, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'SUNDRY DEBTORS', 'Current Assets', 'Increase', 'Decrease', 1),
(87, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'SUPPLIES', 'Asset', 'Increase', 'Decrease', 1),
(88, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'SUPPLIES EXPENSE', 'Expense', 'Increase', 'Decrease', 1),
(89, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'TRADING SECURITIES', 'Asset', 'Increase', 'Decrease', 1),
(90, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'TREASURY STOCK', 'Contra Equity', 'Increase', 'Decrease', 1),
(91, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'UNCOLLECTIBLE ACCOUNTS EXPENSE', 'Expense', 'Increase', 'Decrease', 1),
(92, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'UNEARNED REVENUE', 'Liability', 'Decrease', 'Increase', 1),
(93, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'UNREALIZED GAIN', 'Gain', 'Decrease', 'Increase', 1),
(94, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'UNREALIZED LOSS', 'Loss', 'Increase', 'Decrease', 1),
(95, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'UNREALIZED GAIN – OTHER COMPREHENSIVE INCOME', 'Increase in Equity Via Other Comprehensive Income', 'Decrease', 'Increase', 1),
(96, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'UNREALIZED LOSS – OTHER COMPREHENSIVE INCOME', 'Decrease in Equity Via Other Comprehensive Income', 'Increase', 'Decrease', 1),
(97, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'UTILITIES EXPENSE', 'Expense', 'Increase', 'Decrease', 1),
(98, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'WARRANTY EXPENSE', 'Expense', 'Increase', 'Decrease', 1),
(99, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'WARRANTY LIABILITY', 'Liability', 'Decrease', 'Increase', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addressinfos`
--

DROP TABLE IF EXISTS `addressinfos`;
CREATE TABLE `addressinfos` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `students_id` int(10) UNSIGNED NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `temp_address` varchar(100) DEFAULT NULL,
  `temp_state` varchar(25) DEFAULT NULL,
  `temp_country` varchar(25) DEFAULT NULL,
  `home_phone` varchar(15) DEFAULT NULL,
  `mobile_1` varchar(15) DEFAULT NULL,
  `mobile_2` varchar(15) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alert_settings`
--

DROP TABLE IF EXISTS `alert_settings`;
CREATE TABLE `alert_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `event` varchar(100) NOT NULL,
  `sms` tinyint(1) NOT NULL DEFAULT 1,
  `email` tinyint(1) NOT NULL DEFAULT 1,
  `subject` varchar(191) NOT NULL,
  `template` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `alert_settings`
--

INSERT INTO `alert_settings` (`id`, `created_at`, `updated_at`, `created_by`, `last_updated_by`, `event`, `sms`, `email`, `subject`, `template`, `status`) VALUES
(1, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'BirthdayWish', 0, 0, 'Wish Your Birthday Dear', 'Dear {{first_name}}, Sending you smiles for every moment of your special day…Have a wonderful time and a very happy birthday!', 1),
(2, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'StudentRegistration', 0, 0, 'Registration Information', 'Dear {{first_name}}, you are successfully registered in our institution with RegNo.{{reg_no}}. Thank You.', 1),
(3, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'StudentTransfer', 0, 0, 'Transfer Information', 'Dear {{first_name}}, We would like to inform you are successfully transferred to {{semester}}. Thank You.', 1),
(4, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'FeeReceive', 0, 0, 'Fees Receive Information', 'Dear {{first_name}}, We would like to inform you we are successfully received {{amount}} on {{date}}. Thank you for the Deposit.', 1),
(5, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'BalanceFees', 0, 0, 'Balance Fees Information', 'Dear {{first_name}}, you have {{due_amount}} balance fees. please deposit on time. For more info contact the Account Department.', 1),
(6, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'SubjectAttendance', 0, 0, 'Student Subject Wise Attendance Information', 'Dear {{guardian_name}}, your child {{first_name}} was Absent in {{absent_status}} subjects attendance on {{date}}.', 1),
(7, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'StudentAttendance', 0, 0, 'Student Attendance Information', 'Dear Guardian, This is to inform you that {{first_name}} is {{status}} on {{date}}.', 1),
(8, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'StaffAttendance', 0, 0, 'Staff Attendance Information', 'Dear {{first_name}}, This is to inform you are {{status}} on {{date}}.', 1),
(9, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'StaffAbsentNotification', 0, 0, 'Staff Absent Information', 'Dear Sir, This is to inform you following staffs are absent today. {{staffs_name}}', 1),
(10, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'ExamScoreForGuardian', 0, 0, 'Exam Score Information', 'Dear Guardian, {{first_name}} has obtained the following marks in {{exam_mark_detail}}.', 1),
(11, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'ExamScoreForStudent', 0, 0, 'Exam Score Information', 'Dear {{first_name}}, you have obtained following marks in {{exam_mark_detail}}.', 1),
(12, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'LibraryRegistration', 0, 0, 'Library Registration Information', 'Dear {{first_name}}, Congratulation! You are successfully registered in our library.', 1),
(13, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'LibraryReturnPeriodOver', 0, 0, 'Library Clearance Reminder', 'Dear {{first_name}}, We would like to inform you have some books return time period is over. So, please return as soon as possible.', 1),
(14, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'HostelRegistration', 0, 0, 'Hostel Registration Information', 'Dear {{first_name}}, Congratulation! You are successfully registered in our hostel.', 1),
(15, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'HostelShift', 0, 0, 'Hostel Shift Information', 'Dear {{first_name}}, Congratulation! You are successfully shifted in {{new_hostel}}.', 1),
(16, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'HostelLeave', 0, 0, 'Hostel Leave Information', 'Dear {{first_name}}, You are successfully leaving from our hostel. Thank you.', 1),
(17, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'HostelActive', 0, 0, 'Hostel Active Again Information', 'Dear {{first_name}}, You are successfully re-Activated for our hostel service in {{new_hostel}}.', 1),
(18, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'TransportRegistration', 0, 0, 'Transport Service Registration Information', 'Dear {{first_name}}, You are successfully registered for our transport service in {{transport}}.', 1),
(19, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'TransportShift', 0, 0, 'Transport Shift Information', 'Dear {{first_name}}, Congratulation! You are successfully shifted in {{transport}}.', 1),
(20, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'TransportLeave', 0, 0, 'Transport Leave Information', 'Dear {{first_name}}, You are successfully deactivated for transport service. Thank you.', 1),
(21, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'TransportActive', 0, 0, 'Transport Active Again Information', 'Dear {{first_name}}, You are successfully re-Activated for our transport service in {{transport}}.', 1),
(22, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'CustomerRegistration', 0, 0, 'Customer Registration Information', 'Dear {name}, you are successfully registered in our CRM with RegNo.{reg_no}.', 1),
(23, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'VendorRegistration', 0, 0, 'Vendor Registration Information', 'Dear {name}, you are successfully registered in our CRM with RegNo.{reg_no}.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
CREATE TABLE `assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `rate` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
CREATE TABLE `attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `attendees_type` int(11) NOT NULL,
  `link_id` int(10) UNSIGNED NOT NULL,
  `years_id` int(10) UNSIGNED NOT NULL,
  `months_id` int(10) UNSIGNED NOT NULL,
  `day_1` int(11) NOT NULL DEFAULT 0,
  `day_2` int(11) NOT NULL DEFAULT 0,
  `day_3` int(11) NOT NULL DEFAULT 0,
  `day_4` int(11) NOT NULL DEFAULT 0,
  `day_5` int(11) NOT NULL DEFAULT 0,
  `day_6` int(11) NOT NULL DEFAULT 0,
  `day_7` int(11) NOT NULL DEFAULT 0,
  `day_8` int(11) NOT NULL DEFAULT 0,
  `day_9` int(11) NOT NULL DEFAULT 0,
  `day_10` int(11) NOT NULL DEFAULT 0,
  `day_11` int(11) NOT NULL DEFAULT 0,
  `day_12` int(11) NOT NULL DEFAULT 0,
  `day_13` int(11) NOT NULL DEFAULT 0,
  `day_14` int(11) NOT NULL DEFAULT 0,
  `day_15` int(11) NOT NULL DEFAULT 0,
  `day_16` int(11) NOT NULL DEFAULT 0,
  `day_17` int(11) NOT NULL DEFAULT 0,
  `day_18` int(11) NOT NULL DEFAULT 0,
  `day_19` int(11) NOT NULL DEFAULT 0,
  `day_20` int(11) NOT NULL DEFAULT 0,
  `day_21` int(11) NOT NULL DEFAULT 0,
  `day_22` int(11) NOT NULL DEFAULT 0,
  `day_23` int(11) NOT NULL DEFAULT 0,
  `day_24` int(11) NOT NULL DEFAULT 0,
  `day_25` int(11) NOT NULL DEFAULT 0,
  `day_26` int(11) NOT NULL DEFAULT 0,
  `day_27` int(11) NOT NULL DEFAULT 0,
  `day_28` int(11) NOT NULL DEFAULT 0,
  `day_29` int(11) NOT NULL DEFAULT 0,
  `day_30` int(11) NOT NULL DEFAULT 0,
  `day_31` int(11) NOT NULL DEFAULT 0,
  `day_32` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_certificates`
--

DROP TABLE IF EXISTS `attendance_certificates`;
CREATE TABLE `attendance_certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `students_id` int(10) UNSIGNED NOT NULL,
  `date_of_issue` date NOT NULL,
  `year_of_study` varchar(9) NOT NULL,
  `percentage_of_attendance` varchar(3) NOT NULL,
  `ref_text` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_masters`
--

DROP TABLE IF EXISTS `attendance_masters`;
CREATE TABLE `attendance_masters` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `year` int(10) UNSIGNED NOT NULL,
  `month` int(10) UNSIGNED NOT NULL,
  `day_in_month` int(11) NOT NULL,
  `holiday` int(11) NOT NULL,
  `open` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_statuses`
--

DROP TABLE IF EXISTS `attendance_statuses`;
CREATE TABLE `attendance_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(25) NOT NULL,
  `display_class` varchar(15) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendance_statuses`
--

INSERT INTO `attendance_statuses` (`id`, `created_at`, `updated_at`, `created_by`, `last_updated_by`, `title`, `display_class`, `status`) VALUES
(1, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'PRESENT', 'btn-primary', 1),
(2, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'ABSENT', 'btn-danger', 1),
(3, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'LATE', 'btn-warning', 1),
(4, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'LEAVE', 'btn-success', 1),
(5, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'HOLIDAY', 'btn-info', 1);

-- --------------------------------------------------------

--
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
CREATE TABLE `audits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(191) NOT NULL,
  `auditable_type` varchar(191) NOT NULL,
  `auditable_id` bigint(20) UNSIGNED NOT NULL,
  `old_values` text DEFAULT NULL,
  `new_values` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
CREATE TABLE `banks` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `bank_name` varchar(100) NOT NULL,
  `ac_name` varchar(100) NOT NULL,
  `ac_number` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_transactions`
--

DROP TABLE IF EXISTS `bank_transactions`;
CREATE TABLE `bank_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `banks_id` int(10) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `deposit_id` varchar(15) NOT NULL,
  `date` datetime NOT NULL,
  `dr_amt` int(11) NOT NULL DEFAULT 0,
  `cr_amt` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bonafide_certificates`
--

DROP TABLE IF EXISTS `bonafide_certificates`;
CREATE TABLE `bonafide_certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `students_id` int(10) UNSIGNED NOT NULL,
  `date_of_issue` date NOT NULL,
  `course` text NOT NULL,
  `period` varchar(9) NOT NULL,
  `character` varchar(191) NOT NULL,
  `ref_text` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_categories`
--

DROP TABLE IF EXISTS `book_categories`;
CREATE TABLE `book_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificate_histories`
--

DROP TABLE IF EXISTS `certificate_histories`;
CREATE TABLE `certificate_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `students_id` int(10) UNSIGNED NOT NULL,
  `certificate` varchar(50) NOT NULL,
  `certificate_id` int(10) UNSIGNED NOT NULL,
  `history_type` text NOT NULL,
  `ref_text` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificate_templates`
--

DROP TABLE IF EXISTS `certificate_templates`;
CREATE TABLE `certificate_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `certificate` varchar(191) NOT NULL,
  `template` text NOT NULL,
  `background_image` text DEFAULT NULL,
  `custom_css` text DEFAULT NULL,
  `student_photo` tinyint(1) NOT NULL DEFAULT 1,
  `background_status` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `certificate_templates`
--

INSERT INTO `certificate_templates` (`id`, `created_at`, `updated_at`, `created_by`, `last_updated_by`, `certificate`, `template`, `background_image`, `custom_css`, `student_photo`, `background_status`, `status`) VALUES
(2, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'TRANSFER', '<table class=\"table table-bordered\"> <tbody> <tr> <td style=\"text-align: right;\"><span style=\"text-align: right;\">TC No. :&nbsp;</span><br></td> <td style=\"text-align: left;\"><span style=\"font-weight: 700;\">{{tc_num}}</span><br></td> <td rowspan=\"5\">{{student_image}}</td> </tr> <tr> <td style=\"text-align: right; \"><span style=\"text-align: right;\">Faculty/Level :&nbsp;</span><br></td> <td style=\"text-align: left;\"><span style=\"font-weight: 700;\">{{faculty}}</span><br></td> </tr> <tr> <td style=\"text-align: right; \"><span style=\"text-align: right;\">Admission No./Reg.No. :</span><br></td> <td style=\"text-align: left;\"><span style=\"font-weight: 700;\">{{reg_no}}</span><br></td> </tr> <tr> <td style=\"text-align: right;\"><span style=\"text-align: right;\">University Reg. No. :</span><br></td> <td style=\"text-align: left;\"><b>{{university_reg}}</b><br></td> </tr><tr><td style=\"text-align: right;\">Batch. :<br></td><td style=\"text-align: left;\"><span style=\"font-weight: 700;\">{{batch}}</span><br></td></tr> </tbody></table><table class=\"table table-bordered\"> <tbody> <tr> <td>01.</td> <td style=\"text-align: right; \">Name of Student :&nbsp;</td> <td width=\"50%\" style=\"text-align: left;\"><b>{{student_name}}</b><br></td> </tr> <tr> <td>02.</td> <td style=\"text-align: right; \">Name of Father.&nbsp;:&nbsp;</td> <td width=\"50%\" style=\"text-align: left;\"><b>{{parents_name}}</b><br></td> </tr> <tr> <td>03.</td> <td style=\"text-align: right; \">Date of Birth :&nbsp;</td> <td width=\"50%\" style=\"text-align: left;\"><span style=\"font-weight: 700;\">{{date_of_birth}}</span><br></td> </tr> <tr> <td>04.</td> <td style=\"text-align: right; \">Gender :&nbsp;</td> <td width=\"50%\" style=\"text-align: left;\"><span style=\"font-weight: 700;\">{{gender}}</span><br></td> </tr> <tr> <td>05.</td> <td style=\"text-align: right; \">Nationality :&nbsp;</td> <td width=\"50%\" style=\"text-align: left;\"><span style=\"font-weight: 700;\">{{nationality}}</span><br></td> </tr> <tr> <td>06.</td> <td style=\"text-align: right; \">Religion :&nbsp;</td> <td width=\"50%\" style=\"text-align: left;\"><b>{{religion}}</b><br></td> </tr> <tr> <td>07.</td> <td style=\"text-align: right; \">Community &amp; Caste :&nbsp;</td> <td width=\"50%\" style=\"text-align: left;\"><span style=\"font-weight: 700;\">{{caste}}</span><br></td> </tr> <tr> <td>08.</td> <td style=\"text-align: right; \">Date of Admission :&nbsp;</td> <td width=\"50%\" style=\"text-align: left;\"><span style=\"font-weight: 700;\">{{reg_date}}</span><br></td> </tr> <tr> <td>09.</td> <td style=\"text-align: right; \">Date of Leaving :&nbsp;</td> <td width=\"50%\" style=\"text-align: left;\"><b>{{date_of_leaving}}</b><br></td> </tr> <tr> <td>10.</td> <td style=\"text-align: right;\">Class studied at the time of leaving :&nbsp;</td> <td width=\"50%\" style=\"text-align: left;\"><b>{{leaving_time_class}}</b><br></td> </tr> <tr> <td>11.</td> <td style=\"text-align: right; \">Whether qualified for promotion to higher class :&nbsp;</td> <td width=\"50%\" style=\"text-align: left;\"><b>{{qualified_to_promote}}</b><br></td> </tr> <tr> <td>12.</td> <td style=\"text-align: right; \">Whether the student has paid all Balance fees to the college :&nbsp;</td> <td width=\"50%\" style=\"text-align: left;\"><b>{{paid_fee_status}}</b><br></td> </tr> <tr> <td>13.</td> <td style=\"text-align: right; \">Conduct and Character :&nbsp;</td> <td width=\"50%\" style=\"text-align: left;\"><span style=\"font-weight: 700;\">{{character}}</span><br></td> </tr> </tbody></table>', NULL, '.subpage{padding: 100px;}', 0, 0, 1),
(3, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'CHARACTER', '<p>This is to certify that&nbsp;<span style=\"color: rgb(57, 57, 57);\"><b>{{student_name}}</b></span>&nbsp;Son of&nbsp;<span style=\"color: rgb(57, 57, 57);\"><b>{{father_name}}</b> </span>&amp;&nbsp;<span style=\"color: rgb(57, 57, 57);\"><b>{{mother_name}}</b></span>, Permanent Address<b>&nbsp;<span style=\"color: rgb(57, 57, 57);\">{{address}}</span></b>, is known to me for about&nbsp;<span style=\"color: rgb(57, 57, 57);\"><b>{{year}}</b></span>&nbsp;years. He is a citizen of&nbsp;<span style=\"color: rgb(57, 57, 57);\"><b>{{country}}</b>&nbsp;</span>by birth.</p><p><br></p><p>To the best of my knowledge, he bears a <b>{{character}}</b> character and is not involved in such activities which are against the state freedom and peace. I wish all success and prosperity in his life.</p>', NULL, '.subpage{padding: 100px;}', 0, 0, 1),
(4, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'BONAFIDE', 'This is to certify that <b>{{student_name}} </b>Reg No. <b>{{reg_no}}</b>   Son of <b>{{parents_name}}</b> is a bonafide student of this College in the <b>{{course}}</b> course during the period <b>{{period}}</b>. His/Her Date of Birth as per our School/College record is <b>{{date_of_birth}}</b>.His/Her Conduct and Character are <b>{{character}}</b>.', NULL, '.subpage{padding: 100px;}', 0, 0, 1),
(5, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'COURSE COMPLETION', '<p>This is to certify that <b>{{student_name}}</b> Reg No. <b>{{reg_no}}</b>&nbsp; Son of <b>{{parents_name}} </b>has studied <b>{{course}}</b> in our college during the <b>{{period}}</b>. His/Her Date of Birth as per our School/College record is <b>{{date_of_birth}}</b>.His/Her Conduct and Character are <b>{{character}}</b> during the tenure of his studies.<br></p>', NULL, '.subpage{padding: 100px;}', 0, 0, 1),
(6, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'GENERAL TEMPLATE', '<p style=\"text-align: center; \">REG.NO.:<b>{{reg_no}}</b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;REG.DATE: <b>{{reg_date}}</b></p><p style=\"text-align: center; \"><b><br></b></p><p style=\"text-align: center; \">This is to certify that <b>{{student_name}}</b> son/daughter of <b>{{parents_name}}</b> Residing at <b>{{address}}</b> is bonafide Student of our school.</p><p style=\"text-align: center; \"><br></p><p style=\"text-align: center; \">He/She is /was very obedient, sincere and hardworking.</p><p style=\"text-align: center; \"><br></p><p style=\"text-align: center; \">He/She bears a good moral character. His/Her Date of Birth is <b>{{date_of_birth}}</b> and Place of Birth is <b>{{address}}</b>.<br></p>', NULL, '.subpage{padding: 100px;}', 1, 0, 1),
(7, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, NULL, 'IDENTITY CARD', '<h5 style=\"text-align: center;\"><b>{{student_name}}</b></h5><h6 style=\"text-align: center; \"><b>{{faculty}}-</b><b>{{semester}}</b></h6><p></p><p><b>PARENT : {{parents_name}}</b></p><p></p><p><b>ADDRESS : {{address}}</b></p><p><b>CONTACT : {{guardian_mobile_1}}</b></p><p><b>VALID DATE : JAN 2019-  FEB 2020</b></p><p></p>', NULL, '.subpage{padding:83px 5px 5px;color:#000!important}.page-content{padding:8px 20px 24px}h5{font-size:14px;margin:2px auto}h6{font-size:12px;margin:2px auto}.student_image{border-radius:0;width:100px;height:auto;border:2px #438eb9 solid}p{margin:1px 0 0;font-size:10px;text-align:left!important}', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `character_certificates`
--

DROP TABLE IF EXISTS `character_certificates`;
CREATE TABLE `character_certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `students_id` int(10) UNSIGNED NOT NULL,
  `date_of_issue` date NOT NULL,
  `cc_num` varchar(191) NOT NULL,
  `year` varchar(4) NOT NULL,
  `character` varchar(191) NOT NULL,
  `ref_text` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_completion_certificates`
--

DROP TABLE IF EXISTS `course_completion_certificates`;
CREATE TABLE `course_completion_certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `students_id` int(10) UNSIGNED NOT NULL,
  `date_of_issue` date NOT NULL,
  `course` text NOT NULL,
  `period` varchar(9) NOT NULL,
  `character` varchar(191) NOT NULL,
  `ref_text` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `reg_no` varchar(15) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `mobile_1` varchar(10) DEFAULT NULL,
  `mobile_2` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `extra_info` text DEFAULT NULL,
  `customer_image` text DEFAULT NULL,
  `customer_status` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_statuses`
--

DROP TABLE IF EXISTS `customer_statuses`;
CREATE TABLE `customer_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_statuses`
--

INSERT INTO `customer_statuses` (`id`, `created_at`, `updated_at`, `created_by`, `last_updated_by`, `title`, `status`) VALUES
(1, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, 1, 'New Customer', 1),
(2, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, 1, 'Annual Contract', 1),
(3, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, 1, 'Office Contract', 1),
(4, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, 1, 'Individual', 1),
(5, '2020-05-04 17:10:07', '2020-05-04 17:10:07', 1, 1, 'inquiry/Lead', 1);

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

DROP TABLE IF EXISTS `days`;
CREATE TABLE `days` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`id`, `created_at`, `updated_at`, `created_by`, `last_updated_by`, `title`, `status`) VALUES
(1, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'Sunday', 1),
(2, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'Monday', 1),
(3, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'Tuesday', 1),
(4, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'Wednesday', 1),
(5, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'Thursday', 1),
(6, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'Friday', 1),
(7, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'Saturday', 1);

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `member_type` varchar(8) NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `file` text NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `downloads`
--

DROP TABLE IF EXISTS `downloads`;
CREATE TABLE `downloads` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `semesters_id` int(10) UNSIGNED DEFAULT NULL,
  `subjects_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `file` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_settings`
--

DROP TABLE IF EXISTS `email_settings`;
CREATE TABLE `email_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `driver` varchar(100) NOT NULL,
  `host` varchar(100) NOT NULL,
  `port` varchar(10) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `encryption` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
CREATE TABLE `exams` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_mark_ledgers`
--

DROP TABLE IF EXISTS `exam_mark_ledgers`;
CREATE TABLE `exam_mark_ledgers` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `exam_schedule_id` int(10) UNSIGNED NOT NULL,
  `students_id` int(10) UNSIGNED NOT NULL,
  `obtain_mark_theory` int(11) NOT NULL DEFAULT 0,
  `absent_theory` tinyint(1) NOT NULL DEFAULT 0,
  `obtain_mark_practical` int(11) NOT NULL DEFAULT 0,
  `absent_practical` tinyint(1) NOT NULL DEFAULT 0,
  `sorting_order` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_schedules`
--

DROP TABLE IF EXISTS `exam_schedules`;
CREATE TABLE `exam_schedules` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `years_id` int(10) UNSIGNED NOT NULL,
  `months_id` int(10) UNSIGNED NOT NULL,
  `exams_id` int(10) UNSIGNED NOT NULL,
  `faculty_id` int(10) UNSIGNED NOT NULL,
  `semesters_id` int(10) UNSIGNED NOT NULL,
  `subjects_id` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `full_mark_theory` int(11) NOT NULL DEFAULT 0,
  `pass_mark_theory` int(11) NOT NULL DEFAULT 0,
  `full_mark_practical` int(11) NOT NULL DEFAULT 0,
  `pass_mark_practical` int(11) NOT NULL DEFAULT 0,
  `sorting_order` int(10) UNSIGNED NOT NULL,
  `publish_status` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

DROP TABLE IF EXISTS `faculties`;
CREATE TABLE `faculties` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `faculty` varchar(100) NOT NULL,
  `faculty_code` varchar(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faculty_semester`
--

DROP TABLE IF EXISTS `faculty_semester`;
CREATE TABLE `faculty_semester` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `faculty_id` int(10) UNSIGNED NOT NULL,
  `semester_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_collections`
--

DROP TABLE IF EXISTS `fee_collections`;
CREATE TABLE `fee_collections` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `students_id` int(10) UNSIGNED NOT NULL,
  `fee_masters_id` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `fine` int(11) DEFAULT NULL,
  `payment_mode` varchar(15) NOT NULL,
  `note` varchar(100) DEFAULT NULL,
  `response` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_heads`
--

DROP TABLE IF EXISTS `fee_heads`;
CREATE TABLE `fee_heads` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `fee_head_title` varchar(100) NOT NULL,
  `fee_head_amount` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_masters`
--

DROP TABLE IF EXISTS `fee_masters`;
CREATE TABLE `fee_masters` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `students_id` int(10) UNSIGNED NOT NULL,
  `semester` varchar(100) NOT NULL,
  `fee_head` varchar(100) NOT NULL,
  `fee_due_date` datetime NOT NULL,
  `fee_amount` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

DROP TABLE IF EXISTS `general_settings`;
CREATE TABLE `general_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `institute` varchar(100) NOT NULL,
  `salogan` varchar(100) DEFAULT NULL,
  `copyright` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `favicon` text DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `print_header` text DEFAULT NULL,
  `print_footer` text DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `linkedIn` varchar(100) DEFAULT NULL,
  `youtube` varchar(100) DEFAULT NULL,
  `googlePlus` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `whatsApp` varchar(100) DEFAULT NULL,
  `skype` varchar(100) DEFAULT NULL,
  `pinterest` varchar(100) DEFAULT NULL,
  `wordpress` varchar(100) DEFAULT NULL,
  `time_zones_id` int(10) UNSIGNED DEFAULT NULL,
  `quick_menu` tinyint(1) NOT NULL DEFAULT 1,
  `public_registration` tinyint(1) NOT NULL DEFAULT 1,
  `front_desk` tinyint(1) NOT NULL DEFAULT 1,
  `student_staff` tinyint(1) NOT NULL DEFAULT 1,
  `account` tinyint(1) NOT NULL DEFAULT 1,
  `inventory` tinyint(1) NOT NULL DEFAULT 1,
  `library` tinyint(1) NOT NULL DEFAULT 1,
  `attendance` tinyint(1) NOT NULL DEFAULT 1,
  `exam` tinyint(1) NOT NULL DEFAULT 1,
  `certificate` tinyint(1) NOT NULL DEFAULT 1,
  `hostel` tinyint(1) NOT NULL DEFAULT 1,
  `transport` tinyint(1) NOT NULL DEFAULT 1,
  `assignment` tinyint(1) NOT NULL DEFAULT 1,
  `upload_download` tinyint(1) NOT NULL DEFAULT 1,
  `meeting` tinyint(1) NOT NULL DEFAULT 1,
  `alert` tinyint(1) NOT NULL DEFAULT 1,
  `academic` tinyint(1) NOT NULL DEFAULT 1,
  `help` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `created_at`, `updated_at`, `created_by`, `last_updated_by`, `institute`, `salogan`, `copyright`, `address`, `phone`, `email`, `website`, `favicon`, `logo`, `print_header`, `print_footer`, `facebook`, `twitter`, `linkedIn`, `youtube`, `googlePlus`, `instagram`, `whatsApp`, `skype`, `pinterest`, `wordpress`, `time_zones_id`, `quick_menu`, `public_registration`, `front_desk`, `student_staff`, `account`, `inventory`, `library`, `attendance`, `exam`, `certificate`, `hostel`, `transport`, `assignment`, `upload_download`, `meeting`, `alert`, `academic`, `help`, `status`) VALUES
(1, '2020-05-04 17:10:05', '2025-01-28 19:02:48', 1, 1, 'TP SHETTEY', NULL, 'Copyright © 2025.TP SHETTEY right reserved', 'Lanja', '0000000000', 'tpshettey@gmail.com', NULL, '5156.png', '6514.png', '<p>u</p>', '<p>u</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 274, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `grading_scales`
--

DROP TABLE IF EXISTS `grading_scales`;
CREATE TABLE `grading_scales` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `gradingType_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(2) NOT NULL,
  `percentage_from` int(11) NOT NULL,
  `percentage_to` int(11) NOT NULL,
  `grade_point` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grading_types`
--

DROP TABLE IF EXISTS `grading_types`;
CREATE TABLE `grading_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guardian_details`
--

DROP TABLE IF EXISTS `guardian_details`;
CREATE TABLE `guardian_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `guardian_first_name` varchar(15) DEFAULT NULL,
  `guardian_middle_name` varchar(15) DEFAULT NULL,
  `guardian_last_name` varchar(15) DEFAULT NULL,
  `guardian_qualification` varchar(50) DEFAULT NULL,
  `guardian_occupation` varchar(50) DEFAULT NULL,
  `guardian_office` varchar(100) DEFAULT NULL,
  `guardian_office_number` varchar(15) DEFAULT NULL,
  `guardian_residence_number` varchar(15) DEFAULT NULL,
  `guardian_mobile_1` varchar(15) DEFAULT NULL,
  `guardian_mobile_2` varchar(15) DEFAULT NULL,
  `guardian_email` varchar(100) DEFAULT NULL,
  `guardian_relation` varchar(50) DEFAULT NULL,
  `guardian_address` varchar(100) DEFAULT NULL,
  `guardian_image` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `institutions`
--

DROP TABLE IF EXISTS `institutions`;
CREATE TABLE `institutions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

DROP TABLE IF EXISTS `months`;
CREATE TABLE `months` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`id`, `created_at`, `updated_at`, `created_by`, `last_updated_by`, `title`, `status`) VALUES
(1, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'January', 1),
(2, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'February', 1),
(3, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'March', 1),
(4, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'April', 1),
(5, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'May', 1),
(6, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'June', 1),
(7, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'July', 1),
(8, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'August', 1),
(9, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'September', 1),
(10, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'October', 1),
(11, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'November', 1),
(12, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, NULL, 'December', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `member_type` varchar(8) NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(100) NOT NULL,
  `note` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `publish_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `display_group` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_payments`
--

DROP TABLE IF EXISTS `online_payments`;
CREATE TABLE `online_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `students_id` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_gateway` varchar(191) DEFAULT NULL,
  `ref_no` varchar(191) DEFAULT NULL,
  `ref_text` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parent_details`
--

DROP TABLE IF EXISTS `parent_details`;
CREATE TABLE `parent_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `students_id` int(10) UNSIGNED NOT NULL,
  `grandfather_first_name` varchar(15) DEFAULT NULL,
  `grandfather_middle_name` varchar(15) DEFAULT NULL,
  `grandfather_last_name` varchar(15) DEFAULT NULL,
  `father_first_name` varchar(15) DEFAULT NULL,
  `father_middle_name` varchar(15) DEFAULT NULL,
  `father_last_name` varchar(15) DEFAULT NULL,
  `father_qualification` varchar(50) DEFAULT NULL,
  `father_occupation` varchar(50) DEFAULT NULL,
  `father_office` varchar(100) DEFAULT NULL,
  `father_office_number` varchar(15) DEFAULT NULL,
  `father_residence_number` varchar(15) DEFAULT NULL,
  `father_mobile_1` varchar(15) DEFAULT NULL,
  `father_mobile_2` varchar(15) DEFAULT NULL,
  `father_email` varchar(100) DEFAULT NULL,
  `mother_first_name` varchar(15) DEFAULT NULL,
  `mother_middle_name` varchar(15) DEFAULT NULL,
  `mother_last_name` varchar(15) DEFAULT NULL,
  `mother_qualification` varchar(50) DEFAULT NULL,
  `mother_occupation` varchar(50) DEFAULT NULL,
  `mother_office` varchar(100) DEFAULT NULL,
  `mother_office_number` varchar(15) DEFAULT NULL,
  `mother_residence_number` varchar(15) DEFAULT NULL,
  `mother_mobile_1` varchar(15) DEFAULT NULL,
  `mother_mobile_2` varchar(15) DEFAULT NULL,
  `mother_email` varchar(100) DEFAULT NULL,
  `father_image` text DEFAULT NULL,
  `mother_image` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(100) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `created_at`, `updated_at`, `created_by`, `last_updated_by`, `title`, `status`) VALUES
(1, '2020-05-04 17:10:06', '2020-05-04 17:10:06', 1, 1, 'Cash', 1),
(2, '2020-05-04 17:10:06', '2020-05-04 17:10:06', 1, 1, 'Bank', 1),
(3, '2020-05-04 17:10:06', '2020-05-04 17:10:06', 1, 1, 'Online Payment', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

DROP TABLE IF EXISTS `payment_settings`;
CREATE TABLE `payment_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `identity` varchar(15) NOT NULL,
  `logo` varchar(15) NOT NULL,
  `link` varchar(100) NOT NULL,
  `config` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_settings`
--

INSERT INTO `payment_settings` (`id`, `created_at`, `updated_at`, `identity`, `logo`, `link`, `config`, `status`) VALUES
(1, NULL, NULL, 'Stripe', 'stripe', 'https://stripe.com', '{\"Publishable_Key\":\"\",\"Secret_Key\":\"\"}', 0),
(2, NULL, NULL, 'Instamojo', 'instamojo', 'https://www.instamojo.com', '{\"API_KEY\":\"\",\"AUTH_TOKEN\":\"\"}', 0),
(3, NULL, NULL, 'PayUMoney', 'payumoney', 'https://www.payumoney.com', '{\"Merchant_Key\":\"\",\"Merchant_Salt\":\"\",\"Auth_Header\":\"\"}', 0),
(4, NULL, NULL, 'RozorPay', 'rozorpay', 'https://razorpay.com', '{\"Key\":\"\",\"Secret\":\"\"}', 0),
(5, NULL, NULL, 'PayStack', 'paystack', 'https://paystack.co', '{\"publicKey\":\"\",\"secretKey\":\"\",\"merchantEmail\":\"\"}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_heads`
--

DROP TABLE IF EXISTS `payroll_heads`;
CREATE TABLE `payroll_heads` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_masters`
--

DROP TABLE IF EXISTS `payroll_masters`;
CREATE TABLE `payroll_masters` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL,
  `tag_line` varchar(100) NOT NULL,
  `payroll_head` varchar(50) NOT NULL,
  `due_date` datetime NOT NULL,
  `amount` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `group` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `display_name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `group_head` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `group`, `name`, `display_name`, `description`, `group_head`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin Setup Permission', 'super-admin-index', 'Super Admin Setup Permission', 'Super Admin Setup Permission', 1, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(2, 'Menu', 'expand-action-menu', 'Expand Nav Menu', 'Expand Nav Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(3, 'Menu', 'admin-control', 'Admin Control', 'Admin Control Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(4, 'Menu', 'dashboard', 'Dashboard', 'Dashboard Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(5, 'Menu', 'front-office', 'Front Office', 'Front Office Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(6, 'Menu', 'student-staff', 'Student-Staff', 'Student-Staff Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(7, 'Menu', 'account', 'Account', 'Account Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(10, 'Menu', 'attendance', 'Attendance', 'Attendance Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(11, 'Menu', 'examination', 'Examination', 'Examination Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(12, 'Menu', 'certificate', 'Certificate', 'Certificate Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(16, 'Menu', 'download', 'Download', 'Download Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(18, 'Menu', 'report', 'Report', 'Report Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(19, 'Menu', 'alert-center', 'Alert Center', 'Alert Center Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(20, 'Menu', 'academic', 'Academic Setup', 'Academic Setup Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(21, 'Menu', 'help', 'Help', 'Help Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(22, 'Student Menu', 'student-dashboard', 'Dashboard', 'Dashboard Student Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(23, 'Student Menu', 'student-profile', 'Profile', 'Profile Student Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(24, 'Student Menu', 'student-profile-edit', 'Profile Edit', 'Profile Edit Student Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(25, 'Student Menu', 'student-fees', 'Fees', 'Fees Student Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(27, 'Student Menu', 'student-attendance', 'Attendance', 'Attendance Student Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(28, 'Student Menu', 'student-exam', 'Exam', 'Exam Student Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(31, 'Student Menu', 'student-course', 'Course', 'Course Student Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(32, 'Student Menu', 'student-notice', 'Notice', 'Notice Student Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(33, 'Student Menu', 'student-download', 'Download', 'Download Student Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(36, 'Guardian Menu', 'guardian-dashboard', 'Dashboard', 'Dashboard Guardian Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(37, 'Guardian Menu', 'guardian-profile-edit', 'Profile Edit', 'Profile Edit Guardian Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(38, 'Guardian Menu', 'guardian-notice', 'Notice', 'Notice Guardian Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(39, 'Guardian Menu', 'guardian-student-list', 'Student List', 'Student List Guardian Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(40, 'Guardian Menu', 'guardian-student-profile', 'Student Profile', 'Student Profile Guardian Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(41, 'Guardian Menu', 'guardian-student-fees', 'Fees', 'Fees Guardian Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(43, 'Guardian Menu', 'guardian-student-attendance', 'Attendance', 'Attendance Guardian Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(46, 'Guardian Menu', 'guardian-student-course', 'Course', 'Course Guardian Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(47, 'Guardian Menu', 'guardian-student-download', 'Download', 'Download Guardian Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(48, 'Guardian Menu', 'guardian-student-exam', 'Exam', 'Exam Guardian Menu', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(50, 'Super Suit', 'super-suit', 'Super Suit', 'Super Suit', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(51, 'User Activity', 'user-activity-index', 'Index', 'User Activity Index', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(52, 'User Activity', 'user-activity-delete', 'Delete', 'Delete User Activity', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(53, 'User Activity', 'user-activity-bulk-action', 'Bulk(Active,InActive,Delete)', 'User Activity Bulk Action', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(54, 'Role', 'role-index', 'Index', 'Role Index', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(55, 'Role', 'role-add', 'Add', 'Role Add', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(56, 'Role', 'role-view', 'View', 'View Role', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(57, 'Role', 'role-edit', 'Edit', 'Edit Role', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(58, 'Role', 'role-delete', 'Delete', 'Delete Role', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(59, 'User', 'user-index', 'Index', 'User Index', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(60, 'User', 'user-add', 'Add', 'User Add', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(61, 'User', 'user-edit', 'Edit', 'Edit User', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(62, 'User', 'user-delete', 'Delete', 'Delete User', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(63, 'User', 'user-active', 'Active', 'Active User', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(64, 'User', 'user-in-active', 'In-Active', 'In-Active User', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(65, 'User', 'user-bulk-action', 'Bulk(Active,InActive,Delete)', 'User Bulk Action', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(66, 'General Setting', 'general-setting-index', 'Index', 'General Setting Index', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(67, 'General Setting', 'general-setting-add', 'Add', 'General Setting Add', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(68, 'General Setting', 'general-setting-edit', 'Edit', 'Edit General Setting', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(69, 'Alert Setting', 'alert-setting-index', 'Index', 'Alert Setting Index', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(70, 'Alert Setting', 'alert-setting-add', 'Add', 'Alert Setting Add', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(71, 'Alert Setting', 'alert-setting-edit', 'Edit', 'Edit Alert Setting', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(72, 'SMS Setting', 'sms-setting-index', 'Index', 'SMS Setting Index', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(73, 'SMS Setting', 'sms-setting-add', 'Add', 'SMS Setting Add', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(74, 'SMS Setting', 'sms-setting-edit', 'Edit', 'Edit SMS Setting', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(75, 'SMS Setting', 'sms-setting-active', 'Active', 'Active SMS', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(76, 'SMS Setting', 'sms-setting-in-active', 'In-Active', 'In-Active SMS', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(77, 'Email Setting', 'email-setting-index', 'Index', 'Email Setting Index', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(78, 'Email Setting', 'email-setting-add', 'Add', 'Email Setting Add', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(79, 'Email Setting', 'email-setting-edit', 'Edit', 'Edit Email Setting', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(80, 'Email Setting', 'email-setting-status-change', 'Status', 'Change Status', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(81, 'Payment Gateway Setting', 'payment-gateway-setting-index', 'Index', 'Payment Gateway Setting Index', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(82, 'Payment Gateway Setting', 'payment-gateway-setting-add', 'Add', 'Payment Gateway Setting Add', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(83, 'Payment Gateway Setting', 'payment-gateway-setting-edit', 'Edit', 'Edit Payment Gateway Setting', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(84, 'Payment Gateway Setting', 'payment-gateway-active', 'Active', 'Active Payment Gateway', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(85, 'Payment Gateway Setting', 'payment-gateway-in-active', 'In-Active', 'In-Active Payment Gateway', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(91, 'Academic Management Permission', 'academic-index', 'Academic Permission', 'Academic Permission', 1, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(92, 'Faculty', 'faculty-index', 'Index', 'Faculty Index', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(93, 'Faculty', 'faculty-add', 'Add', 'Faculty Add', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(94, 'Faculty', 'faculty-edit', 'Edit', 'Edit Faculty', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(95, 'Faculty', 'faculty-delete', 'Delete', 'Delete Faculty', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(96, 'Faculty', 'faculty-active', 'Active', 'Active Faculty', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(97, 'Faculty', 'faculty-in-active', 'In-Active', 'In-Active Faculty', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(98, 'Faculty', 'faculty-bulk-action', 'Bulk(Active,InActive,Delete)', 'Faculty Bulk Action', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(99, 'Semester', 'semester-index', 'Index', 'Semester Index', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(100, 'Semester', 'semester-add', 'Add', 'Semester Add', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(101, 'Semester', 'semester-edit', 'Edit', 'Edit Semester', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(102, 'Semester', 'semester-delete', 'Delete', 'Delete Semester', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(103, 'Semester', 'semester-active', 'Active', 'Active Semester', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(104, 'Semester', 'semester-in-active', 'In-Active', 'In-Active Semester', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(105, 'Semester', 'semester-bulk-action', 'Bulk(Active,InActive,Delete)', 'Semester Bulk Action', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(106, 'Student Batch', 'student-batch-index', 'Index', 'Student Batch Index', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(107, 'Student Batch', 'student-batch-add', 'Add', 'Student Batch Add', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(108, 'Student Batch', 'student-batch-edit', 'Edit', 'Edit Student Batch', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(109, 'Student Batch', 'student-batch-delete', 'Delete', 'Delete Student Batch', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(110, 'Student Batch', 'student-batch-active', 'Active', 'Active Student Batch', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(111, 'Student Batch', 'student-batch-in-active', 'In-Active', 'In-Active Student Batch', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(112, 'Student Batch', 'student-batch-bulk-action', 'Bulk(Active,InActive,Delete)', 'Student Status Bulk Action', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(113, 'Grading', 'grading-index', 'Index', 'Grading Index', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(114, 'Grading', 'grading-add', 'Add', 'Grading Add', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(115, 'Grading', 'grading-edit', 'Edit', 'Edit Grading', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(116, 'Grading', 'grading-delete', 'Delete', 'Delete Grading', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(117, 'Grading', 'grading-active', 'Active', 'Active Grading', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(118, 'Grading', 'grading-in-active', 'In-Active', 'In-Active Grading', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(119, 'Grading', 'grading-bulk-action', 'Bulk(Active,InActive,Delete)', 'Grading Bulk Action', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(120, 'Subject / Course', 'subject-index', 'Index', 'Subject / Course Index', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(121, 'Subject / Course', 'subject-add', 'Add', 'Subject / Course Add', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(122, 'Subject / Course', 'subject-edit', 'Edit', 'Edit Subject / Course', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(123, 'Subject / Course', 'subject-delete', 'Delete', 'Delete Subject / Course', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(124, 'Subject / Course', 'subject-active', 'Active', 'Active Subject / Course', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(125, 'Subject / Course', 'subject-in-active', 'In-Active', 'In-Active Subject / Course', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(126, 'Subject / Course', 'subject-bulk-action', 'Bulk(Active,InActive,Delete)', 'Subject / Course Bulk Action', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(127, 'Student Status', 'student-status-index', 'Index', 'Student Status Index', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(128, 'Student Status', 'student-status-add', 'Add', 'Student Status Add', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(129, 'Student Status', 'student-status-edit', 'Edit', 'Edit Student Status', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(130, 'Student Status', 'student-status-delete', 'Delete', 'Delete Student Status', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(131, 'Student Status', 'student-status-active', 'Active', 'Active Student Status', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(132, 'Student Status', 'student-status-in-active', 'In-Active', 'In-Active Student Status', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(133, 'Student Status', 'student-status-bulk-action', 'Bulk(Active,InActive,Delete)', 'Student Status Bulk Action', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(148, 'Year', 'year-index', 'Index', 'Year Index', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(149, 'Year', 'year-add', 'Add', 'Year Add', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(150, 'Year', 'year-edit', 'Edit', 'Edit Year', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(151, 'Year', 'year-delete', 'Delete', 'Delete Year', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(152, 'Year', 'year-active', 'Active', 'Active Year', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(153, 'Year', 'year-in-active', 'In-Active', 'In-Active Year', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(154, 'Year', 'year-bulk-action', 'Bulk(Active,InActive,Delete)', 'Year Bulk Action', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(155, 'Year', 'year-active-status', 'Make Active', 'Year Make Active', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(156, 'Month', 'month-index', 'Index', 'Month Index', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(157, 'Month', 'month-add', 'Add', 'Month Add', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(158, 'Month', 'month-edit', 'Edit', 'Edit Month', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(159, 'Month', 'month-delete', 'Delete', 'Delete Month', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(160, 'Month', 'month-active', 'Active', 'Active Month', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(161, 'Month', 'month-in-active', 'In-Active', 'In-Active Month', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(162, 'Month', 'month-bulk-action', 'Bulk(Active,InActive,Delete)', 'Month Bulk Action', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(163, 'Day', 'day-index', 'Index', 'Day Index', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(164, 'Day', 'day-add', 'Add', 'Day Add', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(165, 'Day', 'day-edit', 'Edit', 'Edit Day', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(166, 'Day', 'day-delete', 'Delete', 'Delete Day', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(167, 'Day', 'day-active', 'Active', 'Active Day', 0, '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(168, 'Day', 'day-in-active', 'In-Active', 'In-Active Day', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(169, 'Day', 'day-bulk-action', 'Bulk(Active,InActive,Delete)', 'Day Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(170, 'Front Office Permission', 'front-office-index', 'Front Office Management', 'Front Office Management', 1, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(183, 'Visitor Log', 'visitor-index', 'Index', 'Visitor Log Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(184, 'Visitor Log', 'visitor-add', 'Add', 'Visitor Log Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(185, 'Visitor Log', 'visitor-edit', 'Edit', 'Edit Visitor Log', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(186, 'Visitor Log', 'visitor-active', 'Active', 'Active Visitor Log', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(187, 'Visitor Log', 'visitor-in-active', 'In-Active', 'In-Active Visitor Log', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(188, 'Visitor Log', 'visitor-delete', 'Delete', 'Delete Visitor Log', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(189, 'Visitor Log', 'visitor-bulk-action', 'Bulk(Active,InActive,Delete)', 'Visitor Log Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(190, 'Visit Purpose', 'visitor-purpose-index', 'Index', 'Visit Purpose Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(191, 'Visit Purpose', 'visitor-purpose-add', 'Add', 'Visit Purpose Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(192, 'Visit Purpose', 'visitor-purpose-edit', 'Edit', 'Edit Visit Purpose', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(193, 'Visit Purpose', 'visitor-purpose-active', 'Active', 'Active Visit Purpose', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(194, 'Visit Purpose', 'visitor-purpose-in-active', 'In-Active', 'In-Active Visit Purpose', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(195, 'Visit Purpose', 'visitor-purpose-delete', 'Delete', 'Delete Visit Purpose', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(196, 'Visit Purpose', 'visitor-purpose-bulk-action', 'Bulk(Active,InActive,Delete)', 'Visit Purpose Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(197, 'Student Management Permission', 'student-management-index', 'Student Management', 'Student Management', 1, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(198, 'Student', 'student-index', 'Index', 'Student Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(199, 'Student', 'student-registration', 'Registration', 'Student Registration', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(200, 'Student', 'student-view', 'View', 'View Student', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(201, 'Student', 'student-edit', 'Edit', 'Edit Student', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(202, 'Student', 'student-delete', 'Delete', 'Delete Student', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(203, 'Student', 'student-active', 'Active', 'Active Student', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(204, 'Student', 'student-in-active', 'In-Active', 'In-Active Student', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(205, 'Student', 'student-bulk-action', 'Bulk(Active,InActive,Delete)', 'Student Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(206, 'Student', 'student-delete-academic-info', 'Delete Academic Info', 'Student Delete Academic Info', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(207, 'Student', 'student-transfer', 'Transfer', 'Transfer Student', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(208, 'Student Document', 'student-document-index', 'Index', 'Student Document Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(209, 'Student Document', 'student-document-add', 'Add', 'Student Document Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(210, 'Student Document', 'student-document-edit', 'Edit', 'Edit Student Document', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(211, 'Student Document', 'student-document-delete', 'Delete', 'Delete Student Document', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(212, 'Student Document', 'student-document-active', 'Active', 'Active Student Document', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(213, 'Student Document', 'student-document-in-active', 'In-Active', 'In-Active Student Document', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(214, 'Student Document', 'student-document-bulk-action', 'Bulk(Active,InActive,Delete)', 'Student Document Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(215, 'Student Note', 'student-note-index', 'Index', 'Student Note Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(216, 'Student Note', 'student-note-add', 'Add', 'Student Note Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(217, 'Student Note', 'student-note-edit', 'Edit', 'Edit Student Note', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(218, 'Student Note', 'student-note-delete', 'Delete', 'Delete Student Note', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(219, 'Student Note', 'student-note-active', 'Active', 'Active Student Note', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(220, 'Student Note', 'student-note-in-active', 'In-Active', 'In-Active Student Note', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(221, 'Student Note', 'student-note-bulk-action', 'Bulk(Active,InActive,Delete)', 'Student Note Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(222, 'Report', 'student-report', 'Student', 'Student Report', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(223, 'Guardian Management Permission', 'guardian-management-index', 'Guardian Management', 'Guardian Management', 1, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(224, 'Guardian', 'guardian-index', 'Index', 'Guardian Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(225, 'Guardian', 'guardian-registration', 'Registration', 'Guardian Registration', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(226, 'Guardian', 'guardian-view', 'View', 'View Guardian', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(227, 'Guardian', 'guardian-edit', 'Edit', 'Edit Guardian', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(228, 'Guardian', 'guardian-delete', 'Delete', 'Delete Guardian', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(229, 'Guardian', 'guardian-active', 'Active', 'Active Guardian', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(230, 'Guardian', 'guardian-in-active', 'In-Active', 'In-Active Guardian', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(231, 'Guardian', 'guardian-bulk-action', 'Bulk(Active,InActive,Delete)', 'Guardian Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(232, 'Guardian', 'guardian-link', 'Link Student', 'Guardian Link Student', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(233, 'Guardian', 'guardian-unlink', 'UnLink Student', 'Guardian UnLink Student', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(234, 'Staff Management Permission', 'staff-management-index', 'Staff Management', 'Staff Management', 1, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(235, 'Staff', 'staff-index', 'Index', 'Staff Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(236, 'Staff', 'staff-add', 'Add', 'Staff Registration', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(237, 'Staff', 'staff-view', 'View', 'View Staff', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(238, 'Staff', 'staff-edit', 'Edit', 'Edit Staff', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(239, 'Staff', 'staff-delete', 'Delete', 'Delete Staff', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(240, 'Staff', 'staff-active', 'Active', 'Active Staff', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(241, 'Staff', 'staff-in-active', 'In-Active', 'In-Active Staff', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(242, 'Staff', 'staff-bulk-action', 'Bulk(Active,InActive,Delete)', 'Staff Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(243, 'Staff Document', 'staff-document-index', 'Index', 'Staff Document Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(244, 'Staff Document', 'staff-document-add', 'Add', 'Staff Document Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(245, 'Staff Document', 'staff-document-edit', 'Edit', 'Edit Staff Document', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(246, 'Staff Document', 'staff-document-delete', 'Delete', 'Delete Staff Document', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(247, 'Staff Document', 'staff-document-active', 'Active', 'Active Staff Document', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(248, 'Staff Document', 'staff-document-in-active', 'In-Active', 'In-Active Staff Document', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(249, 'Staff Document', 'staff-document-bulk-action', 'Bulk(Active,InActive,Delete)', 'Staff Document Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(250, 'Staff Note', 'staff-note-index', 'Index', 'Staff Note Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(251, 'Staff Note', 'staff-note-add', 'Add', 'Staff Note Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(252, 'Staff Note', 'staff-note-edit', 'Edit', 'Edit Staff Note', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(253, 'Staff Note', 'staff-note-delete', 'Delete', 'Delete Staff Note', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(254, 'Staff Note', 'staff-note-active', 'Active', 'Active Staff Note', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(255, 'Staff Note', 'staff-note-in-active', 'In-Active', 'In-Active Staff Note', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(256, 'Staff Note', 'staff-note-bulk-action', 'Bulk(Active,InActive,Delete)', 'Staff Note Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(257, 'Staff Designation', 'staff-designation-index', 'Index', 'Staff Designation Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(258, 'Staff Designation', 'staff-designation-add', 'Add', 'Staff Designation Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(259, 'Staff Designation', 'staff-designation-edit', 'Edit', 'Edit Staff Designation', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(260, 'Staff Designation', 'staff-designation-delete', 'Delete', 'Delete Staff Designation', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(261, 'Staff Designation', 'staff-designation-active', 'Active', 'Active Staff Designation', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(262, 'Staff Designation', 'staff-designation-in-active', 'In-Active', 'In-Active Staff Designation', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(263, 'Staff Designation', 'staff-designation-bulk-action', 'Bulk(Active,InActive,Delete)', 'Staff Designation Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(264, 'Report', 'staff-report', 'Staff', 'Staff Report', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(265, 'Account Management Permission', 'account-management-index', 'Account Management', 'Account Management', 1, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(266, 'Fees', 'fees-index', 'Index', 'Student Fees Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(267, 'Fees', 'fees-balance', 'Balance', 'Fees Balance', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(268, 'Fees Head', 'fees-head-index', 'Index', 'Fees Head Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(269, 'Fees Head', 'fees-head-add', 'Add', 'Fees Head Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(270, 'Fees Head', 'fees-head-edit', 'Edit', 'Edit Fees Head', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(271, 'Fees Head', 'fees-head-delete', 'Delete', 'Delete Fees Head', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(272, 'Fees Head', 'fees-head-active', 'Active', 'Active Fees Head', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(273, 'Fees Head', 'fees-head-in-active', 'In-Active', 'In-Active Fees Head', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(274, 'Fees Head', 'fees-head-bulk-action', 'Bulk(Active,InActive,Delete)', 'Fees Head Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(275, 'Fees Master', 'fees-master-index', 'Index', 'Fees Master Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(276, 'Fees Master', 'fees-master-add', 'Add', 'Fees Master Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(277, 'Fees Master', 'fees-master-edit', 'Edit', 'Edit Fees Master', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(278, 'Fees Master', 'fees-master-delete', 'Delete', 'Delete Fees Master', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(279, 'Fees Master', 'fees-master-active', 'Active', 'Active Fees Master', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(280, 'Fees Master', 'fees-master-in-active', 'In-Active', 'In-Active Fees Master', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(281, 'Fees Master', 'fees-master-bulk-action', 'Bulk(Active,InActive,Delete)', 'Fees Master Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(282, 'Quick Fee Receive', 'fees-quick-receive-add', 'Collect', 'Quick Fee Receive Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(283, 'Fees Collection', 'fees-collection-index', 'Index', 'Fees Collection Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(284, 'Fees Collection', 'fees-collection-add', 'Add', 'Fees Collection Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(285, 'Fees Collection', 'fees-collection-view', 'View', 'View Fees Collection', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(286, 'Fees Collection', 'fees-collection-delete', 'Delete', 'Delete Fees Collection', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(287, 'Online Fee Payment', 'fees-online-payment-pay', 'Pay', 'Pay Online Fee', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(288, 'Online Fee Payment', 'fees-online-payment-index', 'Index', 'Index Online Fee Payment', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(289, 'Online Fee Payment', 'fees-online-payment-view', 'View', 'View Online Fee Payment', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(290, 'Online Fee Payment', 'fees-online-payment-verify', 'Verify', 'Verify Online Fee Payment', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(291, 'Payroll', 'payroll-index', 'Index', 'Staff Payroll Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(292, 'Payroll', 'payroll-balance', 'Balance', 'Payroll Balance', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(293, 'Payroll Head', 'payroll-head-index', 'Index', 'Payroll Head Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(294, 'Payroll Head', 'payroll-head-add', 'Add', 'Payroll Head Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(295, 'Payroll Head', 'payroll-head-edit', 'Edit', 'Edit Payroll Head', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(296, 'Payroll Head', 'payroll-head-delete', 'Delete', 'Delete Payroll Head', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(297, 'Payroll Head', 'payroll-head-active', 'Active', 'Active Payroll Head', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(298, 'Payroll Head', 'payroll-head-in-active', 'In-Active', 'In-Active Payroll Head', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(299, 'Payroll Head', 'payroll-head-bulk-action', 'Bulk(Active,InActive,Delete)', 'Payroll Head Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(300, 'Payroll Master', 'payroll-master-index', 'Index', 'Payroll Master Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(301, 'Payroll Master', 'payroll-master-add', 'Add', 'Payroll Master Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(302, 'Payroll Master', 'payroll-master-edit', 'Edit', 'Edit Payroll Master', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(303, 'Payroll Master', 'payroll-master-delete', 'Delete', 'Delete Payroll Master', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(304, 'Payroll Master', 'payroll-master-active', 'Active', 'Active Payroll Master', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(305, 'Payroll Master', 'payroll-master-in-active', 'In-Active', 'In-Active Payroll Master', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(306, 'Payroll Master', 'payroll-master-bulk-action', 'Bulk(Active,InActive,Delete)', 'Payroll Master Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(307, 'Salary Pay', 'salary-payment-index', 'Index', 'Salary Pay Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(308, 'Salary Pay', 'salary-payment-add', 'Add', 'Salary Pay Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(309, 'Salary Pay', 'salary-payment-view', 'View', 'View Salary Pay', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(310, 'Salary Pay', 'salary-payment-delete', 'Delete', 'Delete Salary Pay', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(311, 'Account Group', 'account-group-index', 'Index', 'Account Group Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(312, 'Account Group', 'account-group-add', 'Add', 'Account Group Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(313, 'Account Group', 'account-group-edit', 'Edit', 'Edit Account Group', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(314, 'Account Group', 'account-group-delete', 'Delete', 'Delete Account Group', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(315, 'Account Group', 'account-group-active', 'Active', 'Active Account Group', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(316, 'Account Group', 'account-group-in-active', 'In-Active', 'In-Active Account Group', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(317, 'Account Group', 'account-group-bulk-action', 'Bulk(Active,InActive,Delete)', 'Account Group Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(318, 'Account Group', 'account-group-chart-of-account', 'Chart of Account', 'Account Group Chart of Account', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(319, 'Transaction Head', 'transaction-head-index', 'Index', 'Transaction Head Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(320, 'Transaction Head', 'transaction-head-add', 'Add', 'Transaction Head Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(321, 'Transaction Head', 'transaction-head-edit', 'Edit', 'Edit Transaction Head', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(322, 'Transaction Head', 'transaction-head-delete', 'Delete', 'Delete Transaction Head', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(323, 'Transaction Head', 'transaction-head-active', 'Active', 'Active Transaction Head', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(324, 'Transaction Head', 'transaction-head-in-active', 'In-Active', 'In-Active Transaction Head', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(325, 'Transaction Head', 'transaction-head-bulk-action', 'Bulk(Active,InActive,Delete)', 'Payroll Head Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(326, 'Transaction', 'transaction-index', 'Index', 'Transaction Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(327, 'Transaction', 'transaction-add', 'Add', 'Transaction Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(328, 'Transaction', 'transaction-edit', 'Edit', 'Edit Transaction', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(329, 'Transaction', 'transaction-delete', 'Delete', 'Delete Transaction', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(330, 'Transaction', 'transaction-active', 'Active', 'Active Transaction', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(331, 'Transaction', 'transaction-in-active', 'In-Active', 'In-Active Transaction', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(332, 'Transaction', 'transaction-bulk-action', 'Bulk(Active,InActive,Delete)', 'Transaction Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(333, 'Bank', 'bank-index', 'Index', 'Bank Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(334, 'Bank', 'bank-add', 'Add', 'Bank Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(335, 'Bank', 'bank-edit', 'Edit', 'Edit Bank', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(336, 'Bank', 'bank-view', 'View', 'View Bank', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(337, 'Bank', 'bank-delete', 'Delete', 'Delete Bank', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(338, 'Bank', 'bank-active', 'Active', 'Active Bank', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(339, 'Bank', 'bank-in-active', 'In-Active', 'In-Active Bank', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(340, 'Bank', 'bank-bulk-action', 'Bulk(Active,InActive,Delete)', 'Bank Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(341, 'Bank Transaction', 'bank-transaction-index', 'Index', 'Bank Transaction Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(342, 'Bank Transaction', 'bank-transaction-add', 'Add', 'Bank Transaction Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(343, 'Bank Transaction', 'bank-transaction-delete', 'Delete', 'Delete Bank Transaction', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(344, 'Bank Transaction', 'bank-transaction-bulk-action', 'Bulk(Active,InActive,Delete)', 'Bank Transaction Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(345, 'Account Print', 'fee-print-master', 'Master Slip', 'Fee Master Slip', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(346, 'Account Print', 'fee-print-collection', 'Collection', 'Print Fee Collection', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(347, 'Account Print', 'fee-print-today-receipt', 'Today Short Receipt', 'Print Today Short Receipt', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(348, 'Account Print', 'fee-print-today-detail-receipt', 'Today Detail Receipt', 'Print Today Detail Receip', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(349, 'Account Print', 'fee-print-student-ledger', 'Student Ledger', 'Print Student Ledger', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(350, 'Account Print', 'fee-print-student-due', 'Due Short Slip', 'Print Due Short Slip', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(351, 'Account Print', 'fee-print-student-due-detail', 'Due Detail Slip', 'Print Due Detail Slip', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(352, 'Account Print', 'fee-print-bulk-due-slip', 'Bulk Due Short Slip', 'Print Bulk Due Short Slip', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(353, 'Account Print', 'fee-print-bulk-due-detail-slip', 'Bulk Due Detail SLip', 'Print Bulk Due Detail SLip', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(354, 'Account Report', 'report-cash-book', 'Cashbook', 'Cashbook Detail', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(355, 'Account Report', 'report-fee-collection', 'Fee Collection', 'Fee Collection Detail', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(356, 'Account Report', 'report-fee-collection-head', 'Fee Collection Head', 'Fee Collection Head Detail', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(357, 'Account Report', 'report.fee-online-payment', 'Online Payment', 'Fee Online Payment', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(358, 'Account Report', 'report.balance-fee', 'Fee Balance Statement', 'Fee Balance Statement', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(359, 'Account Report', 'transaction-head-view', 'Statement of Ledger', 'View Transaction Head', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(360, 'Account Report', 'transaction-head-balance-statement', 'Ledger Balance Statement', 'View Transaction Head', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(483, 'Attendance Management Permission', 'attendance-management-index', 'Attendance Management', 'Attendance Management', 1, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(484, 'Attendance Master', 'attendance-master-index', 'Index', 'Attendance Master Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(485, 'Attendance Master', 'attendance-master-add', 'Add', 'Attendance Master Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(486, 'Attendance Master', 'attendance-master-edit', 'Edit', 'Edit Attendance Master', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(487, 'Attendance Master', 'attendance-master-delete', 'Delete', 'Delete Attendance Master', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(488, 'Attendance Master', 'attendance-master-active', 'Active', 'Active Attendance Master', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(489, 'Attendance Master', 'attendance-master-in-active', 'In-Active', 'In-Active Attendance Master', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(490, 'Attendance Master', 'attendance-master-bulk-action', 'Bulk(Active,InActive,Delete)', 'Attendance Master Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(491, 'Student Regular Attendance', 'student-attendance-index', 'Index', 'Student Regular Attendance Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(492, 'Student Regular Attendance', 'student-attendance-add', 'Add', 'Student Regular Attendance Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(493, 'Student Regular Attendance', 'student-attendance-delete', 'Delete', 'Delete Student Regular Attendance', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(494, 'Student Regular Attendance', 'student-attendance-bulk-action', 'Bulk(Active,InActive,Delete)', 'Student Regular Attendance Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(495, 'Student SubjectWise Attendance', 'subject-attendance-index', 'Index', 'Student SubjectWise Attendance Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(496, 'Student SubjectWise Attendance', 'subject-attendance-add', 'Add', 'Student SubjectWise Attendance Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(497, 'Student SubjectWise Attendance', 'subject-attendance-delete', 'Delete', 'Delete Student SubjectWise Attendance', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(498, 'Student SubjectWise Attendance', 'subject-attendance-bulk-action', 'Bulk(Active,InActive,Delete)', 'Student SubjectWise Attendance Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(499, 'Student SubjectWise Attendance', 'subject-attendance-alert', 'Alert', 'Student SubjectWise Attendance Alert', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(500, 'Staff Attendance', 'staff-attendance-index', 'Index', 'Staff Attendance Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(501, 'Staff Attendance', 'staff-attendance-add', 'Add', 'Staff Attendance Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(502, 'Staff Attendance', 'staff-attendance-delete', 'Delete', 'Delete Staff Attendance', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(503, 'Staff Attendance', 'staff-attendance-bulk-action', 'Bulk(Active,InActive,Delete)', 'Staff Attendance Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(504, 'Exam Management Permission', 'exam-management-index', 'Exam Management', 'Exam Management', 1, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(505, 'Exam', 'exam-index', 'Index', 'Exam Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(506, 'Exam', 'exam-add', 'Add', 'Exam Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(507, 'Exam', 'exam-edit', 'Edit', 'Edit Exam', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(508, 'Exam', 'exam-delete', 'Delete', 'Delete Exam', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(509, 'Exam', 'exam-active', 'Active', 'Active Exam', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(510, 'Exam', 'exam-in-active', 'In-Active', 'In-Active Exam', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(511, 'Exam', 'exam-bulk-action', 'Bulk(Active,InActive,Delete)', 'Exam Bulk Action', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(512, 'Exam', 'exam-admit-card', 'Admit Card', 'Exam Admit Card', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(513, 'Exam', 'exam-exam-routine', 'Routin/Schedule', 'Exam Routine/Schedule', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(514, 'Exam', 'exam-mark-ledger', 'MarkLedger', 'Exam Mark Ledger', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(515, 'Exam', 'exam-result-publish', 'Result Publish', 'Exam Result Publish', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(516, 'Exam', 'exam-result-un-publish', 'Result UnPublish', 'Exam Result UnPublish', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(517, 'Exam Schedule', 'exam-schedule-index', 'Index', 'Exam Schedule Index', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(518, 'Exam Schedule', 'exam-schedule-add', 'Add', 'Exam Schedule Add', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(519, 'Exam Schedule', 'exam-schedule-edit', 'Edit', 'Edit Exam Schedule', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(520, 'Exam Schedule', 'exam-schedule-delete', 'Delete', 'Delete Exam Schedule', 0, '2020-05-04 17:10:03', '2020-05-04 17:10:03'),
(521, 'Exam Schedule', 'exam-schedule-active', 'Active', 'Active Exam Schedule', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(522, 'Exam Schedule', 'exam-schedule-in-active', 'In-Active', 'In-Active Exam Schedule', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(523, 'Exam Mark Ledger', 'exam-mark-ledger-index', 'Index', 'Exam Mark Ledger Index', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(524, 'Exam Mark Ledger', 'exam-mark-ledger-add', 'Add', 'Exam Mark Ledger Add', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(525, 'Exam Mark Ledger', 'exam-mark-ledger-edit', 'Edit', 'Edit Exam Mark Ledger', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(526, 'Exam Mark Ledger', 'exam-mark-ledger-delete', 'Delete', 'Delete Exam Mark Ledger', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(527, 'Exam Mark Ledger', 'exam-mark-ledger-active', 'Active', 'Active Exam Mark Ledger', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(528, 'Exam Mark Ledger', 'exam-mark-ledger-in-active', 'In-Active', 'In-Active Exam Mark Ledger', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(529, 'Exam Print', 'exam-print-admitcard', 'Admit Card', 'Exam Admit Card', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(530, 'Exam Print', 'exam-print-routine', 'Routine/Schedule', 'Exam Routine/Schedule', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(531, 'Exam Print', 'exam-print-mark-sheet', 'Mark/Grade Sheet', 'Exam Mark/Grade Sheet', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(532, 'Exam Print', 'exam-print-mark-ledger', 'Mark Ledger', 'Exam Mark Ledger Sheet', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(533, 'Certificate Management Permission', 'certificate-management-index', 'Certificate Management', 'Certificate Management', 1, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(534, 'Certificate', 'issue-certificate', 'Certificate Issue', 'Certificate Issue', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(535, 'Certificate', 'certificate-history', 'Certificate History', 'Certificate History', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(536, 'General Certificate', 'certificate-generate', 'General Certificate Generate', 'General Certificate Generate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(537, 'General Certificate', 'general-certificate-print', 'General Certificate Print', 'General Certificate Print', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(538, 'Certificate Template', 'certificate-template-index', 'Index', 'Certificate Template Index', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(539, 'Certificate Template', 'certificate-template-add', 'Add', 'Certificate Template Add', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(540, 'Certificate Template', 'certificate-template-edit', 'Edit', 'Edit Certificate Template', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(541, 'Certificate Template', 'certificate-template-view', 'View', 'View Certificate Template', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(542, 'Certificate Template', 'certificate-template-delete', 'Delete', 'Delete Certificate Template', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(543, 'Certificate Template', 'certificate-template-active', 'Active', 'Active Certificate Template', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(544, 'Certificate Template', 'certificate-template-in-active', 'In-Active', 'In-Active Certificate Template', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(545, 'Certificate Template', 'certificate-template-bulk-action', 'Bulk(Active,InActive,Delete', 'Bulk Certificate Template', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(546, 'Attendance Certificate', 'attendance-certificate-index', 'Index', 'Attendance Certificate Index', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(547, 'Attendance Certificate', 'attendance-certificate-add', 'Add', 'Attendance Certificate Add', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(548, 'Attendance Certificate', 'attendance-certificate-edit', 'Edit', 'Edit Attendance Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(549, 'Attendance Certificate', 'attendance-certificate-view', 'View', 'View Attendance Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(550, 'Attendance Certificate', 'attendance-certificate-delete', 'Delete', 'Delete Attendance Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(551, 'Attendance Certificate', 'attendance-certificate-bulk-action', 'Bulk(Active,InActive,Delete', 'Bulk Attendance Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(552, 'Attendance Certificate', 'attendance-certificate-print', 'Print', 'Print Attendance Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(553, 'Attendance Certificate', 'attendance-certificate-bulk-print', 'Bulk Print', 'Bulk Print Attendance Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(554, 'Transfer Certificate', 'transfer-certificate-index', 'Index', 'Transfer Certificate Index', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(555, 'Transfer Certificate', 'transfer-certificate-add', 'Add', 'Transfer Certificate Add', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04');
INSERT INTO `permissions` (`id`, `group`, `name`, `display_name`, `description`, `group_head`, `created_at`, `updated_at`) VALUES
(556, 'Transfer Certificate', 'transfer-certificate-edit', 'Edit', 'Edit Transfer Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(557, 'Transfer Certificate', 'transfer-certificate-view', 'View', 'View Transfer Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(558, 'Transfer Certificate', 'transfer-certificate-delete', 'Delete', 'Delete Transfer Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(559, 'Transfer Certificate', 'transfer-certificate-bulk-action', 'Bulk(Active,InActive,Delete', 'Bulk Transfer Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(560, 'Transfer Certificate', 'transfer-certificate-print', 'Print', 'Print Transfer Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(561, 'Transfer Certificate', 'transfer-certificate-bulk-print', 'Bulk Print', 'Bulk Print Transfer Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(562, 'Bonafide Certificate', 'bonafide-certificate-index', 'Index', 'Bonafide Certificate Index', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(563, 'Bonafide Certificate', 'bonafide-certificate-add', 'Add', 'Bonafide Certificate Add', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(564, 'Bonafide Certificate', 'bonafide-certificate-edit', 'Edit', 'Edit Bonafide Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(565, 'Bonafide Certificate', 'bonafide-certificate-view', 'View', 'View Bonafide Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(566, 'Bonafide Certificate', 'bonafide-certificate-delete', 'Delete', 'Delete Bonafide Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(567, 'Bonafide Certificate', 'bonafide-certificate-bulk-action', 'Bulk(Active,InActive,Delete', 'Bulk Bonafide Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(568, 'Bonafide Certificate', 'bonafide-certificate-print', 'Print', 'Print Bonafide Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(569, 'Bonafide Certificate', 'bonafide-certificate-bulk-print', 'Bulk Print', 'Bulk Print Bonafide Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(570, 'Course Completion Certificate', 'course-completion-certificate-index', 'Index', 'Course Completion Certificate Index', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(571, 'Course Completion Certificate', 'course-completion-certificate-add', 'Add', 'Course Completion Certificate Add', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(572, 'Course Completion Certificate', 'course-completion-certificate-edit', 'Edit', 'Edit Course Completion Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(573, 'Course Completion Certificate', 'course-completion-certificate-view', 'View', 'View Course Completion Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(574, 'Course Completion Certificate', 'course-completion-certificate-delete', 'Delete', 'Delete Course Completion Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(575, 'Course Completion Certificate', 'course-completion-certificate-bulk-action', 'Bulk(Active,InActive,Delete', 'Bulk Course Completion Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(576, 'Course Completion Certificate', 'course-completion-certificate-print', 'Print', 'Print Course Completion Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(577, 'Course Completion Certificate', 'course-completion-certificate-bulk-print', 'Bulk Print', 'Bulk Print Course Completion Certificate', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(652, 'Vehicle', 'vehicle-index', 'Index', 'Vehicle Index', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(653, 'Vehicle', 'vehicle-add', 'Add', 'Vehicle Add', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(654, 'Vehicle', 'vehicle-edit', 'Edit', 'Edit Vehicle', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(655, 'Vehicle', 'vehicle-delete', 'Delete', 'Delete Vehicle', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(656, 'Vehicle', 'vehicle-active', 'Active', 'Active Vehicle', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(657, 'Vehicle', 'vehicle-in-active', 'In-Active', 'In-Active Vehicle', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(658, 'Vehicle', 'vehicle-bulk-action', 'Bulk(Active,InActive,Delete)', 'Vehicle Bulk Action', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(668, 'Notice & Alert Management Permission', 'notice-group-index', 'Notice & Alert Permission', 'Notice & Alert Permission', 1, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(669, 'Notice', 'notice-index', 'Index', 'Notice Index', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(670, 'Notice', 'notice-add', 'Add', 'Notice Add', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(671, 'Notice', 'notice-edit', 'Edit', 'Edit Notice', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(672, 'Notice', 'notice-delete', 'Delete', 'Delete Notice', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(673, 'SMS/E-Mail', 'sms-email-index', 'Index', 'SMS/E-Mail Index', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(674, 'SMS/E-Mail', 'sms-email-delete', 'Delete', 'SMS/E-Mail Delete', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(675, 'SMS/E-Mail', 'sms-email-bulk-action', 'Bulk(Active,InActive,Delete)', 'Bulk SMS/E-Mail', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(676, 'SMS/E-Mail', 'sms-email-create', 'Create', 'Create SMS/E-Mail', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(677, 'SMS/E-Mail', 'sms-email-send', 'Send', 'Send SMS/E-Mail', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(678, 'SMS/E-Mail', 'sms-email-student-guardian-send', 'Student & Guardian', 'Student & Guardian SMS/E-Mail', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(679, 'SMS/E-Mail', 'sms-email-staff-send', 'Staff', 'Staff SMS/E-Mail', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(680, 'SMS/E-Mail', 'sms-email-individual-send', 'Individual', 'Individual SMS/E-Mail', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(681, 'SMS/E-Mail', 'sms-email-fee-receipt', 'Fee Receipt', 'Fee ReceiptSMS/E-Mail', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(682, 'SMS/E-Mail', 'sms-email-due-reminder', 'Due Reminder', 'Due Reminder SMS/E-Mail', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(683, 'SMS/E-Mail', 'sms-email-book-return-reminder', 'Book Return Reminder', 'Book Return Reminder', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(684, 'More(Assignment & Download) Management Permission', 'more-index', 'More(Assignment & Download) Permission', 'More(Assignment & Download) Permission', 1, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(698, 'Download', 'download-index', 'Index', 'Download Index', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(699, 'Download', 'download-add', 'Add', 'Download Add', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(700, 'Download', 'download-edit', 'Edit', 'Edit Download', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(701, 'Download', 'download-delete', 'Delete', 'Delete Download', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(702, 'Download', 'download-active', 'Active', 'Active Download', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(703, 'Download', 'download-in-active', 'In-Active', 'In-Active Download', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04'),
(704, 'Download', 'download-bulk-action', 'Bulk(Active,InActive,Delete)', 'Download Bulk Action', 0, '2020-05-04 17:10:04', '2020-05-04 17:10:04');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(2, 6),
(3, 1),
(3, 6),
(4, 1),
(4, 6),
(5, 1),
(5, 6),
(6, 1),
(6, 6),
(7, 1),
(7, 6),
(10, 1),
(10, 6),
(11, 1),
(11, 6),
(12, 1),
(12, 6),
(16, 1),
(16, 6),
(18, 1),
(18, 6),
(19, 1),
(19, 6),
(20, 1),
(20, 6),
(20, 8),
(21, 1),
(21, 6),
(22, 1),
(22, 6),
(23, 1),
(23, 6),
(24, 1),
(24, 6),
(25, 1),
(25, 6),
(27, 1),
(27, 6),
(28, 1),
(28, 6),
(28, 8),
(31, 1),
(31, 6),
(32, 1),
(32, 6),
(33, 1),
(33, 6),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(43, 1),
(46, 1),
(47, 1),
(48, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(113, 8),
(114, 1),
(114, 8),
(115, 1),
(115, 8),
(116, 1),
(116, 8),
(117, 1),
(117, 8),
(118, 1),
(118, 8),
(119, 1),
(119, 8),
(120, 1),
(120, 8),
(121, 1),
(121, 8),
(122, 1),
(122, 8),
(123, 1),
(123, 8),
(124, 1),
(124, 8),
(125, 1),
(125, 8),
(126, 1),
(126, 8),
(127, 1),
(127, 8),
(128, 1),
(128, 8),
(129, 1),
(129, 8),
(130, 1),
(130, 8),
(131, 1),
(131, 8),
(132, 1),
(132, 8),
(133, 1),
(133, 8),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
(191, 1),
(192, 1),
(193, 1),
(194, 1),
(195, 1),
(196, 1),
(197, 1),
(198, 1),
(198, 6),
(199, 1),
(199, 6),
(200, 1),
(200, 6),
(201, 1),
(201, 6),
(202, 1),
(202, 6),
(203, 1),
(203, 6),
(204, 1),
(204, 6),
(205, 1),
(205, 6),
(206, 1),
(206, 6),
(207, 1),
(207, 6),
(208, 1),
(208, 6),
(209, 1),
(209, 6),
(210, 1),
(210, 6),
(211, 1),
(211, 6),
(212, 1),
(212, 6),
(213, 1),
(213, 6),
(214, 1),
(214, 6),
(215, 1),
(216, 1),
(217, 1),
(218, 1),
(219, 1),
(220, 1),
(221, 1),
(222, 1),
(223, 1),
(224, 1),
(225, 1),
(226, 1),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1),
(235, 1),
(236, 1),
(237, 1),
(238, 1),
(239, 1),
(240, 1),
(241, 1),
(242, 1),
(243, 1),
(244, 1),
(245, 1),
(246, 1),
(247, 1),
(248, 1),
(249, 1),
(250, 1),
(251, 1),
(252, 1),
(253, 1),
(254, 1),
(255, 1),
(256, 1),
(257, 1),
(258, 1),
(259, 1),
(260, 1),
(261, 1),
(262, 1),
(263, 1),
(264, 1),
(265, 1),
(266, 1),
(267, 1),
(268, 1),
(269, 1),
(270, 1),
(271, 1),
(272, 1),
(273, 1),
(274, 1),
(275, 1),
(276, 1),
(277, 1),
(278, 1),
(279, 1),
(280, 1),
(281, 1),
(282, 1),
(283, 1),
(284, 1),
(285, 1),
(286, 1),
(287, 1),
(288, 1),
(289, 1),
(290, 1),
(291, 1),
(292, 1),
(293, 1),
(294, 1),
(295, 1),
(296, 1),
(297, 1),
(298, 1),
(299, 1),
(300, 1),
(301, 1),
(302, 1),
(303, 1),
(304, 1),
(305, 1),
(306, 1),
(307, 1),
(308, 1),
(309, 1),
(310, 1),
(311, 1),
(312, 1),
(313, 1),
(314, 1),
(315, 1),
(316, 1),
(317, 1),
(318, 1),
(319, 1),
(320, 1),
(321, 1),
(322, 1),
(323, 1),
(324, 1),
(325, 1),
(326, 1),
(327, 1),
(328, 1),
(329, 1),
(330, 1),
(331, 1),
(332, 1),
(333, 1),
(334, 1),
(335, 1),
(336, 1),
(337, 1),
(338, 1),
(339, 1),
(340, 1),
(341, 1),
(342, 1),
(343, 1),
(344, 1),
(345, 1),
(346, 1),
(347, 1),
(348, 1),
(349, 1),
(350, 1),
(351, 1),
(352, 1),
(353, 1),
(354, 1),
(355, 1),
(356, 1),
(357, 1),
(358, 1),
(359, 1),
(360, 1),
(483, 1),
(484, 1),
(485, 1),
(486, 1),
(487, 1),
(488, 1),
(489, 1),
(490, 1),
(491, 1),
(492, 1),
(493, 1),
(494, 1),
(495, 1),
(496, 1),
(497, 1),
(498, 1),
(499, 1),
(500, 1),
(501, 1),
(502, 1),
(503, 1),
(504, 1),
(505, 1),
(506, 1),
(507, 1),
(508, 1),
(509, 1),
(510, 1),
(511, 1),
(512, 1),
(513, 1),
(514, 1),
(515, 1),
(516, 1),
(517, 1),
(518, 1),
(519, 1),
(520, 1),
(521, 1),
(522, 1),
(523, 1),
(524, 1),
(525, 1),
(526, 1),
(527, 1),
(528, 1),
(529, 1),
(530, 1),
(531, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `code` varchar(15) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT 0,
  `sub_category_id` int(10) UNSIGNED DEFAULT 0,
  `warranty` varchar(15) DEFAULT NULL,
  `product_image` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_prices`
--

DROP TABLE IF EXISTS `product_prices`;
CREATE TABLE `product_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `products_id` int(10) UNSIGNED NOT NULL,
  `cost_price` double(10,2) DEFAULT 0.00,
  `sale_price` double(10,2) DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `invoice_no` varchar(15) NOT NULL,
  `vendors_id` int(10) UNSIGNED NOT NULL,
  `purchase_date` datetime NOT NULL,
  `grand_total_amount` int(11) NOT NULL,
  `total_discount` int(11) NOT NULL,
  `purchase_details` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

DROP TABLE IF EXISTS `purchase_details`;
CREATE TABLE `purchase_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `purchase_id` int(10) UNSIGNED NOT NULL,
  `products_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

DROP TABLE IF EXISTS `purchase_returns`;
CREATE TABLE `purchase_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `purchase_date` datetime NOT NULL,
  `invoice_no` varchar(15) NOT NULL,
  `purchase_id` int(10) UNSIGNED NOT NULL,
  `vendors_id` int(10) UNSIGNED NOT NULL,
  `purchase_detail_id` int(10) UNSIGNED NOT NULL,
  `products_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `display_name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'Super Admin', 'Super Admin', '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(2, 'admin', 'Administrator', 'Administrator', '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(3, 'account', 'Accountant', 'Accountant', '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(5, 'staff', 'Staff', 'Staff', '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(6, 'student', 'Student', 'Student', '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(7, 'guardian', 'Guardian', 'Guardian', '2020-05-04 17:10:02', '2020-05-04 17:10:02'),
(8, 'teacher', 'Teacher', 'Teacher', '2020-05-04 17:10:02', '2020-05-04 17:10:02');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `salary_pays`
--

DROP TABLE IF EXISTS `salary_pays`;
CREATE TABLE `salary_pays` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL,
  `salary_masters_id` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `allowance` int(11) DEFAULT NULL,
  `fine` int(11) DEFAULT NULL,
  `payment_mode` varchar(15) NOT NULL,
  `note` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_details`
--

DROP TABLE IF EXISTS `sales_details`;
CREATE TABLE `sales_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_returns`
--

DROP TABLE IF EXISTS `sales_returns`;
CREATE TABLE `sales_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

DROP TABLE IF EXISTS `semesters`;
CREATE TABLE `semesters` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `semester` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `staff_id` int(10) UNSIGNED DEFAULT NULL,
  `gradingType_id` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `semester_assets`
--

DROP TABLE IF EXISTS `semester_assets`;
CREATE TABLE `semester_assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `semesters_id` int(10) UNSIGNED NOT NULL,
  `assets_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `semester_subject`
--

DROP TABLE IF EXISTS `semester_subject`;
CREATE TABLE `semester_subject` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `semester_id` int(10) UNSIGNED NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_emails`
--

DROP TABLE IF EXISTS `sms_emails`;
CREATE TABLE `sms_emails` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` text NOT NULL,
  `sms` tinyint(1) NOT NULL DEFAULT 0,
  `email` tinyint(1) NOT NULL DEFAULT 0,
  `group` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_settings`
--

DROP TABLE IF EXISTS `sms_settings`;
CREATE TABLE `sms_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `identity` varchar(15) NOT NULL,
  `logo` varchar(15) NOT NULL,
  `link` varchar(100) NOT NULL,
  `config` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_settings`
--

INSERT INTO `sms_settings` (`id`, `created_at`, `updated_at`, `identity`, `logo`, `link`, `config`, `status`) VALUES
(1, NULL, NULL, 'Msg91', 'msg91', 'https://msg91.com', '{\"Authkey\":\"\",\"Sender\":\"\",\"Route\":\"\",\"Country\":\"\"}', 0),
(2, NULL, NULL, 'Msg94', 'msg94', 'http://www.msg94.com', '{\"Authkey\":\"\",\"Sender\":\"\",\"Route\":\"\",\"Country\":\"\"}', 0),
(3, NULL, NULL, 'KeswaTech', 'keswasms', 'http://ktsms.keswatech.com', '{\"Sender\":\"\",\"apiKey\":\"\"}', 0),
(4, NULL, NULL, 'Twilio', 'twilio', 'https://www.twilio.com', '{\"SID\":\"\",\"Token\":\"\",\"FromNumber\":\"\"}', 0),
(5, NULL, NULL, 'MessageBird', 'messagebird', 'https://www.messagebird.com', '{\"Originator\":\"\",\"AcccessKey\":\"\"}', 0),
(6, NULL, NULL, 'Clickatell', 'clickatell', 'http://clickatell.com', '{\"API_ID\":\"\",\"User\":\"\",\"Password\":\"\",\"Unicode\":\"0\"}', 0),
(7, NULL, NULL, 'BudgetSmsNet', 'budgetsms', 'https://www.budgetsms.net', '{\"Username\":\"\",\"UserID\":\"\",\"Handle\":\"\",\"From\":\"\"}', 0),
(8, NULL, NULL, 'Nexmo', 'nexmo', 'https://www.nexmo.com', '{\"From\":\"\",\"API_KEY\":\"\",\"API_SECRET\":\"\"}', 0),
(9, NULL, NULL, 'smsCountry', 'smscountry', 'https://www.smscountry.com', '{\"UserName\":\"\",\"Password\":\"\",\"SenderId\":\"\",\"Token\":\"\"}', 0),
(10, NULL, NULL, 'MsgClub', 'msgclub', 'http://msg.msgclub.net', '{\"AUTH_KEY\":\"\",\"senderId\":\"\",\"routeId\":\"\"}', 0),
(11, NULL, NULL, 'Digimiles', 'digimiles', 'http://www.digimiles.in', '{\"UserName\":\"\",\"Password\":\"\",\"Type\":0,\"Sender_ID\":\"\"}', 0),
(12, NULL, NULL, 'Textlocal', 'textlocal', 'https://www.textlocal.in', '{\"apiKey\":\"\",\"sender\":\"\"}', 0),
(13, NULL, NULL, 'SmartSMS', 'smartsms', 'https://smartsmssolutions.com/', '{\"ACCESS_TOKEN\":\"\",\"Sender\":\"\",\"Routing\":\"2\",\"Type\":\"0\"}', 0),
(14, NULL, NULL, 'Sparrow', 'sparrow', 'http://sparrowsms.com', '{\"From\":\"\",\"Token\":\"\"}', 0),
(15, NULL, NULL, 'InitiativeNepal', 'aayosms', 'https://www.ininepal.com', '{\"Sender\":\"\",\"UserName\":\"\",\"Password\":\"\"}', 0),
(16, NULL, NULL, 'SendPK', 'sendpk', 'https://sendpk.com/api.php', '{\"UserName\":\"\",\"Password\":\"\",\"Sender\":\"\",\"Type\":\"\"}', 0),
(17, NULL, NULL, 'LifetimeSMS', 'lifetimesms', 'http://lifetimesms.com', '{\"ApiToken\":\"\",\"ApiSecret\":\"\",\"From\":\"\"}', 0),
(18, NULL, NULL, 'SmsCluster', 'smscluster', 'http://www.smscluster.com', '{\"AUTH_KEY\":\"\",\"senderId\":\"\",\"routeId\":\"\",\"smsContentType\":\"English\"}', 0),
(19, NULL, NULL, 'marketsmsPK', 'marketsms', 'http://www.marketsms.pk', '{\"UserName\":\"\",\"Password\":\"\",\"From\":\"\"}', 0),
(20, NULL, NULL, 'springEdge', 'springedge', 'http://springedge.com', '{\"API_KEY\":\"\",\"SenderID\":\"\"}', 0),
(21, NULL, NULL, 'africastalking', 'africastalking', 'https://africastalking.com', '{\"API_KEY\":\"\",\"UserName\":\"\"}', 0),
(22, NULL, NULL, 'TheSMSCentral', 'thesmscentral', 'https://thesmscentral.com', '{\"ApiToken\":\"\",\"Sender\":\"\"}', 0),
(23, NULL, NULL, 'AakashNepal', 'aakashsms', 'https://aakashsms.com', '{\"AuthToken\":\"\"}', 0),
(24, NULL, NULL, 'FullTimeBulk', 'fulltimesms', 'http://www.sms.fulltimesms.com', '{\"ApiToken\":\"\",\"ApiSecret\":\"\",\"From\":\"\"}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `reg_no` varchar(15) NOT NULL,
  `join_date` datetime NOT NULL,
  `designation` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `middle_name` varchar(15) DEFAULT NULL,
  `last_name` varchar(15) NOT NULL,
  `father_name` varchar(50) DEFAULT NULL,
  `mother_name` varchar(50) DEFAULT NULL,
  `date_of_birth` datetime NOT NULL,
  `gender` varchar(10) NOT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `temp_address` varchar(100) DEFAULT NULL,
  `temp_state` varchar(25) DEFAULT NULL,
  `temp_country` varchar(25) DEFAULT NULL,
  `home_phone` varchar(15) DEFAULT NULL,
  `mobile_1` varchar(15) DEFAULT NULL,
  `mobile_2` varchar(15) DEFAULT NULL,
  `mother_tongue` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `experience` varchar(100) DEFAULT NULL,
  `experience_info` varchar(100) DEFAULT NULL,
  `other_info` varchar(100) DEFAULT NULL,
  `staff_image` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_designations`
--

DROP TABLE IF EXISTS `staff_designations`;
CREATE TABLE `staff_designations` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
CREATE TABLE `stocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `products_id` int(10) UNSIGNED NOT NULL,
  `transaction_type` varchar(25) DEFAULT NULL,
  `date` datetime NOT NULL,
  `qty_in` int(11) DEFAULT 0,
  `qty_out` int(11) DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `reg_no` varchar(25) NOT NULL,
  `reg_date` datetime NOT NULL,
  `serial_no` varchar(100) DEFAULT NULL,
  `faculty` int(10) UNSIGNED DEFAULT NULL,
  `semester` int(10) UNSIGNED DEFAULT NULL,
  `academic_status` int(10) UNSIGNED DEFAULT NULL,
  `batch` int(10) UNSIGNED DEFAULT NULL,
  `first_name` varchar(25) NOT NULL,
  `middle_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) NOT NULL,
  `first_name_dev` varchar(20) DEFAULT NULL,
  `middle_name_dev` varchar(20) DEFAULT NULL,
  `last_name_dev` varchar(20) DEFAULT NULL,
  `date_of_birth` datetime NOT NULL,
  `adhar_no` varchar(25) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `religion` varchar(25) DEFAULT NULL,
  `caste` varchar(25) DEFAULT NULL,
  `nationality` varchar(25) DEFAULT NULL,
  `mother_tongue` varchar(25) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `extra_info` varchar(100) DEFAULT NULL,
  `student_image` text DEFAULT NULL,
  `student_signature` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_batches`
--

DROP TABLE IF EXISTS `student_batches`;
CREATE TABLE `student_batches` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_guardians`
--

DROP TABLE IF EXISTS `student_guardians`;
CREATE TABLE `student_guardians` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `students_id` int(10) UNSIGNED NOT NULL,
  `guardians_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_statuses`
--

DROP TABLE IF EXISTS `student_statuses`;
CREATE TABLE `student_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_statuses`
--

INSERT INTO `student_statuses` (`id`, `created_at`, `updated_at`, `created_by`, `last_updated_by`, `title`, `status`) VALUES
(1, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, 1, 'New Admission', 1),
(2, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, 1, 'Continue', 1),
(3, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, 1, 'Pass Out', 1),
(4, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, 1, 'Back Continue', 1),
(5, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, 1, 'Drop Out', 1),
(6, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, 1, 'Transfer in', 1),
(7, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, 1, 'Transfer Out', 1),
(8, '2020-05-04 17:10:05', '2020-05-04 17:10:05', 1, 1, 'Online Registration', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `code` varchar(15) NOT NULL,
  `full_mark_theory` int(11) DEFAULT NULL,
  `pass_mark_theory` int(11) DEFAULT NULL,
  `full_mark_practical` int(11) DEFAULT NULL,
  `pass_mark_practical` int(11) DEFAULT NULL,
  `credit_hour` int(11) DEFAULT NULL,
  `sub_type` varchar(15) DEFAULT NULL,
  `class_type` varchar(15) DEFAULT NULL,
  `staff_id` int(10) UNSIGNED DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
CREATE TABLE `sub_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_zones`
--

DROP TABLE IF EXISTS `time_zones`;
CREATE TABLE `time_zones` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `timezone` varchar(35) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_zones`
--

INSERT INTO `time_zones` (`id`, `created_at`, `updated_at`, `timezone`, `status`) VALUES
(1, NULL, '2025-01-28 19:02:48', 'Africa/Abidjan', 0),
(2, NULL, '2025-01-28 19:02:48', 'Africa/Accra', 0),
(3, NULL, '2025-01-28 19:02:48', 'Africa/Addis_Ababa', 0),
(4, NULL, '2025-01-28 19:02:48', 'Africa/Algiers', 0),
(5, NULL, '2025-01-28 19:02:48', 'Africa/Asmara', 0),
(6, NULL, '2025-01-28 19:02:48', 'Africa/Asmera', 0),
(7, NULL, '2025-01-28 19:02:48', 'Africa/Bamako', 0),
(8, NULL, '2025-01-28 19:02:48', 'Africa/Bangui', 0),
(9, NULL, '2025-01-28 19:02:48', 'Africa/Banjul', 0),
(10, NULL, '2025-01-28 19:02:48', 'Africa/Bissau', 0),
(11, NULL, '2025-01-28 19:02:48', 'Africa/Blantyre', 0),
(12, NULL, '2025-01-28 19:02:48', 'Africa/Brazzaville', 0),
(13, NULL, '2025-01-28 19:02:48', 'Africa/Bujumbura', 0),
(14, NULL, '2025-01-28 19:02:48', 'Africa/Cairo', 0),
(15, NULL, '2025-01-28 19:02:48', 'Africa/Casablanca', 0),
(16, NULL, '2025-01-28 19:02:48', 'Africa/Ceuta', 0),
(17, NULL, '2025-01-28 19:02:48', 'Africa/Conakry', 0),
(18, NULL, '2025-01-28 19:02:48', 'Africa/Dakar', 0),
(19, NULL, '2025-01-28 19:02:48', 'Africa/Dar_es_Salaam', 0),
(20, NULL, '2025-01-28 19:02:48', 'Africa/Djibouti', 0),
(21, NULL, '2025-01-28 19:02:48', 'Africa/Douala', 0),
(22, NULL, '2025-01-28 19:02:48', 'Africa/El_Aaiun', 0),
(23, NULL, '2025-01-28 19:02:48', 'Africa/Freetown', 0),
(24, NULL, '2025-01-28 19:02:48', 'Africa/Gaborone', 0),
(25, NULL, '2025-01-28 19:02:48', 'Africa/Harare', 0),
(26, NULL, '2025-01-28 19:02:48', 'Africa/Johannesburg', 0),
(27, NULL, '2025-01-28 19:02:48', 'Africa/Juba', 0),
(28, NULL, '2025-01-28 19:02:48', 'Africa/Kampala', 0),
(29, NULL, '2025-01-28 19:02:48', 'Africa/Khartoum', 0),
(30, NULL, '2025-01-28 19:02:48', 'Africa/Kigali', 0),
(31, NULL, '2025-01-28 19:02:48', 'Africa/Kinshasa', 0),
(32, NULL, '2025-01-28 19:02:48', 'Africa/Lagos', 0),
(33, NULL, '2025-01-28 19:02:48', 'Africa/Libreville', 0),
(34, NULL, '2025-01-28 19:02:48', 'Africa/Lome', 0),
(35, NULL, '2025-01-28 19:02:48', 'Africa/Luanda', 0),
(36, NULL, '2025-01-28 19:02:48', 'Africa/Lubumbashi', 0),
(37, NULL, '2025-01-28 19:02:48', 'Africa/Lusaka', 0),
(38, NULL, '2025-01-28 19:02:48', 'Africa/Malabo', 0),
(39, NULL, '2025-01-28 19:02:48', 'Africa/Maputo', 0),
(40, NULL, '2025-01-28 19:02:48', 'Africa/Maseru', 0),
(41, NULL, '2025-01-28 19:02:48', 'Africa/Mbabane', 0),
(42, NULL, '2025-01-28 19:02:48', 'Africa/Mogadishu', 0),
(43, NULL, '2025-01-28 19:02:48', 'Africa/Monrovia', 0),
(44, NULL, '2025-01-28 19:02:48', 'Africa/Nairobi', 0),
(45, NULL, '2025-01-28 19:02:48', 'Africa/Ndjamena', 0),
(46, NULL, '2025-01-28 19:02:48', 'Africa/Niamey', 0),
(47, NULL, '2025-01-28 19:02:48', 'Africa/Nouakchott', 0),
(48, NULL, '2025-01-28 19:02:48', 'Africa/Ouagadougou', 0),
(49, NULL, '2025-01-28 19:02:48', 'Africa/Porto-Novo', 0),
(50, NULL, '2025-01-28 19:02:48', 'Africa/Sao_Tome', 0),
(51, NULL, '2025-01-28 19:02:48', 'Africa/Timbuktu', 0),
(52, NULL, '2025-01-28 19:02:48', 'Africa/Tripoli', 0),
(53, NULL, '2025-01-28 19:02:48', 'Africa/Tunis', 0),
(54, NULL, '2025-01-28 19:02:48', 'Africa/Windhoek', 0),
(55, NULL, '2025-01-28 19:02:48', 'America/Adak', 0),
(56, NULL, '2025-01-28 19:02:48', 'America/Anchorage', 0),
(57, NULL, '2025-01-28 19:02:48', 'America/Anguilla', 0),
(58, NULL, '2025-01-28 19:02:48', 'America/Antigua', 0),
(59, NULL, '2025-01-28 19:02:48', 'America/Araguaina', 0),
(60, NULL, '2025-01-28 19:02:48', 'America/Argentina/Buenos_Aires', 0),
(61, NULL, '2025-01-28 19:02:48', 'America/Argentina/Catamarca', 0),
(62, NULL, '2025-01-28 19:02:48', 'America/Argentina/ComodRivadavia', 0),
(63, NULL, '2025-01-28 19:02:48', 'America/Argentina/Cordoba', 0),
(64, NULL, '2025-01-28 19:02:48', 'America/Argentina/Jujuy', 0),
(65, NULL, '2025-01-28 19:02:48', 'America/Argentina/La_Rioja', 0),
(66, NULL, '2025-01-28 19:02:48', 'America/Argentina/Mendoza', 0),
(67, NULL, '2025-01-28 19:02:48', 'America/Argentina/Rio_Gallegos', 0),
(68, NULL, '2025-01-28 19:02:48', 'America/Argentina/Salta', 0),
(69, NULL, '2025-01-28 19:02:48', 'America/Argentina/San_Juan', 0),
(70, NULL, '2025-01-28 19:02:48', 'America/Argentina/San_Luis', 0),
(71, NULL, '2025-01-28 19:02:48', 'America/Argentina/Tucuman', 0),
(72, NULL, '2025-01-28 19:02:48', 'America/Argentina/Ushuaia', 0),
(73, NULL, '2025-01-28 19:02:48', 'America/Aruba', 0),
(74, NULL, '2025-01-28 19:02:48', 'America/Asuncion', 0),
(75, NULL, '2025-01-28 19:02:48', 'America/Atikokan', 0),
(76, NULL, '2025-01-28 19:02:48', 'America/Atka', 0),
(77, NULL, '2025-01-28 19:02:48', 'America/Bahia', 0),
(78, NULL, '2025-01-28 19:02:48', 'America/Bahia_Banderas', 0),
(79, NULL, '2025-01-28 19:02:48', 'America/Barbados', 0),
(80, NULL, '2025-01-28 19:02:48', 'America/Belem', 0),
(81, NULL, '2025-01-28 19:02:48', 'America/Belize', 0),
(82, NULL, '2025-01-28 19:02:48', 'America/Blanc-Sablon', 0),
(83, NULL, '2025-01-28 19:02:48', 'America/Boa_Vista', 0),
(84, NULL, '2025-01-28 19:02:48', 'America/Bogota', 0),
(85, NULL, '2025-01-28 19:02:48', 'America/Boise', 0),
(86, NULL, '2025-01-28 19:02:48', 'America/Buenos_Aires', 0),
(87, NULL, '2025-01-28 19:02:48', 'America/Cambridge_Bay', 0),
(88, NULL, '2025-01-28 19:02:48', 'America/Campo_Grande', 0),
(89, NULL, '2025-01-28 19:02:48', 'America/Cancun', 0),
(90, NULL, '2025-01-28 19:02:48', 'America/Caracas', 0),
(91, NULL, '2025-01-28 19:02:48', 'America/Catamarca', 0),
(92, NULL, '2025-01-28 19:02:48', 'America/Cayenne', 0),
(93, NULL, '2025-01-28 19:02:48', 'America/Cayman', 0),
(94, NULL, '2025-01-28 19:02:48', 'America/Chicago', 0),
(95, NULL, '2025-01-28 19:02:48', 'America/Chihuahua', 0),
(96, NULL, '2025-01-28 19:02:48', 'America/Coral_Harbour', 0),
(97, NULL, '2025-01-28 19:02:48', 'America/Cordoba', 0),
(98, NULL, '2025-01-28 19:02:48', 'America/Costa_Rica', 0),
(99, NULL, '2025-01-28 19:02:48', 'America/Creston', 0),
(100, NULL, '2025-01-28 19:02:48', 'America/Cuiaba', 0),
(101, NULL, '2025-01-28 19:02:48', 'America/Curacao', 0),
(102, NULL, '2025-01-28 19:02:48', 'America/Danmarkshavn', 0),
(103, NULL, '2025-01-28 19:02:48', 'America/Dawson', 0),
(104, NULL, '2025-01-28 19:02:48', 'America/Dawson_Creek', 0),
(105, NULL, '2025-01-28 19:02:48', 'America/Denver', 0),
(106, NULL, '2025-01-28 19:02:48', 'America/Detroit', 0),
(107, NULL, '2025-01-28 19:02:48', 'America/Dominica', 0),
(108, NULL, '2025-01-28 19:02:48', 'America/Edmonton', 0),
(109, NULL, '2025-01-28 19:02:48', 'America/Eirunepe', 0),
(110, NULL, '2025-01-28 19:02:48', 'America/El_Salvador', 0),
(111, NULL, '2025-01-28 19:02:48', 'America/Ensenada', 0),
(112, NULL, '2025-01-28 19:02:48', 'America/Fort_Wayne', 0),
(113, NULL, '2025-01-28 19:02:48', 'America/Fortaleza', 0),
(114, NULL, '2025-01-28 19:02:48', 'America/Glace_Bay', 0),
(115, NULL, '2025-01-28 19:02:48', 'America/Godthab', 0),
(116, NULL, '2025-01-28 19:02:48', 'America/Goose_Bay', 0),
(117, NULL, '2025-01-28 19:02:48', 'America/Grand_Turk', 0),
(118, NULL, '2025-01-28 19:02:48', 'America/Grenada', 0),
(119, NULL, '2025-01-28 19:02:48', 'America/Guadeloupe', 0),
(120, NULL, '2025-01-28 19:02:48', 'America/Guatemala', 0),
(121, NULL, '2025-01-28 19:02:48', 'America/Guayaquil', 0),
(122, NULL, '2025-01-28 19:02:48', 'America/Guyana', 0),
(123, NULL, '2025-01-28 19:02:48', 'America/Halifax', 0),
(124, NULL, '2025-01-28 19:02:48', 'America/Havana', 0),
(125, NULL, '2025-01-28 19:02:48', 'America/Hermosillo', 0),
(126, NULL, '2025-01-28 19:02:48', 'America/Indiana/Indianapolis', 0),
(127, NULL, '2025-01-28 19:02:48', 'America/Indiana/Knox', 0),
(128, NULL, '2025-01-28 19:02:48', 'America/Indiana/Marengo', 0),
(129, NULL, '2025-01-28 19:02:48', 'America/Indiana/Petersburg', 0),
(130, NULL, '2025-01-28 19:02:48', 'America/Indiana/Tell_City', 0),
(131, NULL, '2025-01-28 19:02:48', 'America/Indiana/Vevay', 0),
(132, NULL, '2025-01-28 19:02:48', 'America/Indiana/Vincennes', 0),
(133, NULL, '2025-01-28 19:02:48', 'America/Indiana/Winamac', 0),
(134, NULL, '2025-01-28 19:02:48', 'America/Indianapolis', 0),
(135, NULL, '2025-01-28 19:02:48', 'America/Inuvik', 0),
(136, NULL, '2025-01-28 19:02:48', 'America/Iqaluit', 0),
(137, NULL, '2025-01-28 19:02:48', 'America/Jamaica', 0),
(138, NULL, '2025-01-28 19:02:48', 'America/Jujuy', 0),
(139, NULL, '2025-01-28 19:02:48', 'America/Juneau', 0),
(140, NULL, '2025-01-28 19:02:48', 'America/Kentucky/Louisville', 0),
(141, NULL, '2025-01-28 19:02:48', 'America/Kentucky/Monticello', 0),
(142, NULL, '2025-01-28 19:02:48', 'America/Knox_IN', 0),
(143, NULL, '2025-01-28 19:02:48', 'America/Kralendijk', 0),
(144, NULL, '2025-01-28 19:02:48', 'America/La_Paz', 0),
(145, NULL, '2025-01-28 19:02:48', 'America/Lima', 0),
(146, NULL, '2025-01-28 19:02:48', 'America/Los_Angeles', 0),
(147, NULL, '2025-01-28 19:02:48', 'America/Louisville', 0),
(148, NULL, '2025-01-28 19:02:48', 'America/Lower_Princes', 0),
(149, NULL, '2025-01-28 19:02:48', 'America/Maceio', 0),
(150, NULL, '2025-01-28 19:02:48', 'America/Managua', 0),
(151, NULL, '2025-01-28 19:02:48', 'America/Manaus', 0),
(152, NULL, '2025-01-28 19:02:48', 'America/Marigot', 0),
(153, NULL, '2025-01-28 19:02:48', 'America/Martinique', 0),
(154, NULL, '2025-01-28 19:02:48', 'America/Matamoros', 0),
(155, NULL, '2025-01-28 19:02:48', 'America/Mazatlan', 0),
(156, NULL, '2025-01-28 19:02:48', 'America/Mendoza', 0),
(157, NULL, '2025-01-28 19:02:48', 'America/Menominee', 0),
(158, NULL, '2025-01-28 19:02:48', 'America/Merida', 0),
(159, NULL, '2025-01-28 19:02:48', 'America/Metlakatla', 0),
(160, NULL, '2025-01-28 19:02:48', 'America/Mexico_City', 0),
(161, NULL, '2025-01-28 19:02:48', 'America/Miquelon', 0),
(162, NULL, '2025-01-28 19:02:48', 'America/Moncton', 0),
(163, NULL, '2025-01-28 19:02:48', 'America/Monterrey', 0),
(164, NULL, '2025-01-28 19:02:48', 'America/Montevideo', 0),
(165, NULL, '2025-01-28 19:02:48', 'America/Montreal', 0),
(166, NULL, '2025-01-28 19:02:48', 'America/Montserrat', 0),
(167, NULL, '2025-01-28 19:02:48', 'America/Nassau', 0),
(168, NULL, '2025-01-28 19:02:48', 'America/New_York', 0),
(169, NULL, '2025-01-28 19:02:48', 'America/Nipigon', 0),
(170, NULL, '2025-01-28 19:02:48', 'America/Nome', 0),
(171, NULL, '2025-01-28 19:02:48', 'America/Noronha', 0),
(172, NULL, '2025-01-28 19:02:48', 'America/North_Dakota/Beulah', 0),
(173, NULL, '2025-01-28 19:02:48', 'America/North_Dakota/Center', 0),
(174, NULL, '2025-01-28 19:02:48', 'America/North_Dakota/New_Salem', 0),
(175, NULL, '2025-01-28 19:02:48', 'America/Ojinaga', 0),
(176, NULL, '2025-01-28 19:02:48', 'America/Panama', 0),
(177, NULL, '2025-01-28 19:02:48', 'America/Pangnirtung', 0),
(178, NULL, '2025-01-28 19:02:48', 'America/Paramaribo', 0),
(179, NULL, '2025-01-28 19:02:48', 'America/Phoenix', 0),
(180, NULL, '2025-01-28 19:02:48', 'America/Port-au-Prince', 0),
(181, NULL, '2025-01-28 19:02:48', 'America/Port_of_Spain', 0),
(182, NULL, '2025-01-28 19:02:48', 'America/Porto_Acre', 0),
(183, NULL, '2025-01-28 19:02:48', 'America/Porto_Velho', 0),
(184, NULL, '2025-01-28 19:02:48', 'America/Puerto_Rico', 0),
(185, NULL, '2025-01-28 19:02:48', 'America/Rainy_River', 0),
(186, NULL, '2025-01-28 19:02:48', 'America/Rankin_Inlet', 0),
(187, NULL, '2025-01-28 19:02:48', 'America/Recife', 0),
(188, NULL, '2025-01-28 19:02:48', 'America/Regina', 0),
(189, NULL, '2025-01-28 19:02:48', 'America/Resolute', 0),
(190, NULL, '2025-01-28 19:02:48', 'America/Rio_Branco', 0),
(191, NULL, '2025-01-28 19:02:48', 'America/Rosario', 0),
(192, NULL, '2025-01-28 19:02:48', 'America/Santa_Isabel', 0),
(193, NULL, '2025-01-28 19:02:48', 'America/Santarem', 0),
(194, NULL, '2025-01-28 19:02:48', 'America/Santiago', 0),
(195, NULL, '2025-01-28 19:02:48', 'America/Santo_Domingo', 0),
(196, NULL, '2025-01-28 19:02:48', 'America/Sao_Paulo', 0),
(197, NULL, '2025-01-28 19:02:48', 'America/Scoresbysund', 0),
(198, NULL, '2025-01-28 19:02:48', 'America/Shiprock', 0),
(199, NULL, '2025-01-28 19:02:48', 'America/Sitka', 0),
(200, NULL, '2025-01-28 19:02:48', 'America/St_Barthelemy', 0),
(201, NULL, '2025-01-28 19:02:48', 'America/St_Johns', 0),
(202, NULL, '2025-01-28 19:02:48', 'America/St_Kitts', 0),
(203, NULL, '2025-01-28 19:02:48', 'America/St_Lucia', 0),
(204, NULL, '2025-01-28 19:02:48', 'America/St_Thomas', 0),
(205, NULL, '2025-01-28 19:02:48', 'America/St_Vincent', 0),
(206, NULL, '2025-01-28 19:02:48', 'America/Swift_Current', 0),
(207, NULL, '2025-01-28 19:02:48', 'America/Tegucigalpa', 0),
(208, NULL, '2025-01-28 19:02:48', 'America/Thule', 0),
(209, NULL, '2025-01-28 19:02:48', 'America/Thunder_Bay', 0),
(210, NULL, '2025-01-28 19:02:48', 'America/Tijuana', 0),
(211, NULL, '2025-01-28 19:02:48', 'America/Toronto', 0),
(212, NULL, '2025-01-28 19:02:48', 'America/Tortola', 0),
(213, NULL, '2025-01-28 19:02:48', 'America/Vancouver', 0),
(214, NULL, '2025-01-28 19:02:48', 'America/Virgin', 0),
(215, NULL, '2025-01-28 19:02:48', 'America/Whitehorse', 0),
(216, NULL, '2025-01-28 19:02:48', 'America/Winnipeg', 0),
(217, NULL, '2025-01-28 19:02:48', 'America/Yakutat', 0),
(218, NULL, '2025-01-28 19:02:48', 'America/Yellowknife', 0),
(219, NULL, '2025-01-28 19:02:48', 'Antarctica/Casey', 0),
(220, NULL, '2025-01-28 19:02:48', 'Antarctica/Davis', 0),
(221, NULL, '2025-01-28 19:02:48', 'Antarctica/DumontDUrville', 0),
(222, NULL, '2025-01-28 19:02:48', 'Antarctica/Macquarie', 0),
(223, NULL, '2025-01-28 19:02:48', 'Antarctica/Mawson', 0),
(224, NULL, '2025-01-28 19:02:48', 'Antarctica/McMurdo', 0),
(225, NULL, '2025-01-28 19:02:48', 'Antarctica/Palmer', 0),
(226, NULL, '2025-01-28 19:02:48', 'Antarctica/Rothera', 0),
(227, NULL, '2025-01-28 19:02:48', 'Antarctica/South_Pole', 0),
(228, NULL, '2025-01-28 19:02:48', 'Antarctica/Syowa', 0),
(229, NULL, '2025-01-28 19:02:48', 'Antarctica/Vostok', 0),
(230, NULL, '2025-01-28 19:02:48', 'Arctic/Longyearbyen', 0),
(231, NULL, '2025-01-28 19:02:48', 'Asia/Aden', 0),
(232, NULL, '2025-01-28 19:02:48', 'Asia/Almaty', 0),
(233, NULL, '2025-01-28 19:02:48', 'Asia/Amman', 0),
(234, NULL, '2025-01-28 19:02:48', 'Asia/Anadyr', 0),
(235, NULL, '2025-01-28 19:02:48', 'Asia/Aqtau', 0),
(236, NULL, '2025-01-28 19:02:48', 'Asia/Aqtobe', 0),
(237, NULL, '2025-01-28 19:02:48', 'Asia/Ashgabat', 0),
(238, NULL, '2025-01-28 19:02:48', 'Asia/Ashkhabad', 0),
(239, NULL, '2025-01-28 19:02:48', 'Asia/Baghdad', 0),
(240, NULL, '2025-01-28 19:02:48', 'Asia/Bahrain', 0),
(241, NULL, '2025-01-28 19:02:48', 'Asia/Baku', 0),
(242, NULL, '2025-01-28 19:02:48', 'Asia/Bangkok', 0),
(243, NULL, '2025-01-28 19:02:48', 'Asia/Beirut', 0),
(244, NULL, '2025-01-28 19:02:48', 'Asia/Bishkek', 0),
(245, NULL, '2025-01-28 19:02:48', 'Asia/Brunei', 0),
(246, NULL, '2025-01-28 19:02:48', 'Asia/Calcutta', 0),
(247, NULL, '2025-01-28 19:02:48', 'Asia/Choibalsan', 0),
(248, NULL, '2025-01-28 19:02:48', 'Asia/Chongqing', 0),
(249, NULL, '2025-01-28 19:02:48', 'Asia/Chungking', 0),
(250, NULL, '2025-01-28 19:02:48', 'Asia/Colombo', 0),
(251, NULL, '2025-01-28 19:02:48', 'Asia/Dacca', 0),
(252, NULL, '2025-01-28 19:02:48', 'Asia/Damascus', 0),
(253, NULL, '2025-01-28 19:02:48', 'Asia/Dhaka', 0),
(254, NULL, '2025-01-28 19:02:48', 'Asia/Dili', 0),
(255, NULL, '2025-01-28 19:02:48', 'Asia/Dubai', 0),
(256, NULL, '2025-01-28 19:02:48', 'Asia/Dushanbe', 0),
(257, NULL, '2025-01-28 19:02:48', 'Asia/Gaza', 0),
(258, NULL, '2025-01-28 19:02:48', 'Asia/Harbin', 0),
(259, NULL, '2025-01-28 19:02:48', 'Asia/Hebron', 0),
(260, NULL, '2025-01-28 19:02:48', 'Asia/Ho_Chi_Minh', 0),
(261, NULL, '2025-01-28 19:02:48', 'Asia/Hong_Kong', 0),
(262, NULL, '2025-01-28 19:02:48', 'Asia/Hovd', 0),
(263, NULL, '2025-01-28 19:02:48', 'Asia/Irkutsk', 0),
(264, NULL, '2025-01-28 19:02:48', 'Asia/Istanbul', 0),
(265, NULL, '2025-01-28 19:02:48', 'Asia/Jakarta', 0),
(266, NULL, '2025-01-28 19:02:48', 'Asia/Jayapura', 0),
(267, NULL, '2025-01-28 19:02:48', 'Asia/Jerusalem', 0),
(268, NULL, '2025-01-28 19:02:48', 'Asia/Kabul', 0),
(269, NULL, '2025-01-28 19:02:48', 'Asia/Kamchatka', 0),
(270, NULL, '2025-01-28 19:02:48', 'Asia/Karachi', 0),
(271, NULL, '2025-01-28 19:02:48', 'Asia/Kashgar', 0),
(272, NULL, '2025-01-28 19:02:48', 'Asia/Kathmandu', 0),
(273, NULL, '2025-01-28 19:02:48', 'Asia/Khandyga', 0),
(274, NULL, '2025-01-28 18:03:15', 'Asia/Kolkata', 1),
(275, NULL, '2025-01-28 19:02:48', 'Asia/Krasnoyarsk', 0),
(276, NULL, '2025-01-28 19:02:48', 'Asia/Kuala_Lumpur', 0),
(277, NULL, '2025-01-28 19:02:48', 'Asia/Kuching', 0),
(278, NULL, '2025-01-28 19:02:48', 'Asia/Kuwait', 0),
(279, NULL, '2025-01-28 19:02:48', 'Asia/Macao', 0),
(280, NULL, '2025-01-28 19:02:48', 'Asia/Macau', 0),
(281, NULL, '2025-01-28 19:02:48', 'Asia/Magadan', 0),
(282, NULL, '2025-01-28 19:02:48', 'Asia/Makassar', 0),
(283, NULL, '2025-01-28 19:02:48', 'Asia/Manila', 0),
(284, NULL, '2025-01-28 19:02:48', 'Asia/Muscat', 0),
(285, NULL, '2025-01-28 19:02:48', 'Asia/Nicosia', 0),
(286, NULL, '2025-01-28 19:02:48', 'Asia/Novokuznetsk', 0),
(287, NULL, '2025-01-28 19:02:48', 'Asia/Novosibirsk', 0),
(288, NULL, '2025-01-28 19:02:48', 'Asia/Omsk', 0),
(289, NULL, '2025-01-28 19:02:48', 'Asia/Oral', 0),
(290, NULL, '2025-01-28 19:02:48', 'Asia/Phnom_Penh', 0),
(291, NULL, '2025-01-28 19:02:48', 'Asia/Pontianak', 0),
(292, NULL, '2025-01-28 19:02:48', 'Asia/Pyongyang', 0),
(293, NULL, '2025-01-28 19:02:48', 'Asia/Qatar', 0),
(294, NULL, '2025-01-28 19:02:48', 'Asia/Qyzylorda', 0),
(295, NULL, '2025-01-28 19:02:48', 'Asia/Rangoon', 0),
(296, NULL, '2025-01-28 19:02:48', 'Asia/Riyadh', 0),
(297, NULL, '2025-01-28 19:02:48', 'Asia/Saigon', 0),
(298, NULL, '2025-01-28 19:02:48', 'Asia/Sakhalin', 0),
(299, NULL, '2025-01-28 19:02:48', 'Asia/Samarkand', 0),
(300, NULL, '2025-01-28 19:02:48', 'Asia/Seoul', 0),
(301, NULL, '2025-01-28 19:02:48', 'Asia/Shanghai', 0),
(302, NULL, '2025-01-28 19:02:48', 'Asia/Singapore', 0),
(303, NULL, '2025-01-28 19:02:48', 'Asia/Taipei', 0),
(304, NULL, '2025-01-28 19:02:48', 'Asia/Tashkent', 0),
(305, NULL, '2025-01-28 19:02:48', 'Asia/Tbilisi', 0),
(306, NULL, '2025-01-28 19:02:48', 'Asia/Tehran', 0),
(307, NULL, '2025-01-28 19:02:48', 'Asia/Tel_Aviv', 0),
(308, NULL, '2025-01-28 19:02:48', 'Asia/Thimbu', 0),
(309, NULL, '2025-01-28 19:02:48', 'Asia/Thimphu', 0),
(310, NULL, '2025-01-28 19:02:48', 'Asia/Tokyo', 0),
(311, NULL, '2025-01-28 19:02:48', 'Asia/Ujung_Pandang', 0),
(312, NULL, '2025-01-28 19:02:48', 'Asia/Ulaanbaatar', 0),
(313, NULL, '2025-01-28 19:02:48', 'Asia/Ulan_Bator', 0),
(314, NULL, '2025-01-28 19:02:48', 'Asia/Urumqi', 0),
(315, NULL, '2025-01-28 19:02:48', 'Asia/Ust-Nera', 0),
(316, NULL, '2025-01-28 19:02:48', 'Asia/Vientiane', 0),
(317, NULL, '2025-01-28 19:02:48', 'Asia/Vladivostok', 0),
(318, NULL, '2025-01-28 19:02:48', 'Asia/Yakutsk', 0),
(319, NULL, '2025-01-28 19:02:48', 'Asia/Yekaterinburg', 0),
(320, NULL, '2025-01-28 19:02:48', 'Asia/Yerevan', 0),
(321, NULL, '2025-01-28 19:02:48', 'Atlantic/Azores', 0),
(322, NULL, '2025-01-28 19:02:48', 'Atlantic/Bermuda', 0),
(323, NULL, '2025-01-28 19:02:48', 'Atlantic/Canary', 0),
(324, NULL, '2025-01-28 19:02:48', 'Atlantic/Cape_Verde', 0),
(325, NULL, '2025-01-28 19:02:48', 'Atlantic/Faeroe', 0),
(326, NULL, '2025-01-28 19:02:48', 'Atlantic/Faroe', 0),
(327, NULL, '2025-01-28 19:02:48', 'Atlantic/Jan_Mayen', 0),
(328, NULL, '2025-01-28 19:02:48', 'Atlantic/Madeira', 0),
(329, NULL, '2025-01-28 19:02:48', 'Atlantic/Reykjavik', 0),
(330, NULL, '2025-01-28 19:02:48', 'Atlantic/South_Georgia', 0),
(331, NULL, '2025-01-28 19:02:48', 'Atlantic/St_Helena', 0),
(332, NULL, '2025-01-28 19:02:48', 'Atlantic/Stanley', 0),
(333, NULL, '2025-01-28 19:02:48', 'Australia/ACT', 0),
(334, NULL, '2025-01-28 19:02:48', 'Australia/Adelaide', 0),
(335, NULL, '2025-01-28 19:02:48', 'Australia/Brisbane', 0),
(336, NULL, '2025-01-28 19:02:48', 'Australia/Broken_Hill', 0),
(337, NULL, '2025-01-28 19:02:48', 'Australia/Canberra', 0),
(338, NULL, '2025-01-28 19:02:48', 'Australia/Currie', 0),
(339, NULL, '2025-01-28 19:02:48', 'Australia/Darwin', 0),
(340, NULL, '2025-01-28 19:02:48', 'Australia/Eucla', 0),
(341, NULL, '2025-01-28 19:02:48', 'Australia/Hobart', 0),
(342, NULL, '2025-01-28 19:02:48', 'Australia/LHI', 0),
(343, NULL, '2025-01-28 19:02:48', 'Australia/Lindeman', 0),
(344, NULL, '2025-01-28 19:02:48', 'Australia/Lord_Howe', 0),
(345, NULL, '2025-01-28 19:02:48', 'Australia/Melbourne', 0),
(346, NULL, '2025-01-28 19:02:48', 'Australia/North', 0),
(347, NULL, '2025-01-28 19:02:48', 'Australia/NSW', 0),
(348, NULL, '2025-01-28 19:02:48', 'Australia/Perth', 0),
(349, NULL, '2025-01-28 19:02:48', 'Australia/Queensland', 0),
(350, NULL, '2025-01-28 19:02:48', 'Australia/South', 0),
(351, NULL, '2025-01-28 19:02:48', 'Australia/Sydney', 0),
(352, NULL, '2025-01-28 19:02:48', 'Australia/Tasmania', 0),
(353, NULL, '2025-01-28 19:02:48', 'Australia/Victoria', 0),
(354, NULL, '2025-01-28 19:02:48', 'Australia/West', 0),
(355, NULL, '2025-01-28 19:02:48', 'Australia/Yancowinna', 0),
(356, NULL, '2025-01-28 19:02:48', 'Europe/Amsterdam', 0),
(357, NULL, '2025-01-28 19:02:48', 'Europe/Andorra', 0),
(358, NULL, '2025-01-28 19:02:48', 'Europe/Athens', 0),
(359, NULL, '2025-01-28 19:02:48', 'Europe/Belfast', 0),
(360, NULL, '2025-01-28 19:02:48', 'Europe/Belgrade', 0),
(361, NULL, '2025-01-28 19:02:48', 'Europe/Berlin', 0),
(362, NULL, '2025-01-28 19:02:48', 'Europe/Bratislava', 0),
(363, NULL, '2025-01-28 19:02:48', 'Europe/Brussels', 0),
(364, NULL, '2025-01-28 19:02:48', 'Europe/Bucharest', 0),
(365, NULL, '2025-01-28 19:02:48', 'Europe/Budapest', 0),
(366, NULL, '2025-01-28 19:02:48', 'Europe/Busingen', 0),
(367, NULL, '2025-01-28 19:02:48', 'Europe/Chisinau', 0),
(368, NULL, '2025-01-28 19:02:48', 'Europe/Copenhagen', 0),
(369, NULL, '2025-01-28 19:02:48', 'Europe/Dublin', 0),
(370, NULL, '2025-01-28 19:02:48', 'Europe/Gibraltar', 0),
(371, NULL, '2025-01-28 19:02:48', 'Europe/Guernsey', 0),
(372, NULL, '2025-01-28 19:02:48', 'Europe/Helsinki', 0),
(373, NULL, '2025-01-28 19:02:48', 'Europe/Isle_of_Man', 0),
(374, NULL, '2025-01-28 19:02:48', 'Europe/Istanbul', 0),
(375, NULL, '2025-01-28 19:02:48', 'Europe/Jersey', 0),
(376, NULL, '2025-01-28 19:02:48', 'Europe/Kaliningrad', 0),
(377, NULL, '2025-01-28 19:02:48', 'Europe/Kiev', 0),
(378, NULL, '2025-01-28 19:02:48', 'Europe/Lisbon', 0),
(379, NULL, '2025-01-28 19:02:48', 'Europe/Ljubljana', 0),
(380, NULL, '2025-01-28 19:02:48', 'Europe/London', 0),
(381, NULL, '2025-01-28 19:02:48', 'Europe/Luxembourg', 0),
(382, NULL, '2025-01-28 19:02:48', 'Europe/Madrid', 0),
(383, NULL, '2025-01-28 19:02:48', 'Europe/Malta', 0),
(384, NULL, '2025-01-28 19:02:48', 'Europe/Mariehamn', 0),
(385, NULL, '2025-01-28 19:02:48', 'Europe/Minsk', 0),
(386, NULL, '2025-01-28 19:02:48', 'Europe/Monaco', 0),
(387, NULL, '2025-01-28 19:02:48', 'Europe/Moscow', 0),
(388, NULL, '2025-01-28 19:02:48', 'Europe/Nicosia', 0),
(389, NULL, '2025-01-28 19:02:48', 'Europe/Oslo', 0),
(390, NULL, '2025-01-28 19:02:48', 'Europe/Paris', 0),
(391, NULL, '2025-01-28 19:02:48', 'Europe/Podgorica', 0),
(392, NULL, '2025-01-28 19:02:48', 'Europe/Prague', 0),
(393, NULL, '2025-01-28 19:02:48', 'Europe/Riga', 0),
(394, NULL, '2025-01-28 19:02:48', 'Europe/Rome', 0),
(395, NULL, '2025-01-28 19:02:48', 'Europe/Samara', 0),
(396, NULL, '2025-01-28 19:02:48', 'Europe/San_Marino', 0),
(397, NULL, '2025-01-28 19:02:48', 'Europe/Sarajevo', 0),
(398, NULL, '2025-01-28 19:02:48', 'Europe/Simferopol', 0),
(399, NULL, '2025-01-28 19:02:48', 'Europe/Skopje', 0),
(400, NULL, '2025-01-28 19:02:48', 'Europe/Sofia', 0),
(401, NULL, '2025-01-28 19:02:48', 'Europe/Stockholm', 0),
(402, NULL, '2025-01-28 19:02:48', 'Europe/Tallinn', 0),
(403, NULL, '2025-01-28 19:02:48', 'Europe/Tirane', 0),
(404, NULL, '2025-01-28 19:02:48', 'Europe/Tiraspol', 0),
(405, NULL, '2025-01-28 19:02:48', 'Europe/Uzhgorod', 0),
(406, NULL, '2025-01-28 19:02:48', 'Europe/Vaduz', 0),
(407, NULL, '2025-01-28 19:02:48', 'Europe/Vatican', 0),
(408, NULL, '2025-01-28 19:02:48', 'Europe/Vienna', 0),
(409, NULL, '2025-01-28 19:02:48', 'Europe/Vilnius', 0),
(410, NULL, '2025-01-28 19:02:48', 'Europe/Volgograd', 0),
(411, NULL, '2025-01-28 19:02:48', 'Europe/Warsaw', 0),
(412, NULL, '2025-01-28 19:02:48', 'Europe/Zagreb', 0),
(413, NULL, '2025-01-28 19:02:48', 'Europe/Zaporozhye', 0),
(414, NULL, '2025-01-28 19:02:48', 'Europe/Zurich', 0),
(415, NULL, '2025-01-28 19:02:48', 'Indian/Antananarivo', 0),
(416, NULL, '2025-01-28 19:02:48', 'Indian/Chagos', 0),
(417, NULL, '2025-01-28 19:02:48', 'Indian/Christmas', 0),
(418, NULL, '2025-01-28 19:02:48', 'Indian/Cocos', 0),
(419, NULL, '2025-01-28 19:02:48', 'Indian/Comoro', 0),
(420, NULL, '2025-01-28 19:02:48', 'Indian/Kerguelen', 0),
(421, NULL, '2025-01-28 19:02:48', 'Indian/Mahe', 0),
(422, NULL, '2025-01-28 19:02:48', 'Indian/Maldives', 0),
(423, NULL, '2025-01-28 19:02:48', 'Indian/Mauritius', 0),
(424, NULL, '2025-01-28 19:02:48', 'Indian/Mayotte', 0),
(425, NULL, '2025-01-28 19:02:48', 'Indian/Reunion', 0),
(426, NULL, '2025-01-28 19:02:48', 'Pacific/Apia', 0),
(427, NULL, '2025-01-28 19:02:48', 'Pacific/Auckland', 0),
(428, NULL, '2025-01-28 19:02:48', 'Pacific/Chatham', 0),
(429, NULL, '2025-01-28 19:02:48', 'Pacific/Chuuk', 0),
(430, NULL, '2025-01-28 19:02:48', 'Pacific/Easter', 0),
(431, NULL, '2025-01-28 19:02:48', 'Pacific/Efate', 0),
(432, NULL, '2025-01-28 19:02:48', 'Pacific/Enderbury', 0),
(433, NULL, '2025-01-28 19:02:48', 'Pacific/Fakaofo', 0),
(434, NULL, '2025-01-28 19:02:48', 'Pacific/Fiji', 0),
(435, NULL, '2025-01-28 19:02:48', 'Pacific/Funafuti', 0),
(436, NULL, '2025-01-28 19:02:48', 'Pacific/Galapagos', 0),
(437, NULL, '2025-01-28 19:02:48', 'Pacific/Gambier', 0),
(438, NULL, '2025-01-28 19:02:48', 'Pacific/Guadalcanal', 0),
(439, NULL, '2025-01-28 19:02:48', 'Pacific/Guam', 0),
(440, NULL, '2025-01-28 19:02:48', 'Pacific/Honolulu', 0),
(441, NULL, '2025-01-28 19:02:48', 'Pacific/Johnston', 0),
(442, NULL, '2025-01-28 19:02:48', 'Pacific/Kiritimati', 0),
(443, NULL, '2025-01-28 19:02:48', 'Pacific/Kosrae', 0),
(444, NULL, '2025-01-28 19:02:48', 'Pacific/Kwajalein', 0),
(445, NULL, '2025-01-28 19:02:48', 'Pacific/Majuro', 0),
(446, NULL, '2025-01-28 19:02:48', 'Pacific/Marquesas', 0),
(447, NULL, '2025-01-28 19:02:48', 'Pacific/Midway', 0),
(448, NULL, '2025-01-28 19:02:48', 'Pacific/Nauru', 0),
(449, NULL, '2025-01-28 19:02:48', 'Pacific/Niue', 0),
(450, NULL, '2025-01-28 19:02:48', 'Pacific/Norfolk', 0),
(451, NULL, '2025-01-28 19:02:48', 'Pacific/Noumea', 0),
(452, NULL, '2025-01-28 19:02:48', 'Pacific/Pago_Pago', 0),
(453, NULL, '2025-01-28 19:02:48', 'Pacific/Palau', 0),
(454, NULL, '2025-01-28 19:02:48', 'Pacific/Pitcairn', 0),
(455, NULL, '2025-01-28 19:02:48', 'Pacific/Pohnpei', 0),
(456, NULL, '2025-01-28 19:02:48', 'Pacific/Ponape', 0),
(457, NULL, '2025-01-28 19:02:48', 'Pacific/Port_Moresby', 0),
(458, NULL, '2025-01-28 19:02:48', 'Pacific/Rarotonga', 0),
(459, NULL, '2025-01-28 19:02:48', 'Pacific/Saipan', 0),
(460, NULL, '2025-01-28 19:02:48', 'Pacific/Samoa', 0),
(461, NULL, '2025-01-28 19:02:48', 'Pacific/Tahiti', 0),
(462, NULL, '2025-01-28 19:02:48', 'Pacific/Tarawa', 0),
(463, NULL, '2025-01-28 19:02:48', 'Pacific/Tongatapu', 0),
(464, NULL, '2025-01-28 19:02:48', 'Pacific/Truk', 0),
(465, NULL, '2025-01-28 19:02:48', 'Pacific/Wake', 0),
(466, NULL, '2025-01-28 19:02:48', 'Pacific/Wallis', 0),
(467, NULL, '2025-01-28 19:02:48', 'Pacific/Yap', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `tr_head_id` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `dr_amount` int(11) DEFAULT NULL,
  `cr_amount` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_heads`
--

DROP TABLE IF EXISTS `transaction_heads`;
CREATE TABLE `transaction_heads` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `tr_head` varchar(100) NOT NULL,
  `ref_id` int(10) UNSIGNED DEFAULT NULL,
  `acc_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_certificates`
--

DROP TABLE IF EXISTS `transfer_certificates`;
CREATE TABLE `transfer_certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `students_id` int(10) UNSIGNED NOT NULL,
  `date_of_issue` date NOT NULL,
  `date_of_leaving` date NOT NULL,
  `tc_num` varchar(191) NOT NULL,
  `leaving_time_class` text NOT NULL,
  `qualified_to_promote` text NOT NULL,
  `paid_fee_status` varchar(191) NOT NULL,
  `character` varchar(191) NOT NULL,
  `ref_text` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contact_number` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `profile_image` text DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `hook_id` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `last_login_at`, `last_login_ip`, `created_at`, `updated_at`, `contact_number`, `address`, `profile_image`, `role_id`, `hook_id`, `status`) VALUES
(1, 'Super Admin', 'superadmin@edufirm.com', '$2y$10$nbriw3XLSot3o4fj8QwCku2nI55AGj3Ot0I05khpDVeNRcUMq8pNW', NULL, '2025-07-15 10:17:30', '127.0.0.1', NULL, '2025-07-15 10:17:30', NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
CREATE TABLE `vendors` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `reg_no` varchar(15) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `mobile_1` varchar(10) DEFAULT NULL,
  `mobile_2` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `extra_info` text DEFAULT NULL,
  `vendor_image` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_logs`
--

DROP TABLE IF EXISTS `visitor_logs`;
CREATE TABLE `visitor_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `purpose` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `id_doc` varchar(191) DEFAULT NULL,
  `id_num` varchar(191) DEFAULT NULL,
  `in_time` time NOT NULL,
  `out_time` time DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_purposes`
--

DROP TABLE IF EXISTS `visitor_purposes`;
CREATE TABLE `visitor_purposes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

DROP TABLE IF EXISTS `years`;
CREATE TABLE `years` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(4) NOT NULL,
  `active_status` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `years`
--

INSERT INTO `years` (`id`, `created_at`, `updated_at`, `created_by`, `last_updated_by`, `title`, `active_status`, `status`) VALUES
(1, '2020-05-04 17:10:05', '2025-01-28 15:31:51', 1, NULL, '2018', 0, 0),
(2, '2020-05-04 17:10:05', '2025-01-28 15:31:51', 1, NULL, '2019', 0, 0),
(3, '2020-05-04 17:10:05', '2025-01-28 15:31:51', 1, NULL, '2020', 0, 1),
(4, '2025-01-27 05:56:39', '2025-01-28 15:31:51', 1, NULL, '2000', 0, 1),
(5, '2025-01-28 15:31:43', '2025-01-28 15:31:51', 1, NULL, '2025', 1, 1),
(6, '2025-02-13 16:47:44', '2025-02-13 16:47:44', 1, NULL, '2024', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_infos`
--
ALTER TABLE `academic_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `academic_infos_students_id_foreign` (`students_id`);

--
-- Indexes for table `account_categories`
--
ALTER TABLE `account_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_categories_ac_name_unique` (`ac_name`);

--
-- Indexes for table `addressinfos`
--
ALTER TABLE `addressinfos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addressinfos_students_id_foreign` (`students_id`);

--
-- Indexes for table `alert_settings`
--
ALTER TABLE `alert_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assets_title_unique` (`title`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_years_id_foreign` (`years_id`),
  ADD KEY `attendances_months_id_foreign` (`months_id`);

--
-- Indexes for table `attendance_certificates`
--
ALTER TABLE `attendance_certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attendance_certificates_students_id_unique` (`students_id`);

--
-- Indexes for table `attendance_masters`
--
ALTER TABLE `attendance_masters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_masters_year_foreign` (`year`),
  ADD KEY `attendance_masters_month_foreign` (`month`);

--
-- Indexes for table `attendance_statuses`
--
ALTER TABLE `attendance_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attendance_statuses_title_unique` (`title`);

--
-- Indexes for table `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  ADD KEY `audits_user_id_user_type_index` (`user_id`,`user_type`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_transactions`
--
ALTER TABLE `bank_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_transactions_banks_id_foreign` (`banks_id`);

--
-- Indexes for table `bonafide_certificates`
--
ALTER TABLE `bonafide_certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bonafide_certificates_students_id_unique` (`students_id`);

--
-- Indexes for table `book_categories`
--
ALTER TABLE `book_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `book_categories_title_unique` (`title`),
  ADD UNIQUE KEY `book_categories_slug_unique` (`slug`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_title_unique` (`title`);

--
-- Indexes for table `certificate_histories`
--
ALTER TABLE `certificate_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `certificate_histories_students_id_foreign` (`students_id`);

--
-- Indexes for table `certificate_templates`
--
ALTER TABLE `certificate_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `character_certificates`
--
ALTER TABLE `character_certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `character_certificates_students_id_unique` (`students_id`),
  ADD UNIQUE KEY `character_certificates_cc_num_unique` (`cc_num`);

--
-- Indexes for table `course_completion_certificates`
--
ALTER TABLE `course_completion_certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_completion_certificates_students_id_unique` (`students_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_reg_no_unique` (`reg_no`);

--
-- Indexes for table `customer_statuses`
--
ALTER TABLE `customer_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_statuses_title_unique` (`title`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `days_title_unique` (`title`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `downloads`
--
ALTER TABLE `downloads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_settings`
--
ALTER TABLE `email_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `exams_title_unique` (`title`);

--
-- Indexes for table `exam_mark_ledgers`
--
ALTER TABLE `exam_mark_ledgers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_mark_ledgers_students_id_foreign` (`students_id`);

--
-- Indexes for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_schedules_years_id_foreign` (`years_id`),
  ADD KEY `exam_schedules_months_id_foreign` (`months_id`),
  ADD KEY `exam_schedules_exams_id_foreign` (`exams_id`),
  ADD KEY `exam_schedules_faculty_id_foreign` (`faculty_id`),
  ADD KEY `exam_schedules_semesters_id_foreign` (`semesters_id`),
  ADD KEY `exam_schedules_subjects_id_foreign` (`subjects_id`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faculties_faculty_unique` (`faculty`),
  ADD UNIQUE KEY `faculties_faculty_code_unique` (`faculty_code`);

--
-- Indexes for table `faculty_semester`
--
ALTER TABLE `faculty_semester`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faculty_semester_faculty_id_foreign` (`faculty_id`),
  ADD KEY `faculty_semester_semester_id_foreign` (`semester_id`);

--
-- Indexes for table `fee_collections`
--
ALTER TABLE `fee_collections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_collections_students_id_foreign` (`students_id`),
  ADD KEY `fee_collections_fee_masters_id_foreign` (`fee_masters_id`);

--
-- Indexes for table `fee_heads`
--
ALTER TABLE `fee_heads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fee_heads_fee_head_title_unique` (`fee_head_title`);

--
-- Indexes for table `fee_masters`
--
ALTER TABLE `fee_masters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_masters_students_id_foreign` (`students_id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `general_settings_time_zones_id_foreign` (`time_zones_id`);

--
-- Indexes for table `grading_scales`
--
ALTER TABLE `grading_scales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grading_scales_gradingtype_id_foreign` (`gradingType_id`);

--
-- Indexes for table `grading_types`
--
ALTER TABLE `grading_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `grading_types_title_unique` (`title`),
  ADD UNIQUE KEY `grading_types_slug_unique` (`slug`);

--
-- Indexes for table `guardian_details`
--
ALTER TABLE `guardian_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `institutions`
--
ALTER TABLE `institutions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `months`
--
ALTER TABLE `months`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `months_title_unique` (`title`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_payments`
--
ALTER TABLE `online_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parent_details`
--
ALTER TABLE `parent_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_details_students_id_foreign` (`students_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_methods_title_unique` (`title`);

--
-- Indexes for table `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_heads`
--
ALTER TABLE `payroll_heads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payroll_heads_title_unique` (`title`),
  ADD UNIQUE KEY `payroll_heads_slug_unique` (`slug`);

--
-- Indexes for table `payroll_masters`
--
ALTER TABLE `payroll_masters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_masters_staff_id_foreign` (`staff_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_code_unique` (`code`);

--
-- Indexes for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_prices_products_id_unique` (`products_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_vendors_id_foreign` (`vendors_id`);

--
-- Indexes for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_details_products_id_foreign` (`products_id`);

--
-- Indexes for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_returns_vendors_id_foreign` (`vendors_id`),
  ADD KEY `purchase_returns_products_id_foreign` (`products_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `salary_pays`
--
ALTER TABLE `salary_pays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_pays_staff_id_foreign` (`staff_id`),
  ADD KEY `salary_pays_salary_masters_id_foreign` (`salary_masters_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_details`
--
ALTER TABLE `sales_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_returns`
--
ALTER TABLE `sales_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `semesters_semester_unique` (`semester`),
  ADD UNIQUE KEY `semesters_slug_unique` (`slug`);

--
-- Indexes for table `semester_assets`
--
ALTER TABLE `semester_assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semester_subject`
--
ALTER TABLE `semester_subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `semester_subject_semester_id_foreign` (`semester_id`),
  ADD KEY `semester_subject_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_emails`
--
ALTER TABLE `sms_emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_settings`
--
ALTER TABLE `sms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_reg_no_unique` (`reg_no`),
  ADD KEY `staff_designation_foreign` (`designation`);

--
-- Indexes for table `staff_designations`
--
ALTER TABLE `staff_designations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_designations_title_unique` (`title`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_reg_no_unique` (`reg_no`),
  ADD KEY `students_faculty_foreign` (`faculty`),
  ADD KEY `students_semester_foreign` (`semester`),
  ADD KEY `students_academic_status_foreign` (`academic_status`),
  ADD KEY `students_batch_foreign` (`batch`);

--
-- Indexes for table `student_batches`
--
ALTER TABLE `student_batches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_batches_title_unique` (`title`);

--
-- Indexes for table `student_guardians`
--
ALTER TABLE `student_guardians`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_guardians_students_id_foreign` (`students_id`),
  ADD KEY `student_guardians_guardians_id_foreign` (`guardians_id`);

--
-- Indexes for table `student_statuses`
--
ALTER TABLE `student_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_statuses_title_unique` (`title`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_zones`
--
ALTER TABLE `time_zones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_tr_head_id_foreign` (`tr_head_id`);

--
-- Indexes for table `transaction_heads`
--
ALTER TABLE `transaction_heads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer_certificates`
--
ALTER TABLE `transfer_certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transfer_certificates_students_id_unique` (`students_id`),
  ADD UNIQUE KEY `transfer_certificates_tc_num_unique` (`tc_num`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_reg_no_unique` (`reg_no`);

--
-- Indexes for table `visitor_logs`
--
ALTER TABLE `visitor_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor_purposes`
--
ALTER TABLE `visitor_purposes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `visitor_purposes_title_unique` (`title`);

--
-- Indexes for table `years`
--
ALTER TABLE `years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `years_title_unique` (`title`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_infos`
--
ALTER TABLE `academic_infos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_categories`
--
ALTER TABLE `account_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `addressinfos`
--
ALTER TABLE `addressinfos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alert_settings`
--
ALTER TABLE `alert_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_certificates`
--
ALTER TABLE `attendance_certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_masters`
--
ALTER TABLE `attendance_masters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_statuses`
--
ALTER TABLE `attendance_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `audits`
--
ALTER TABLE `audits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_transactions`
--
ALTER TABLE `bank_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bonafide_certificates`
--
ALTER TABLE `bonafide_certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_categories`
--
ALTER TABLE `book_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificate_histories`
--
ALTER TABLE `certificate_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificate_templates`
--
ALTER TABLE `certificate_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `character_certificates`
--
ALTER TABLE `character_certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_completion_certificates`
--
ALTER TABLE `course_completion_certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_statuses`
--
ALTER TABLE `customer_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `downloads`
--
ALTER TABLE `downloads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_settings`
--
ALTER TABLE `email_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_mark_ledgers`
--
ALTER TABLE `exam_mark_ledgers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faculty_semester`
--
ALTER TABLE `faculty_semester`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_collections`
--
ALTER TABLE `fee_collections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_heads`
--
ALTER TABLE `fee_heads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_masters`
--
ALTER TABLE `fee_masters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `grading_scales`
--
ALTER TABLE `grading_scales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grading_types`
--
ALTER TABLE `grading_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guardian_details`
--
ALTER TABLE `guardian_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `institutions`
--
ALTER TABLE `institutions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `months`
--
ALTER TABLE `months`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_payments`
--
ALTER TABLE `online_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parent_details`
--
ALTER TABLE `parent_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payroll_heads`
--
ALTER TABLE `payroll_heads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_masters`
--
ALTER TABLE `payroll_masters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=714;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_prices`
--
ALTER TABLE `product_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `salary_pays`
--
ALTER TABLE `salary_pays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_details`
--
ALTER TABLE `sales_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_returns`
--
ALTER TABLE `sales_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `semester_assets`
--
ALTER TABLE `semester_assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `semester_subject`
--
ALTER TABLE `semester_subject`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_emails`
--
ALTER TABLE `sms_emails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_settings`
--
ALTER TABLE `sms_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_designations`
--
ALTER TABLE `staff_designations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_batches`
--
ALTER TABLE `student_batches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_guardians`
--
ALTER TABLE `student_guardians`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_statuses`
--
ALTER TABLE `student_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_zones`
--
ALTER TABLE `time_zones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=468;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_heads`
--
ALTER TABLE `transaction_heads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfer_certificates`
--
ALTER TABLE `transfer_certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_logs`
--
ALTER TABLE `visitor_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_purposes`
--
ALTER TABLE `visitor_purposes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `years`
--
ALTER TABLE `years`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `academic_infos`
--
ALTER TABLE `academic_infos`
  ADD CONSTRAINT `academic_infos_students_id_foreign` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `addressinfos`
--
ALTER TABLE `addressinfos`
  ADD CONSTRAINT `addressinfos_students_id_foreign` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_months_id_foreign` FOREIGN KEY (`months_id`) REFERENCES `months` (`id`),
  ADD CONSTRAINT `attendances_years_id_foreign` FOREIGN KEY (`years_id`) REFERENCES `years` (`id`);

--
-- Constraints for table `attendance_certificates`
--
ALTER TABLE `attendance_certificates`
  ADD CONSTRAINT `attendance_certificates_students_id_foreign` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `attendance_masters`
--
ALTER TABLE `attendance_masters`
  ADD CONSTRAINT `attendance_masters_month_foreign` FOREIGN KEY (`month`) REFERENCES `months` (`id`),
  ADD CONSTRAINT `attendance_masters_year_foreign` FOREIGN KEY (`year`) REFERENCES `years` (`id`);

--
-- Constraints for table `bank_transactions`
--
ALTER TABLE `bank_transactions`
  ADD CONSTRAINT `bank_transactions_banks_id_foreign` FOREIGN KEY (`banks_id`) REFERENCES `banks` (`id`);

--
-- Constraints for table `bonafide_certificates`
--
ALTER TABLE `bonafide_certificates`
  ADD CONSTRAINT `bonafide_certificates_students_id_foreign` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `certificate_histories`
--
ALTER TABLE `certificate_histories`
  ADD CONSTRAINT `certificate_histories_students_id_foreign` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `character_certificates`
--
ALTER TABLE `character_certificates`
  ADD CONSTRAINT `character_certificates_students_id_foreign` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `course_completion_certificates`
--
ALTER TABLE `course_completion_certificates`
  ADD CONSTRAINT `course_completion_certificates_students_id_foreign` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `exam_mark_ledgers`
--
ALTER TABLE `exam_mark_ledgers`
  ADD CONSTRAINT `exam_mark_ledgers_students_id_foreign` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  ADD CONSTRAINT `exam_schedules_exams_id_foreign` FOREIGN KEY (`exams_id`) REFERENCES `exams` (`id`),
  ADD CONSTRAINT `exam_schedules_faculty_id_foreign` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`),
  ADD CONSTRAINT `exam_schedules_months_id_foreign` FOREIGN KEY (`months_id`) REFERENCES `months` (`id`),
  ADD CONSTRAINT `exam_schedules_semesters_id_foreign` FOREIGN KEY (`semesters_id`) REFERENCES `semesters` (`id`),
  ADD CONSTRAINT `exam_schedules_subjects_id_foreign` FOREIGN KEY (`subjects_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `exam_schedules_years_id_foreign` FOREIGN KEY (`years_id`) REFERENCES `years` (`id`);

--
-- Constraints for table `faculty_semester`
--
ALTER TABLE `faculty_semester`
  ADD CONSTRAINT `faculty_semester_faculty_id_foreign` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`),
  ADD CONSTRAINT `faculty_semester_semester_id_foreign` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`);

--
-- Constraints for table `fee_collections`
--
ALTER TABLE `fee_collections`
  ADD CONSTRAINT `fee_collections_fee_masters_id_foreign` FOREIGN KEY (`fee_masters_id`) REFERENCES `fee_masters` (`id`),
  ADD CONSTRAINT `fee_collections_students_id_foreign` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `fee_masters`
--
ALTER TABLE `fee_masters`
  ADD CONSTRAINT `fee_masters_students_id_foreign` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD CONSTRAINT `general_settings_time_zones_id_foreign` FOREIGN KEY (`time_zones_id`) REFERENCES `time_zones` (`id`);

--
-- Constraints for table `grading_scales`
--
ALTER TABLE `grading_scales`
  ADD CONSTRAINT `grading_scales_gradingtype_id_foreign` FOREIGN KEY (`gradingType_id`) REFERENCES `grading_types` (`id`);

--
-- Constraints for table `parent_details`
--
ALTER TABLE `parent_details`
  ADD CONSTRAINT `parent_details_students_id_foreign` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `payroll_masters`
--
ALTER TABLE `payroll_masters`
  ADD CONSTRAINT `payroll_masters_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_vendors_id_foreign` FOREIGN KEY (`vendors_id`) REFERENCES `vendors` (`id`);

--
-- Constraints for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD CONSTRAINT `purchase_details_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD CONSTRAINT `purchase_returns_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `purchase_returns_vendors_id_foreign` FOREIGN KEY (`vendors_id`) REFERENCES `vendors` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
