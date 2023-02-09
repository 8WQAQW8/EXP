-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- 主機: localhost
-- 產生時間： 2022-12-07 16:39:01
-- 伺服器版本: 5.7.17-log
-- PHP 版本： 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `expstore`
--

-- --------------------------------------------------------

--
-- 資料表結構 `addbook`
--

CREATE TABLE `addbook` (
  `addressid` int(10) NOT NULL COMMENT '地址ID',
  `setdefault` tinyint(1) NOT NULL DEFAULT '0' COMMENT '預設收件人',
  `emailid` int(10) NOT NULL COMMENT '會員編號',
  `cname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件者姓名',
  `mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件者電話',
  `tel` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '收件者市話',
  `myzip` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '郵遞區號',
  `address` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件地址',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `addbook`
--

INSERT INTO `addbook` (`addressid`, `setdefault`, `emailid`, `cname`, `mobile`, `tel`, `myzip`, `address`, `create_date`) VALUES
(1, 1, 2, 'test02', '0912345678', '0488888888', '407', '1223路', '2022-12-07 08:28:17');

-- --------------------------------------------------------

--
-- 資料表結構 `carousel`
--

CREATE TABLE `carousel` (
  `caro_id` int(3) NOT NULL COMMENT '輪播編號',
  `caro_title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '輪播標題',
  `caro_alt` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `caro_content` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '輪播內容介紹',
  `caro_online` tinyint(1) NOT NULL DEFAULT '1' COMMENT '上下架',
  `caro_sort` int(3) NOT NULL COMMENT '輪播排序',
  `caro_pic` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '輪播圖檔名稱',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `carousel`
--

INSERT INTO `carousel` (`caro_id`, `caro_title`, `caro_alt`, `caro_content`, `caro_online`, `caro_sort`, `caro_pic`, `p_id`, `create_date`) VALUES
(1, '產地挑選現撈海鮮、透過三去處理、嚴選把關漁獲品質。', '', NULL, 1, 1, '1920-750.png', 0, '2022-11-01 08:26:17'),
(2, '', '店內展示圖1', NULL, 1, 2, '1920-750-2.png', 0, '2022-11-01 08:28:51'),
(3, '', '店內展示圖2', NULL, 1, 3, '1920-750-3.png', 0, '2022-11-01 08:29:17');

-- --------------------------------------------------------

--
-- 資料表結構 `cart`
--

CREATE TABLE `cart` (
  `cartid` int(10) NOT NULL COMMENT '購物車編號',
  `emailid` int(10) DEFAULT NULL COMMENT '會員編號',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `qty` int(3) NOT NULL COMMENT '產品數量',
  `orderid` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '訂單編號',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '訂單處理狀態',
  `ip` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '訂購者的IP',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入購物車時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `cart`
--

INSERT INTO `cart` (`cartid`, `emailid`, `p_id`, `qty`, `orderid`, `status`, `ip`, `create_date`) VALUES
(1, NULL, 5, 1, NULL, 1, '::1', '2022-12-07 08:31:41');

-- --------------------------------------------------------

--
-- 資料表結構 `city`
--

CREATE TABLE `city` (
  `AutoNo` int(10) NOT NULL COMMENT '城市編號',
  `Name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT '城市名稱',
  `cityOrder` tinyint(2) NOT NULL COMMENT '標記',
  `State` smallint(6) NOT NULL COMMENT '狀態'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `city`
--

INSERT INTO `city` (`AutoNo`, `Name`, `cityOrder`, `State`) VALUES
(1, '臺北市', 0, 0),
(2, '基隆市', 0, 0),
(3, '新北市', 0, 0),
(4, '宜蘭縣', 0, 0),
(5, '新竹市', 0, 0),
(6, '新竹縣', 0, 0),
(7, '桃園市', 0, 0),
(8, '苗栗縣', 0, 0),
(9, '台中市', 0, 0),
(10, '彰化縣', 0, 0),
(11, '南投縣', 0, 0),
(12, '雲林縣', 0, 0),
(13, '嘉義市', 0, 0),
(14, '嘉義縣', 0, 0),
(15, '台南市', 0, 0),
(16, '高雄市', 0, 0),
(17, '南海諸島', 0, 0),
(18, '澎湖縣', 0, 0),
(19, '屏東縣', 0, 0),
(20, '台東縣', 0, 0),
(21, '花蓮縣', 0, 0),
(22, '金門縣', 0, 0),
(23, '連江縣', 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `hot`
--

CREATE TABLE `hot` (
  `h_id` int(3) NOT NULL COMMENT '熱銷商品流水號',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `h_sort` int(3) DEFAULT NULL COMMENT '熱銷商品排名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `hot`
--

INSERT INTO `hot` (`h_id`, `p_id`, `h_sort`) VALUES
(1, 16, 1),
(2, 2, 2),
(3, 5, 3),
(4, 11, 4),
(5, 1, 5),
(6, 39, 6),
(7, 17, 7),
(8, 12, 8);

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `emailid` int(11) NOT NULL COMMENT 'email流水號',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'email帳號',
  `pw1` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '密碼',
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否啟動',
  `cname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '中文姓名',
  `tssn` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份證字號',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `imgname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '相片檔名',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `member`
--

INSERT INTO `member` (`emailid`, `email`, `pw1`, `active`, `cname`, `tssn`, `birthday`, `imgname`, `create_date`) VALUES
(1, 'test@gmail.com', '123456', 1, '林先生', 'A123456789', '2022-10-24', NULL, '2022-11-24 06:34:43'),
(2, 'test02@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 'test02', 'A123456789', '2022-12-07', '989df49a842ce9f87895', '2022-12-07 08:28:17');

-- --------------------------------------------------------

--
-- 資料表結構 `new`
--

CREATE TABLE `new` (
  `new_id` int(3) NOT NULL COMMENT '新商品流水號',
  `p_id` int(10) NOT NULL COMMENT '產品編號	',
  `new_sort` int(3) DEFAULT NULL COMMENT '新商品順序	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `new`
--

INSERT INTO `new` (`new_id`, `p_id`, `new_sort`) VALUES
(1, 3, 1),
(2, 21, 2),
(3, 58, 3),
(4, 23, 4),
(5, 33, 5),
(6, 36, 6),
(7, 42, 7),
(8, 18, 8),
(9, 52, 9),
(10, 7, 10),
(11, 44, 11),
(12, 26, 12),
(13, 32, 13),
(14, 53, 14),
(15, 47, 15),
(16, 28, 16),
(17, 6, 17),
(18, 37, 18),
(19, 55, 19),
(20, 49, 20);

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `classid` int(3) NOT NULL COMMENT '產品類別',
  `p_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '產品名稱',
  `p_intro` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '產品簡介',
  `p_price` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '產品單價',
  `p_set` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '產品單位',
  `p_open` tinyint(1) NOT NULL DEFAULT '1' COMMENT '上架',
  `p_content` text COLLATE utf8_unicode_ci COMMENT '產品詳細規格',
  `p_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '產品輸入日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `product`
--

INSERT INTO `product` (`p_id`, `classid`, `p_name`, `p_intro`, `p_price`, `p_set`, `p_open`, `p_content`, `p_date`) VALUES
(1, 2, '巴拿馬白蝦', '純淨海水養殖，養殖過程和環境都經過，嚴格檢驗與篩選。', '300', ' / 盒', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：巴拿馬白蝦 40/50</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：300元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：850g&nbsp;</span><span style=\"font-weight:bold;\">± 50g</span><br>\r\n&nbsp; &nbsp;&nbsp;<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#f39c12;\">本商品非以真空包裝, 商品總重會包括部分之結冰(含一定的包冰率)</span></span><br>\r\n&nbsp; &nbsp; <span style=\"color:#ffffff;\"><span style=\"background-color:#f39c12;\">購物前請務必閱讀, 同意後再行下單</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\"><span style=\"font-weight:bold;\">▼原產地：巴拿馬</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存，退冰即食</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-01 08:13:33'),
(2, 2, '巨無霸明蝦', '明蝦被廣泛應用在高級菜色中，新鮮美味，鮮美大明蝦，肉質爽脆。高級海鮮，深受國內外消費者喜愛。', '1680 ', ' / 盒', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：巨無霸明蝦(8-10尾)</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：1680元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：1000g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存，退冰即食</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-02 03:43:48'),
(3, 2, '生食級胭脂蝦', '基隆八斗子生食級胭脂蝦，生長於海底火山附近，屬深海蝦，生食、熟食都非常美味。', '399 ', ' / 盒', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：生食級胭脂蝦 </span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：399元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：1200g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存，退冰即食</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>\r\n', '2022-11-02 03:45:54'),
(4, 2, '生凍帝王蟹腳', '來自南極海域純淨的頂極美味，捕撈後隨即急速鮮凍，保留天然海味與完整營養，肉質肥美飽滿鮮味十足。', '1588 ', ' / 包', 1, '<div class=\"product-description\"><span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:18px;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#e67e22;\">&nbsp; &nbsp;斷裂屬正常現象請同意後再行訂購&nbsp; &nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：生凍帝王蟹腳(6/7)</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：1588元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：600g~700g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n&nbsp; &nbsp;&nbsp;<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#f39c12;\">本商品非以真空包裝, 商品總重會包括部分之結冰(含一定的包冰率)</span></span><br>\r\n&nbsp; &nbsp; <span style=\"color:#ffffff;\"><span style=\"background-color:#f39c12;\">購物前請務必閱讀, 同意後再行下單</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\">▼原產地：智利<br>\r\n<br>\r\n▼保存期限：詳情請見商品標示<br>\r\n<br>\r\n▼保存方式：冷凍(-18<sup>0</sup>C)保存<br>\r\n<br>\r\n▼解凍方式：<br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）<br>\r\n<span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#4e5f70;\">【本產品已投保兩千萬產品責任險】<br>\r\n製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-02 03:47:30'),
(5, 2, '熟凍麵包蟹', '生長在純淨的愛爾蘭海域，體型較大，最多膏的蟹種之一，號稱「膏蟹之王」。', '350 ', ' / 隻', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：熟凍麵包蟹</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：350元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：400g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：英國</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存，退冰即食</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-02 03:48:25'),
(6, 2, '老劍蝦', '劍蝦為中型蝦類之最，具備蝦甜味濃肉緊實三特色於一身雖蝦身不大，但滋味養殖蝦難以比擬。', '300 ', ' / 盒', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：老劍蝦</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：360元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：600g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：基隆</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存，退冰即食</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-02 03:49:09'),
(7, 2, '特大天使紅蝦', '阿根廷新鮮捕撈急速冷凍，等級與日本牡丹蝦並列，日本料理專用蝦甜度高、肉質細緻綿密。', '790', ' / 盒', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：特大天使紅蝦 (生食級)</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：790元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：(L2規格) 2000g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n&nbsp; &nbsp;&nbsp;<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#f39c12;\">本商品非以真空包裝, 商品總重會包括部分之結冰(含一定的包冰率)</span></span><br>\r\n&nbsp; &nbsp; <span style=\"color:#ffffff;\"><span style=\"background-color:#f39c12;\">購物前請務必閱讀, 同意後再行下單</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\"><span style=\"font-weight:bold;\">▼原產地：阿根廷</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存，退冰即食</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-02 03:49:51'),
(8, 2, '特大台灣白蝦仁', 'Q彈、鮮美口感，肉質爽脆蒸、煮、烤、炸，變化多端。', '280', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#e74c3c;\">&nbsp;</span><span style=\"font-weight:bold;\"><span style=\"background-color:#e74c3c;\">&nbsp;特價 2包 $440&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：特大台灣白蝦仁</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：280元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：300g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存，退冰即食</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span></span></span>&nbsp;</div>', '2022-11-02 03:50:46'),
(9, 2, '純正蟹管肉', '新鮮急速冷凍，保留原味，加入辛香爆炒，簡單快炒，3分鐘料理輕鬆上桌。', '175 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：純正蟹管肉(大)</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：175元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：180g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：越南</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存，退冰即食</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-02 03:51:38'),
(10, 2, '高品質藍花蟹-公', '來自泰國&斯里蘭卡純淨無汙染海域，遠洋梭子蟹屬中的野生蟹，多肉。', '150 ', ' / 隻', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：高品質藍花蟹(公)</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：150元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：300g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：斯里蘭卡</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存，退冰即食</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-02 03:52:34'),
(11, 2, '頂級軟殼蟹 ', '純天然養殖，蟹身保存全蟹最細嫩、鮮美的狀態，含有豐富蛋白質礦物質​，免剝殼好處理。', '380', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：頂級軟殼蟹 (10入)</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：380元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：600g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：緬甸</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存，退冰即食</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-02 03:53:18'),
(12, 2, '超大肥豬蝦', '深海陽光少照射、外型白、肉嫩的野生肥豬蝦，肉質緊緻鮮甜，且富有彈性。', '1080 ', ' / 盒', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：超大肥豬蝦（7P）</span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼售價：1080元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：1000g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n&nbsp; &nbsp;&nbsp;<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#f39c12;\">本商品非以真空包裝, 商品總重會包括部分之結冰(含一定的包冰率)</span></span><br>\r\n&nbsp; &nbsp; <span style=\"color:#ffffff;\"><span style=\"background-color:#f39c12;\">購物前請務必閱讀, 同意後再行下單</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\"><span style=\"font-size:20px;\">▼原產地：<br>\r\n<br>\r\n▼保存期限：詳情請見商品標示<br>\r\n<br>\r\n▼保存方式：冷凍(-18<sup>0</sup>C)保存<br>\r\n<br>\r\n▼解凍方式：<br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）<br>\r\n<span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-02 03:54:01'),
(13, 3, '山泉鱸魚', '山泉活鱸魚飼養於宜蘭山區，水質為天然湧泉，採用全野生放養，肉質結實鮮美，一般養殖鱸魚無法媲美。', '190 ', ' / 片', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：山泉鱸魚(蝴蝶切)</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：190元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：400g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存<span style=\"background-color:#e67e22;\">(小心魚刺)</span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-02 05:37:09'),
(14, 3, '龍虎斑', '龍虎斑擁有龍膽石斑的結實口感，以及老虎斑魚皮膠質與彈性的特性，口感與肉質超越野生石斑魚。', '350', ' / 尾', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：龍虎斑</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：350元&nbsp;<span style=\"background-color:#3498db;\">&nbsp;</span><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">(含真空服務)&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼規格：850g ± 10%&nbsp;</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存&nbsp;<span style=\"background-color:#e67e22;\">(小心魚刺)</span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-02 05:38:00'),
(15, 118, '日本熟凍香螺', '肉質鮮甜 富有彈性，口感非常Ｑ彈 怎麼料理都無敵好吃。', '199元 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：日本青森縣熟凍香螺 </span>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"></span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：199元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：500g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：日本</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-02 05:39:12'),
(16, 118, '北海道帆立貝', '在日本捕撈後迅速高溫川燙保鮮，並急速冷凍保留帆立貝鮮甜。', '480 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：北海道帆立貝(L)</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：480元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：800g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：北海道</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-02 05:39:51'),
(17, 118, '北海道特等干貝', '濃郁鮮甜，顆顆飽滿圓潤，日本生食級干貝，口感柔嫩Q彈、細緻甘甜。', '1150 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：北海道特等干貝</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：1150元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：1000g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：日本 (北海道)</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-02 05:40:36'),
(18, 118, '活凍竹蛤', '外殼細長，肉質肥美Q彈，比蛤蜊更肥厚 只有老饕才懂的美味。', '170', ' / 盒', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：活凍竹蛤</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：170元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：1000g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：巴基斯坦</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼貼心小提醒 : 竹蛤需川燙後再調味烹煮，料理前需用水沖泡，清洗沙子，因殼很薄，小力清洗即可。黑色內臟部分請先去除後，再料理。</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-02 05:41:07'),
(19, 118, '特大鳳螺', '下酒菜必備人氣商品，有脆勁的鳳螺，牙齒的每一角落都能徹底感受到彈牙的滋味。', '450 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：特大鳳螺 (30/50)</span><br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#f39c12;\">&nbsp; &nbsp;小提醒:鳳螺川燙後再烹煮調味!&nbsp; &nbsp;</span></span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：450元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：2000g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：印度</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-02 05:41:43');
INSERT INTO `product` (`p_id`, `classid`, `p_name`, `p_intro`, `p_price`, `p_set`, `p_open`, `p_content`, `p_date`) VALUES
(20, 118, '去殼鮑魚', '肉質軟嫩不失嚼勁，只要簡單川燙、冰鎮，加上美乃滋或醬料，就是大方又好吃高級料理！', '1080 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：去殼鮑魚</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：1080元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：800g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：中國</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-02 05:42:23'),
(21, 119, '基隆大砲管', '超肥又厚，鮮脆可口 整個就是無敵....讚啦，每尾45公分以上。', '569 ', ' / 隻', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：基隆大砲管 (800g)</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：569元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：800g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：台灣 (基隆)</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-02 05:42:50'),
(22, 3, '龍膽石斑 (肚)', '擁有斑中之王的美譽，龍膽石斑是體型最大的石斑魚，蛋白質高且脂肪含量低。', '280 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：龍膽石斑 (肚)</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：280元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：500g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存<span style=\"background-color:#e67e22;\">(小心魚刺)</span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 06:59:11'),
(23, 3, '去刺虱目魚肚', '肉質Q彈，鮮嫩甜美，具有豐富蛋白質與維生素，貼心去刺，老人小孩安心食用。', '140 ', ' / 片', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：去刺虱目魚肚(小)</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：140元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：150g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存<span style=\"background-color:#e67e22;\">(小心魚刺)</span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n4.真空商品在配送過程有可能因為晃動，而發生失去真空現象，不影響商品品質，不得作為退貨理由。&nbsp;</span></span>&nbsp;</div>', '2022-11-03 07:00:32'),
(24, 3, '挪威鯖魚片 ', '挪威進口白腹鯖魚，產地速凍新鮮直送，來自挪威冰冷海域，肉質細膩油脂豐富且鮮美。', '130 ', ' / 片', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：A級挪威鯖魚片</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：130元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：200g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：挪威</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存，<span style=\"background-color:#e67e22;\">(小心魚刺)</span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 07:01:20'),
(25, 3, '頂級智利鮭魚片 ', '超厚的智利鮭魚切片，選自腹部脂肪最多的部位，吃起來更多汁軟嫩。', '250 ', ' / 片', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：頂級智利鮭魚片</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：250元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：460g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：智利</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存<span style=\"background-color:#e67e22;\">(小心魚刺)</span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 07:01:58'),
(26, 3, '智利鮭魚下巴', '魚下巴擁有足夠的油脂，口感鮮嫩肉質美味，怎樣料理都好吃！', '250 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：頂級智利鮭魚下巴</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：250元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：1000g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：智利</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存<span style=\"background-color:#e67e22;\">(小心魚刺)</span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-03 07:02:33'),
(27, 3, 'A級土魠切片', '新鮮嚴選 即速冷凍 鮮度味美，含豐富DHA、EPA、膠原蛋白、不飽和脂肪酸。', '200 ', ' / 片', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品</span></span><span style=\"font-weight:bold;\">名：A級土魠切片</span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-weight:bold;\">▼售價：200元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼規格/淨重：375g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：印尼</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存<span style=\"background-color:#e67e22;\">(小心魚刺)</span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span>&nbsp;</div>', '2022-11-03 07:03:12'),
(28, 3, '台灣吻仔魚', '嚴選特級吻仔魚，不含漂白劑食用更安心，簡單料理即享美味，適合一家大小所食用！', '165 ', ' / 盒', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：台灣頂級吻仔魚(大)&nbsp;</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：165元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：200g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存，退冰即食</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 07:03:45'),
(29, 3, '爆蛋柳葉魚', '每隻都是擁有滿肚爆卵的金黃魚蛋，飽滿含卵率，且肉質細嫩、魚骨細小，整尾都可以食用！', '140 ', ' / 盒', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：爆蛋柳葉魚</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：140元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：300g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：紐西蘭</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存<span style=\"background-color:#e67e22;\">(小心魚刺)</span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-03 07:04:20'),
(30, 3, '秋刀魚', '富含維生素B12、DHA，最富CP值的高營養魚種，通過SGS重金屬、藥物殘留檢驗', '130 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：秋刀魚(5入)</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：130元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：5入</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存<span style=\"background-color:#e67e22;\">(小心魚刺)</span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 07:04:55'),
(31, 3, '肉鯽魚', '船撈急凍，鮮度鮮美！魚體厚實肥美，富油脂好吃， 肉質細嫩，少刺甜美。', '230', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：肉鯽魚(4P)</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：230元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼規格/淨重：4入</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存，退冰即食<span style=\"background-color:#e67e22;\">(小心魚刺)</span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span><br>\r\n<br>\r\n&nbsp;&nbsp;</div>', '2022-11-03 07:05:26'),
(32, 3, '巴沙魚 ', '肉質綿密細緻，無骨無刺，無魚腥味，入口即化，可酥炸、鮮煮多種料理方式。', '189 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：3入巴沙魚</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：189元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：3入</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存<span style=\"background-color:#e67e22;\">(小心魚刺)</span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-03 07:05:57'),
(33, 3, '生食級鯛魚片 ', '台灣鯛採用友善土地養殖方式，通過多種藥物檢驗，並在HACCP作業管制下生產，從活魚急速凍結。', '150', ' / 片', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：生食級鯛魚片 (250g)</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：150元&nbsp;<span style=\"color:#ffffff;\"></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：250g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存，退冰即食</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 07:06:32'),
(34, 119, '基隆脆卷', '小卷蛋白質含量高，並含有大量的高度不飽和脂肪酸 EPA、DHA是營養補充的聖品。', '150 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：基隆脆卷</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：150元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：300g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-03 07:07:09'),
(35, 119, '台灣小章魚', '一口一個超過癮，吃起來小巧優雅，清脆爽口，低熱量高營養，極高ＣＰ值的選擇。', '220 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：台灣小章魚</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：220元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：500g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-03 07:07:40'),
(36, 119, '冰捲 ', '外皮如水晶般晶瑩剔透，無論在鮮度、甜度上與都是最上等的品質。', '99 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：冰卷</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：99元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：300g&nbsp;</span><span style=\"font-weight:bold;\">± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-03 07:08:51'),
(37, 121, '巨無霸霜降牛排 ', '取用牛隻肩胛部位,屬於牛隻律動均衡之處，肌肉發達纖瘦結實,富含大理石紋油花。', '289 ', ' / 片', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：巨無霸霜降牛排</span>&nbsp;<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：289元</span></span></span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-size:20px;\"><span style=\"font-weight:bold;\">▼包裝規格：</span></span></span><span style=\"font-size:20px;\"><span style=\"font-weight:bold;\">450g ± 10% (約16盎司)</span></span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-size:20px;\"><span style=\"font-weight:bold;\">▼原產地：美國</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 07:09:27'),
(38, 121, '美國帶骨牛小排', '油花分佈均勻，肉質軟嫩，口感柔嫩多汁，散發誘人牛肉香氣，老饕級的上等食材。', '300 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：美國帶骨牛小排(小)</span>&nbsp;<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：</span></span><span style=\"font-weight:bold;\">300元</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼</span></span></span><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-size:20px;\"><span style=\"font-weight:bold;\">包裝規格：</span></span></span><span style=\"font-size:20px;\"><span style=\"font-weight:bold;\">500g±10%</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼原產地：美國</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 07:10:07'),
(39, 121, '美國翼板牛排', '下肩胛翼板，為下肩胛襯底板肉及肩胛小排之間的精肉。肉的厚度均勻，肉質有咬感，風味濃郁。', '589', ' / 片', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：美國翼板牛排</span>&nbsp;<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：589元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼</span></span></span><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-size:20px;\"><span style=\"font-weight:bold;\">包裝規格：</span></span></span><span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">700</span><span style=\"font-weight:bold;\">±10<span style=\"text-decoration:underline;\">g</span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：美國</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 07:10:42'),
(40, 121, '美牛骰子', '肉質富含大理石紋油花，肉質鮮甜多汁且帶肉筋的口感嚼勁十足。', '120 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：美牛骰子</span>&nbsp;</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：120元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼</span></span><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-size:20px;\"><span style=\"font-weight:bold;\">包裝規格：</span></span></span><span style=\"font-size:20px;\"><span style=\"font-weight:bold;\">200g ± 10%</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼原產地：美國</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"font-size:16px;\"><span style=\"color:#d35400;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span><br>\r\n<br>\r\n<br>\r\n【本產品已投保兩千萬產品責任險】<br>\r\n製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3&nbsp;</span>&nbsp;</div>', '2022-11-03 07:11:12'),
(41, 121, '美國牛五花肉片', '油花分布較多、厚切多汁、肉質紮實軟嫩，每一口都令人驚豔！', '250 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：美國牛五花肉片(600g)</span>&nbsp;<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：</span></span><span style=\"font-weight:bold;\">250元</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼</span></span></span><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-size:20px;\"><span style=\"font-weight:bold;\">包裝規格：</span></span></span><span style=\"font-size:20px;\"><span style=\"font-weight:bold;\">600g±10%</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼原產地：美國</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 07:11:44'),
(42, 121, '去骨牛小排', '取自牛隻胸腹肉部位，此部位肉質厚實且肌里完美~所以肉質富含豐富雪花般油花', '299 ', ' / 片', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：去骨牛小排 (熟成) (200g)</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：299元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：200±10<span style=\"text-decoration:underline;\">g</span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：美國</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 07:12:19'),
(43, 121, '熟成CH板腱牛排', '精選優質榖飼美國牛，並選自CHOICE級板腱牛排，肉質Q嫩可口，油花分佈均勻。', '409 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：熟成CH板腱牛排 (500g)</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：409元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：500±10<span style=\"text-decoration:underline;\">g</span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：美國</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 07:12:48'),
(44, 121, 'CH板腱肉片', '美國安格斯特級CH板腱牛肉片，板腱位於牛肩胛的內側，也俗稱牛肩胛或嫩肩里肌。', '350 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：CH板腱肉片</span>&nbsp;&nbsp;<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：</span><span style=\"font-weight:bold;\">350元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：500g±10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：美國</span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span></span></span><br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\">1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-03 07:13:39');
INSERT INTO `product` (`p_id`, `classid`, `p_name`, `p_intro`, `p_price`, `p_set`, `p_open`, `p_content`, `p_date`) VALUES
(45, 121, '美國牛肋條', '採牛隻肋骨之間帶筋帶油的肋條肉，無須久燉即鮮嫩滑口。', '399', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：美國牛肋條</span>&nbsp;<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：</span></span><span style=\"font-weight:bold;\">399元</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼包裝規格：</span></span><span style=\"font-weight:bold;\">550g ± 10%</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼原產地：美國</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 07:14:19'),
(46, 121, '澳洲牛舌燒肉片 ', '澳洲穀飼牛舌，只取舌根部位（牛舌最柔嫩部位），肉質鮮嫩口感Q彈。', '380 ', ' / 盒', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：澳洲牛舌燒肉片</span>&nbsp;</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：380元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼</span><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">包裝規格：</span></span><span style=\"font-weight:bold;\">100g±10%</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼原產地：澳洲</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 07:14:53'),
(47, 122, '豬梅花肉片', '嚴選優質國產豬從飼養到宰殺嚴格控管，取自豬前腿靠近背的部位又稱肩胛肉。', '228 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：豬梅花肉片(600g)</span>&nbsp;<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：228</span></span><span style=\"font-weight:bold;\">元</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼包裝規格：</span></span><span style=\"font-weight:bold;\">600g±10%</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 07:15:33'),
(48, 122, '台灣梅花黑豬肉', '老品種的台灣黑豬，擁有桃園豬的細緻Q彈肉質，梅山豬柔嫩多汁的脂肪優勢。', '250', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：台灣梅花黑豬肉</span>&nbsp;<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：250</span></span><span style=\"font-weight:bold;\">元</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼包裝規格：550g</span></span><span style=\"font-weight:bold;\">±</span><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">10%</span></span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 07:16:05'),
(49, 122, '台灣豬五花肉片', '高品質國產豬五花，油花分布勻稱，細切0.2cm薄度，適合燒肉及火鍋烹調。', '238 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：台灣豬五花肉片</span>&nbsp;<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：238</span></span><span style=\"font-weight:bold;\">元</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼包裝規格：600</span></span><span style=\"font-weight:bold;\">g±10%</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 07:16:31'),
(50, 122, '黑毛松阪豬肉片', '松阪豬位於豬頰和下巴連接處，肉質特別緊實彈牙，口感嫩中帶脆。', '350', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：黑毛松阪豬肉片</span>&nbsp;<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：</span></span><span style=\"font-weight:bold;\">350元</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼包裝規格：</span></span><span style=\"font-weight:bold;\">500g±10%</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-03 07:17:00'),
(51, 122, '去皮黑毛豬五花', '黑毛豬肉質佳且肌內脂肪豐富，吃起來沒有豬肉的腥味、肉質軟嫩而有彈性。', '249 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：去皮黑毛豬五花 (600g)&nbsp;</span>&nbsp;<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：</span></span><span style=\"font-weight:bold;\">249元</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼規格/淨重：</span></span><span style=\"font-weight:bold;\">600g±10%</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 07:17:38'),
(52, 122, '伊比利豬肉片 ', '伊比利豬會大量食用橡樹的果實橡子，因此肉中會散發榛果香味。', '390', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：伊比利豬梅花肉片</span>&nbsp;<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：</span></span><span style=\"font-weight:bold;\">390元</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼包裝規格：</span></span><span style=\"font-weight:bold;\">500g±10%</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼原產地：西班牙</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-03 07:18:15'),
(53, 122, '伊比利肋條', '取自肋骨及肋骨之間的精肉，有著紮實的嚼勁及甘甜脂肪，風味濃郁蘊藏橡樹果實的芳香', '330', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：伊比利肋條</span>&nbsp;<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：</span></span><span style=\"font-weight:bold;\">330元</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼包裝規格：</span></span><span style=\"font-weight:bold;\">500g±10%</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼原產地：西班牙</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 07:39:12'),
(54, 122, '豬棒棒腿', '它位於豬隻後腿部的蹄膀內，肉多帶骨、軟嫩Q彈，形狀像棒棒糖俗稱「棒棒腿」。', '150 ', ' / 盒', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：豬棒棒腿 (黑胡椒)</span>&nbsp;<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：150元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：00g ± 10%</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-03 08:01:20'),
(55, 124, '爆漿雞腿捲', '雞皮包裹超嫩雞腿肉，紮實口感香氣爆表！煎蒸炸烤，簡單料理又好吃！', '150 ', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：爆漿雞腿捲(6入)</span>&nbsp;<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：</span></span><span style=\"font-weight:bold;\">150元</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼包裝規格：</span></span><span style=\"font-weight:bold;\">400g±10%</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span>&nbsp;</div>', '2022-11-03 08:01:57'),
(56, 124, '原味雞腿排', '嚴選高品質新鮮雞腿肉，肉質紮實有彈性，份量厚實，貼心去骨處理，方便料理享用。', '70', ' / 片', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：原味雞腿排</span>&nbsp;<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：70元</span></span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼包裝規格：300g±10%</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼原產地：美國</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span></span>&nbsp;</div>', '2022-11-03 08:02:36'),
(57, 124, '紐奧良雞腿排 ', '雞腿肉扎實鮮嫩，採用特製甜辣醬汁醃製，家庭料理的好選擇。', '75 ', ' / 片', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：紐奧良雞腿排</span>&nbsp;<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：75元</span></span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼包裝規格：300g±10%</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼原產地：美國</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span></span>&nbsp;</div>', '2022-11-03 08:03:13'),
(58, 124, '十八香雞腿排 ', '經典十八香風味！鮮嫩去骨雞腿排，以眾香子、花椒、八角、小茴香......等辛香料醃製入味。', '75 ', ' / 片', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：十八香雞腿排</span>&nbsp;<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：75元</span></span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼包裝規格：300g±10%</span><br>\r\n<br>\r\n<span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼原產地：美國</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。</span></span></span>&nbsp;</div>', '2022-11-03 08:03:45'),
(59, 124, '碳烤燒肉雞翅', '淡淡檸檬香讓整隻雞翅帶點酸甜感受，酥酥脆脆的外皮 裡層雞肉香嫩完全愛不釋手。', '220', ' / 包', 1, '<div class=\"product-description\"><br>\r\n<span style=\"font-size:24px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#2ecc71;\">&nbsp;<span style=\"font-weight:bold;\"> 大量訂購請洽詢客服&nbsp;&nbsp;</span></span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#ffffff;\"><span style=\"background-color:#3498db;\">&nbsp; &nbsp;商品規格&nbsp; &nbsp;</span></span></span></span></span><br>\r\n<br>\r\n<span style=\"font-size:20px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">▼品名：碳烤燒肉雞翅 ( 檸檬香 )</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼售價：220元</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼包裝規格：700±10<span style=\"text-decoration:underline;\">g</span></span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼原產地：台灣</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存期限：詳情請見商品標示</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼保存方式：冷凍(-18<sup>0</sup>C)保存</span><br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼解凍方式：</span><br>\r\n1. 冷凍商品請在拆封前先置於冰箱冷藏室自然解凍或流水解凍，不宜室溫解凍。<br>\r\n2. 當次未食用完之食材，可用保鮮袋或保鮮盒置於冰箱冷藏保存，期限以不超過24小時為佳。<br>\r\n3. 勿將食材反覆回溫、冷凍，開封後以一次食用完畢為佳，避免反覆退凍影響品質。<br>\r\n<br>\r\n<span style=\"font-weight:bold;\">▼其他注意事項<br>\r\n(請同意後再行訂購，如有疑慮可先聯繫客服確認）</span><br>\r\n<span style=\"font-weight:bold;\"><span style=\"color:#d35400;\">1. 網站商品照片因個人螢幕規格以及解析度不同，可能會與商品實體有些色差。<br>\r\n2. 比例尺圖為示意參考用，生鮮商品具有個體差異特性，以實際到貨商品為主。<br>\r\n3. 生鮮商品為時價，若因為價格波動或缺貨情形，請依客服最終報價為主。<br>\r\n4. 真空商品於配送過程中可能因為晃動，而發生失去真空現象，此不影響商品品質，無法作為退換貨理由。<br>\r\n5. 考量食品衛生安全，易於腐敗、保存期限較短之商品不適用7天鑑賞期規定。商品到貨後，請立即確認品項及數量是否正確，如非人為因素導致商品毀損，請於收貨當日拍照存證，並立即與客服聯繫，本公司會進行商品瑕疵或損壞鑑定，確認後會儘速補寄新品給您；超過隔日恕不受理。<br>\r\n6. 辦理退換貨請留存發票並保持商品整體完整，再依[購物說明]中之{退換貨處理辦法}辦理。</span></span></span></span><br>\r\n<br>\r\n<br>\r\n<span style=\"color:#4e5f70;\"><span style=\"font-size:18px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">【本產品已投保兩千萬產品責任險】</span></span></span><br>\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Times New Roman,Times,serif;\"><span style=\"font-weight:bold;\">製造/進口商名稱: 阿布潘水產股份有限公司<br>\r\n製造/進口商電話號碼: 04-24391456<br>\r\n製造/進口商地址: 台中市北屯區環中東路二段125之3號<br>\r\n商品保存期限: 依產品包裝標示為準<br>\r\n投保產品責任險字號: 南山產物產品責任號0900-2236007842-01<br>\r\n食品業者登錄字號:B-183282687-00000-3</span></span></span></span>&nbsp;</div>', '2022-11-03 08:04:09');

-- --------------------------------------------------------

--
-- 資料表結構 `product_img`
--

CREATE TABLE `product_img` (
  `img_id` int(11) NOT NULL COMMENT '圖檔編號',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `img_file` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '圖檔名稱',
  `sort` int(2) NOT NULL COMMENT '圖片順序',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `product_img`
--

INSERT INTO `product_img` (`img_id`, `p_id`, `img_file`, `sort`, `create_date`) VALUES
(1, 1, '巴拿馬白蝦600-375.png', 1, '2022-11-02 05:45:33'),
(2, 2, '巨無霸明蝦600-375.png', 1, '2022-11-02 05:46:24'),
(3, 3, '生食級胭脂蝦600-375.png', 1, '2022-11-02 05:46:53'),
(4, 4, '生凍帝王蟹腳600-375.png', 1, '2022-11-02 05:47:13'),
(5, 5, '熟凍麵包蟹600-375.png', 1, '2022-11-02 05:47:36'),
(6, 6, '老劍蝦600-375.png', 1, '2022-11-02 05:49:48'),
(7, 7, '特大天使紅蝦600-375.png', 1, '2022-11-02 05:51:49'),
(8, 8, '特大台灣白蝦仁600-375.png', 1, '2022-11-02 05:52:56'),
(9, 9, '純正蟹管肉600-375.png', 1, '2022-11-02 05:54:19'),
(10, 10, '高品質藍花蟹-公600-375.png', 1, '2022-11-02 05:55:32'),
(11, 11, '頂級軟殼蟹600-375.png', 1, '2022-11-02 05:56:35'),
(12, 12, '超大肥豬蝦600-375.png', 1, '2022-11-02 05:57:47'),
(13, 13, '山泉鱸魚600-375.png', 1, '2022-11-02 05:58:05'),
(14, 14, '龍虎斑600-375.png', 1, '2022-11-02 05:59:09'),
(15, 15, '日本青森縣熟凍香螺600-375.png', 1, '2022-11-02 05:59:28'),
(16, 16, '北海道帆立貝600-375.png', 1, '2022-11-02 05:59:48'),
(17, 17, '北海道特等干貝600-375.png', 1, '2022-11-02 06:00:09'),
(18, 18, '活凍竹蛤600-375.png', 1, '2022-11-02 06:00:29'),
(19, 19, '特大鳳螺600-375.png', 1, '2022-11-02 06:01:40'),
(20, 20, '去殼鮑魚600-375.png', 1, '2022-11-02 06:02:51'),
(21, 21, '基隆大砲管600-375.png', 1, '2022-11-02 06:03:08'),
(22, 22, '龍膽石斑肚600-375.png', 1, '2022-11-03 08:05:50'),
(23, 23, '去刺虱目魚肚600-375.png', 1, '2022-11-03 08:05:50'),
(24, 24, '挪威鯖魚片600-375.png', 1, '2022-11-03 08:05:50'),
(25, 25, '頂級智利鮭魚片600-375.png', 1, '2022-11-03 08:05:50'),
(26, 26, '頂級智利鮭魚下巴600-375.png', 1, '2022-11-03 08:05:50'),
(27, 27, '頂級土魠魚600-375.png', 1, '2022-11-03 08:05:50'),
(28, 28, '台灣特級吻仔魚600-375.png', 1, '2022-11-03 14:02:11'),
(29, 29, '爆蛋柳葉魚600-375.png', 1, '2022-11-03 14:02:47'),
(30, 30, '秋刀魚600-375.png', 1, '2022-11-03 14:02:47'),
(31, 31, '肉鯽魚600-375.png', 1, '2022-11-03 14:02:47'),
(32, 32, '巴沙魚600-375.png', 1, '2022-11-03 14:02:47'),
(33, 33, '生食級鯛魚片600-375.png', 1, '2022-11-03 14:02:47'),
(34, 34, '基隆小卷600-375.png', 1, '2022-11-03 14:02:47'),
(35, 35, '台灣小章魚600-375.png', 1, '2022-11-03 14:02:47'),
(36, 36, '冰卷600-375.png', 1, '2022-11-03 14:02:47'),
(37, 37, '巨無霸霜降牛排600-375.png', 1, '2022-11-03 14:02:47'),
(38, 38, '美國帶骨牛小排600-375.png', 1, '2022-11-03 14:02:47'),
(39, 39, '美國翼板牛排600-375.png', 1, '2022-11-03 14:02:47'),
(40, 40, '美牛骰子600-375.png', 1, '2022-11-03 14:02:47'),
(41, 41, '美國牛五花肉片600-375.png', 1, '2022-11-03 14:02:47'),
(42, 42, 'CH去骨牛小排600-375.png', 1, '2022-11-03 14:02:47'),
(43, 43, '熟成CH板腱牛排600-375.png', 1, '2022-11-03 14:02:47'),
(44, 44, 'CH板腱肉片600-375.png', 1, '2022-11-03 14:02:47'),
(45, 45, '牛肋條600-375 .png', 1, '2022-11-03 14:02:47'),
(46, 46, '澳洲牛舌燒肉片600-375.png', 1, '2022-11-03 14:02:47'),
(47, 47, '豬梅花肉片600-375.png', 1, '2022-11-03 14:02:47'),
(48, 48, '台灣梅花黑豬肉600-375.png', 1, '2022-11-03 14:02:47'),
(49, 49, '台灣豬五花肉片600-375.png', 1, '2022-11-03 14:02:47'),
(50, 50, '黑毛松阪豬肉片600-375.png', 1, '2022-11-03 14:02:47'),
(51, 51, '去皮黑毛豬五花600-375 .png', 1, '2022-11-03 14:02:47'),
(52, 52, '伊比利豬梅花肉片600-375.png', 1, '2022-11-03 14:02:47'),
(53, 53, '伊比利肋條600-375.png', 1, '2022-11-03 14:02:47'),
(54, 54, '豬棒棒腿600-375.png', 1, '2022-11-03 14:02:47'),
(55, 55, '爆漿雞腿捲600-375.png', 1, '2022-11-03 14:02:47'),
(56, 56, '原味雞腿排600-375.png', 1, '2022-11-03 14:02:47'),
(57, 57, '紐奧良雞腿排600-375.png', 1, '2022-11-03 14:02:47'),
(58, 58, '十八香雞腿排600-375.png', 1, '2022-11-03 14:02:47'),
(59, 59, '碳烤燒肉雞翅600-375.png', 1, '2022-11-03 14:02:47'),
(60, 1, '巴拿馬白蝦2-600-375.png', 2, '2022-11-02 05:45:33'),
(61, 1, '巴拿馬白蝦3-600-375.png', 3, '2022-11-02 05:45:33'),
(62, 2, '巨無霸明蝦2-600-375.png', 2, '2022-11-02 05:46:24'),
(63, 2, '巨無霸明蝦3-600-375.png', 3, '2022-11-02 05:46:24'),
(64, 3, '生食級胭脂蝦2-600-375.png', 2, '2022-11-02 05:46:53'),
(65, 3, '生食級胭脂蝦3-600-375.png', 3, '2022-11-02 05:46:53'),
(66, 4, '生凍帝王蟹腳2-600-375.png', 2, '2022-11-02 05:47:13'),
(67, 4, '生凍帝王蟹腳3-600-375.png', 3, '2022-11-02 05:47:13'),
(68, 5, '熟凍麵包蟹2-600-375.png', 2, '2022-11-02 05:47:36'),
(69, 5, '熟凍麵包蟹3-600-375.png', 3, '2022-11-02 05:47:36'),
(70, 6, '老劍蝦2-600-375.png', 2, '2022-11-02 05:49:48'),
(71, 6, '老劍蝦3-600-375.png', 3, '2022-11-02 05:49:48'),
(72, 7, '特大天使紅蝦2-600-375.png', 2, '2022-11-02 05:51:49'),
(73, 7, '特大天使紅蝦3-600-375.png', 3, '2022-11-02 05:51:49'),
(74, 8, '特大台灣白蝦仁2-600-375.png', 2, '2022-11-02 05:52:56'),
(75, 8, '特大台灣白蝦仁3-600-375.png', 3, '2022-11-02 05:52:56'),
(76, 9, '純正蟹管肉2-600-375.png', 2, '2022-11-02 05:54:19'),
(77, 9, '純正蟹管肉3-600-375.png', 3, '2022-11-02 05:54:19'),
(78, 10, '高品質藍花蟹-公2-600-375.png', 2, '2022-11-02 05:55:32'),
(79, 10, '高品質藍花蟹-公3-600-375.png', 3, '2022-11-02 05:55:32'),
(80, 11, '頂級軟殼蟹2-600-375.png', 2, '2022-11-02 05:56:35'),
(81, 11, '頂級軟殼蟹3-600-375.png', 3, '2022-11-02 05:56:35'),
(82, 12, '超大肥豬蝦2-600-375.png', 2, '2022-11-02 05:57:47'),
(83, 12, '超大肥豬蝦3-600-375.png', 3, '2022-11-02 05:57:47'),
(84, 13, '山泉鱸魚2-600-375.png', 2, '2022-11-02 05:58:05'),
(85, 13, '山泉鱸魚3-600-375.png', 3, '2022-11-02 05:58:05'),
(86, 14, '龍虎斑2-600-375.png', 2, '2022-11-02 05:59:09'),
(87, 14, '龍虎斑3-600-375.png', 3, '2022-11-02 05:59:09'),
(88, 15, '日本青森縣熟凍香螺2-600-375.png', 2, '2022-11-02 05:59:28'),
(89, 15, '日本青森縣熟凍香螺3-600-375.png', 3, '2022-11-02 05:59:28'),
(90, 16, '北海道帆立貝2-600-375.png', 2, '2022-11-02 05:59:48'),
(91, 16, '北海道帆立貝3-600-375.png', 3, '2022-11-02 05:59:48'),
(92, 17, '北海道特等干貝2-600-375.png', 2, '2022-11-02 06:00:09'),
(93, 17, '北海道特等干貝3-600-375.png', 3, '2022-11-02 06:00:09'),
(94, 18, '活凍竹蛤2-600-375.png', 2, '2022-11-02 06:00:29'),
(95, 18, '活凍竹蛤3-600-375.png', 3, '2022-11-02 06:00:29'),
(96, 19, '特大鳳螺2-600-375.png', 2, '2022-11-02 06:01:40'),
(97, 19, '特大鳳螺3-600-375.png', 3, '2022-11-02 06:01:40'),
(98, 20, '去殼鮑魚2-600-375.png', 2, '2022-11-02 06:02:51'),
(99, 20, '去殼鮑魚3-600-375.png', 3, '2022-11-02 06:02:51'),
(100, 21, '基隆大砲管2-600-375.png', 2, '2022-11-02 06:03:08'),
(101, 21, '基隆大砲管3-600-375.png', 3, '2022-11-02 06:03:08'),
(102, 22, '龍膽石斑肚2-600-375.png', 2, '2022-11-03 08:05:50'),
(103, 22, '龍膽石斑肚3-600-375.png', 3, '2022-11-03 08:05:50'),
(104, 23, '去刺虱目魚肚2-600-375.png', 2, '2022-11-03 08:05:50'),
(105, 23, '去刺虱目魚肚3-600-375.png', 3, '2022-11-03 08:05:50'),
(106, 24, '挪威鯖魚片2-600-375.png', 2, '2022-11-03 08:05:50'),
(107, 24, '挪威鯖魚片3-600-375.png', 3, '2022-11-03 08:05:50'),
(108, 25, '頂級智利鮭魚片2-600-375.png', 2, '2022-11-03 08:05:50'),
(109, 25, '頂級智利鮭魚片3-600-375.png', 3, '2022-11-03 08:05:50'),
(110, 26, '頂級智利鮭魚下巴2-600-375.png', 2, '2022-11-03 08:05:50'),
(111, 26, '頂級智利鮭魚下巴3-600-375.png', 3, '2022-11-03 08:05:50'),
(112, 27, '頂級土魠魚2-600-375.png', 2, '2022-11-03 08:05:50'),
(113, 27, '頂級土魠魚3-600-375.png', 3, '2022-11-03 08:05:50'),
(114, 28, '台灣吻仔魚2-600-375.png', 2, '2022-11-03 14:02:11'),
(115, 28, '台灣吻仔魚3-600-375.png', 3, '2022-11-03 14:02:11'),
(116, 29, '爆蛋柳葉魚2-600-375.png', 2, '2022-11-03 14:02:47'),
(117, 29, '爆蛋柳葉魚3-600-375.png', 3, '2022-11-03 14:02:47'),
(118, 30, '秋刀魚2-600-375.png', 2, '2022-11-03 14:02:47'),
(119, 30, '秋刀魚3-600-375.png', 3, '2022-11-03 14:02:47'),
(120, 31, '肉鯽魚2-600-375.png', 2, '2022-11-03 14:02:47'),
(121, 31, '肉鯽魚3-600-375.png', 3, '2022-11-03 14:02:47'),
(122, 32, '巴沙魚2-600-375.png', 2, '2022-11-03 14:02:47'),
(123, 32, '巴沙魚3-600-375.png', 3, '2022-11-03 14:02:47'),
(124, 33, '生食級鯛魚片2-600-375.png', 2, '2022-11-03 14:02:47'),
(125, 33, '生食級鯛魚片3-600-375.png', 3, '2022-11-03 14:02:47'),
(126, 34, '基隆小卷2-600-375.png', 2, '2022-11-03 14:02:47'),
(127, 34, '基隆小卷3-600-375.png', 3, '2022-11-03 14:02:47'),
(128, 35, '台灣小章魚2-600-375.png', 2, '2022-11-03 14:02:47'),
(129, 35, '台灣小章魚3-600-375.png', 3, '2022-11-03 14:02:47'),
(130, 36, '冰卷2-600-375.png', 2, '2022-11-03 14:02:47'),
(131, 36, '冰卷3-600-375.png', 3, '2022-11-03 14:02:47'),
(132, 37, '巨無霸霜降牛排2-600-375.png', 2, '2022-11-03 14:02:47'),
(133, 37, '巨無霸霜降牛排3-600-375.png', 3, '2022-11-03 14:02:47'),
(134, 38, '美國帶骨牛小排2-600-375.png', 2, '2022-11-03 14:02:47'),
(135, 38, '美國帶骨牛小排3-600-375.png', 3, '2022-11-03 14:02:47'),
(136, 39, '美國翼板牛排2-600-375.png', 2, '2022-11-03 14:02:47'),
(137, 39, '美國翼板牛排3-600-375.png', 3, '2022-11-03 14:02:47'),
(138, 40, '美牛骰子2-600-375.png', 2, '2022-11-03 14:02:47'),
(139, 40, '美牛骰子3-600-375.png', 3, '2022-11-03 14:02:47'),
(140, 41, '美國牛五花肉片2-600-375.png', 2, '2022-11-03 14:02:47'),
(141, 41, '美國牛五花肉片3-600-375.png', 3, '2022-11-03 14:02:47'),
(142, 42, 'CH去骨牛小排2-600-375.png', 2, '2022-11-03 14:02:47'),
(143, 42, 'CH去骨牛小排3-600-375.png', 3, '2022-11-03 14:02:47'),
(144, 43, '熟成CH板腱牛排2-600-375.png', 2, '2022-11-03 14:02:47'),
(145, 43, '熟成CH板腱牛排3-600-375.png', 3, '2022-11-03 14:02:47'),
(146, 44, 'CH板腱肉片2-600-375.png', 2, '2022-11-03 14:02:47'),
(147, 44, 'CH板腱肉片3-600-375.png', 3, '2022-11-03 14:02:47'),
(148, 45, '美國牛肋條2-600-375.png', 2, '2022-11-03 14:02:47'),
(149, 45, '美國牛肋條3-600-375.png', 3, '2022-11-03 14:02:47'),
(150, 46, '澳洲牛舌燒肉片2-600-375.png', 2, '2022-11-03 14:02:47'),
(151, 46, '澳洲牛舌燒肉片3-600-375.png', 3, '2022-11-03 14:02:47'),
(152, 47, '豬梅花肉片2-600-375.png', 2, '2022-11-03 14:02:47'),
(153, 47, '豬梅花肉片3-600-375.png', 3, '2022-11-03 14:02:47'),
(154, 48, '台灣梅花黑豬肉2-600-375.png', 2, '2022-11-03 14:02:47'),
(155, 48, '台灣梅花黑豬肉3-600-375.png', 3, '2022-11-03 14:02:47'),
(156, 49, '台灣豬五花肉片2-600-375.png', 2, '2022-11-03 14:02:47'),
(157, 49, '台灣豬五花肉片3-600-375.png', 3, '2022-11-03 14:02:47'),
(158, 50, '黑毛松阪豬肉片2-600-375.png', 2, '2022-11-03 14:02:47'),
(159, 50, '黑毛松阪豬肉片3-600-375.png', 3, '2022-11-03 14:02:47'),
(160, 51, '去皮黑毛豬五花2-600-375 .png', 2, '2022-11-03 14:02:47'),
(161, 51, '去皮黑毛豬五花3-600-375 .png', 3, '2022-11-03 14:02:47'),
(162, 52, '伊比利豬梅花肉片2-600-375.png', 2, '2022-11-03 14:02:47'),
(163, 52, '伊比利豬梅花肉片3-600-375.png', 3, '2022-11-03 14:02:47'),
(164, 53, '伊比利肋條2-600-375.png', 2, '2022-11-03 14:02:47'),
(165, 53, '伊比利肋條3-600-375.png', 3, '2022-11-03 14:02:47'),
(166, 54, '豬棒棒腿2-600-375.png', 2, '2022-11-03 14:02:47'),
(167, 54, '豬棒棒腿3-600-375.png', 3, '2022-11-03 14:02:47'),
(168, 55, '爆漿雞腿捲2-600-375.png', 2, '2022-11-03 14:02:47'),
(169, 55, '爆漿雞腿捲3-600-375.png', 3, '2022-11-03 14:02:47'),
(170, 56, '原味雞腿排2-600-375.png', 2, '2022-11-03 14:02:47'),
(171, 56, '原味雞腿排3-600-375.png', 3, '2022-11-03 14:02:47'),
(172, 57, '紐奧良雞腿排2-600-375.png', 2, '2022-11-03 14:02:47'),
(173, 57, '紐奧良雞腿排3-600-375.png', 3, '2022-11-03 14:02:47'),
(174, 58, '十八香雞腿排2-600-375.png', 2, '2022-11-03 14:02:47'),
(175, 58, '十八香雞腿排3-600-375.png', 3, '2022-11-03 14:02:47'),
(176, 59, '碳烤燒肉雞翅2-600-375.png', 2, '2022-11-03 14:02:47'),
(177, 59, '碳烤燒肉雞翅3-600-375.png', 3, '2022-11-03 14:02:47');

-- --------------------------------------------------------

--
-- 資料表結構 `pyclass`
--

CREATE TABLE `pyclass` (
  `classid` int(3) NOT NULL COMMENT '產品類別',
  `level` int(2) NOT NULL COMMENT '所在層級',
  `fonticon` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '字型圖示',
  `cname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '類別名稱',
  `sort` int(3) NOT NULL COMMENT '列表排序',
  `uplink` int(3) NOT NULL COMMENT '上層連結',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '建立時間與更新時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 資料表的匯出資料 `pyclass`
--

INSERT INTO `pyclass` (`classid`, `level`, `fonticon`, `cname`, `sort`, `uplink`, `create_date`) VALUES
(1, 1, '', '所有商品', 1, 0, '2022-11-02 01:57:27'),
(2, 1, '', '蝦蟹類', 2, 0, '2022-10-25 07:49:33'),
(3, 1, '', '魚類', 3, 0, '2022-10-25 07:49:47'),
(118, 1, '', '貝類', 4, 0, '2022-10-25 07:49:47'),
(119, 1, '', '軟體類', 5, 0, '2022-11-02 01:55:57'),
(120, 1, '', '肉類', 6, 0, '2022-10-28 04:23:32'),
(121, 2, '', '牛肉', 1, 120, '2022-10-27 15:45:33'),
(122, 2, '', '豬肉', 2, 120, '2022-10-27 15:45:27'),
(124, 2, '', '雞肉', 3, 120, '2022-10-27 15:45:40');

-- --------------------------------------------------------

--
-- 資料表結構 `town`
--

CREATE TABLE `town` (
  `townNo` bigint(20) NOT NULL COMMENT '鄕鎮市編號',
  `Name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT '鄕鎮市名稱',
  `Post` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '郵遞區號',
  `State` smallint(6) NOT NULL COMMENT '狀態',
  `AutoNo` int(10) NOT NULL COMMENT '上層城市編號連結'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `town`
--

INSERT INTO `town` (`townNo`, `Name`, `Post`, `State`, `AutoNo`) VALUES
(1, '中正區', '100', 0, 1),
(2, '大同區', '103', 0, 1),
(3, '中山區', '104', 0, 1),
(4, '松山區', '105', 0, 1),
(5, '大安區', '106', 0, 1),
(6, '萬華區', '108', 0, 1),
(7, '信義區', '110', 0, 1),
(8, '士林區', '111', 0, 1),
(9, '北投區', '112', 0, 1),
(10, '內湖區', '114', 0, 1),
(11, '南港區', '115', 0, 1),
(12, '文山區', '116', 0, 1),
(13, '仁愛區', '200', 0, 2),
(14, '信義區', '201', 0, 2),
(15, '中正區', '202', 0, 2),
(16, '中山區', '203', 0, 2),
(17, '安樂區', '204', 0, 2),
(18, '暖暖區', '205', 0, 2),
(19, '七堵區', '206', 0, 2),
(20, '萬里區', '207', 0, 3),
(21, '金山區', '208', 0, 3),
(22, '板橋區', '220', 0, 3),
(23, '汐止區', '221', 0, 3),
(24, '深坑區', '222', 0, 3),
(25, '石碇區', '223', 0, 3),
(26, '瑞芳區', '224', 0, 3),
(27, '平溪區', '226', 0, 3),
(28, '雙溪區', '227', 0, 3),
(29, '貢寮區', '228', 0, 3),
(30, '新店區', '231', 0, 3),
(31, '坪林區', '232', 0, 3),
(32, '烏來區', '233', 0, 3),
(33, '永和區', '234', 0, 3),
(34, '中和區', '235', 0, 3),
(35, '土城區', '236', 0, 3),
(36, '三峽區', '237', 0, 3),
(37, '樹林區', '238', 0, 3),
(38, '鶯歌區', '239', 0, 3),
(39, '三重區', '241', 0, 3),
(40, '新莊區', '242', 0, 3),
(41, '泰山區', '243', 0, 3),
(42, '林口區', '244', 0, 3),
(43, '蘆洲區', '247', 0, 3),
(44, '五股區', '248', 0, 3),
(45, '八里區', '249', 0, 3),
(46, '淡水區', '251', 0, 3),
(47, '三芝區', '252', 0, 3),
(48, '石門區', '253', 0, 3),
(49, '宜蘭市', '260', 0, 4),
(50, '頭城鎮', '261', 0, 4),
(51, '礁溪鄉', '262', 0, 4),
(52, '壯圍鄉', '263', 0, 4),
(53, '員山鄉', '264', 0, 4),
(54, '羅東鎮', '265', 0, 4),
(55, '三星鄉', '266', 0, 4),
(56, '大同鄉', '267', 0, 4),
(57, '五結鄉', '268', 0, 4),
(58, '冬山鄉', '269', 0, 4),
(59, '蘇澳鎮', '270', 0, 4),
(60, '南澳鄉', '272', 0, 4),
(61, '釣魚台列嶼', '290', 0, 4),
(62, '新竹市(東區)', '300', 0, 5),
(63, '竹北市', '302', 0, 6),
(64, '湖口鄉', '303', 0, 6),
(65, '新豐鄉', '304', 0, 6),
(66, '新埔鎮', '305', 0, 6),
(67, '關西鎮', '306', 0, 6),
(68, '芎林鄉', '307', 0, 6),
(69, '寶山鄉', '308', 0, 6),
(70, '竹東鎮', '310', 0, 6),
(71, '五峰鄉', '311', 0, 6),
(72, '橫山鄉', '312', 0, 6),
(73, '尖石鄉', '313', 0, 6),
(74, '北埔鄉', '314', 0, 6),
(75, '峨眉鄉', '315', 0, 6),
(76, '中壢區', '320', 0, 7),
(77, '平鎮區', '324', 0, 7),
(78, '龍潭區', '325', 0, 7),
(79, '楊梅區', '326', 0, 7),
(80, '新屋區', '327', 0, 7),
(81, '觀音區', '328', 0, 7),
(82, '桃園區', '330', 0, 7),
(83, '龜山區', '333', 0, 7),
(84, '八德區', '334', 0, 7),
(85, '大溪區', '335', 0, 7),
(86, '復興區', '336', 0, 7),
(87, '大園區', '337', 0, 7),
(88, '蘆竹區', '338', 0, 7),
(89, '竹南鎮', '350', 0, 8),
(90, '頭份市', '351', 0, 8),
(91, '三灣鄉', '352', 0, 8),
(92, '南庄鄉', '353', 0, 8),
(93, '獅潭鄉', '354', 0, 8),
(94, '後龍鎮', '356', 0, 8),
(95, '通霄鎮', '357', 0, 8),
(96, '苑裡鎮', '358', 0, 8),
(97, '苗栗市', '360', 0, 8),
(98, '造橋鄉', '361', 0, 8),
(99, '頭屋鄉', '362', 0, 8),
(100, '公館鄉', '363', 0, 8),
(101, '大湖鄉', '364', 0, 8),
(102, '泰安鄉', '365', 0, 8),
(103, '銅鑼鄉', '366', 0, 8),
(104, '三義鄉', '367', 0, 8),
(105, '西湖鄉', '368', 0, 8),
(106, '卓蘭鎮', '369', 0, 8),
(107, '中區', '400', 0, 9),
(108, '東區', '401', 0, 9),
(109, '南區', '402', 0, 9),
(110, '西區', '403', 0, 9),
(111, '北區', '404', 0, 9),
(112, '北屯區', '406', 0, 9),
(113, '西屯區', '407', 0, 9),
(114, '南屯區', '408', 0, 9),
(115, '太平區', '411', 0, 9),
(116, '大里區', '412', 0, 9),
(117, '霧峰區', '413', 0, 9),
(118, '烏日區', '414', 0, 9),
(119, '豐原區', '420', 0, 9),
(120, '后里區', '421', 0, 9),
(121, '石岡區', '422', 0, 9),
(122, '東勢區', '423', 0, 9),
(123, '和平區', '424', 0, 9),
(124, '新社區', '426', 0, 9),
(125, '潭子區', '427', 0, 9),
(126, '大雅區', '428', 0, 9),
(127, '神岡區', '429', 0, 9),
(128, '大肚區', '432', 0, 9),
(129, '沙鹿區', '433', 0, 9),
(130, '龍井區', '434', 0, 9),
(131, '梧棲區', '435', 0, 9),
(132, '清水區', '436', 0, 9),
(133, '大甲區', '437', 0, 9),
(134, '外埔區', '438', 0, 9),
(135, '大安區', '439', 0, 9),
(136, '彰化市', '500', 0, 10),
(137, '芬園鄉', '502', 0, 10),
(138, '花壇鄉', '503', 0, 10),
(139, '秀水鄉', '504', 0, 10),
(140, '鹿港鎮', '505', 0, 10),
(141, '福興鄉', '506', 0, 10),
(142, '線西鄉', '507', 0, 10),
(143, '和美鎮', '508', 0, 10),
(144, '伸港鄉', '509', 0, 10),
(145, '員林市', '510', 0, 10),
(146, '社頭鄉', '511', 0, 10),
(147, '永靖鄉', '512', 0, 10),
(148, '埔心鄉', '513', 0, 10),
(149, '溪湖鎮', '514', 0, 10),
(150, '大村鄉', '515', 0, 10),
(151, '埔鹽鄉', '516', 0, 10),
(152, '田中鎮', '520', 0, 10),
(153, '北斗鎮', '521', 0, 10),
(154, '田尾鄉', '522', 0, 10),
(155, '埤頭鄉', '523', 0, 10),
(156, '溪州鄉', '524', 0, 10),
(157, '竹塘鄉', '525', 0, 10),
(158, '二林鎮', '526', 0, 10),
(159, '大城鄉', '527', 0, 10),
(160, '芳苑鄉', '528', 0, 10),
(161, '二水鄉', '530', 0, 10),
(162, '南投市', '540', 0, 11),
(163, '中寮鄉', '541', 0, 11),
(164, '草屯鎮', '542', 0, 11),
(165, '國姓鄉', '544', 0, 11),
(166, '埔里鎮', '545', 0, 11),
(167, '仁愛鄉', '546', 0, 11),
(168, '名間鄉', '551', 0, 11),
(169, '集集鎮', '552', 0, 11),
(170, '水里鄉', '553', 0, 11),
(171, '魚池鄉', '555', 0, 11),
(172, '信義鄉', '556', 0, 11),
(173, '竹山鎮', '557', 0, 11),
(174, '鹿谷鄉', '558', 0, 11),
(175, '斗南鎮', '630', 0, 12),
(176, '大埤鄉', '631', 0, 12),
(177, '虎尾鎮', '632', 0, 12),
(178, '土庫鎮', '633', 0, 12),
(179, '褒忠鄉', '634', 0, 12),
(180, '東勢鄉', '635', 0, 12),
(181, '臺西鄉', '636', 0, 12),
(182, '崙背鄉', '637', 0, 12),
(183, '麥寮鄉', '638', 0, 12),
(184, '斗六市', '640', 0, 12),
(185, '林內鄉', '643', 0, 12),
(186, '古坑鄉', '646', 0, 12),
(187, '莿桐鄉', '647', 0, 12),
(188, '西螺鎮', '648', 0, 12),
(189, '二崙鄉', '649', 0, 12),
(190, '北港鎮', '651', 0, 12),
(191, '水林鄉', '652', 0, 12),
(192, '口湖鄉', '653', 0, 12),
(193, '四湖鄉', '654', 0, 12),
(194, '元長鄉', '655', 0, 12),
(195, '嘉義市(東區)', '600', 0, 13),
(196, '番路鄉', '602', 0, 14),
(197, '梅山鄉', '603', 0, 14),
(198, '竹崎鄉', '604', 0, 14),
(199, '阿里山鄉', '605', 0, 14),
(200, '中埔鄉', '606', 0, 14),
(201, '大埔鄉', '607', 0, 14),
(202, '水上鄉', '608', 0, 14),
(203, '鹿草鄉', '611', 0, 14),
(204, '太保市', '612', 0, 14),
(205, '朴子市', '613', 0, 14),
(206, '東石鄉', '614', 0, 14),
(207, '六腳鄉', '615', 0, 14),
(208, '新港鄉', '616', 0, 14),
(209, '民雄鄉', '621', 0, 14),
(210, '大林鎮', '622', 0, 14),
(211, '溪口鄉', '623', 0, 14),
(212, '義竹鄉', '624', 0, 14),
(213, '布袋鎮', '625', 0, 14),
(214, '中西區', '700', 0, 15),
(215, '東區', '701', 0, 15),
(216, '南區', '702', 0, 15),
(217, '北區', '704', 0, 15),
(218, '安平區', '708', 0, 15),
(219, '安南區', '709', 0, 15),
(220, '永康區', '710', 0, 15),
(221, '歸仁區', '711', 0, 15),
(222, '新化區', '712', 0, 15),
(223, '左鎮區', '713', 0, 15),
(224, '玉井區', '714', 0, 15),
(225, '楠西區', '715', 0, 15),
(226, '南化區', '716', 0, 15),
(227, '仁德區', '717', 0, 15),
(228, '關廟區', '718', 0, 15),
(229, '龍崎區', '719', 0, 15),
(230, '官田區', '720', 0, 15),
(231, '麻豆區', '721', 0, 15),
(232, '佳里區', '722', 0, 15),
(233, '西港區', '723', 0, 15),
(234, '七股區', '724', 0, 15),
(235, '將軍區', '725', 0, 15),
(236, '學甲區', '726', 0, 15),
(237, '北門區', '727', 0, 15),
(238, '新營區', '730', 0, 15),
(239, '後壁區', '731', 0, 15),
(240, '白河區', '732', 0, 15),
(241, '東山區', '733', 0, 15),
(242, '六甲區', '734', 0, 15),
(243, '下營區', '735', 0, 15),
(244, '柳營區', '736', 0, 15),
(245, '鹽水區', '737', 0, 15),
(246, '善化區', '741', 0, 15),
(247, '大內區', '742', 0, 15),
(248, '山上區', '743', 0, 15),
(249, '新市區', '744', 0, 15),
(250, '安定區', '745', 0, 15),
(251, '新興區', '800', 0, 16),
(252, '前金區', '801', 0, 16),
(253, '苓雅區', '802', 0, 16),
(254, '鹽埕區', '803', 0, 16),
(255, '鼓山區', '804', 0, 16),
(256, '旗津區', '805', 0, 16),
(257, '前鎮區', '806', 0, 16),
(258, '三民區', '807', 0, 16),
(259, '楠梓區', '811', 0, 16),
(260, '小港區', '812', 0, 16),
(261, '左營區', '813', 0, 16),
(262, '仁武區', '814', 0, 16),
(263, '大社區', '815', 0, 16),
(264, '岡山區', '820', 0, 16),
(265, '路竹區', '821', 0, 16),
(266, '阿蓮區', '822', 0, 16),
(267, '田寮區', '823', 0, 16),
(268, '燕巢區', '824', 0, 16),
(269, '橋頭區', '825', 0, 16),
(270, '梓官區', '826', 0, 16),
(271, '彌陀區', '827', 0, 16),
(272, '永安區', '828', 0, 16),
(273, '湖內區', '829', 0, 16),
(274, '鳳山區', '830', 0, 16),
(275, '大寮區', '831', 0, 16),
(276, '林園區', '832', 0, 16),
(277, '鳥松區', '833', 0, 16),
(278, '大樹區', '840', 0, 16),
(279, '旗山區', '842', 0, 16),
(280, '美濃區', '843', 0, 16),
(281, '六龜區', '844', 0, 16),
(282, '內門區', '845', 0, 16),
(283, '杉林區', '846', 0, 16),
(284, '甲仙區', '847', 0, 16),
(285, '桃源區', '848', 0, 16),
(286, '那瑪夏區', '849', 0, 16),
(287, '茂林區', '851', 0, 16),
(288, '茄萣區', '852', 0, 16),
(289, '東沙', '817', 0, 17),
(290, '南沙', '819', 0, 17),
(291, '馬公市', '880', 0, 18),
(292, '西嶼鄉', '881', 0, 18),
(293, '望安鄉', '882', 0, 18),
(294, '七美鄉', '883', 0, 18),
(295, '白沙鄉', '884', 0, 18),
(296, '湖西鄉', '885', 0, 18),
(297, '屏東市', '900', 0, 19),
(298, '三地門鄉', '901', 0, 19),
(299, '霧臺鄉', '902', 0, 19),
(300, '瑪家鄉', '903', 0, 19),
(301, '九如鄉', '904', 0, 19),
(302, '里港鄉', '905', 0, 19),
(303, '高樹鄉', '906', 0, 19),
(304, '鹽埔鄉', '907', 0, 19),
(305, '長治鄉', '908', 0, 19),
(306, '麟洛鄉', '909', 0, 19),
(307, '竹田鄉', '911', 0, 19),
(308, '內埔鄉', '912', 0, 19),
(309, '萬丹鄉', '913', 0, 19),
(310, '潮州鎮', '920', 0, 19),
(311, '泰武鄉', '921', 0, 19),
(312, '來義鄉', '922', 0, 19),
(313, '萬巒鄉', '923', 0, 19),
(314, '崁頂鄉', '924', 0, 19),
(315, '新埤鄉', '925', 0, 19),
(316, '南州鄉', '926', 0, 19),
(317, '林邊鄉', '927', 0, 19),
(318, '東港鄉', '928', 0, 19),
(319, '琉球鄉', '929', 0, 19),
(320, '佳冬鄉', '931', 0, 19),
(321, '新園鄉', '932', 0, 19),
(322, '枋寮鄉', '940', 0, 19),
(323, '枋山鄉', '941', 0, 19),
(324, '春日鄉', '942', 0, 19),
(325, '獅子鄉', '943', 0, 19),
(326, '車城鄉', '944', 0, 19),
(327, '牡丹鄉', '945', 0, 19),
(328, '恆春鎮', '946', 0, 19),
(329, '滿州鄉', '947', 0, 19),
(330, '臺東市', '950', 0, 20),
(331, '綠島鄉', '951', 0, 20),
(332, '蘭嶼鄉', '952', 0, 20),
(333, '延平鄉', '953', 0, 20),
(334, '卑南鄉', '954', 0, 20),
(335, '鹿野鄉', '955', 0, 20),
(336, '關山鎮', '956', 0, 20),
(337, '海端鄉', '957', 0, 20),
(338, '池上鄉', '958', 0, 20),
(339, '東河鄉', '959', 0, 20),
(340, '成功鎮', '961', 0, 20),
(341, '長濱鄉', '962', 0, 20),
(342, '太麻里鄉', '963', 0, 20),
(343, '金峰鄉', '964', 0, 20),
(344, '大武鄉', '965', 0, 20),
(345, '達仁鄉', '966', 0, 20),
(346, '花蓮市', '970', 0, 21),
(347, '新城鄉', '971', 0, 21),
(348, '秀林鄉', '972', 0, 21),
(349, '吉安鄉', '973', 0, 21),
(350, '壽豐鄉', '974', 0, 21),
(351, '鳳林鎮', '975', 0, 21),
(352, '光復鄉', '976', 0, 21),
(353, '豐濱鄉', '977', 0, 21),
(354, '瑞穗鄉', '978', 0, 21),
(355, '萬榮鄉', '979', 0, 21),
(356, '玉里鎮', '981', 0, 21),
(357, '卓溪鄉', '982', 0, 21),
(358, '富里鄉', '983', 0, 21),
(359, '金沙鎮', '890', 0, 22),
(360, '金湖鎮', '891', 0, 22),
(361, '金寧鄉', '892', 0, 22),
(362, '金城鎮', '893', 0, 22),
(363, '烈嶼鄉', '894', 0, 22),
(364, '烏坵鄉', '896', 0, 22),
(365, '南竿鄉', '209', 0, 23),
(366, '北竿鄉', '210', 0, 23),
(367, '莒光鄉', '211', 0, 23),
(368, '東引鄉', '212', 0, 23),
(371, '新竹市(北區)', '300', 0, 5),
(372, '新竹市(香山區)', '300', 0, 5),
(373, '嘉義市(西區)', '600', 0, 13);

-- --------------------------------------------------------

--
-- 資料表結構 `uorder`
--

CREATE TABLE `uorder` (
  `orderid` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '訂單編號',
  `emailid` int(10) NOT NULL COMMENT '會員編號',
  `addressid` int(10) NOT NULL COMMENT '收件人編號',
  `howpay` tinyint(4) NOT NULL DEFAULT '1' COMMENT '如何付款',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '訂單處理狀態',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '備註',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '訂單時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `addbook`
--
ALTER TABLE `addbook`
  ADD PRIMARY KEY (`addressid`);

--
-- 資料表索引 `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`caro_id`);

--
-- 資料表索引 `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartid`);

--
-- 資料表索引 `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`AutoNo`);

--
-- 資料表索引 `hot`
--
ALTER TABLE `hot`
  ADD PRIMARY KEY (`h_id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`emailid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- 資料表索引 `new`
--
ALTER TABLE `new`
  ADD PRIMARY KEY (`new_id`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`p_id`);

--
-- 資料表索引 `product_img`
--
ALTER TABLE `product_img`
  ADD PRIMARY KEY (`img_id`);

--
-- 資料表索引 `pyclass`
--
ALTER TABLE `pyclass`
  ADD PRIMARY KEY (`classid`);

--
-- 資料表索引 `town`
--
ALTER TABLE `town`
  ADD PRIMARY KEY (`townNo`);

--
-- 資料表索引 `uorder`
--
ALTER TABLE `uorder`
  ADD PRIMARY KEY (`orderid`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `addbook`
--
ALTER TABLE `addbook`
  MODIFY `addressid` int(10) NOT NULL AUTO_INCREMENT COMMENT '地址ID', AUTO_INCREMENT=2;
--
-- 使用資料表 AUTO_INCREMENT `carousel`
--
ALTER TABLE `carousel`
  MODIFY `caro_id` int(3) NOT NULL AUTO_INCREMENT COMMENT '輪播編號', AUTO_INCREMENT=4;
--
-- 使用資料表 AUTO_INCREMENT `cart`
--
ALTER TABLE `cart`
  MODIFY `cartid` int(10) NOT NULL AUTO_INCREMENT COMMENT '購物車編號', AUTO_INCREMENT=2;
--
-- 使用資料表 AUTO_INCREMENT `city`
--
ALTER TABLE `city`
  MODIFY `AutoNo` int(10) NOT NULL AUTO_INCREMENT COMMENT '城市編號', AUTO_INCREMENT=24;
--
-- 使用資料表 AUTO_INCREMENT `hot`
--
ALTER TABLE `hot`
  MODIFY `h_id` int(3) NOT NULL AUTO_INCREMENT COMMENT '熱銷商品流水號', AUTO_INCREMENT=9;
--
-- 使用資料表 AUTO_INCREMENT `member`
--
ALTER TABLE `member`
  MODIFY `emailid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'email流水號', AUTO_INCREMENT=3;
--
-- 使用資料表 AUTO_INCREMENT `new`
--
ALTER TABLE `new`
  MODIFY `new_id` int(3) NOT NULL AUTO_INCREMENT COMMENT '新商品流水號', AUTO_INCREMENT=21;
--
-- 使用資料表 AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `p_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '產品編號', AUTO_INCREMENT=60;
--
-- 使用資料表 AUTO_INCREMENT `product_img`
--
ALTER TABLE `product_img`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '圖檔編號', AUTO_INCREMENT=178;
--
-- 使用資料表 AUTO_INCREMENT `pyclass`
--
ALTER TABLE `pyclass`
  MODIFY `classid` int(3) NOT NULL AUTO_INCREMENT COMMENT '產品類別', AUTO_INCREMENT=125;
--
-- 使用資料表 AUTO_INCREMENT `town`
--
ALTER TABLE `town`
  MODIFY `townNo` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '鄕鎮市編號', AUTO_INCREMENT=374;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
