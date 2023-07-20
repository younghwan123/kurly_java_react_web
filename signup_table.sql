-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- 생성 시간: 23-03-16 14:02
-- 서버 버전: 8.0.32
-- PHP 버전: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `moonjong`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `signup_table`
--

CREATE TABLE `signup_table` (
  `idx` int NOT NULL COMMENT '자동 증가번호',
  `id` varchar(16) COLLATE utf8mb4_general_ci NOT NULL COMMENT '아이디',
  `pw` varchar(16) COLLATE utf8mb4_general_ci NOT NULL COMMENT '비밀번호',
  `irum` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '이름',
  `email` varchar(250) COLLATE utf8mb4_general_ci NOT NULL COMMENT '이메일',
  `hp` varchar(13) COLLATE utf8mb4_general_ci NOT NULL COMMENT '휴대폰',
  `addr` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT '주소',
  `gender` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '성별',
  `birth` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '생년월일',
  `chooga` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '추가입력사항',
  `service` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL COMMENT '이용약관동의',
  `gaib_date` varchar(10) COLLATE utf8mb4_general_ci NOT NULL COMMENT '가입일자'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='마켓컬리 회원가입 테이블';


CREATE TABLE `signup_table` (
  `idx` int(11)  NOT NULL PRIMARY KEY  AUTO_INCREMENT  COMMENT '자동 증가번호',
  `user_id` varchar(16) COLLATE utf8mb4_general_ci NOT NULL COMMENT '아이디',
  `user_pw` varchar(16) COLLATE utf8mb4_general_ci NOT NULL COMMENT '비밀번호',
  `user_irum` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '이름',
  `user_email` varchar(250) COLLATE utf8mb4_general_ci NOT NULL COMMENT '이메일',
  `user_hp` varchar(13) COLLATE utf8mb4_general_ci NOT NULL COMMENT '휴대폰',
  `user_addr` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT '주소',
  `user_gender` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '성별',
  `user_birth` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '생년월일',
  `user_chooga` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '추가입력사항',
  `user_service` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL COMMENT '이용약관동의',
  `user_gaib_date` TIMESTAMP  DEFAULT  CURRENT_TIMESTAMP NOT NULL  COMMENT '가입일자'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='마켓컬리 회원가입 테이블';


// 더미 데이터 입력
INSERT INTO signup_table(user_id, user_pw, user_irum, user_email, user_hp, user_addr, user_gender, user_birth, user_chooga, user_service) 
VALUES('moonjong','moonjong1234','문선종','moonjong@naver.com','010-7942-6441','서울시','남성','1970-09-29','타임세일','이용약관동의...');

user_id
user_pw
user_irum
user_email
user_hp
user_addr
user_gender
user_birth
user_chooga
user_servi
user_gaib_da




--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `signup_table`
--
ALTER TABLE `signup_table`
  ADD PRIMARY KEY (`idx`,`id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `signup_table`
--
ALTER TABLE `signup_table`
  MODIFY `idx` int NOT NULL AUTO_INCREMENT COMMENT '자동 증가번호';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
