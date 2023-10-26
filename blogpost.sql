-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2023 at 09:01 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogpost`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_social_media`
--

CREATE TABLE `blog_social_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bsm_facebook` varchar(255) DEFAULT NULL,
  `bsm_instagram` varchar(255) DEFAULT NULL,
  `bsm_youtube` varchar(255) DEFAULT NULL,
  `bsm_linkedin` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_social_media`
--

INSERT INTO `blog_social_media` (`id`, `bsm_facebook`, `bsm_instagram`, `bsm_youtube`, `bsm_linkedin`, `created_at`, `updated_at`) VALUES
(1, 'https://www.facebook.com/', 'https://www.instagram.com/', 'https://www.youtube.com/', 'https://www.linkedin.com/', NULL, '2023-03-15 16:14:36');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 10000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `ordering`, `created_at`, `updated_at`) VALUES
(2, 'App dev.', 1, '2023-03-19 14:55:48', '2023-04-05 04:20:24'),
(3, 'Health', 2, '2023-04-02 08:54:55', '2023-04-05 04:18:47'),
(4, 'Web dev.', 1, '2023-04-04 08:44:02', '2023-05-23 12:53:27');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_03_01_053007_create_types_table', 1),
(6, '2023_03_09_081330_create_settings_table', 2),
(7, '2023_03_15_164014_create_blog_social_media_table', 3),
(8, '2023_03_19_164704_create_categories_table', 4),
(9, '2023_03_19_165700_create_sub_categories_table', 4),
(10, '2023_03_21_095213_create_posts_table', 5),
(11, '2023_04_05_115207_update_posts_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('mh.ab1214@gmail.com', 'Y0ttRWppS05BblZSZTdhejRFWm5ianlwekdHSnVHNnBQc0Ntazg3UGpQdG83YjdFdExhNkU0d1FEcVJEclMyNw==', '2023-05-23 01:08:26');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_slug` varchar(255) DEFAULT NULL,
  `post_content` text DEFAULT NULL,
  `post_tags` text DEFAULT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `post_title`, `post_slug`, `post_content`, `post_tags`, `featured_image`, `created_at`, `updated_at`) VALUES
(7, 1, 2, 'How to resize image using image intervention', 'how-to-resize-image-using-image-intervention', '<p>Content ..................</p>', NULL, '1679905762_c-programming-tutorial.png', '2023-03-27 05:29:23', '2023-03-27 05:29:23'),
(10, 1, 5, 'What is the benefits of watermelon', 'what-is-the-benefits-of-watermelon', '<h2><img alt=\"\" src=\"http://blogpost.com/storage/my1files/R%20%282%29.jpg\" style=\"height:226px; width:300px\" /></h2>\r\n\r\n<p><a name=\"TOC_TITLE_HDR_2\">Helps you stay hydrated</a></p>\r\n\r\n<p>Staying hydrated is important for your body to function properly.</p>\r\n\r\n<p>Body temperature regulation, normal organ function, nutrient delivery to cells, and alertness are only some of the bodily processes that rely on adequate hydration (<a href=\"https://pubmed.ncbi.nlm.nih.gov/30609670/\" rel=\"noopener noreferrer\" target=\"_blank\">2Trusted Source</a>).</p>\r\n\r\n<p>Eating&nbsp;<a href=\"https://www.healthline.com/nutrition/19-hydrating-foods\">foods with a high water content</a>&nbsp;may help give your body the water it needs to function properly.</p>\r\n\r\n<p>Watermelon comprises 92% water, making it a great choice for daily water intake (<a href=\"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4464475/\" rel=\"noopener noreferrer\" target=\"_blank\">3Trusted Source</a>).</p>\r\n\r\n<p>Furthermore, due to its high water content, this melon has a low&nbsp;<a href=\"https://www.healthline.com/nutrition/calorie-density\">calorie density</a>&nbsp;&mdash; in other words, very few calories for its total weight.</p>', NULL, '1680437488_watermelon.jpg', '2023-03-30 10:23:08', '2023-04-02 09:11:28'),
(11, 1, 5, 'How to maintain our health', 'how-to-maintain-our-health', '<p><img alt=\"\" src=\"http://blogpost.com/storage/my1files/healthy-diet.jpg_2015122915473647567.jpg\" style=\"height:200px\" />&nbsp;</p>\r\n\r\n<p>Non-Communicable Diseases (NCDs) are diseases that cannot be transferred from one person to another. The four main non-communicable diseases are cardiovascular diseases, cancers, chronic respiratory diseases and diabetes. They are responsible for 75% of deaths worldwide, killing 38 million people each year.</p>\r\n\r\n<p>Unhealthy diets and physical inactivity are amongst the main risk factors of NCDs. They raise blood pressure, increase blood glucose, elevate blood lipids and lead to obesity.</p>\r\n\r\n<p>The last decades have witnessed a huge increase in meat, sugars, fats and highly processed food consumption. On the other hand, the consumption of fiber-rich foods such as whole grains, pulses and roots has been declining. This phenomenon is known as nutrition transition, it occurs due to globalization, urbanization and the development of the food industry that produces less nutritious food costing less money. NCDs can be prevented by following a heathy lifestyle through healthy eating and physical activity. This can be easy and doable by following some recommendations:</p>\r\n\r\n<p>&nbsp;</p>', NULL, '1680436987_R.jpg', '2023-04-02 07:49:04', '2023-04-02 09:13:10'),
(12, 1, 8, 'How to upload image in codeIgnitor', 'how-to-upload-image-in-codeignitor', '<p>The is the way how to .....</p>', NULL, '1680608992_maxresdefault.jpg', '2023-04-04 08:49:53', '2023-04-04 08:49:53'),
(13, 1, 2, 'how to code in android', 'how-to-code-in-android', '<p>The body of&nbsp;</p>', NULL, '1680609084_c-programming-tutorial.png', '2023-04-04 08:51:24', '2023-04-04 08:51:24'),
(14, 1, 9, 'CakePhp for bigineer', 'cakephp-for-bigineer', '<p>The conten......</p>', NULL, '1680609175_R (2).jpg', '2023-04-04 08:52:55', '2023-04-04 08:52:55'),
(15, 1, 7, 'How use laravel 8', 'how-use-laravel-8', '<p>The content&nbsp;</p>', NULL, '1680609339_R (1).png', '2023-04-04 08:55:39', '2023-04-04 08:55:39'),
(16, 1, 10, 'How to upgrade laptop RAM using three way', 'how-to-upgrade-laptop-ram-using-three-way', '<p>The body content....</p>', NULL, '1680612964_Toshiba-satellite-A105-S4014.jpg', '2023-04-04 09:56:05', '2023-04-04 09:56:05'),
(17, 1, 11, 'Flutter tutorial', 'flutter-tutorial', '<p>The body of</p>', NULL, '1680681731_R (2).png', '2023-04-05 05:02:11', '2023-04-05 05:02:11'),
(18, 1, 7, 'How remove file extension in laravel 8', 'how-remove-file-extension-in-laravel-8', '<p>If a file has a file extension it&#39;s likely required. If you want to delete a file extension because you want it hidden, use Windows to hide file extensions. For help with hiding and showing file extensions.&nbsp;In Windows, you can view the&nbsp;<a href=\"https://www.computerhope.com/jargon/f/fileext.htm\">file extension</a>&nbsp;for a single file or all files, all the time. The method for viewing the file extension for a single file is the same in every version of Windows, but viewing all file extensions differs between versions. Select an option below and follow the instructions for viewing file extensions.</p>', 'Laravel,javascript,Vue Js', '1680698463_R (1).jpg', '2023-04-05 09:41:04', '2023-04-14 07:03:02'),
(19, 1, 12, 'An Experiential Guide to Explore This Kingdom', 'an-experiential-guide-to-explore-this-kingdom', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam nihil enim maxime corporis cumque totam aliquid nam sint inventore optio modi neque laborum officiis necessitatibus, facilis placeat pariatur! Voluptatem, sed harum pariatur adipisci voluptates voluptatum cumque, porro sint minima similique magni perferendis fuga! Optio vel ipsum excepturi tempore reiciendis id quidem? Vel in, doloribus debitis nesciunt fugit sequi magnam accusantium modi neque quis, vitae velit, pariatur harum autem a! Velit impedit atque maiores animi possimus asperiores natus repellendus excepturi sint architecto eligendi non, omnis nihil. Facilis, doloremque illum. Fugit optio laborum minus debitis natus illo perspiciatis corporis voluptatum rerum laboriosam.</p>', NULL, '1681552872_post-2.jpg', '2023-04-15 07:01:12', '2023-04-15 07:01:12'),
(20, 1, 12, 'What to Do in Houston: Ideas for Your Visit', 'what-to-do-in-houston-ideas-for-your-visit', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam nihil enim maxime corporis cumque totam aliquid nam sint inventore optio modi neque laborum officiis necessitatibus, facilis placeat pariatur! Voluptatem, sed harum pariatur adipisci voluptates voluptatum cumque, porro sint minima similique magni perferendis fuga! Optio vel ipsum excepturi tempore reiciendis id quidem? Vel in, doloribus debitis nesciunt fugit sequi magnam accusantium modi neque quis, vitae velit, pariatur harum autem a! Velit impedit atque maiores animi possimus asperiores natus repellendus excepturi sint architecto eligendi non, omnis nihil. Facilis, doloremque illum. Fugit optio laborum minus debitis natus illo perspiciatis corporis voluptatum rerum laboriosam.</p>', NULL, '1681552963_ls-2.jpg', '2023-04-15 07:02:43', '2023-04-15 07:02:43'),
(21, 1, 12, 'U.S. Travel Association Calls on CDC to Remove Cruise Restrictions', 'u-s-travel-association-calls-on-cdc-to-remove-cruise-restrictions', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam nihil enim maxime corporis cumque totam aliquid nam sint inventore optio modi neque laborum officiis necessitatibus, facilis placeat pariatur! Voluptatem, sed harum pariatur adipisci voluptates voluptatum cumque, porro sint minima similique magni perferendis fuga! Optio vel ipsum excepturi tempore reiciendis id quidem? Vel in, doloribus debitis nesciunt fugit sequi magnam accusantium modi neque quis, vitae velit, pariatur harum autem a! Velit impedit atque maiores animi possimus asperiores natus repellendus excepturi sint architecto eligendi non, omnis nihil. Facilis, doloremque illum. Fugit optio laborum minus debitis natus illo perspiciatis corporis voluptatum rerum laboriosam.</p>', NULL, '1681553031_cr-2.jpg', '2023-04-15 07:03:51', '2023-04-15 07:03:51'),
(22, 1, 12, 'Top 7 Reasons to Visit Denver This Summer', 'top-7-reasons-to-visit-denver-this-summer', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam nihil enim maxime corporis cumque totam aliquid nam sint inventore optio modi neque laborum officiis necessitatibus, facilis placeat pariatur! Voluptatem, sed harum pariatur adipisci voluptates voluptatum cumque, porro sint minima similique magni perferendis fuga! Optio vel ipsum excepturi tempore reiciendis id quidem? Vel in, doloribus debitis nesciunt fugit sequi magnam accusantium modi neque quis, vitae velit, pariatur harum autem a! Velit impedit atque maiores animi possimus asperiores natus repellendus excepturi sint architecto eligendi non, omnis nihil. Facilis, doloremque illum. Fugit optio laborum minus debitis natus illo perspiciatis corporis voluptatum rerum laboriosam.</p>', NULL, '1681553178_post-8.jpg', '2023-04-15 07:06:18', '2023-04-15 07:06:18'),
(23, 1, 12, 'Alaska Cruises Will Restart as Biden Signs New Tourism Law', 'alaska-cruises-will-restart-as-biden-signs-new-tourism-law', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam nihil enim maxime corporis cumque totam aliquid nam sint inventore optio modi neque laborum officiis necessitatibus, facilis placeat pariatur! Voluptatem, sed harum pariatur adipisci voluptates voluptatum cumque, porro sint minima similique magni perferendis fuga! Optio vel ipsum excepturi tempore reiciendis id quidem? Vel in, doloribus debitis nesciunt fugit sequi magnam accusantium modi neque quis, vitae velit, pariatur harum autem a! Velit impedit atque maiores animi possimus asperiores natus repellendus excepturi sint architecto eligendi non, omnis nihil. Facilis, doloremque illum. Fugit optio laborum minus debitis natus illo perspiciatis corporis voluptatum rerum laboriosam.</p>', NULL, '1681553236_post-4.jpg', '2023-04-15 07:07:17', '2023-04-15 07:07:17'),
(24, 1, 12, 'What is road map', 'what-is-road-map', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam nihil enim maxime corporis cumque totam aliquid nam sint inventore optio modi neque laborum officiis necessitatibus, facilis placeat pariatur! Voluptatem, sed harum pariatur adipisci voluptates voluptatum cumque, porro sint minima similique magni perferendis fuga! Optio vel ipsum excepturi tempore reiciendis id quidem? Vel in, doloribus debitis nesciunt fugit sequi magnam accusantium modi neque quis, vitae velit, pariatur harum autem a! Velit impedit atque maiores animi possimus asperiores natus repellendus excepturi sint architecto eligendi non, omnis nihil. Facilis, doloremque illum. Fugit optio laborum minus debitis natus illo perspiciatis corporis voluptatum rerum laboriosam.</p>', NULL, '1681553321_post-9.jpg', '2023-04-15 07:08:41', '2023-04-15 07:08:41'),
(25, 1, 12, 'Ethiopia Cruises Will Restart as Biden Signs New Tourism Law', 'ethiopia-cruises-will-restart-as-biden-signs-new-tourism-law', '<h2>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam nihil enim maxime corporis cumque totam aliquid nam sint inventore optio modi neque laborum officiis necessitatibus, facilis placeat pariatur! Voluptatem, sed harum pariatur adipisci voluptates voluptatum cumque, porro sint minima similique magni perferendis fuga! Optio vel ipsum excepturi tempore reiciendis id quidem? Vel in, doloribus debitis nesciunt fugit sequi magnam accusantium modi neque quis, vitae velit, pariatur harum autem a! Velit impedit atque maiores animi possimus asperiores natus repellendus excepturi sint architecto eligendi non, omnis nihil. Facilis, doloremque illum. Fugit optio laborum minus debitis natus illo perspiciatis corporis voluptatum rerum laboriosam.</h2>', NULL, '1681553438_cr-1.jpg', '2023-04-15 07:10:38', '2023-04-15 07:10:38'),
(26, 1, 12, 'Ethiopia Travel Association Calls on CDC to Remove Cruise Restrictions', 'ethiopia-travel-association-calls-on-cdc-to-remove-cruise-restrictions', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam nihil enim maxime corporis cumque totam aliquid nam sint inventore optio modi neque laborum officiis necessitatibus, facilis placeat pariatur! Voluptatem, sed harum pariatur adipisci voluptates voluptatum cumque, porro sint minima similique magni perferendis fuga! Optio vel ipsum excepturi tempore reiciendis id quidem? Vel in, doloribus debitis nesciunt fugit sequi magnam accusantium modi neque quis, vitae velit, pariatur harum autem a! Velit impedit atque maiores animi possimus asperiores natus repellendus excepturi sint architecto eligendi non, omnis nihil. Facilis, doloremque illum. Fugit optio laborum minus debitis natus illo perspiciatis corporis voluptatum rerum laboriosam.</p>', NULL, '1681553510_cr-2.jpg', '2023-04-15 07:11:50', '2023-04-15 07:11:50'),
(27, 1, 10, 'What is computer', 'what-is-computer', '<p>A&nbsp;<strong>computer</strong>&nbsp;is an electronic device that receives input, stores or processes the input as per user instructions and provides output in desired format. Computers have become an integral part of our lives because they can accomplish easy tasks repeatedly without getting bored and complex ones repeatedly without committing errors. In this tutorial we will discuss in detail about the different parts of computer that enable it to carry out tasks efficiently and correctly. We will also discuss about microprocessors, the brain of computers, which actually do all the assigned tasks.</p>', 'laptop,desktop,palmtop,server', '1681628589_R (2).jpg', '2023-04-16 04:03:10', '2023-04-16 04:03:10'),
(28, 1, 10, 'What is desktop computer', 'what-is-desktop-computer', '<p>A&nbsp;<strong>desktop computer</strong>&nbsp;is a&nbsp;<a href=\"https://www.computerhope.com/jargon/c/computer.htm\">computer</a>&nbsp;that fits on or under a desk. They utilize peripheral devices for interaction, such as a keyboard and mouse for input, and display devices like a&nbsp;<a href=\"https://www.computerhope.com/jargon/m/monitor.htm\">monitor</a>, projector, or television. Desktop computers can have a&nbsp;<a href=\"https://www.computerhope.com/jargon/h/horizont.htm\">horizontal</a>&nbsp;or&nbsp;<a href=\"https://www.computerhope.com/jargon/v/vertical.htm\">vertical</a>&nbsp;(tower)&nbsp;<a href=\"https://www.computerhope.com/jargon/f/formfact.htm\">form factor</a>, or be combined with a monitor to create an&nbsp;<a href=\"https://www.computerhope.com/jargon/a/all-in-one-computer.htm\">All-in-One computer</a>. Unlike a&nbsp;<a href=\"https://www.computerhope.com/jargon/l/laptop.htm\">laptop</a>, which is portable, desktop computers are generally made to stay at one location.</p>', 'Computer,Desktop', '1681628907_R (4).jpg', '2023-04-16 04:08:27', '2023-04-18 07:36:30'),
(29, 1, 10, 'What is palmtop computer', 'what-is-palmtop-computer', '<p>A&nbsp;<strong>palmtop computer</strong>&nbsp;was an IBM-compatible electronic device that was about the size of a large pocket calculator. They came in a&nbsp;<a href=\"https://www.computerhope.com/jargon/c/clamshel.htm\">clamshell</a>&nbsp;form factor, which allowed them to be used as a&nbsp;<a href=\"https://www.computerhope.com/jargon/h/handheld.htm\">handheld device</a>&nbsp;or what could be described as a small&nbsp;<a href=\"https://www.computerhope.com/jargon/l/laptop.htm\">laptop computer</a>. Although palmtop computers were based on&nbsp;<a href=\"https://www.computerhope.com/jargon/d/dos.htm\">DOS</a>, many of them could run programs designed for traditional PCs.</p>', NULL, '1681629069_R (5).jpg', '2023-04-16 04:11:09', '2023-04-16 04:11:09'),
(30, 1, 10, 'Lightweight laptop computer', 'lightweight-laptop-computer', '<p>Sometimes referred to as ultraportable or ultrathin, the lightweight laptop is twice the size of a netbook, yet it still feels light and easy to carry. This category offers a perfect balance of performance and portability, especially for frequent flyers. These models are plenty fast for most types of work and have a mid-size screen that&#39;s comfortable to work on. Most even have built-in DVD burners, which netbooks do not. This category can be expensive if you order the biggest hard drive or fastest processor available.</p>', 'Computer,laptop', '1681629309_Portege-X40-KTAA-2.png', '2023-04-16 04:15:09', '2023-04-18 07:39:16'),
(31, 1, 10, 'Everyday Computing laptop computer', 'everyday-computing-laptop-computer', '<p>Also called a midsize or mainstream notebook, this category falls into the broad middle in terms of weight, screen size, technology, and price. A few models have top-shelf features such as a 17.3-inch diagonal widescreen or powerful processor. The everyday laptop has enough muscle to do almost any task, but it&rsquo;s too heavy and too short on battery life to make a great travel laptop.</p>', NULL, '1681629415_buyguide-laptops-everyday-computing.png', '2023-04-16 04:16:55', '2023-04-16 04:16:55'),
(32, 1, 10, 'Desktop Replacement laptop computer', 'desktop-replacement-laptop-computer', '<p>This portable delivers a full PC experience. It offers a comfortable keyboard, large hard drive, a huge screen and great system memory. The stereo speakers are loud and rich, plus you&rsquo;ll find exciting emerging mobile technology such as Intel Wireless Display, which lets you play your laptop&rsquo;s picture on your big-screen HDTV without wires. With all these features, a desktop replacement is too large for comfortable travel, and battery life is very short.</p>', 'Computer,Laptop', '1681629525_buyguide-laptops-desktop-replacement.png', '2023-04-16 04:18:45', '2023-04-18 07:37:30'),
(33, 1, 10, 'Full Size Desktop Computer', 'full-size-desktop-computer', '<p>Full-size desktop computers come with a variety of displays and processing units. A desktop computer consists of many components, the components of a desktop computer are connected to each other components by cable or wireless connection. Full-size desktop computers are often in the tower form factor look. Users can easily upgrade the full-size desktop computer as per their requirements.</p>', 'Computer,Desktop', '1681630966_Full-Size-Desktop.jpg', '2023-04-16 04:42:46', '2023-04-18 07:38:20'),
(34, 1, 10, 'Compact Desktop Computer', 'compact-desktop-computer', '<p style=\"text-align:justify\">Compact desktops are smaller in size and lighter in weight than full-size desktops.&nbsp;Compact desktop commuters tend to be cheaper and less powerful computers than full-size desktops. Compact computers look very similar to full-size desktop computers. The compact desktop is designed to be used to perform tasks such as browsing the web, working on applications, document processing, playing video and audio files. Compact desktops have less working capacity of hardware and processor, due to which they are not able to do big tasks.</p>', 'HP,Computer,Desktop', '1681631530_Compact-Desktop.jpg', '2023-04-16 04:52:10', '2023-04-19 02:45:47'),
(35, 1, 10, 'All in One Desktop computer', 'all-in-one-desktop-computer', '<p style=\"text-align:justify\">All in one desktop computer is much better than a full-size desktop computer and compact desktop computer because all the components of all in one desktop computer are integrated into a single case. All-in-one desktop computer is very good for those people who have a space problem because the all-in-one desktop computer takes up workspace as compared to full size. All-in-one desktop computers are costlier than full-size desktop and compact desktop computers. Macintosh desktop computer is an example of an all-in-one desktop computer.</p>', NULL, '1681631695_All-in-one-desktop.jpg', '2023-04-16 04:54:55', '2023-04-16 04:54:55'),
(36, 1, 5, 'What are the benefits of bananas', 'what-are-the-benefits-of-bananas', '<p style=\"text-align:center\"><img alt=\"\" src=\"http://blogpost.com/storage/my1files/healthy-diet.jpg_2015122915473647567.jpg\" style=\"height:56px; width:84px\" /></p>\r\n\r\n<p>Bananas are incredibly healthy, convenient, delicious, and one of the most inexpensive fresh fruits you can buy. This makes them an excellent choice for anyone interested in eating healthy.</p>\r\n\r\n<p>While they&rsquo;re native to Southeast Asia, they grow ubiquitously in many warm climates, making them available worldwide. The Cavendish variety, the most common type found in grocery stores, starts out firm and green but turns yellow, soft, and sweet as it ripens.</p>\r\n\r\n<p>Bananas contain many essential nutrients and may benefit weight loss, digestion, and heart health.</p>\r\n\r\n<p>Here are 11 science-based health benefits of bananas.</p>', 'Benefits,Bananas', '1684659088_banana-bunch-19074568.jpg', '2023-05-21 05:51:28', '2023-05-21 05:51:28');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_name` varchar(255) DEFAULT NULL,
  `blog_email` varchar(255) DEFAULT NULL,
  `blog_description` varchar(255) DEFAULT NULL,
  `blog_logo` varchar(255) DEFAULT NULL,
  `blog_favicon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `blog_name`, `blog_email`, `blog_description`, `blog_logo`, `blog_favicon`, `created_at`, `updated_at`) VALUES
(1, 'Mame blog', 'mame@gmail.com', 'The largest blog', '1684856808-11352_blogpost_logo.png', '1679072218-59861_blogpost_favicon.ico', NULL, '2023-05-23 12:46:48');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `parent_category` int(11) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 10000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `subcategory_name`, `slug`, `parent_category`, `ordering`, `created_at`, `updated_at`) VALUES
(2, 'Android', 'android', 2, 3, '2023-03-19 17:15:23', '2023-05-23 12:53:31'),
(5, 'Diet', 'diet', 3, 5, '2023-04-02 08:55:36', '2023-05-23 12:53:31'),
(7, 'Laravel 8', 'laravel-8', 4, 6, '2023-04-04 08:45:35', '2023-05-23 12:53:31'),
(8, 'CodeIgnit', 'codeignit', 4, 1, '2023-04-04 08:46:22', '2023-05-23 12:53:31'),
(9, 'CakePhp', 'cakephp', 4, 1, '2023-04-04 08:47:12', '2023-04-05 04:50:17'),
(10, 'Computer', 'computer', 0, 6, '2023-04-04 09:50:17', '2023-04-05 05:00:23'),
(11, 'Flutter ', 'flutter', 2, 3, '2023-04-05 05:00:05', '2023-04-05 05:02:48'),
(12, 'Turizm ', 'turizm', 0, 8, '2023-04-15 06:58:35', '2023-05-23 12:53:31'),
(13, 'Minor surgery', 'minor-surgery', 3, 10000, '2023-05-23 12:54:03', '2023-05-23 12:54:03');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin/Super Author', NULL, NULL),
(2, 'Author', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `biography` text DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 2,
  `blocked` int(11) NOT NULL DEFAULT 0,
  `direct_publish` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `username`, `picture`, `biography`, `type`, `blocked`, `direct_publish`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'M/Hassen Abamecha', 'mh.ab1214@gmail.com', NULL, '$2y$10$yfquF99ztxrAfSmspC/Ixe6TY15WzG4XtHRgJt/7DVCfiRdk/bEZq', 'mame', 'AIMG1168485738280576.jpg', 'Hi I am Programmer!  ', 1, 0, 1, NULL, NULL, '2023-05-23 12:56:22'),
(2, 'aschalew w.', 'aschii@gnail.com', NULL, '$2y$10$s6d9ppTM0QUTGmVac7piDe.o9yxlhfQXNGR3gLHntgeZTviGaxFNC', 'hsadggfhh', NULL, NULL, 2, 0, 0, NULL, '2023-03-16 18:39:30', '2023-03-18 13:44:36'),
(4, 'Dabali dereje B', 'daba@gmail.com', NULL, '$2y$10$EAz30VsGp.Wb5/VLVTc.1O/Uzngeil5.NcBS.YtZXD29/zmVxt9u6', 'daba123', NULL, NULL, 2, 0, 0, NULL, '2023-03-17 15:04:46', '2023-03-18 13:45:51'),
(5, 'Mohammed Awel', 'mame@gmail.com', NULL, '$2y$10$V.vLxxxakIxywHXQ.MQzlOVb4yo9PeAl7X7y4TQndc0Gb06GnUfEm', 'mameawel', NULL, NULL, 2, 0, 0, NULL, '2023-03-17 15:35:42', '2023-05-23 12:53:05'),
(6, 'Berihun', 'bari@gmail.com', NULL, '$2y$10$aHKgF6bwnAnux0G1QkFMU.QI1a6zqFl1b/VW6/v6pLVcLhLoyhJyi', 'bari1223', NULL, NULL, 2, 0, 0, NULL, '2023-03-17 15:36:47', '2023-03-17 15:36:47'),
(7, 'Melaku M', 'male@gmail.com', NULL, '$2y$10$WAtGG61c5pE5LirqN71FQu9Y5MjpyoajauzvYCT98wMf/dIc0Tp3e', 'male234', NULL, NULL, 2, 0, 0, NULL, '2023-03-17 15:37:42', '2023-03-17 15:37:42'),
(8, 'Siyam Ab', 'siyam@gmail.com', NULL, '$2y$10$2c486ZIqb39RaAQ9uDRVnutg/Ebk5C4C.p9/Z4YFKbGT6R39Upeo2', 'siyam1212', NULL, NULL, 2, 0, 0, NULL, '2023-03-17 15:39:10', '2023-03-17 15:39:10'),
(9, 'Awel jemal', 'awel@gmail.com', NULL, '$2y$10$eN0THV55E8.JEe3aFPbqlOAoKK14VWr13ePqjSxq8SyAKOwhbs4Y6', 'awel1233', NULL, NULL, 2, 0, 0, NULL, '2023-03-17 15:41:31', '2023-03-27 06:37:33'),
(10, 'Bante B', 'bante@gmail.com', NULL, '$2y$10$QkCOYlL2qP86Y3vkVnuMxu9phvNsghkKbmxr2ZVlUQe2QqVd0dbkW', 'bante123', NULL, NULL, 2, 0, 0, NULL, '2023-03-17 15:42:21', '2023-03-17 15:42:21'),
(11, 'Bante B1', 'bante1@gmail.com', NULL, '$2y$10$HY2e7FrmHgBXrvARuYcf4O2VTNA366C/hEcHpP4GIC8VM/re9/SEC', 'bane345', NULL, NULL, 2, 0, 0, NULL, '2023-03-17 15:44:29', '2023-03-17 15:44:29'),
(12, 'Awel jemal2', 'awel2@gmail.com', NULL, '$2y$10$fANBZHTVJVHQg3jhU0fRn.5ChHTkWDv6/.61lliM9B1IGkDMirfTW', 'Aweljemal', NULL, NULL, 2, 0, 1, NULL, '2023-03-17 15:45:47', '2023-03-17 15:45:47'),
(14, 'nebil m', 'nebil@gmail.com', NULL, '$2y$10$T0hWNRWesaZP5nN7herqi.GA54N7VTF8ZsvWoavQefnuo8.plfhiG', 'neba2344', NULL, NULL, 2, 0, 1, NULL, '2023-03-17 15:51:56', '2023-03-17 15:51:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_social_media`
--
ALTER TABLE `blog_social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_social_media`
--
ALTER TABLE `blog_social_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
