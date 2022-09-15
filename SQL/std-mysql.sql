-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: std-mysql
-- Время создания: Сен 15 2022 г., 05:26
-- Версия сервера: 5.7.26-0ubuntu0.16.04.1
-- Версия PHP: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `std_1754_project`
--
CREATE DATABASE IF NOT EXISTS `std_1754_project` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `std_1754_project`;

-- --------------------------------------------------------

--
-- Структура таблицы `folders`
--

CREATE TABLE `folders` (
  `id` int(11) NOT NULL,
  `color` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `folders`
--

INSERT INTO `folders` (`id`, `color`, `title`, `user_id`) VALUES
(1, '#7FFFD4', 'ffff', 3),
(3, '#87CEEB', 'Учёба', 1),
(4, '#DDA0DD', 'Подарки', 1),
(5, '#F6F8FA', 'Магазины', 2),
(9, '#87CEEB', 'title', 7),
(10, '#FF7F50', 'title', 7),
(11, '#7FFFD4', 'title', 7),
(15, '#F6F8FA', 'УПССССС....', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `article` varchar(255) DEFAULT NULL,
  `created` date NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `folder_id` int(11) NOT NULL,
  `color` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `notes`
--

INSERT INTO `notes` (`id`, `title`, `article`, `created`, `deleted`, `folder_id`, `color`) VALUES
(4, 'Теория вероятности', 'Остались номера: 1253, 1868, 2235, 2365, 2568, 3005, 3264, 0000', '2022-05-02', 0, 3, '#87CEEB'),
(5, 'История экономических учений', 'Главы 3, 4, 6\r\nЛабораторные 1, 5, 7, 11', '2022-05-10', 0, 3, '#87CEEB'),
(6, 'Введение в менеджмент ', 'Конспекты по главам 1-5\r\nПрактические 5-8\r\nКурсовая', '2022-05-20', 0, 3, '#87CEEB'),
(7, 'Катя', 'Духи, желательно DKNY', '2022-06-01', 0, 4, '#DDA0DD'),
(8, 'Валера', 'Выбрать из: джойстик, кроссовки, телескоп', '2022-06-12', 0, 4, '#DDA0DD'),
(9, 'Дима', 'Скинуться со всеми на Playstation\r\n', '2022-06-12', 0, 4, '#DDA0DD'),
(10, 'Adidas', '12000', '2022-06-12', 0, 5, '#F6F8FA'),
(11, 'Nike', '11300, но качество в Adidas лучше', '2022-06-12', 0, 5, '#F6F8FA'),
(12, 'Puma', '8000 более бюджетный вариант', '2022-06-12', 0, 5, '#F6F8FA'),
(18, 'title', 'csdvfbg', '2022-06-13', 0, 9, '#87CEEB'),
(22, 'Я не специально)', 'Я решил проверить каталог на удаление и удалил его \r\nПоздравляю сайт очень рабочий', '2022-06-13', 0, 15, '#F6F8FA');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `privileges` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `privileges`) VALUES
(1, 'uknow@gh.ru', 'testpass', 'u'),
(2, 'project@req.com', 'project', 'u'),
(3, 'ya@new.ru', 'New_user_parol', 'u'),
(4, 'New_user@huya.tv', 'New_user_parol', 'u'),
(5, 'New_user@huya.tv', 'New_user_parol', 'u'),
(6, 'water2lamp@gmail.com', 'Art200352', 'u'),
(7, 'New_user@mail.ru', 'New_user_parol', 'u'),
(8, 'New_user@mail.ru', 'New_user_parol', 'u'),
(9, 'New_user@mail.ru', 'New_user_parol', 'u'),
(10, 'New_user@mail.ru', 'New_user_parol', 'u');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `folders`
--
ALTER TABLE `folders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
