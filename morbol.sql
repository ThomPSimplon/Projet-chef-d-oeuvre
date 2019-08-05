-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 05 août 2019 à 08:17
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `morbol`
--

-- --------------------------------------------------------

--
-- Structure de la table `annonce`
--

DROP TABLE IF EXISTS `annonce`;
CREATE TABLE IF NOT EXISTS `annonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `player_role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `player_reasearch` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `commentary` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idUser` (`idUser`),
  KEY `player_role` (`player_role`),
  KEY `player_reasearch` (`player_reasearch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job` (`job`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`id`, `job`, `role`) VALUES
(1, 'Paladin', 'Tank'),
(2, 'Guerrier', 'Tank'),
(3, 'Chevalier Noir', 'Tank'),
(4, 'Pistosabreur', 'Tank'),
(5, 'Mage Blanc', 'Healer'),
(6, 'Erudit', 'Healer'),
(7, 'Astromancien', 'Healer'),
(8, 'Moine', 'DPS'),
(9, 'Samourai', 'DPS'),
(10, 'Chevalier Dragon', 'DPS'),
(11, 'Ninja', 'DPS'),
(12, 'Barde', 'DPS'),
(13, 'Machiniste', 'DPS'),
(14, 'Danseur', 'DPS'),
(15, 'Mage Noir', 'DPS'),
(16, 'Invocateur', 'DPS'),
(17, 'Mage Rouge', 'DPS'),
(18, 'Mage Bleu', 'DPS');

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

DROP TABLE IF EXISTS `membres`;
CREATE TABLE IF NOT EXISTS `membres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mdp` text COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_role` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_role` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `membres`
--

INSERT INTO `membres` (`id`, `pseudo`, `mail`, `mdp`, `avatar`, `id_role`) VALUES
(1, 'Toya', 'xtooya@gmail.com', '640ab2bae07bedc4c163f679a746f7ab7fb5d1fa', '1.jpg', 0);

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
CREATE TABLE IF NOT EXISTS `reponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_annonce` int(11) NOT NULL,
  `id_jobs` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_jobs` (`id_jobs`),
  KEY `id_annonce` (`id_annonce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL,
  `grade` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `grade` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `grade`) VALUES
(1, 'Admin'),
(4, 'En Attente'),
(3, 'Membre'),
(2, 'Modérateur');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `annonce`
--
ALTER TABLE `annonce`
  ADD CONSTRAINT `annonce_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `membres` (`id`),
  ADD CONSTRAINT `annonce_ibfk_2` FOREIGN KEY (`player_role`) REFERENCES `jobs` (`job`),
  ADD CONSTRAINT `annonce_ibfk_3` FOREIGN KEY (`id`) REFERENCES `reponse` (`id_annonce`);

--
-- Contraintes pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `reponse_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `membres` (`id`),
  ADD CONSTRAINT `reponse_ibfk_2` FOREIGN KEY (`id_jobs`) REFERENCES `jobs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
