-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `calciatore`;
CREATE TABLE `calciatore` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `ruolo` varchar(20) NOT NULL,
  `squadra_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `squadra_id` (`squadra_id`),
  CONSTRAINT `calciatore_ibfk_1` FOREIGN KEY (`squadra_id`) REFERENCES `squadra` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `calciatore` (`id`, `nome`, `ruolo`, `squadra_id`) VALUES
(2,	'Caria Maurizio',	'Stopper',	1),
(3,	'Pozzo Debora',	'Mezzapunta Dx',	1),
(4,	'Crisafulli Nicolo',	'Stopper',	1),
(5,	'Sinisi Alice',	'Portiera',	1),
(6,	'Hoxhaj Mario',	'Mezzapunta Sx',	1),
(7,	'Traversone Matteo',	'Ala Sx',	1),
(8,	'Adamini Alessio',	'Ala Dx',	1),
(9,	'Carabbio Emanuele',	'Punta Centrale',	1),
(10,	'Zara Fabrizio',	'Terzino Dx',	1),
(11,	'Villa Elisa',	'Centocampista Centra',	1),
(12,	'Montepagano Rachele',	'Terzino Sx',	1),
(13,	'Capitta Sara',	'Bomberona',	2),
(14,	'He-Man',	'Mezzapunta Sx',	2),
(15,	'Tomcat',	'Ala Sx',	2),
(16,	'Moscow Mule',	'Ala Dx',	2),
(17,	'Rum Cooler',	'Punta Centrale',	2),
(18,	'Mojito',	'Terzino Dx',	2),
(19,	'Negroni',	'Stopper',	2),
(20,	'White Russian',	'Terzino Sx',	2),
(21,	'Margarita',	'Terzino Sx',	2),
(22,	'Bombardino',	'Portiere',	2),
(23,	'Vodka Lemon',	'Terzino Sx',	2);

DROP TABLE IF EXISTS `calendario`;
CREATE TABLE `calendario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `goal_casa` tinyint(2) unsigned DEFAULT NULL,
  `goal_ospite` tinyint(2) unsigned DEFAULT NULL,
  `squadra_id` int(10) unsigned NOT NULL,
  `ospite_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `squadra_id` (`squadra_id`),
  UNIQUE KEY `ospite_id` (`ospite_id`),
  UNIQUE KEY `data` (`data`),
  CONSTRAINT `calendario_ibfk_1` FOREIGN KEY (`squadra_id`) REFERENCES `squadra` (`id`),
  CONSTRAINT `calendario_ibfk_2` FOREIGN KEY (`ospite_id`) REFERENCES `squadra` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `squadra`;
CREATE TABLE `squadra` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `allenatore` varchar(20) NOT NULL,
  `denominazione` varchar(20) NOT NULL,
  `datafondazione` year(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `squadra` (`id`, `allenatore`, `denominazione`, `datafondazione`) VALUES
(1,	'Fabio Fazio',	'Wylab',	'2016'),
(2,	'Valerio Sanguineti',	'Villaggio',	'2016');

DROP TABLE IF EXISTS `votazione`;
CREATE TABLE `votazione` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calciatore_id` int(10) unsigned NOT NULL,
  `calendario_id` int(10) unsigned NOT NULL,
  `voto` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calciatore_id` (`calciatore_id`),
  KEY `calendario_id` (`calendario_id`),
  CONSTRAINT `votazione_ibfk_1` FOREIGN KEY (`calciatore_id`) REFERENCES `calciatore` (`id`),
  CONSTRAINT `votazione_ibfk_2` FOREIGN KEY (`calendario_id`) REFERENCES `calendario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2017-02-21 09:04:44
