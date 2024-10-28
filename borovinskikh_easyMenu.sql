-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 28 2024 г., 11:04
-- Версия сервера: 5.7.39
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `borovinskikh_easyMenu`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id_category` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id_category`, `name`, `created_at`, `updated_at`) VALUES
(1, 'завтрак', NULL, NULL),
(2, 'обед', NULL, NULL),
(3, 'ужин', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id_menu` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE `menu_items` (
  `id_menu_item` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `menu_recipes`
--

CREATE TABLE `menu_recipes` (
  `id_menu_recipe` bigint(20) UNSIGNED NOT NULL,
  `id_menu` bigint(20) UNSIGNED NOT NULL,
  `id_recipe` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(31, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(32, '2024_10_14_055525_create_post_table', 1),
(33, '2024_10_14_055533_create_user_table', 1),
(34, '2024_10_14_055542_create_role_table', 1),
(35, '2024_10_14_055551_create_menu_table', 1),
(36, '2024_10_14_055601_create_recipe_table', 1),
(37, '2024_10_14_055610_create_category_table', 1),
(38, '2024_10_14_055626_create_menu_item_table', 1),
(39, '2024_10_14_055636_create_menu_recipe_table', 1),
(40, '2024_10_14_055655_create_recipe_menu_item_table', 1),
(41, '2024_10_27_111427_add_image_to_posts_table', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(3000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`post_id`, `image`, `title`, `content`, `user_id`, `created_at`, `updated_at`) VALUES
(7, '1730042834.png', 'Вред сахара: почему стоит ограничить его потребление', 'Сахар — это один из самых распространенных ингредиентов в нашей пище. Он добавляется в множество продуктов, от сладостей до соусов, и часто употребляется в виде сладких напитков. Несмотря на его привлекательный вкус, чрезмерное потребление сахара может иметь серьезные последствия для здоровья.\r\n\r\n1. Увеличение риска ожирения\r\nОдним из основных негативных эффектов сахара является его связь с ожирением. Сахар содержит много калорий, но не дает ощущения насыщения, что приводит к перееданию. Исследования показывают, что люди, которые потребляют много добавленного сахара, имеют более высокий риск развития избыточного веса и ожирения.\r\n\r\n2. Развитие диабета\r\nЧрезмерное потребление сахара может привести к инсулинорезистентности, что в свою очередь увеличивает риск развития диабета 2 типа. Когда организм постоянно получает большое количество сахара, поджелудочная железа вынуждена вырабатывать больше инсулина, что со временем может привести к ее истощению.\r\n\r\n3. Проблемы с зубами\r\nСахар является одной из главных причин кариеса. Бактерии, находящиеся в ротовой полости, используют сахар в качестве источника энергии и производят кислоты, которые разрушают зубную эмаль. Регулярное употребление сахара без должной гигиены полости рта может привести к серьезным стоматологическим проблемам.\r\n\r\n4. Влияние на психическое здоровье\r\nИсследования показывают, что высокое потребление сахара может быть связано с повышенным риском депрессии и тревожности. Сахар может вызывать резкие колебания уровня сахара в крови, что влияет на настроение и общее состояние.\r\n\r\n5. Сердечно-сосудистые заболевания\r\nСахар также может способствовать развитию сердечно-сосудистых заболеваний. Избыточное потребление сахара увеличивает уровень триглицеридов и может привести к повышению артериального давления, что в конечном итоге увеличивает риск сердечно-сосудистых заболеваний.\r\n\r\nЗаключение\r\nОграничение потребления сахара — важный шаг к улучшению здоровья. Замените сладости на фрукты, выбирайте продукты с низким содержанием добавленного сахара и внимательно читайте этикетки. Заботясь о своем здоровье, вы можете избежать многих проблем, связанных с избыточным потреблением сахара.', 3, '2024-10-27 12:27:14', '2024-10-27 12:27:14'),
(8, '1730043053.png', 'Утренние зарядки: ключ к бодрости и здоровью', 'Утренние зарядки — это отличный способ начать день с энергии и хорошего настроения. Вот несколько причин, почему они полезны:\r\n\r\nУвеличение энергии: Физическая активность активирует кровообращение, что помогает организму проснуться и зарядиться энергией на весь день.\r\n\r\nУлучшение настроения: Упражнения способствуют выработке эндорфинов, которые помогают снизить уровень стресса и улучшают общее настроение.\r\n\r\nУлучшение концентрации: Утренние зарядки способствуют улучшению кровоснабжения мозга, что повышает концентрацию и продуктивность в течение дня.\r\n\r\nФормирование привычки: Регулярные утренние тренировки помогают установить полезную привычку, что способствует здоровому образу жизни в целом.\r\n\r\nПоддержание физической формы: Даже короткая зарядка помогает поддерживать физическую активность и улучшает обмен веществ.\r\n\r\nНачните утро с зарядки, и вы заметите, как это положительно скажется на вашем здоровье и самочувствии!', 3, '2024-10-27 12:30:53', '2024-10-27 12:30:53'),
(9, '1730043318.png', 'Водный баланс: почему он важен для здоровья', 'Соблюдение водного баланса — ключевой аспект поддержания здоровья. Вот несколько причин, почему это так важно:\r\n\r\nПоддержание функций организма: Вода необходима для нормального функционирования всех систем, включая пищеварение, циркуляцию крови и терморегуляцию.\r\n\r\nУлучшение обмена веществ: Достаточное количество воды способствует эффективному обмену веществ, помогает выводить токсины и поддерживает здоровье кожи.\r\n\r\nУвлажнение: Вода предотвращает обезвоживание, которое может вызывать усталость, головные боли и снижение концентрации.\r\n\r\nКонтроль аппетита: Иногда жажда может восприниматься как голод. Поддерживая водный баланс, вы можете избежать ненужного переедания.\r\n\r\nСпортивные достижения: Для спортсменов правильное увлажнение критично для повышения выносливости и предотвращения травм.\r\n\r\nСледите за своим водным балансом, и вы заметите, как это положительно скажется на вашем самочувствии и общем здоровье!', 3, '2024-10-27 12:35:18', '2024-10-27 12:35:18');

-- --------------------------------------------------------

--
-- Структура таблицы `recipes`
--

CREATE TABLE `recipes` (
  `id_recipe` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ingredients` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calories` int(11) NOT NULL,
  `id_category` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `recipes_menu_items`
--

CREATE TABLE `recipes_menu_items` (
  `id_recipe_menu_item` bigint(20) UNSIGNED NOT NULL,
  `id_recipe` bigint(20) UNSIGNED NOT NULL,
  `id_menu_item` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id_role` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id_role`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'user', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_role` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `login`, `id_role`, `created_at`, `updated_at`) VALUES
(2, 'polinasmile3.14@gmail.com', 'qq@mail.ru', '$2y$12$yIrB12NG5DkUUMiQmOHzWe70S1YQLQ9Se/FyGG.0iFRFlrEpcyFbi', 'qq', 2, '2024-10-24 12:15:34', '2024-10-24 12:15:34'),
(3, 'admin', 'admin@mail.ru', '$2y$12$a22JXHV0NWhLcgB26SwkO.h75NUQH5u1Ra4YOEgfTG0v/TJYZ/xoO', 'admin', 1, '2024-10-25 10:47:28', '2024-10-25 10:47:28'),
(5, 'cultm1nd', 'cultm1nd@mail.ru', '$2y$12$XvidGB5GlpR6RUM9ct68BumcxDoum75ioyZP8lhrYUWcQwpyKGM4i', 'cultm1nd', 2, '2024-10-27 11:48:18', '2024-10-27 11:48:18');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id_menu_item`);

--
-- Индексы таблицы `menu_recipes`
--
ALTER TABLE `menu_recipes`
  ADD PRIMARY KEY (`id_menu_recipe`),
  ADD KEY `id_menu` (`id_menu`,`id_recipe`),
  ADD KEY `id_recipe` (`id_recipe`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id_recipe`),
  ADD KEY `id_category` (`id_category`);

--
-- Индексы таблицы `recipes_menu_items`
--
ALTER TABLE `recipes_menu_items`
  ADD PRIMARY KEY (`id_recipe_menu_item`),
  ADD KEY `id_recipe` (`id_recipe`,`id_menu_item`),
  ADD KEY `id_menu_item` (`id_menu_item`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_role`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `id_role` (`id_role`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id_menu` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id_menu_item` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `menu_recipes`
--
ALTER TABLE `menu_recipes`
  MODIFY `id_menu_recipe` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id_recipe` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `recipes_menu_items`
--
ALTER TABLE `recipes_menu_items`
  MODIFY `id_recipe_menu_item` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id_role` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_recipes`
--
ALTER TABLE `menu_recipes`
  ADD CONSTRAINT `menu_recipes_ibfk_1` FOREIGN KEY (`id_recipe`) REFERENCES `recipes` (`id_recipe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_recipes_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menus` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `recipes_menu_items`
--
ALTER TABLE `recipes_menu_items`
  ADD CONSTRAINT `recipes_menu_items_ibfk_1` FOREIGN KEY (`id_menu_item`) REFERENCES `menu_items` (`id_menu_item`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recipes_menu_items_ibfk_2` FOREIGN KEY (`id_recipe`) REFERENCES `recipes` (`id_recipe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
