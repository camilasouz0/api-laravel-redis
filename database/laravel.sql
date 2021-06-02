SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cats`;
CREATE TABLE IF NOT EXISTS `cats` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metric` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temperament` text COLLATE utf8mb4_unicode_ci,
  `origin` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_05_25_010306_create_cache_table', 1),
(5, '2021_05_25_225815_cats', 1);

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('keenan.steuber@example.com', '$2y$10$azhlz3Rzj9T6gruCvYN/meqLJCdj6.d14TFa2KVw0t.76/wSC2kiG', '2021-05-31 17:34:40'),
('green56@example.org', '$2y$10$A98hQlkWQPeW0t4N6w/5ueIihQay8jsT5pogE3GqJIucaa0tCzDqS', '2021-05-31 17:34:40');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Lon Daniel', 'hwindler@example.com', '2021-05-31 17:34:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'aYsY1bfboJ', '2021-05-31 17:34:36', '2021-05-31 17:34:36'),
(2, 'Lula Adams', 'greenfelder.gust@example.org', '2021-05-31 17:34:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vqI4duurX8', '2021-05-31 17:34:36', '2021-05-31 17:34:36'),
(3, 'Noble Sporer', 'erika.ullrich@example.org', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wLJyzAI7g2', '2021-05-31 17:34:37', '2021-05-31 17:34:37'),
(4, 'Prof. Warren Pfannerstill MD', 'bauch.elsa@example.com', '2021-05-31 17:34:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Ams5s57uhG', '2021-05-31 17:34:37', '2021-05-31 17:34:37'),
(5, 'Linda Parisian', 'yasmine.mcclure@example.net', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '3v4K85EYoR', '2021-05-31 17:34:37', '2021-05-31 17:34:37'),
(6, 'Oren Rolfson', 'wreilly@example.org', '2021-05-31 17:34:38', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CfNqnDzeaX', '2021-05-31 17:34:38', '2021-05-31 17:34:38'),
(7, 'Jerald Brown', 'wbarrows@example.com', '2021-05-31 17:34:39', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PiMHPe6Aj4', '2021-05-31 17:34:39', '2021-05-31 17:34:39'),
(8, 'Miss Retha Goldner II', 'yzboncak@example.org', '2021-05-31 17:34:39', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'VDEmj6mH1X', '2021-05-31 17:34:39', '2021-05-31 17:34:39'),
(9, 'Caroline Ward', 'keenan.steuber@example.com', '2021-05-31 17:34:40', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kTBN4BizXg', '2021-05-31 17:34:40', '2021-05-31 17:34:40'),
(10, 'Evert Brekke', 'green56@example.org', '2021-05-31 17:34:40', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'VvHAYdlcLO', '2021-05-31 17:34:40', '2021-05-31 17:34:40'),
(11, 'Dewayne Cronin III', 'ayla00@example.org', '2021-05-31 17:34:40', '$2y$10$SfMNwqrFMhWJHOqKhdaOQ.3dWdciMyBxhuKlx1wDXwuUJVsX9/tsO', 'u5Ozs3mYFklsIjZaeIf1Do3grm2nqGW7T1iTX7oP68bkRP52KzCDbwZkQ6vv', '2021-05-31 17:34:40', '2021-05-31 17:34:41'),
(12, 'Test User', 'test@example.com', NULL, '$2y$10$58tMvBB31ApfuKMg9Sh6meTsPqbxl65R5n9LbIpjYojQ0PjaoIkOW', NULL, '2021-05-31 17:34:41', '2021-05-31 17:34:41');
COMMIT;
