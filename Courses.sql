-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Дек 26 2024 г., 08:36
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Courses`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cost`
--

CREATE TABLE `cost` (
  `cost_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `cost` int(11) NOT NULL,
  `VATcost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `cost`
--

INSERT INTO `cost` (`cost_id`, `date`, `cost`, `VATcost`) VALUES
(1, '2024-09-01', 10000, 12000);

-- --------------------------------------------------------

--
-- Структура таблицы `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `daynumber` varchar(255) NOT NULL,
  `studentnumber` int(11) NOT NULL,
  `cost_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `course`
--

INSERT INTO `course` (`id`, `name`, `type`, `daynumber`, `studentnumber`, `cost_id`) VALUES
(1, 'Фронтенд-разработчик', 1, '12 месяцев', 25, 1),
(2, 'back-end Разработчик', 1, '31', 25, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `education`
--

CREATE TABLE `education` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `education`
--

INSERT INTO `education` (`id`, `code`, `name`) VALUES
(1, 'bachelor', 'бакалавриат'),
(2, 'doctoral ', 'Докторантура'),
(3, 'specialty', 'Специалитет, магистратура'),
(4, 'sce', 'СПО'),
(5, 'other', 'Другое');

-- --------------------------------------------------------

--
-- Структура таблицы `gender`
--

CREATE TABLE `gender` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `gender`
--

INSERT INTO `gender` (`id`, `code`, `name`) VALUES
(1, 'male', 'Мужчина'),
(2, 'female', 'Женщина');

-- --------------------------------------------------------

--
-- Структура таблицы `Organization`
--

CREATE TABLE `Organization` (
  `organization_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `course_id` int(11) NOT NULL,
  `adress` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Organization`
--

INSERT INTO `Organization` (`organization_id`, `title`, `course_id`, `adress`, `number`, `email`) VALUES
(1, 'Практикум', 1, '895929, Нижегородская область, город Егорьевск, шоссе Чехова, 75', '8(915)999-99-99', 'org1@yandex.ru'),
(2, 'Практикум', 2, '305086, Оренбургская область, город Лотошино, наб. Ломоносова, 53', '8(800)-264-04-33', 'harold.casper@gmail.com');

-- --------------------------------------------------------

--
-- Структура таблицы `request`
--

CREATE TABLE `request` (
  `request_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `countofpeople` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `request`
--

INSERT INTO `request` (`request_id`, `organization_id`, `countofpeople`, `user_id`, `status_id`, `course_id`) VALUES
(1, 1, 25, 1, 1, 1),
(3, 1, 25, 1, 1, 1),
(4, 1, 25, 1, 1, 2),
(6, 1, 25, 12, 1, 1),
(7, 1, 25, 13, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'educator'),
(2, 'student');

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `status`
--

INSERT INTO `status` (`id`, `code`, `name`) VALUES
(1, 'new', 'new'),
(2, 'approve', 'approve'),
(3, 'rejected', 'rejected');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `bday` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `education` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `fullname`, `bday`, `gender`, `education`, `role_id`) VALUES
(1, 'login1', 'a722c63db8ec8625af6cf71cb8c2d939', 'Иванов Иван Иванович', '12.12.1989', 1, 1, 1),
(2, 'Test', '5f4dcc3b5aa765d61d8327deb882cf99', 'Тест Тест Тест', '12.12.2000', 1, 3, 2),
(7, 'log2', '5f4dcc3b5aa765d61d8327deb882cf99', 'ЗВА', '2024-09-23', 1, 4, 1),
(12, 'nerius', 'e10adc3949ba59abbe56e057f20f883e', 'З В А', '2007-08-20', 1, 4, 1),
(13, 'tester1', '72a3dcef165d9122a45decf13ae20631', 'тестер', '1212-12-12', 1, 4, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cost`
--
ALTER TABLE `cost`
  ADD PRIMARY KEY (`cost_id`);

--
-- Индексы таблицы `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `cost` (`cost_id`),
  ADD KEY `type_2` (`type`);

--
-- Индексы таблицы `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Organization`
--
ALTER TABLE `Organization`
  ADD PRIMARY KEY (`organization_id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD UNIQUE KEY `adress` (`adress`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `courses_id` (`course_id`);

--
-- Индексы таблицы `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `educator_id` (`user_id`),
  ADD KEY `organization_id` (`organization_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `gender` (`gender`),
  ADD KEY `education` (`education`),
  ADD KEY `education_2` (`education`),
  ADD KEY `education_3` (`education`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `gender_2` (`gender`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cost`
--
ALTER TABLE `cost`
  MODIFY `cost_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `education`
--
ALTER TABLE `education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Organization`
--
ALTER TABLE `Organization`
  MODIFY `organization_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `request`
--
ALTER TABLE `request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`cost_id`) REFERENCES `cost` (`cost_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Organization`
--
ALTER TABLE `Organization`
  ADD CONSTRAINT `Organization_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`);

--
-- Ограничения внешнего ключа таблицы `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `Organization` (`organization_id`),
  ADD CONSTRAINT `request_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `request_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `request_ibfk_5` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`);

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`education`) REFERENCES `education` (`id`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `user_ibfk_3` FOREIGN KEY (`gender`) REFERENCES `gender` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
