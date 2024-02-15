-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Фев 15 2024 г., 15:44
-- Версия сервера: 8.0.29
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_hasanov7764_605-31 хасанов`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Персона`
--

CREATE TABLE `Персона` (
  `id` int NOT NULL,
  `ФИО` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `дата_рождения` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Персона`
--

INSERT INTO `Персона` (`id`, `ФИО`, `дата_рождения`) VALUES
(1, 'Иванов Иван Иванович', '2014-02-01'),
(2, 'Петров Петр Петрович', '2015-06-25'),
(3, 'Артемов Артем Артемович', '2016-02-10'),
(4, 'Евгеньев Евгений Евгеньевич', '2012-05-14'),
(5, 'Данилов Данил Даниилович', '2000-10-31'),
(6, 'Никитин Никита Никитович', '2000-07-03'),
(7, 'Сергеев Сергей Сергеевич', '2000-05-01'),
(8, 'Антонов Антон Антонович', '2000-07-08');

-- --------------------------------------------------------

--
-- Структура таблицы `жюри`
--

CREATE TABLE `жюри` (
  `id` int NOT NULL,
  `id_персоны` int NOT NULL,
  `id_конкурса` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `жюри`
--

INSERT INTO `жюри` (`id`, `id_персоны`, `id_конкурса`) VALUES
(1, 5, 1),
(2, 6, 2),
(3, 7, 3),
(4, 8, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `конкурс`
--

CREATE TABLE `конкурс` (
  `id` int NOT NULL,
  `название` varchar(255) NOT NULL,
  `дата_проведения` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `конкурс`
--

INSERT INTO `конкурс` (`id`, `название`, `дата_проведения`) VALUES
(1, 'Скорочтение', '2024-02-16'),
(2, 'Лучший рисунок', '2024-02-17'),
(3, 'Лучший танец', '2024-02-18'),
(4, 'Лучшее стихотворение', '2024-02-19');

-- --------------------------------------------------------

--
-- Структура таблицы `критерий`
--

CREATE TABLE `критерий` (
  `id` int NOT NULL,
  `id_конкурса` int NOT NULL,
  `наименования_критерия` varchar(255) NOT NULL,
  `максимальный_балл` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `критерий`
--

INSERT INTO `критерий` (`id`, `id_конкурса`, `наименования_критерия`, `максимальный_балл`) VALUES
(1, 1, 'Чтение за минуту', 10),
(2, 2, 'Оценка Жюри', 10),
(3, 3, 'Оценка Жюри', 10),
(4, 4, 'Выразительность чтения', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `оценка`
--

CREATE TABLE `оценка` (
  `id` int NOT NULL,
  `id_участника` int NOT NULL,
  `id_жюри` int NOT NULL,
  `id_критерий` int NOT NULL,
  `балл` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `оценка`
--

INSERT INTO `оценка` (`id`, `id_участника`, `id_жюри`, `id_критерий`, `балл`) VALUES
(1, 1, 1, 1, 6),
(2, 2, 2, 2, 9),
(3, 3, 3, 3, 8),
(4, 4, 4, 4, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `участник`
--

CREATE TABLE `участник` (
  `id` int NOT NULL,
  `id_персоны` int NOT NULL,
  `id_конкурса` int NOT NULL,
  `название_конкурсной_работы` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `участник`
--

INSERT INTO `участник` (`id`, `id_персоны`, `id_конкурса`, `название_конкурсной_работы`) VALUES
(1, 1, 1, 'Произведение \"Рассказы для детей\"'),
(2, 2, 2, '\"Мой город\"'),
(3, 3, 3, 'Танец \"хип-хоп\"'),
(4, 4, 4, 'Стихотворение \"Белая Береза\"');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Персона`
--
ALTER TABLE `Персона`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `жюри`
--
ALTER TABLE `жюри`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_персоны` (`id_персоны`),
  ADD KEY `id_конкурса` (`id_конкурса`);

--
-- Индексы таблицы `конкурс`
--
ALTER TABLE `конкурс`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `критерий`
--
ALTER TABLE `критерий`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_конкурса` (`id_конкурса`);

--
-- Индексы таблицы `оценка`
--
ALTER TABLE `оценка`
  ADD KEY `id_критерий` (`id_критерий`),
  ADD KEY `оценка_ibfk_1` (`id_жюри`),
  ADD KEY `оценка_ibfk_3` (`id_участника`);

--
-- Индексы таблицы `участник`
--
ALTER TABLE `участник`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_персоны` (`id_персоны`),
  ADD KEY `id_конкурса` (`id_конкурса`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Персона`
--
ALTER TABLE `Персона`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `конкурс`
--
ALTER TABLE `конкурс`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `жюри`
--
ALTER TABLE `жюри`
  ADD CONSTRAINT `жюри_ibfk_1` FOREIGN KEY (`id_персоны`) REFERENCES `Персона` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `жюри_ibfk_2` FOREIGN KEY (`id_конкурса`) REFERENCES `конкурс` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `критерий`
--
ALTER TABLE `критерий`
  ADD CONSTRAINT `критерий_ibfk_1` FOREIGN KEY (`id_конкурса`) REFERENCES `конкурс` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `оценка`
--
ALTER TABLE `оценка`
  ADD CONSTRAINT `оценка_ibfk_1` FOREIGN KEY (`id_жюри`) REFERENCES `жюри` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `оценка_ibfk_2` FOREIGN KEY (`id_критерий`) REFERENCES `критерий` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `оценка_ibfk_3` FOREIGN KEY (`id_участника`) REFERENCES `Персона` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `участник`
--
ALTER TABLE `участник`
  ADD CONSTRAINT `участник_ibfk_2` FOREIGN KEY (`id_персоны`) REFERENCES `Персона` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `участник_ibfk_3` FOREIGN KEY (`id_конкурса`) REFERENCES `конкурс` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
