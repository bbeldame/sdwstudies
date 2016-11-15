-- phpMyAdmin SQL Dump
-- version 4.6.4deb1+deb.cihar.com~xenial.1
-- https://www.phpmyadmin.net/
--
-- Client :  localhost
-- Généré le :  Mar 15 Novembre 2016 à 09:27
-- Version du serveur :  5.7.16-0ubuntu0.16.04.1
-- Version de PHP :  7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `library`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `street_number` int(11) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `address`
--

INSERT INTO `address` (`id`, `street_number`, `address1`, `address2`, `address3`, `zip_code`, `country_id`, `city`) VALUES
(1, 8, 'rue de rivolie', NULL, NULL, '75001', 1, 'paris'),
(2, 8, 'rue de rivolie', NULL, NULL, '75001', 1, 'paris'),
(3, 8, 'rue de rivolie', NULL, NULL, '69001', 1, 'lille'),
(4, 8, 'rue de rivolie', NULL, NULL, '39000', 1, 'lyon');

-- --------------------------------------------------------

--
-- Structure de la table `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `author`
--

INSERT INTO `author` (`id`, `last_name`, `first_name`) VALUES
(1, 'Robillard', 'Anne'),
(2, 'pigis', 'florian'),
(3, 'Dreno', 'Kévin'),
(4, 'Boggs', 'Kieran'),
(5, 'Sasia', 'Adrien'),
(6, 'Bel', 'Basile');

-- --------------------------------------------------------

--
-- Structure de la table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `book`
--

INSERT INTO `book` (`id`, `title`, `description`, `code`) VALUES
(1, 'Les chevaliers d\'émeraudes', 'azertyuiop', '1234567890'),
(2, 'Narnia', 'azertyuiop', '0987654321'),
(3, 'L\'épouvanteur', 'azertyuiop', '2345678901'),
(4, 'Star wars', 'azertyuiop', '3456789012'),
(5, 'Les héritiers denkidiev', '	azertyuiop', '4567890123'),
(6, 'Le seigneur des anneaux', 'azertyuiop', '056987654321'),
(7, 'Ange', 'azertuiophiugtu', '09876544545678');

-- --------------------------------------------------------

--
-- Structure de la table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `booking_date` datetime NOT NULL,
  `return_date` date DEFAULT NULL,
  `book_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `booking`
--

INSERT INTO `booking` (`id`, `booking_date`, `return_date`, `book_id`, `customer_id`) VALUES
(1, '2015-09-15 00:00:00', '2015-09-23', 1, 1),
(2, '2015-10-19 00:00:00', '2016-01-10', 3, 1),
(3, '2016-08-13 00:00:00', NULL, 5, 1),
(4, '2016-10-15 00:00:00', '2016-11-18', 7, 2),
(5, '2016-06-15 00:00:00', NULL, 7, 2),
(6, '2016-04-28 00:00:00', '2016-08-18', 7, 3),
(7, '2016-10-17 00:00:00', '2016-11-18', 2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `book_author`
--

CREATE TABLE `book_author` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `book_author`
--

INSERT INTO `book_author` (`book_id`, `author_id`) VALUES
(1, 1),
(5, 1),
(7, 1),
(2, 2),
(2, 3),
(3, 4),
(4, 5),
(6, 6);

-- --------------------------------------------------------

--
-- Structure de la table `book_category`
--

CREATE TABLE `book_category` (
  `book_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `book_category`
--

INSERT INTO `book_category` (`book_id`, `category_id`) VALUES
(4, 1),
(1, 2),
(2, 2),
(3, 2),
(5, 2),
(6, 2),
(7, 3);

-- --------------------------------------------------------

--
-- Structure de la table `book_keyword`
--

CREATE TABLE `book_keyword` (
  `keyword_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `book_keyword`
--

INSERT INTO `book_keyword` (`keyword_id`, `book_id`) VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 2),
(3, 2),
(1, 3),
(2, 3),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'science fiction'),
(2, 'heroic fantasy'),
(3, 'fantastique');

-- --------------------------------------------------------

--
-- Structure de la table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `code` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `country`
--

INSERT INTO `country` (`id`, `name`, `code`) VALUES
(1, 'France', 'Fr');

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `is_subscriber` tinyint(1) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `customer`
--

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `email`, `tel`, `is_subscriber`, `address_id`) VALUES
(1, 'Romain', 'Valin', 'ro.ce@ss.com', '1234567890', 1, 1),
(2, 'Kieran', 'Boggs', 'ro.ce@ss.com', '1234567890', 1, 2),
(3, 'Kévin', 'Dreno', 'ro.ce@ss.com', '1234567890', 0, 3),
(4, 'Florian', 'Pigis', 'ro.ce@ss.com', '1234567890', 1, 4),
(5, 'Alice', 'Landemard', 'a.la.dd@dd.com', '2134578901', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `keyword`
--

CREATE TABLE `keyword` (
  `id` int(11) NOT NULL,
  `keyword` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `keyword`
--

INSERT INTO `keyword` (`id`, `keyword`) VALUES
(1, 'medieval'),
(2, 'fantastique'),
(3, 'magie'),
(4, 'espace');

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `payment_date` datetime NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `period_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `payment`
--

INSERT INTO `payment` (`id`, `payment_date`, `amount`, `customer_id`, `period_id`) VALUES
(1, '2015-09-10 00:00:00', '42.00', 1, 1),
(2, '2016-09-17 00:00:00', '42.00', 1, 2),
(3, '2015-10-10 00:00:00', '42.00', 2, 1),
(4, '2016-11-20 00:00:00', '42.00', 2, 2),
(5, '2015-11-10 00:00:00', '42.00', 3, 1),
(6, '2016-11-21 00:00:00', '42.00', 4, 2),
(7, '2014-11-21 00:00:00', '42.00', 4, 2),
(8, '2013-11-21 00:00:00', '42.00', 4, 2),
(9, '2012-11-21 00:00:00', '42.00', 4, 2),
(10, '2011-11-21 00:00:00', '42.00', 4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `period`
--

CREATE TABLE `period` (
  `id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `period`
--

INSERT INTO `period` (`id`, `start_date`, `end_date`) VALUES
(1, '2015-09-01 00:00:00', '2016-08-31 00:00:00'),
(2, '2016-09-01 00:00:00', '2017-08-31 00:00:00');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_address_country1_idx` (`country_id`);

--
-- Index pour la table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`);

--
-- Index pour la table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_booking_book1_idx` (`book_id`),
  ADD KEY `fk_booking_customer1_idx` (`customer_id`);

--
-- Index pour la table `book_author`
--
ALTER TABLE `book_author`
  ADD PRIMARY KEY (`book_id`,`author_id`),
  ADD KEY `fk_book_has_author_author1_idx` (`author_id`),
  ADD KEY `fk_book_has_author_book_idx` (`book_id`);

--
-- Index pour la table `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`book_id`,`category_id`),
  ADD KEY `fk_book_has_category_category1_idx` (`category_id`),
  ADD KEY `fk_book_has_category_book1_idx` (`book_id`);

--
-- Index pour la table `book_keyword`
--
ALTER TABLE `book_keyword`
  ADD PRIMARY KEY (`keyword_id`,`book_id`),
  ADD KEY `fk_keyword_has_book_book1_idx` (`book_id`),
  ADD KEY `fk_keyword_has_book_keyword1_idx` (`keyword_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer_address1_idx` (`address_id`);

--
-- Index pour la table `keyword`
--
ALTER TABLE `keyword`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_payment_customer1_idx` (`customer_id`),
  ADD KEY `fk_payment_period1_idx` (`period_id`);

--
-- Index pour la table `period`
--
ALTER TABLE `period`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `keyword`
--
ALTER TABLE `keyword`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_address_country1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_booking_book1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_booking_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `fk_book_has_author_author1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_book_has_author_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `fk_book_has_category_book1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_book_has_category_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `book_keyword`
--
ALTER TABLE `book_keyword`
  ADD CONSTRAINT `fk_keyword_has_book_book1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_keyword_has_book_keyword1` FOREIGN KEY (`keyword_id`) REFERENCES `keyword` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_customer_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_payment_period1` FOREIGN KEY (`period_id`) REFERENCES `period` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
