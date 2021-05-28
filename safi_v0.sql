-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 17 déc. 2020 à 07:15
-- Version du serveur :  10.3.25-MariaDB-0ubuntu0.20.04.1
-- Version de PHP : 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `safi_v0`
--

-- --------------------------------------------------------

--
-- Structure de la table `activities`
--

CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `request` varchar(1024) NOT NULL,
  `place` varchar(255) DEFAULT NULL,
  `code` varchar(9) NOT NULL,
  `creationDate` date DEFAULT NULL,
  `validationDate` datetime DEFAULT NULL,
  `allocatedBudget` decimal(10,2) NOT NULL,
  `unit` varchar(8) NOT NULL,
  `activityStates_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `activities`
--

INSERT INTO `activities` (`id`, `employee_id`, `theme`, `request`, `place`, `code`, `creationDate`, `validationDate`, `allocatedBudget`, `unit`, `activityStates_id`) VALUES
(1, 59, 'Où on est-on avec les greffes du coeur ?', 'Bonjour, Seriez-vous d\'accord pour qu\'on organise une conférence sur les nouveautés au sujet des greffes ? Merci', 'Salle Pleyel à Paris', 'AC-011220', '2020-12-13', NULL, '0.00', '', 1),
(2, 56, 'Lutter contre la maladie d\'Alzheimer', 'Bonjour, J\'aimerais organiser un symposium pour le mois de décembre prochain. Je pense qu\'avec un budget d\'environ 5000€, je devrai pourvoir faire face à toutes les dépenses. Merci.', 'Salle Audubon aux Sables d\'Olonnes', 'AC-010720', '2020-10-05', '2020-10-28 17:54:24', '4000.00', '€', 3);

-- --------------------------------------------------------

--
-- Structure de la table `activities_practitioners`
--

CREATE TABLE `activities_practitioners` (
  `id` int(11) NOT NULL,
  `specialization` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `activities_id` int(11) NOT NULL,
  `practitioner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `activities_practitioners`
--

INSERT INTO `activities_practitioners` (`id`, `specialization`, `activities_id`, `practitioner_id`) VALUES
(1, 'Spécialiste de la maladie d\'Alzheimer', 2, 500),
(2, 'Spécialiste du cerveau', 2, 731);

-- --------------------------------------------------------

--
-- Structure de la table `activityStates`
--

CREATE TABLE `activityStates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `activityStates`
--

INSERT INTO `activityStates` (`id`, `name`) VALUES
(1, 'created'),
(2, 'waiting'),
(3, 'accepted'),
(4, 'refused'),
(5, 'closed');

-- --------------------------------------------------------

--
-- Structure de la table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `applications`
--

INSERT INTO `applications` (`id`, `name`) VALUES
(1, 'SafiVisits'),
(2, 'SafiFees'),
(3, 'SafiRepay');

-- --------------------------------------------------------

--
-- Structure de la table `applications_employees_privileges`
--

CREATE TABLE `applications_employees_privileges` (
  `id` int(11) NOT NULL,
  `employees_id` int(11) NOT NULL,
  `applications_id` int(11) NOT NULL,
  `privileges_id` int(11) NOT NULL,
  `creationDate` datetime NOT NULL,
  `activated` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `applications_employees_privileges`
--

INSERT INTO `applications_employees_privileges` (`id`, `employees_id`, `applications_id`, `privileges_id`, `creationDate`, `activated`) VALUES
(1, 55, 1, 1, '2018-12-01 10:20:22', 1),
(2, 55, 1, 3, '2018-12-02 10:22:17', 1),
(3, 56, 1, 1, '2020-01-03 10:23:36', 1);

-- --------------------------------------------------------

--
-- Structure de la table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `district_id` int(11) NOT NULL,
  `postalCode` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `firstname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lastname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `login` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `releaseDate` datetime DEFAULT NULL,
  `entryDate` date DEFAULT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timespan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `employees`
--

INSERT INTO `employees` (`id`, `code`, `leader_id`, `district_id`, `postalCode`, `firstname`, `lastname`, `login`, `password`, `address`, `city`, `phone`, `releaseDate`, `entryDate`, `token`, `timespan`) VALUES
(55, 'a131', NULL, 1, '46000', 'Alain', 'Aribi', 'aribiA', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '8 rue des Charmes', 'Cahors', NULL, NULL, '2005-12-21', 'tYBnLJzuccnMPJdrZJ0Wk6GcCPl5Ku3XcEu2dIW6G7AEi4qPzGBRLiqvtmtaIN1v', 1491751241),
(56, 'a17', 56, 2, '46200', 'David', 'Andre', 'dandre', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '1 rue Petit', 'Lalbenque', NULL, NULL, '1998-11-23', NULL, 0),
(57, 'a55', 56, 3, '46250', 'Christian', 'Bedos', 'cbedos', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '1 rue Peranud', 'Montcuq', NULL, NULL, '1995-01-12', NULL, 0),
(58, 'a93', 56, 4, '46123', 'Louis', 'Tusseau', 'ltusseau', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '22 rue des Ternes', 'Gramat', NULL, NULL, '2000-05-01', NULL, 0),
(59, 'b13', 56, 5, '46512', 'Pascal', 'Bentot', 'pbentot', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '11 allée des Cerises', 'Bessines', NULL, NULL, '1992-07-09', NULL, 0),
(60, 'b16', 56, 4, '46000', 'Luc', 'Bioret', 'lbioret', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '1 Avenue gambetta', 'Cahors', NULL, NULL, '1998-05-11', NULL, 0),
(61, 'b19', NULL, 6, '93100', 'Francis', 'Bunisset', 'fbunisset', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '10 rue des Perles', 'Montreuil', NULL, NULL, '1987-10-21', NULL, 0),
(62, 'b25', NULL, 7, '75019', 'Denise', 'Bunisset', 'dbunisset', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '23 rue Manin', 'paris', NULL, NULL, '2010-12-05', NULL, 0),
(63, 'b28', 62, 9, '75017', 'Bernard', 'Cacheux', 'bcacheux', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '114 rue Blanche', 'Paris', NULL, NULL, '2009-11-12', NULL, 0),
(64, 'b34', 62, 10, '75011', 'Eric', 'Cadic', 'ecadic', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '123 avenue de la République', 'Paris', NULL, NULL, '2008-09-23', '1KyF0JNbwoVB0v1PE3UY9ywtLmpXNMwYTbPZcpQ4lHpomFmCTYOWFgaqPqJiwsNQ', 0),
(65, 'b4', 62, 10, '75019', 'Catherine', 'Charoze', 'ccharoze', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '100 rue Petit', 'Paris', NULL, NULL, '2005-11-12', NULL, 0),
(66, 'b50', 62, 6, '93230', 'Christophe', 'Clepkens', 'cclepkens', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '12 allée des Anges', 'Romainville', NULL, NULL, '2003-08-11', NULL, 0),
(67, 'b59', 62, 8, '93100', 'Vincenne', 'Cottin', 'vcottin', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '36 rue Des Roches', 'Monteuil', NULL, NULL, '2001-11-18', NULL, 0),
(68, 'c14', 62, 2, '94000', 'François', 'Daburon', 'fdaburon', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '13 rue de Chanzy', 'Créteil', NULL, NULL, '2002-02-11', NULL, 0),
(69, 'c3', NULL, 6, '94000', 'Philippe', 'De', 'pde', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '13 rue Barthes', 'Créteil', NULL, NULL, '2010-12-14', NULL, 0),
(70, 'c54', NULL, 6, '93210', 'Michel', 'Debelle', 'mdebelle', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '181 avenue Barbusse', 'Rosny', NULL, NULL, '2006-11-23', NULL, 0),
(71, 'd13', NULL, 2, '44000', 'Jeanne', 'Debelle', 'jdebelle', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '134 allée des Joncs', 'Nantes', NULL, NULL, '2000-05-11', NULL, 0),
(72, 'd51', 72, 4, '44000', 'Michel', 'Debroise', 'mdebroise', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '2 Bld Jourdain', 'Nantes', NULL, NULL, '2001-04-17', NULL, 0),
(73, 'e22', NULL, 4, '45000', 'Nathalie', 'Desmarquest', 'ndesmarquest', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '14 Place d Arc', 'Orléans', NULL, NULL, '2005-11-12', NULL, 0),
(74, 'e24', NULL, 6, '23200', 'Pierre', 'Desnost', 'pdesnost', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '16 avenue des Cèdres', 'Guéret', NULL, NULL, '2001-02-05', NULL, 0),
(75, 'e39', NULL, 5, '23120', 'Frédéric', 'Dudouit', 'fdudouit', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '18 rue de l église', 'GrandBourg', NULL, NULL, '2000-08-01', NULL, 0),
(76, 'e49', NULL, 3, '67000', 'Claude', 'Duncombe', 'cduncombe', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '19 rue de la tour', 'Strasbourg', NULL, NULL, '1987-10-10', NULL, 0),
(77, 'e5', 76, 4, '67000', 'Céline', 'Enault-Pascreau', 'cenault', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '25 place de la gare', 'Strasbourg', NULL, NULL, '1995-09-01', NULL, 0),
(78, 'e52', 70, 11, '13015', 'Valérie', 'Eynde', 'veynde', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '3 Grand Place', 'Marseille', NULL, NULL, '1999-11-01', NULL, 0),
(79, 'f21', 70, 11, '13002', 'Jacques', 'Finck', 'jfinck', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '10 avenue du Prado', 'Marseille', NULL, NULL, '2001-11-10', NULL, 0),
(80, 'f39', NULL, 1, '13012', 'Fernande', 'Frémont', 'ffremont', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '4 route de la mer', 'Allauh', NULL, NULL, '1998-10-01', NULL, 0),
(81, 'f4', NULL, 3, '13025', 'Alain', 'Gest', 'agest', '9303d0c836b4877e919d231d103774124372442d238994092ab42eb5d33ad07b497468496c7cbd15fd42f012686b67a625b5fea92fecb3f4d90da853cc2a68c9', '30 avenue de la mer', 'Berre', NULL, NULL, '1985-11-01', NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `expenseActivityPackages`
--

CREATE TABLE `expenseActivityPackages` (
  `id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `unit` varchar(8) NOT NULL,
  `expenseProofs_id` int(11) DEFAULT NULL,
  `activities_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `expenseActivityPackages`
--

INSERT INTO `expenseActivityPackages` (`id`, `description`, `amount`, `unit`, `expenseProofs_id`, `activities_id`) VALUES
(6, 'Location de la salle', '1500.00', '€', 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `expenseInPackages`
--

CREATE TABLE `expenseInPackages` (
  `id` int(11) NOT NULL,
  `expensePackageType_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `expenseInPackages`
--

INSERT INTO `expenseInPackages` (`id`, `expensePackageType_id`) VALUES
(1, 7);

-- --------------------------------------------------------

--
-- Structure de la table `expenseOutPackages`
--

CREATE TABLE `expenseOutPackages` (
  `id` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `unit` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `expenseProofs_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `expenseOutPackages`
--

INSERT INTO `expenseOutPackages` (`id`, `description`, `amount`, `unit`, `expenseProofs_id`) VALUES
(5, 'Leclerc - Cartouche d\'encre noir', '35.40', '€', 1);

-- --------------------------------------------------------

--
-- Structure de la table `expensePackageTypes`
--

CREATE TABLE `expensePackageTypes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `unit` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `expensePackageTypes`
--

INSERT INTO `expensePackageTypes` (`id`, `name`, `amount`, `unit`) VALUES
(5, 'Repas de midi', '25.00', '€'),
(6, 'Relais étape (nuit+repas)', '100.00', '€'),
(7, 'Nuitée (hotel seul)', '80.00', '€'),
(8, 'Déplacement : prix remboursé au kilomètre. Chaque visiteur dispose d\'un badge pour le télépéage pour éviter le remboursement de ces petits montants.', '0.45', '€');

-- --------------------------------------------------------

--
-- Structure de la table `expenseProofs`
--

CREATE TABLE `expenseProofs` (
  `id` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `filePath` varchar(512) CHARACTER SET utf8 DEFAULT NULL,
  `expenseProofTypes_id` int(11) NOT NULL,
  `uploadDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `expenseProofs`
--

INSERT INTO `expenseProofs` (`id`, `description`, `filePath`, `expenseProofTypes_id`, `uploadDate`) VALUES
(1, 'Ticket Leclerc', 'IMG20201107131743.jpg', 1, '2020-11-07 12:05:44'),
(2, 'Facture de la location de la salle - Mairie des Sables', 'scan_facture_salle_mairie.jpg', 2, '2020-11-30 12:26:22');

-- --------------------------------------------------------

--
-- Structure de la table `expenseProofTypes`
--

CREATE TABLE `expenseProofTypes` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `extension` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `expenseProofTypes`
--

INSERT INTO `expenseProofTypes` (`id`, `type`, `extension`) VALUES
(1, 'phone_camera', 'jpg'),
(2, 'computer', 'jpg');

-- --------------------------------------------------------

--
-- Structure de la table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `expenseSheets_id` int(11) NOT NULL,
  `expenseStates_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 0,
  `creationDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `expenses`
--

INSERT INTO `expenses` (`id`, `expenseSheets_id`, `expenseStates_id`, `quantity`, `creationDate`) VALUES
(1, 2, 3, 2, '2020-11-01'),
(5, 2, 3, 1, '2020-11-04'),
(6, 2, 3, 1, '2020-11-16');

-- --------------------------------------------------------

--
-- Structure de la table `expenseSheets`
--

CREATE TABLE `expenseSheets` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `ref` varchar(4) CHARACTER SET utf8 NOT NULL,
  `calcultatedAmount` decimal(10,2) DEFAULT NULL,
  `unit` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `sheetState_id` int(11) NOT NULL,
  `creationDate` date NOT NULL,
  `modificationDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `expenseSheets`
--

INSERT INTO `expenseSheets` (`id`, `employee_id`, `ref`, `calcultatedAmount`, `unit`, `sheetState_id`, `creationDate`, `modificationDate`) VALUES
(1, 56, '1220', NULL, '', 1, '2020-11-20', NULL),
(2, 56, '1120', '1615.40', '€', 5, '2020-10-20', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `expenseSheetStates`
--

CREATE TABLE `expenseSheetStates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `expenseSheetStates`
--

INSERT INTO `expenseSheetStates` (`id`, `name`) VALUES
(1, 'created'),
(2, 'closed'),
(3, 'validated'),
(4, 'payment'),
(5, 'reimbursed'),
(6, 'waitingForProof');

-- --------------------------------------------------------

--
-- Structure de la table `expenseStates`
--

CREATE TABLE `expenseStates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `expenseStates`
--

INSERT INTO `expenseStates` (`id`, `name`) VALUES
(1, 'waiting_for_validation'),
(2, 'waiting_for_proof'),
(3, 'validated'),
(4, 'refused_for_missing_proof'),
(5, 'refused_for_amount_too_high');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `medecineFamilies`
--

CREATE TABLE `medecineFamilies` (
  `id` int(11) NOT NULL,
  `code` varchar(10) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `medecineFamilies`
--

INSERT INTO `medecineFamilies` (`id`, `code`, `name`) VALUES
(1, 'AA', 'Antalgiques en association'),
(2, 'AAA', 'Antalgiques antipyréques en association'),
(3, 'AAC', 'Antidépresseur d action centrale'),
(4, 'AAH', 'Antivertigineux antihistaminique H1'),
(5, 'ABA', 'Antibiotique antituberculeux'),
(6, 'ABC', 'Antibiotique antiacnénique local'),
(7, 'ABP', 'Antibiotique de la famille des béta-lactamines -pénicilline A-'),
(8, 'AFC', 'Antibiotique de la famille des cyclines'),
(9, 'AFM', 'Antibiotique de la famille des macrolides'),
(10, 'AH', 'Antihistaminique H1 local'),
(11, 'AIM', 'Antidépresseur imipraminique -tricyclique-'),
(12, 'AIN', 'Antidépresseur inhibiteur sélectif de la recapture de la sétonine'),
(13, 'ALO', 'Antibiotique local -ORL-'),
(14, 'ANS', 'Antidépresseur IMAO non sélectif'),
(15, 'AO', 'Antibiotique ophtalmique'),
(16, 'AP', 'Antipsychotique normothymique'),
(17, 'AUM', 'Antibiotique urinaire minute'),
(18, 'CRT', 'Corticoide, antibiotique et antifongique à usage local'),
(19, 'HYP', 'Hypnotique antihistaminique'),
(20, 'PSA', 'Psychostimulant antiasthésique');

-- --------------------------------------------------------

--
-- Structure de la table `medecines_visitReports`
--

CREATE TABLE `medecines_visitReports` (
  `id` int(11) NOT NULL,
  `medicines_id` int(11) NOT NULL,
  `quantity` int(2) DEFAULT NULL,
  `visitReports_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `medecines_visitReports`
--

INSERT INTO `medecines_visitReports` (`id`, `medicines_id`, `quantity`, `visitReports_id`) VALUES
(21, 1, 3, 1),
(22, 2, 4, 1),
(23, 3, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `medicines`
--

CREATE TABLE `medicines` (
  `id` int(11) NOT NULL,
  `code` varchar(15) NOT NULL,
  `commercialName` varchar(80) DEFAULT NULL,
  `family_id` int(11) NOT NULL,
  `composition` varchar(100) DEFAULT NULL,
  `effects` varchar(100) DEFAULT NULL,
  `contraindication` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `medicines`
--

INSERT INTO `medicines` (`id`, `code`, `commercialName`, `family_id`, `composition`, `effects`, `contraindication`) VALUES
(1, '3MYC7', 'TRIMYCINE', 18, 'Triamcinolone acétonide + Néomycine + Nystatine', 'Ce médicament est un corticoïde à  activité forte ou très forte associé à  un antibiotique et un ant', 'Ce médicament est contre-indiqué en cas d allergie à  l un des constituants  d infections de la peau'),
(2, 'ADIMOL9', 'ADIMOL', 7, 'Amoxicilline + Acide clavulanique', 'Ce médicament  plus puissant que les pénicillines simples  est utilisé pour traiter des infections b', 'Ce médicament est contre-indiqué en cas d allergie aux pénicillines ou aux céphalosporines.'),
(3, 'AMOPIL7', 'AMOPIL', 7, 'Amoxicilline', 'Ce médicament  plus puissant que les pénicillines simples  est utilisé pour traiter des infections b', 'Ce médicament est contre-indiqué en cas d allergie aux pénicillines. Il doit être administré avec pr'),
(4, 'AMOX45', 'AMOXAR', 7, 'Amoxicilline', 'Ce médicament  plus puissant que les pénicillines simples  est utilisé pour traiter des infections b', 'La prise de ce médicament peut rendre positifs les tests de dépistage du dopage.'),
(5, 'AMOXIG12', 'AMOXI Gé', 7, 'Amoxicilline', 'Ce médicament  plus puissant que les pénicillines simples  est utilisé pour traiter des infections b', 'Ce médicament est contre-indiqué en cas d allergie aux pénicillines. Il doit être administré avec pr'),
(6, 'APATOUX22', 'APATOUX Vitamine C', 13, 'Tyrothricine + Tétracaïne + Acide ascorbique (Vitamine C)', 'Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.', 'Ce médicament est contre-indiqué en cas d allergie à  l un des constituants  en cas de phénylcétonur'),
(7, 'BACTIG10', 'BACTIGEL', 6, 'Erythromycine', 'Ce médicament est utilisé en application locale pour traiter l acné et les infections cutanées bacté', 'Ce médicament est contre-indiqué en cas d allergie aux antibiotiques de la famille des macrolides ou'),
(8, 'BACTIV13', 'BACTIVIL', 9, 'Erythromycine', 'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d allergie aux macrolides (dont le chef de file est l érythr'),
(9, 'BITALV', 'BIVALIC', 2, 'Dextropropoxyphène + Paracétamol', 'Ce médicament est utilisé pour traiter les douleurs d intensité modérée ou intense.', 'Ce médicament est contre-indiqué en cas d allergie aux médicaments de cette famille  d insuffisance '),
(10, 'CARTION6', 'CARTION', 2, 'Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol', 'Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.', 'Ce médicament est contre-indiqué en cas de troubles de la coagulation (tendances aux hémorragies)  d'),
(11, 'CLAZER6', 'CLAZER', 9, 'Clarithromycine', 'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques. Il est également uti', 'Ce médicament est contre-indiqué en cas d allergie aux macrolides (dont le chef de file est l érythr'),
(12, 'DEPRIL9', 'DEPRAMIL', 11, 'Clomipramine', 'Ce médicament est utilisé pour traiter les épisodes dépressifs sévères  certaines douleurs rebelles ', 'Ce médicament est contre-indiqué en cas de glaucome ou d adénome de la prostate  d infarctus récent '),
(13, 'DIMIRTAM6', 'DIMIRTAM', 3, 'Mirtazapine', 'Ce médicament est utilisé pour traiter les épisodes dépressifs sévères.', 'La prise de ce produit est contre-indiquée en cas de d allergie à  l un des constituants.'),
(14, 'DOLRIL7', 'DOLORIL', 2, 'Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol', 'Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.', 'Ce médicament est contre-indiqué en cas d allergie au paracétamol ou aux salicylates.'),
(15, 'DORNOM8', 'NORMADOR', 19, 'Doxylamine', 'Ce médicament est utilisé pour traiter l insomnie chez l adulte.', 'Ce médicament est contre-indiqué en cas de glaucome  de certains troubles urinaires (rétention urina'),
(16, 'EQUILARX6', 'EQUILAR', 4, 'Méclozine', 'Ce médicament est utilisé pour traiter les vertiges et pour prévenir le mal des transports.', 'Ce médicament ne doit pas être utilisé en cas d allergie au produit  en cas de glaucome ou de rétent'),
(17, 'EVILR7', 'EVEILLOR', 20, 'Adrafinil', 'Ce médicament est utilisé pour traiter les troubles de la vigilance et certains symptomes neurologiq', 'Ce médicament est contre-indiqué en cas d allergie à  l un des constituants.'),
(18, 'INSXT5', 'INSECTIL', 10, 'Diphénydramine', 'Ce médicament est utilisé en application locale sur les piqûres d insecte et l urticaire.', 'Ce médicament est contre-indiqué en cas d allergie aux antihistaminiques.'),
(19, 'JOVAI8', 'JOVENIL', 9, 'Josamycine', 'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d allergie aux macrolides (dont le chef de file est l érythr'),
(20, 'LIDOXY23', 'LIDOXYTRACINE', 8, 'Oxytétracycline +Lidocaïne', 'Ce médicament est utilisé en injection intramusculaire pour traiter certaines infections spécifiques', 'Ce médicament est contre-indiqué en cas d allergie à  l un des constituants. Il ne doit pas être ass'),
(21, 'LITHOR12', 'LITHORINE', 16, 'Lithium', 'Ce médicament est indiqué dans la prévention des psychoses maniaco-dépressives ou pour traiter les é', 'Ce médicament ne doit pas être utilisé si vous êtes allergique au lithium. Avant de prendre ce trait'),
(22, 'PARMOL16', 'PARMOCODEINE', 1, 'Codéine + Paracétamol', 'Ce médicament est utilisé pour le traitement des douleurs lorsque des antalgiques simples ne sont pa', 'Ce médicament est contre-indiqué en cas d allergie à  l un des constituants  chez l enfant de moins '),
(23, 'PHYSOI8', 'PHYSICOR', 20, 'Sulbutiamine', 'Ce médicament est utilisé pour traiter les baisses d activité physique ou psychique  souvent dans un', 'Ce médicament est contre-indiqué en cas d allergie à  l un des constituants.'),
(24, 'PIRIZ8', 'PIRIZAN', 5, 'Pyrazinamide', 'Ce médicament est utilisé  en association à  d autres antibiotiques  pour traiter la tuberculose.', 'Ce médicament est contre-indiqué en cas d allergie à  l un des constituants  d insuffisance rénale o'),
(25, 'POMDI20', 'POMADINE', 15, 'Bacitracine', 'Ce médicament est utilisé pour traiter les infections oculaires de la surface de l oeil.', 'Ce médicament est contre-indiqué en cas d allergie aux antibiotiques appliqués localement.'),
(26, 'TROXT21', 'TROXADET', 12, 'Paroxétine', 'Ce médicament est utilisé pour traiter la dépression et les troubles obsessionnels compulsifs. Il pe', 'Ce médicament est contre-indiqué en cas d allergie au produit.'),
(27, 'TXISOL22', 'TOUXISOL', 13, 'Tyrothricine + Acide ascorbique (Vitamine C)', 'Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.', 'Ce médicament est contre-indiqué en cas d allergie à  l un des constituants et chez l enfant de moin'),
(28, 'URIEG6', 'URIREGUL', 17, 'Fosfomycine trométamol', 'Ce médicament est utilisé pour traiter les infections urinaires simples chez la femme de moins de 65', 'La prise de ce médicament est contre-indiquée en cas d allergie à l un des constituants et d insuffi');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `practitioners`
--

CREATE TABLE `practitioners` (
  `id` int(11) NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `firstname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `notorietyCoeff` int(11) DEFAULT NULL,
  `complementarySpeciality` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `practitioners`
--

INSERT INTO `practitioners` (`id`, `lastname`, `firstname`, `address`, `tel`, `notorietyCoeff`, `complementarySpeciality`, `district_id`) VALUES
(1, 'MARTIN', 'Prosper', '25 rue Anatole France BRIANCON 05100', '0485244174', NULL, NULL, 5),
(2, 'BLANC', 'Anne-Lucie', '39 rue des gatinnes BILLIAT 01200', '0356895400', NULL, 'Pédiatre', 1),
(3, 'GARCIA', 'Camille', '58 rue du stade MESSINCOURT 08110', '0365489929', NULL, NULL, 8),
(4, 'MARTINEZ', 'Alice', '12 rue des Pigeons JOIGNY-SUR-MEUSE 08700', '0319692016', NULL, NULL, 8),
(5, 'MICHEL', 'Vénus', '55 rue du 14 juillet ORCIERES 05170', '0421670911', NULL, NULL, 5),
(6, 'ROUX', 'Anne-Lucie', '49 rue des Ormes ATTILLY 02490', '0313817061', NULL, NULL, 2),
(7, 'FABRE', 'Marie', '78 rue de Poligny YONCQ 08210', '0388716930', NULL, 'HOMEOPATHIE', 8),
(8, 'ARNAUD', 'Andrew', '29 rue des Pigeons SAVINES-LE-LAC 05160', '0477740994', NULL, NULL, 5),
(9, 'FERNANDEZ', 'Julien', '45 rue de du général Scott THIN-LE-MOUTIER 08460', '0321760709', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 8),
(10, 'LOPEZ', 'Aurèle', '16 rue Alphonse Daudet ORCIERES 05170', '0485568083', NULL, NULL, 5),
(11, 'BERNARD', 'Johnny', '74 rue de Paris SAVINES-LE-LAC 05160', '0417789322', NULL, NULL, 5),
(12, 'GIRAUD', 'Andrée', '25 rue Passy PARIS 75000', '0156124589', NULL, 'psy', 5),
(13, 'BOYER', 'Gilles', '33 rue Commandant Hériot MONTIGNY-SUR-MEUSE 08170', '0334037052', NULL, NULL, 8),
(14, 'SANCHEZ', 'Vénus', '14 rue de la poste BANCIGNY 02145', '0313832194', NULL, 'Pédiatrie', 2),
(15, 'BRUN', 'Cristophe', '81 rue Bonaparte AUBENTON 02500', '0366612144', NULL, NULL, 2),
(16, 'PEREZ', 'Jules', '85 rue Hector Berlioz BRIANCON 05100', '0459073011', NULL, NULL, 5),
(17, 'SANTIAGO', 'Julienne', '17 rue Lampion AUGIREIN 09800', '0524077425', NULL, NULL, 9),
(18, 'DURAND', 'John', '92 rue du général de Gaulle SORBIERS 05150', '0484328394', NULL, 'HOMEOPATHIE', 5),
(19, 'RODRIGUEZ', 'Cristophe', '1 rue des Accacias BELLOC 09600', '0564847694', NULL, NULL, 9),
(20, 'REYNAUD', 'Catherine', '8 rue des Accacias MONCEAU-SUR-OISE 02120', '0352679072', NULL, NULL, 2),
(21, 'AUBERT', 'Julien', '51 rue Bonaparte CAMON 09500', '0552863581', NULL, NULL, 9),
(22, 'ROSSI', 'Nohan', '69 rue Mallarmé AX-LES-THERMES 09110', '0596648531', NULL, NULL, 9),
(23, 'BERTRAND', 'Julienne', '72 rue Pasteur SAVOURNON 05700', '0490527954', NULL, NULL, 5),
(24, 'GAUTIER', 'Irénée', '28 rue Anatole France BELLEY 01300', '0486481045', NULL, NULL, 1),
(25, 'BONNET', 'François', '78 rue des Epines AZY-SUR-MARNE 02400', '0318212781', NULL, NULL, 2),
(26, 'REY', 'Charles-Edouard', '86 rue Louis Aragon BILLIAT 01200', '0446961025', NULL, NULL, 1),
(27, 'GOMEZ', 'Jérémy', '89 rue de la pointe SAINT-FIRMIN 05800', '0438318333', NULL, NULL, 5),
(28, 'GIRARD', 'Johnny', '19 rue de la Tour JOIGNY-SUR-MEUSE 08700', '0341883832', NULL, 'pédiatrie', 8),
(29, 'JOURDAN', 'Hector', '29 rue de la pointe BOURG-EN-BRESSE 01000', '0431450970', NULL, NULL, 1),
(30, 'ROCHE', 'Mohammed', '30 rue Pasteur BEZAC 09100', '0591677334', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 9),
(31, 'FAURE', 'Annie', '82 rue Mallarmé SIGOYER 05130', '0487018886', NULL, NULL, 5),
(32, 'ESPOSITO', 'Caline', '27 rue de Marigny BRIANCON 05100', '0444253472', NULL, NULL, 5),
(33, 'IMBERT', 'Jordan', '53 rue Alphonse Daudet SAINT-LAURENT-SUR-SAONE 01750', '0463813731', NULL, NULL, 1),
(34, 'VIDAL', 'Anne-Lucie', '94 rue de la pointe BOULIGNEUX 01330', '0462262613', NULL, NULL, 1),
(35, 'OLIVE', 'Reissa', '63 rue Alphonse Daudet AX-LES-THERMES 09110', '0563092583', NULL, NULL, 9),
(36, 'ROBERT', 'Anne-Jeanne', '26 rue des Armées AVANCON 05230', '0442237548', NULL, NULL, 5),
(37, 'BARTHELEMY', 'Fatima', '24 rue Albert Camus PELVOUX 05340', '0411439067', NULL, 'URGENTISTE', 5),
(38, 'LAURENT', 'Alice', '33 rue de la Tour BOURG-EN-BRESSE 01000', '0479660588', NULL, NULL, 1),
(39, 'ANDRE', 'Béatrice', '25 rue des Lilas LAUNOIS-SUR-VENCE 08430', '0389426738', NULL, NULL, 8),
(40, 'PONS', 'Armelle', '48 rue de Paris REOTIER 05600', '0467247607', NULL, NULL, 5),
(41, 'PASCAL', 'Anselme', '19 rue des pyramides ARANDAS 01230', '0434638475', NULL, NULL, 1),
(42, 'JULIEN', 'John', '23 rue Alphonse Daudet SORBIERS 05150', '0473380415', NULL, NULL, 5),
(43, 'NICOLAS', 'Firmin', '59 rue de la Pergolat FLEVILLE 08250', '0337420570', NULL, NULL, 8),
(44, 'MAURIN', 'Anne', '59 rue de du général Scott MONTCY-NOTRE-DAME 08090', '0310431717', NULL, 'ACUPONCTURE', 8),
(45, 'CORTES', 'Gilles', '65 rue des oiseaux ARROUT 09800', '0578097401', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 9),
(46, 'MATHIEU', 'Anne-Jeanne', '29 rue Petit BEDEILLE 09230', '0523206238', NULL, NULL, 9),
(47, 'FERAUD', 'Anne-Lucie', '14 rue Petit BEZAC 09100', '0512011679', NULL, NULL, 9),
(48, 'ROUBAUD', 'Carole', '86 rue du capitaine Fraquasse BETTANT 01500', '0490382365', NULL, 'HOMEOPATHIE', 1),
(49, 'LONG', 'Amiel', '22 rue Lampion BELLEY 01300', '0463584743', NULL, NULL, 1),
(50, 'GIORDANO', 'Martial', '75 rue du capitaine Crochet ATTILLY 02490', '0361985743', NULL, NULL, 2),
(51, 'COSTE', 'Anne-Laure', '60 rue Pernod BETTANT 01500', '0437621473', NULL, NULL, 1),
(52, 'GARCIN', 'Prosper', '46 rue de la Tour REOTIER 05600', '0450401007', NULL, 'ACUPONCTURE', 5),
(53, 'LAUGIER', 'Fatima', '95 rue de Poligny BOURG-EN-BRESSE 01000', '0481057435', NULL, NULL, 1),
(54, 'RICHARD', 'Jérome', '39 rue Commandant Hériot BANCIGNY 02140', '0315759754', NULL, NULL, 2),
(55, 'JEAN', 'Ines', '90 rue Pernod ROCHEBRUNE 05190', '0444572962', NULL, 'ALLERGOLOGIE', 5),
(56, 'MAUREL', 'Jérémie', '45 rue des Chantereines FLOING 08200', '0333621591', NULL, NULL, 8),
(57, 'RUIZ', 'Anne-Marie', '48 rue du 14 juillet BRIANCON 05100', '0478777229', NULL, NULL, 5),
(58, 'NAVARRO', 'Armelle', '88 rue des Argonautes DOMMARTIN 01380', '0482500579', NULL, NULL, 1),
(59, 'RICARD', 'Anselme', '18 rue de du général Scott BOURG-EN-BRESSE 01000', '0428387190', NULL, 'GERONTOLOGIE', 1),
(60, 'HERNANDEZ', 'Aude', '98 rue Hector Berlioz BOULIGNEUX 01330', '0460116931', NULL, NULL, 1),
(61, 'ROMAN', 'Camille', '43 rue de la poste ASTON 09310', '0554877193', NULL, NULL, 9),
(62, 'VINCENT', 'Bernard', '69 rue Debussy AX-LES-THERMES 09110', '0592618819', NULL, NULL, 9),
(63, 'FOUQUE', 'Johnny', '27 rue Victor Hugo MONTCEAUX 01090', '0410938634', NULL, NULL, 1),
(64, 'LAMBERT', 'Aude', '40 rue Mallarmé SAINT-FIRMIN 05800', '0434328795', NULL, NULL, 5),
(65, 'DAVID', 'Anne-Lucie', '80 rue Victor Hugo LAVAL-MORENCY 08150', '0354570788', NULL, NULL, 8),
(66, 'FOURNIER', 'Alice', '48 rue des perles blanches QUATRE-CHAMPS 08400', '0351022549', NULL, NULL, 8),
(67, 'GONZALEZ', 'Bénédicte', '44 rue des Pigeons SAINT-LAURENT-SUR-SAONE 01750', '0453817641', NULL, NULL, 1),
(68, 'COHEN', 'Précilia', '65 rue St Denis ASTON 09310', '0574385413', NULL, NULL, 9),
(69, 'CAILLOL', 'Andrée', '86 rue des Pigeons AX-LES-THERMES 09110', '0512919575', NULL, NULL, 9),
(70, 'GROS', 'Bertrand', '87 rue du 14 juillet BARZY-SUR-MARNE 02850', '0389988201', NULL, 'ALLERGOLOGIE', 2),
(71, 'AUDIBERT', 'Jérome', '40 rue Bonaparte MAYOT 02800', '0380247692', NULL, NULL, 2),
(72, 'CLEMENT', 'Victor', '91 rue Malraux MEZIERES-SUR-OISE 02240', '0396223586', NULL, NULL, 2),
(73, 'JULLIEN', 'Victor', '86 rue du capitaine Fraquasse SAVINES-LE-LAC 05160', '0424098074', NULL, NULL, 5),
(74, 'GARNIER', 'Bertrand', '44 rue du capitaine Fraquasse MONTIGNY-SUR-MEUSE 08170', '0365814281', NULL, NULL, 8),
(75, 'PAUL', 'Adrien', '47 rue Commandant Hériot AUDRESSEIN 09800', '0561293920', NULL, NULL, 9),
(76, 'LOMBARD', 'Irénée', '42 rue des Epines SAINT-LAURENT-SUR-SAONE 01750', '0432573377', NULL, NULL, 1),
(77, 'DUMAS', 'Amélie', '95 rue Anatole France HERBEUVAL 08370', '0395342234', NULL, NULL, 8),
(78, 'MORENO', 'Jordan', '18 rue Blainville AVANCON 05230', '0410805260', NULL, NULL, 5),
(79, 'BERENGER', 'Anne-Laure', '49 rue des Princes OYONNAX 01100', '0495914341', NULL, NULL, 1),
(80, 'PETIT', 'Ingrid', '90 rue des Lilas BELLOC 09600', '0550136460', NULL, NULL, 9),
(81, 'SIMON', 'Yoan', '2 rue Beaudelaire FALAISE 08400', '0349609708', NULL, NULL, 8),
(82, 'MARTINI', 'Jules', '61 rue Petit SORBIERS 05150', '0453597713', NULL, 'ANGEIOLOGIE', 5),
(83, 'JOUVE', 'Jérome', '12 rue Agniel ABBECOURT 02300', '0336592352', NULL, NULL, 2),
(84, 'BOURRELLY', 'Bernard', '46 rue des Néfliers ARROUT 09800', '0593876907', NULL, NULL, 9),
(85, 'NEGREL', 'Anne-Jeanne', '94 rue de la Tour AUBENTON 02500', '0315358087', NULL, NULL, 2),
(86, 'CHAIX', 'John', '13 rue de la recette MONT-LAURENT 08130', '0324815927', NULL, NULL, 8),
(87, 'PERRIN', 'Aurélien', '34 rue Alphonse Daudet MONTCY-NOTRE-DAME 08090', '0388838695', NULL, 'ALLERGOLOGIE', 8),
(88, 'DAUMAS', 'Anne-Marie', '50 rue Commandant Mouchotte BARENTON-SUR-SERRE 02270', '0380767789', NULL, NULL, 2),
(89, 'MATTEI', 'Marie', '36 rue de la rose BOULIGNEUX 01330', '0459841705', NULL, NULL, 1),
(90, 'MARIN', 'Bertrand', '80 rue Beaudelaire FLOING 08200', '0370254981', NULL, NULL, 8),
(91, 'GIMENEZ', 'Austine', '37 rue Agniel BILLIAT 01200', '0498702952', NULL, NULL, 1),
(92, 'CAMOIN', 'Aline', '85 rue des Cavaux AUBENTON 02500', '0320874526', NULL, 'ACUPONCTURE', 2),
(93, 'GAY', 'Béatrice', '98 rue Perdue AUDRESSEIN 09800', '0550107365', NULL, NULL, 9),
(94, 'PELLEGRIN', 'Fernand', '21 rue Blainville ABBECOURT 02300', '0379546875', NULL, NULL, 2),
(95, 'CHAUVET', 'Anne-Lucie', '47 rue des Anses bleues BARENTON-SUR-SERRE 02270', '0357798474', NULL, NULL, 2),
(96, 'BREMOND', 'Julienne', '89 rue du stade VAUX-CHAMPAGNE 08130', '0321409034', NULL, NULL, 8),
(97, 'TORRES', 'Alain', '21 rue des pyramides MONTCY-NOTRE-DAME 08090', '0355126171', NULL, NULL, 8),
(98, 'ISNARD', 'André', '70 rue de la rose THIN-LE-MOUTIER 08460', '0383574338', NULL, NULL, 8),
(99, 'OLLIVIER', 'Anne-Lucie', '28 rue du Mont AX-LES-THERMES 09110', '0525425981', NULL, NULL, 9),
(100, 'BRUNET', 'Jérémie', '83 rue de la pointe MONTCY-NOTRE-DAME 08090', '0344175754', NULL, NULL, 8),
(101, 'OLIVIER', 'Alizée', '23 rue des Néfliers BARZY-SUR-MARNE 02850', '0318063658', NULL, NULL, 2),
(102, 'GUERIN', 'Béatrice', '75 rue de la poste SIGOYER 05130', '0499728475', NULL, NULL, 5),
(103, 'RUSSO', 'Jimmy', '57 rue du 14 juillet BEDEILLE 09230', '0579403405', NULL, NULL, 9),
(104, 'PAOLI', 'Martin', '77 rue Edouard Hériot PELVOUX 05340', '0465821962', NULL, NULL, 5),
(105, 'FERRERO', 'Astine', '77 rue des Chantereines SIGOYER 05130', '0443207794', NULL, NULL, 5),
(106, 'COSTA', 'Julien', '75 rue des Epines EVIGNY 08090', '0353124513', NULL, NULL, 8),
(107, 'LACROIX', 'Anne-Lucie', '64 rue des Pigeons BEAUMONT-EN-BEINE 02300', '0357357391', NULL, NULL, 2),
(108, 'VIAL', 'Fernand', '21 rue Commandant Hériot ARROUT 09800', '0533982064', NULL, 'ALLERGOLOGIE', 9),
(109, 'BRUNO', 'Aurélien', '13 rue Debussy AUGIREIN 09800', '0550671849', NULL, NULL, 9),
(110, 'GILLES', 'Hector', '54 rue des Chantereines BEAUMONT-EN-BEINE 02300', '0397960460', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 2),
(111, 'THOMAS', 'Bénédicte', '7 rue de Paris BOURG-EN-BRESSE 01000', '0483574560', NULL, NULL, 1),
(112, 'BENOIT', 'Aristote', '35 rue des Argonautes FEPIN 08170', '0321622783', NULL, 'ACUPONCTURE', 8),
(113, 'CASANOVA', 'Anémone', '66 rue Blainville ARROUT 09800', '0561274309', NULL, NULL, 9),
(114, 'RICHAUD', 'Hamed', '96 rue de la Tour SAINT-CREPIN 05600', '0466381035', NULL, NULL, 5),
(115, 'BIANCHI', 'Précilia', '45 rue des Chantereines MONTIGNY-SUR-MEUSE 08170', '0319515228', NULL, NULL, 8),
(116, 'GRANIER', 'Ines', '54 rue de la Tour AUGIREIN 09800', '0522353355', NULL, NULL, 9),
(117, 'CHABERT', 'Alizée', '32 rue des gatinnes SAINT-SAUVEUR 05200', '0479723538', NULL, NULL, 5),
(118, 'ROLLAND', 'Reissa', '36 rue Malraux FLEVILLE 08250', '0389034128', NULL, NULL, 8),
(119, 'RIGAUD', 'Anne-Sophie', '27 rue Anatole France LAUNOIS-SUR-VENCE 08430', '0319617909', NULL, 'ANGEIOLOGIE', 8),
(120, 'DUBOIS', 'Hamed', '44 rue de la Pergolat AGUILCOURT 02190', '0391017673', NULL, NULL, 2),
(121, 'HUGUES', 'Alain', '97 rue des Anges SAINT-LAURENT-SUR-SAONE 01750', '0420673509', NULL, NULL, 1),
(122, 'BARBIER', 'Rodolphe', '5 rue de la pointe AUGIREIN 09800', '0568080361', NULL, NULL, 9),
(123, 'MILLE', 'Andrée', '26 rue des Argonautes BELLEY 01300', '0417979762', NULL, NULL, 1),
(124, 'MAGNAN', 'Hamed', '52 rue des Argonautes BILLIAT 01200', '0434883323', NULL, NULL, 1),
(125, 'ARNOUX', 'Mohammed', '33 rue Bonaparte VAUX-CHAMPAGNE 08130', '0388412366', NULL, NULL, 8),
(126, 'LEVY', 'Patricia', '86 rue de la poste ASTON 09310', '0544573807', NULL, NULL, 9),
(127, 'GAUTHIER', 'Aurélien', '51 rue Debussy SAINT-FIRMIN 05800', '0429493464', NULL, NULL, 5),
(128, 'CHABAUD', 'Firmin', '69 rue de Paris MEZIERES-SUR-OISE 02240', '0327148898', NULL, NULL, 2),
(129, 'REBOUL', 'Robert', '18 rue des Pigeons MAYOT 02800', '0350756815', NULL, NULL, 2),
(130, 'TEISSIER', 'Patrick', '35 rue des Cyprés MEZIERES-SUR-OISE 02240', '0375111486', NULL, NULL, 2),
(131, 'FERRARI', 'Catherine', '67 rue des Pigeons NEUVILLE-LES-DAMES 01400', '0445004508', NULL, NULL, 1),
(132, 'SICARD', 'Aude', '68 rue des Epines BAGERT 09230', '0511378600', NULL, 'ALLERGOLOGIE', 9),
(133, 'COULOMB', 'François', '38 rue Agniel PELVOUX 05340', '0466704922', NULL, NULL, 5),
(134, 'ARMAND', 'Habib', '96 rue de Marigny SAINTE-MARIE 05150', '0472203933', NULL, NULL, 5),
(135, 'MARCHETTI', 'Annie', '98 rue des Argonautes FRESSANCOURT 02800', '0324461914', NULL, 'HOMEOPATHIE', 2),
(136, 'GRAS', 'Julienne', '59 rue des gatinnes BARZY-SUR-MARNE 02850', '0311581103', NULL, NULL, 2),
(137, 'REYNIER', 'Alain', '48 rue des Epines VAUX-CHAMPAGNE 08130', '0353929274', NULL, NULL, 8),
(138, 'DIAZ', 'Aristote', '42 rue Edouard Hériot BAGERT 09230', '0597457423', NULL, NULL, 9),
(139, 'SERRE', 'Catherine', '53 rue des hirondelles SAINT-FIRMIN 05800', '0473864972', NULL, NULL, 5),
(140, 'MARIANI', 'Fatima', '7 rue Alphonse Daudet ASTON 09310', '0573029393', NULL, NULL, 9),
(141, 'JAUFFRET', 'Fernand', '64 rue des Artistes AX-LES-THERMES 09110', '0580503787', NULL, NULL, 9),
(142, 'SERRA', 'Anne-Lucie', '17 rue Pernod DOMMARTIN 01380', '0454076144', NULL, NULL, 1),
(143, 'BONIFAY', 'Anne-Ange', '39 rue des Anges SAVINES-LE-LAC 05160', '0460795137', NULL, NULL, 5),
(144, 'BERARD', 'Alice', '32 rue des pyramides BEAUMONT-EN-BEINE 02300', '0315894255', NULL, NULL, 2),
(145, 'HENRY', 'Armelle', '44 rue Perdue ABBECOURT 02300', '0346616676', NULL, NULL, 2),
(146, 'CANO', 'Anne-Ange', '67 rue de la pointe SAINT-LAURENT-SUR-SAONE 01750', '0479957609', NULL, NULL, 1),
(147, 'AILLAUD', 'André', '9 rue Mallarmé AUBENTON 02500', '0342830645', NULL, 'ACUPONCTURE', 2),
(148, 'GRIMAUD', 'Aurèle', '54 rue du stade NEUVILLE-LES-DAMES 01400', '0470983399', NULL, NULL, 1),
(149, 'SABATIER', 'Jimmy', '8 rue Albert Camus MONTCY-NOTRE-DAME 08090', '0339328684', NULL, NULL, 8),
(150, 'LIEUTAUD', 'Anaelle', '53 rue St Denis BELLOC 09600', '0575252091', NULL, NULL, 9),
(151, 'GUICHARD', 'Armelle', '79 rue Beaudelaire BAGERT 09230', '0574702561', NULL, NULL, 9),
(152, 'ETIENNE', 'Catherine', '81 rue des Cyprés SIGOYER 05130', '0431018220', NULL, 'Pédiatrie', 5),
(153, 'GINOUX', 'Julien', '33 rue des Cyprés BAGERT 09230', '0590592425', NULL, NULL, 9),
(154, 'FRANCESCHI', 'Adelphe', '7 rue de la poste OYONNAX 01100', '0463473029', NULL, NULL, 1),
(155, 'BOUCHET', 'Hypolite', '62 rue Malraux BOURG-EN-BRESSE 01000', '0459994942', NULL, NULL, 1),
(156, 'GALLO', 'Martin', '4 rue des perles blanches FLOING 08200', '0377624408', NULL, NULL, 8),
(157, 'ROSSO', 'Aristote', '13 rue des Argonautes ABBECOURT 02300', '0334073561', NULL, NULL, 2),
(158, 'MOREL', 'Roby', '16 rue Hector Berlioz MACHAULT 08310', '0327990795', NULL, NULL, 8),
(159, 'BOREL', 'Austine', '86 rue Pernod SAINT-ANDRE-DE-ROSANS 05150', '0475430562', NULL, NULL, 5),
(160, 'RIPERT', 'François', '75 rue Anatole France AX-LES-THERMES 09110', '0527300069', NULL, NULL, 9),
(161, 'PAYAN', 'Aurèle', '77 rue des perles blanches BANCIGNY 02140', '0336207616', NULL, NULL, 2),
(162, 'LUCIANI', 'Carole', '62 rue de la pointe BRIANCON 05100', '0494704120', NULL, NULL, 5),
(163, 'BARRA', 'Charles-Edouard', '96 rue des Pigeons MONTCY-NOTRE-DAME 08090', '0351941479', NULL, NULL, 8),
(164, 'GAILLARD', 'Hamed', '88 rue des Armées BELLEY 01300', '0425303459', NULL, NULL, 1),
(165, 'AGOSTINI', 'Amélie', '8 rue de la gare AX-LES-THERMES 09110', '0543024681', NULL, NULL, 9),
(166, 'GREGOIRE', 'Yoan', '67 rue des Anges SAINT-SAUVEUR 05200', '0444643838', NULL, NULL, 5),
(167, 'ROUSSET', 'Victor', '31 rue des Anges BUZAN 09800', '0531789114', NULL, NULL, 9),
(168, 'RAYNAUD', 'Julien', '30 rue des Argonautes ATTILLY 02490', '0381097843', NULL, 'ACUPONCTURE', 2),
(169, 'CAYOL', 'Astine', '63 rue du stade AX-LES-THERMES 09110', '0589774185', NULL, NULL, 9),
(170, 'MARTEL', 'Johnny', '63 rue du 14 juillet AX-LES-THERMES 09110', '0559787089', NULL, NULL, 9),
(171, 'PELISSIER', 'Anaelle', '72 rue de Paris CHALLES 01450', '0436897781', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 1),
(172, 'ALLEMAND', 'Habib', '42 rue des Ormes BILLIAT 01200', '0461405456', NULL, 'URGENTISTE', 1),
(173, 'FERRIER', 'Johnny', '62 rue du général de Gaulle BOURG-EN-BRESSE 01000', '0479899509', NULL, 'OSTEOPATHIE', 1),
(174, 'RAYMOND', 'Anne-Jeanne', '9 rue Pasteur SAINT-FIRMIN 05800', '0412854347', NULL, NULL, 5),
(175, 'MISTRAL', 'Françoise', '36 rue des Ormes SAINT-CREPIN 05600', '0470969763', NULL, NULL, 5),
(176, 'SOLER', 'Annie', '6 rue des Armées ASTON 09310', '0561398750', NULL, NULL, 9),
(177, 'DURBEC', 'Alizée', '60 rue Edouard Hériot ASTON 09310', '0529196402', NULL, NULL, 9),
(178, 'DOSSETTO', 'Victor', '68 rue de la Pergolat BEDEILLE 09230', '0510798563', NULL, NULL, 9),
(179, 'FERRER', 'Amiel', '48 rue Alphonse Daudet FLOING 08200', '0367188526', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 8),
(180, 'FILIPPI', 'Serge', '13 rue des Epines BETTANT 01500', '0415842763', NULL, NULL, 1),
(181, 'BASSO', 'Anne-Lucie', '91 rue Lampion HOUDILCOURT 08190', '0360919149', NULL, NULL, 8),
(182, 'GIL', 'Firmin', '79 rue Commandant Mouchotte SAVINES-LE-LAC 05160', '0454186158', NULL, 'OSTEOPATHIE', 5),
(183, 'POLI', 'Jules', '41 rue Louis Aragon SAINT-LAURENT-SUR-SAONE 01750', '0470580820', NULL, NULL, 1),
(184, 'CHAUVIN', 'Irénée', '25 rue Lampion BLYES 01150', '0462212615', NULL, NULL, 1),
(185, 'MARTINO', 'Anne-Marie', '21 rue de la Pergolat AX-LES-THERMES 09110', '0552002239', NULL, NULL, 9),
(186, 'ESTIENNE', 'Ines', '81 rue du 14 juillet BELLOC 09600', '0579065527', NULL, NULL, 9),
(187, 'GOUIRAN', 'Aurèle', '82 rue des Anges MEZIERES-SUR-OISE 02240', '0372146119', NULL, NULL, 2),
(188, 'VERNET', 'Ingrid', '2 rue de la rose BARZY-SUR-MARNE 02850', '0374513763', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 2),
(189, 'ROMANO', 'Prosper', '34 rue Louis Aragon ARROUT 09800', '0570233041', NULL, NULL, 9),
(190, 'ROUSSEL', 'Hamed', '54 rue Louis Aragon MACHAULT 08310', '0361841793', NULL, NULL, 8),
(191, 'BIANCO', 'Yoan', '69 rue des Accacias BEAUMONT-EN-BEINE 02300', '0364444471', NULL, 'ANGEIOLOGIE', 2),
(192, 'LOMBARDO', 'Serge', '57 rue du capitaine Crochet MONTCY-NOTRE-DAME 08090', '0348000197', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 8),
(193, 'CHEVALIER', 'Patrice', '64 rue Albert Camus SAINT-LAURENT-SUR-SAONE 01750', '0427960246', NULL, NULL, 1),
(194, 'JAUBERT', 'Aristote', '5 rue des Cyprés AZY-SUR-MARNE 02400', '0352734097', NULL, NULL, 2),
(195, 'FERRATO', 'Astine', '40 rue Louis Aragon MONTCY-NOTRE-DAME 08090', '0335541135', NULL, NULL, 8),
(196, 'MOUREN', 'Anémone', '85 rue Hector Berlioz BEZAC 09100', '0538796488', NULL, NULL, 9),
(197, 'PINATEL', 'Anselme', '79 rue des Cavaux CHABESTAN 05400', '0478991381', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 5),
(198, 'ALBERTINI', 'Gilles', '88 rue Alphonse Daudet BELLOC 09600', '0591522693', NULL, NULL, 9),
(199, 'GERARD', 'Austine', '72 rue des Ormes MESSINCOURT 08110', '0368355399', NULL, 'GERONTOLOGIE', 8),
(200, 'OLIVIERI', 'Aurèle', '53 rue Hector Berlioz FALAISE 08400', '0325150351', NULL, NULL, 8),
(201, 'BARTOLI', 'Nohan', '58 rue du 14 juillet AUBENTON 02500', '0380869429', NULL, NULL, 2),
(202, 'MOURET', 'Jimmy', '41 rue du Mont FRESSANCOURT 02800', '0333010728', NULL, 'HOMEOPATHIE', 2),
(203, 'LOMBARDI', 'Gilles', '26 rue du capitaine Fraquasse YONCQ 08210', '0355888480', NULL, NULL, 8),
(204, 'ORSINI', 'Jules', '95 rue des gatinnes EVIGNY 08090', '0321047751', NULL, 'URGENTISTE', 8),
(205, 'MERCIER', 'Adrien', '37 rue de la rose BARENTON-SUR-SERRE 02270', '0333061059', NULL, NULL, 2),
(206, 'ASTIER', 'Astine', '29 rue Louis Aragon FLEVILLE 08250', '0337878739', NULL, NULL, 8),
(207, 'LECA', 'Ingrid', '95 rue Mallarmé AX-LES-THERMES 09110', '0538253531', NULL, 'ALLERGOLOGIE', 9),
(208, 'BESSON', 'Julie', '70 rue du Mont BILLIAT 01200', '0434858369', NULL, NULL, 1),
(209, 'FONTAINE', 'Jules', '87 rue des hirondelles FLOING 08200', '0366452640', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 8),
(210, 'MALLET', 'sabine', '70 rue des Ormes LAVAL-MORENCY 08150', '0313786191', NULL, NULL, 8),
(211, 'DALMASSO', 'Anne-Sophie', '72 rue de Paris AMBRIEF 02200', '0396888350', NULL, NULL, 2),
(212, 'COLOMBANI', 'Julienne', '95 rue de du général Scott SAINT-FIRMIN 05800', '0499781511', NULL, NULL, 5),
(213, 'SANNA', 'Prosper', '40 rue du stade CHEZY-SUR-MARNE 02570', '0370552277', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 2),
(214, 'GERMAIN', 'François', '21 rue des oiseaux AUBENTON 02500', '0347608567', NULL, NULL, 2),
(215, 'BERGER', 'Béatrice', '91 rue de Paris BARENTON-SUR-SERRE 02270', '0332630528', NULL, NULL, 2),
(216, 'MULLER', 'Alice', '14 rue de la Tour PELVOUX 05340', '0497349269', NULL, NULL, 5),
(217, 'DANIEL', 'Hypolite', '4 rue Petit AX-LES-THERMES 09110', '0592259965', NULL, NULL, 9),
(218, 'ACHARD', 'Dominique', '17 rue Victor Hugo NEUVILLE-LES-DAMES 01400', '0436894892', NULL, NULL, 1),
(219, 'BENEDETTI', 'Précilia', '46 rue Perdue MONT-LAURENT 08130', '0357123782', NULL, NULL, 8),
(220, 'RAVEL', 'Patrice', '37 rue des perles blanches AUGIREIN 09800', '0514467307', NULL, NULL, 9),
(221, 'BERNARDI', 'Catherine', '18 rue de la Pergolat CHABESTAN 05400', '0433787136', NULL, 'Pédiatrie', 5),
(222, 'LATIL', 'Anne-Jeanne', '61 rue Malraux SAVINES-LE-LAC 05160', '0425403948', NULL, NULL, 5),
(223, 'MAUNIER', 'Martial', '39 rue des Pigeons FRESSANCOURT 02800', '0376405689', NULL, NULL, 2),
(224, 'DUPUY', 'Ines', '36 rue du général de Gaulle AX-LES-THERMES 09110', '0571237673', NULL, NULL, 9),
(225, 'MOULIN', 'Fatima', '27 rue des Ormes BARENTON-SUR-SERRE 02270', '0369886219', NULL, NULL, 2),
(226, 'DUPONT', 'Cristophe', '35 rue Commandant Mouchotte CHEZY-SUR-MARNE 02570', '0399128847', NULL, NULL, 2),
(227, 'MARINO', 'Charles-Edouard', '69 rue de Paris BRIANCON 05100', '0486522042', NULL, 'ACUPONCTURE', 5),
(228, 'FAVIER', 'Alice', '64 rue de Paris SORBIERS 05150', '0498218342', NULL, 'ANGEIOLOGIE', 5),
(229, 'PELLEGRINO', 'Johnny', '4 rue des Lilas BELLOC 09600', '0583708661', NULL, NULL, 9),
(230, 'PERROT', 'Marie', '27 rue du stade NEUVILLE-LES-DAMES 01400', '0440602180', NULL, NULL, 1),
(231, 'LUCCHESI', 'Patrice', '25 rue des Néfliers AGUILCOURT 02190', '0313705112', NULL, NULL, 2),
(232, 'RICCI', 'Roby', '74 rue de Marigny JUNIVILLE 08310', '0370618394', NULL, NULL, 8),
(233, 'AUGIER', 'François', '40 rue Commandant Mouchotte BOURG-EN-BRESSE 01000', '0466232870', NULL, 'ANGEIOLOGIE', 1),
(234, 'MANCINI', 'Anne-Lucie', '28 rue de la poste MONCEAU-SUR-OISE 02120', '0337880516', NULL, NULL, 2),
(235, 'BRUNEL', 'Marie', '65 rue des Accacias MEZIERES-SUR-OISE 02240', '0347429128', NULL, NULL, 2),
(236, 'MUNOZ', 'Irénée', '66 rue Victor Hugo ASTON 09310', '0545396012', NULL, 'HOMEOPATHIE', 9),
(237, 'MUSSO', 'Aurèle', '78 rue du 14 juillet NEUVILLE-LES-DAMES 01400', '0436441368', NULL, NULL, 1),
(238, 'CONTE', 'Jimmy', '31 rue des Cavaux BOURG-EN-BRESSE 01000', '0489010528', NULL, NULL, 1),
(239, 'MORETTI', 'Jordan', '56 rue du Mont BRIANCON 05100', '0497686569', NULL, NULL, 5),
(240, 'COMBE', 'Andrew', '5 rue des Pigeons ATTILLY 02490', '0317928011', NULL, NULL, 2),
(241, 'PASTOR', 'Andrée', '9 rue de Paris CAMON 09500', '0575615612', NULL, NULL, 9),
(242, 'PHILIP', 'Aurélien', '34 rue des perles blanches HERBEUVAL 08370', '0354324365', NULL, NULL, 8),
(243, 'NOEL', 'Caline', '90 rue des Pigeons BETTANT 01500', '0441422871', NULL, NULL, 1),
(244, 'PAULEAU', 'Bertrand', '88 rue Mallarmé CAMON 09500', '0519717031', NULL, NULL, 9),
(245, 'MOREAU', 'Anne-Lucie', '31 rue St Denis AVANCON 05230', '0476620839', NULL, NULL, 5),
(246, 'DIDIER', 'Anne-Marie', '32 rue Petit BOULIGNEUX 01330', '0429892782', NULL, NULL, 1),
(247, 'MASSON', 'Anne', '96 rue des pyramides SAINT-FIRMIN 05800', '0430056957', NULL, NULL, 5),
(248, 'GRIMALDI', 'Jordan', '71 rue Lampion ROCHEBRUNE 05190', '0422193913', NULL, NULL, 5),
(249, 'MAS', 'Hector', '39 rue des Chantereines SAINT-CREPIN 05600', '0427945468', NULL, NULL, 5),
(250, 'ALLEGRE', 'Patrice', '35 rue de la gare DOMMARTIN 01380', '0412349269', NULL, NULL, 1),
(251, 'MARCHAND', 'Austine', '1 rue Perdue BANCIGNY 02140', '0362784487', NULL, NULL, 2),
(252, 'DAVIN', 'Nohan', '87 rue de la poste ORCIERES 05170', '0492790588', NULL, NULL, 5),
(253, 'CANOVAS', 'Adrien', '6 rue St Denis NEUVILLE-LES-DAMES 01400', '0463805846', NULL, 'URGENTISTE', 1),
(254, 'RIVIERE', 'Aurélien', '24 rue Anatole France FALAISE 08400', '0394184441', NULL, NULL, 8),
(255, 'MEYER', 'Anne-Sophie', '78 rue Mallarmé BELLOC 09600', '0565131061', NULL, NULL, 9),
(256, 'BOUSQUET', 'Précilia', '17 rue de Paris BARZY-SUR-MARNE 02850', '0373800189', NULL, NULL, 2),
(257, 'RAMPAL', 'Béatrice', '65 rue des Cyprés ASTON 09310', '0556222808', NULL, NULL, 9),
(258, 'FRANCOIS', 'Alain', '12 rue des oiseaux BEAUMONT-EN-BEINE 02300', '0336437836', NULL, NULL, 2),
(259, 'BELLON', 'Jérémy', '13 rue Louis Aragon ARROUT 09800', '0579019785', NULL, 'GERONTOLOGIE', 9),
(260, 'PINNA', 'Alice', '42 rue des hirondelles SAINT-LAURENT-SUR-SAONE 01750', '0418404333', NULL, NULL, 1),
(261, 'MASSE', 'Serge', '54 rue Debussy AUDRESSEIN 09800', '0589986579', NULL, NULL, 9),
(262, 'PELLEGRINI', 'Bertrand', '16 rue de la Tour MONTIGNY-SUR-MEUSE 08170', '0362958231', NULL, NULL, 8),
(263, 'JACQUET', 'Alizée', '85 rue Alphonse Daudet SAINT-SAUVEUR 05200', '0469350553', NULL, NULL, 5),
(264, 'SEGURA', 'Irénée', '54 rue de Marigny PELVOUX 05340', '0413512651', NULL, NULL, 5),
(265, 'ALLARD', 'Bertrand', '66 rue du capitaine Crochet BILLIAT 01200', '0430273395', NULL, 'ALLERGOLOGIE', 1),
(266, 'PEYRE', 'Reissa', '92 rue des Epines BOURG-EN-BRESSE 01000', '0462567494', NULL, NULL, 1),
(267, 'BARRAL', 'Anne-Lucie', '58 rue des Anges FRESSANCOURT 02800', '0397948858', NULL, 'GERONTOLOGIE', 2),
(268, 'GABRIEL', 'Alain', '13 rue Albert Camus BAGERT 09230', '0561056383', NULL, NULL, 9),
(269, 'ORTEGA', 'Rodolphe', '4 rue Bonaparte NEUVILLE-LES-DAMES 01400', '0499930510', NULL, 'ALLERGOLOGIE', 1),
(270, 'DELEUIL', 'Dominique', '31 rue Pernod MESSINCOURT 08110', '0354437353', NULL, 'HOMEOPATHIE', 8),
(271, 'CHAVE', 'Amélie', '73 rue des Epines AGUILCOURT 02190', '0393504917', NULL, NULL, 2),
(272, 'BARBAROUX', 'Aude', '43 rue des Pigeons FALAISE 08400', '0395808887', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 8),
(273, 'NICOLAI', 'Julie', '76 rue des Armées CAMON 09500', '0558376134', NULL, 'ALLERGOLOGIE', 9),
(274, 'FERRAND', 'Jérémie', '71 rue de Poligny SAVINES-LE-LAC 05160', '0490614401', NULL, NULL, 5),
(275, 'ICARD', 'Annie', '95 rue des hirondelles AGUILCOURT 02190', '0334620315', NULL, 'ALLERGOLOGIE', 2),
(276, 'CHARLES', 'Hypolite', '96 rue Commandant Mouchotte BOULIGNEUX 01330', '0445325841', NULL, NULL, 1),
(277, 'BLANCHARD', 'Aline', '9 rue des Epines OYONNAX 01100', '0463729220', NULL, NULL, 1),
(278, 'GRAZIANI', 'Martin', '93 rue de la Tour BELLEY 01300', '0459132484', NULL, NULL, 1),
(279, 'LEROY', 'Hamed', '8 rue Louis Aragon FRESSANCOURT 02800', '0311170881', NULL, NULL, 2),
(280, 'VIALE', 'François', '90 rue de la poste AX-LES-THERMES 09110', '0553374090', NULL, NULL, 9),
(281, 'REYMOND', 'Aurèle', '92 rue St Denis SORBIERS 05150', '0481537923', NULL, NULL, 5),
(282, 'ISOARD', 'Bernard', '71 rue Mallarmé MESSINCOURT 08110', '0366706848', NULL, NULL, 8),
(283, 'CAUVIN', 'Julien', '58 rue de Paris CEYZERIAT 01250', '0411229599', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 1),
(284, 'CONSTANT', 'Gilles', '66 rue de du général Scott ARROUT 09800', '0590561289', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 9),
(285, 'GASTALDI', 'Astine', '18 rue des gatinnes SAINT-LAURENT-SUR-SAONE 01750', '0426146482', NULL, NULL, 1),
(286, 'LAGIER', 'Patrice', '12 rue Victor Hugo EVIGNY 08090', '0311209603', NULL, NULL, 8),
(287, 'PAGES', 'Ingrid', '74 rue des hirondelles AX-LES-THERMES 09110', '0542828199', NULL, NULL, 9),
(288, 'OLIVA', 'Aurélien', '38 rue Debussy BILLIAT 01200', '0439490126', NULL, NULL, 1),
(289, 'RE', 'Yoan', '40 rue de la recette MONCEAU-SUR-OISE 02120', '0333274282', NULL, 'OSTEOPATHIE', 2),
(290, 'PARIS', 'Adelphe', '93 rue Alphonse Daudet OYONNAX 01100', '0457686776', NULL, NULL, 1),
(291, 'PORTE', 'Adrien', '82 rue Agniel JUNIVILLE 08310', '0352053332', NULL, 'ALLERGOLOGIE', 8),
(292, 'FRANCHI', 'Caline', '82 rue St Denis ASTON 09310', '0593546818', NULL, NULL, 9),
(293, 'MORELLI', 'Rodolphe', '68 rue des Argonautes MONCEAU-SUR-OISE 02120', '0381648585', NULL, NULL, 2),
(294, 'BONNEFOY', 'Patricia', '6 rue de la gare BILLIAT 01200', '0474405770', NULL, 'GERONTOLOGIE', 1),
(295, 'TASSY', 'Robert', '40 rue des pyramides SAINT-FIRMIN 05800', '0482621556', NULL, NULL, 5),
(296, 'ROCCHIA', 'Fatima', '7 rue du renard BUZAN 09800', '0560148975', NULL, NULL, 9),
(297, 'NGUYEN', 'Carole', '77 rue Anatole France MESSINCOURT 08110', '0361849887', NULL, NULL, 8),
(298, 'PADOVANI', 'Jordan', '20 rue de la recette SAINT-ANDRE-DE-ROSANS 05150', '0432143599', NULL, 'ANGEIOLOGIE', 5),
(299, 'GUILLAUME', 'Patrice', '10 rue du capitaine Crochet CHALLES 01450', '0479473742', NULL, 'ALLERGOLOGIE', 1),
(300, 'MOUTON', 'Astine', '98 rue du renard BLYES 01150', '0447475896', NULL, NULL, 1),
(301, 'ADAM', 'Anselme', '78 rue de la poste OYONNAX 01100', '0465535519', NULL, NULL, 1),
(302, 'POGGI', 'Aurèle', '63 rue de la gare CHABESTAN 05400', '0434955199', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 5),
(303, 'CHAMBON', 'Jérome', '27 rue des Chantereines BARZY-SUR-MARNE 02850', '0328609452', NULL, NULL, 2),
(304, 'FLORES', 'Victor', '70 rue de la Pergolat ABBECOURT 02300', '0397808656', NULL, NULL, 2),
(305, 'MERLIN', 'Anne-Laure', '58 rue du général de Gaulle FALAISE 08400', '0381506423', NULL, NULL, 8),
(306, 'MAURY', 'Hector', '41 rue Malraux SIGOYER 05130', '0447077417', NULL, NULL, 5),
(307, 'MOHAMED', 'Anne-Jeanne', '12 rue Louis Aragon THIN-LE-MOUTIER 08460', '0351239489', NULL, NULL, 8),
(308, 'MERLE', 'Anne-Lucie', '16 rue Blainville SAVINES-LE-LAC 05160', '0474386707', NULL, NULL, 5),
(309, 'MARTY', 'Jérémy', '53 rue de la pointe AUGIREIN 09800', '0517209857', NULL, NULL, 9),
(310, 'SANTINI', 'Anne', '70 rue de la rose ABBECOURT 02300', '0315174364', NULL, NULL, 2),
(311, 'ALBERT', 'Armelle', '27 rue Blainville SIGOYER 05130', '0487157453', NULL, NULL, 5),
(312, 'BRUNA', 'Camille', '90 rue Mallarmé PELVOUX 05340', '0462682764', NULL, NULL, 5),
(313, 'MORIN', 'Anaelle', '73 rue des Cavaux FEPIN 08170', '0347605928', NULL, NULL, 8),
(314, 'MARIE', 'Carole', '82 rue Blainville BILLIAT 01200', '0489580183', NULL, NULL, 1),
(315, 'DUFOUR', 'Rosalie', '66 rue des Princes SORBIERS 05150', '0447973887', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 5),
(316, 'PIERRE', 'Fatima', '38 rue Hector Berlioz SORBIERS 05150', '0489828043', NULL, NULL, 5),
(317, 'LAFONT', 'Anne-Jeanne', '60 rue Victor Hugo NEUVILLE-LES-DAMES 01400', '0466135862', NULL, NULL, 1),
(318, 'PIGNOL', 'Hypolite', '26 rue Alphonse Daudet BETTANT 01500', '0496740768', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 1),
(319, 'ESTEVE', 'Sophie', '37 rue Alphonse Daudet AX-LES-THERMES 09110', '0550507761', NULL, NULL, 9),
(320, 'PICCA', 'Anne-Laure', '96 rue du capitaine Fraquasse AUBENTON 02500', '0332042330', NULL, 'URGENTISTE', 2),
(321, 'JOLY', 'Caline', '84 rue des Néfliers SAINT-ANDRE-DE-ROSANS 05150', '0441770926', NULL, NULL, 5),
(322, 'ROBIN', 'Amiel', '11 rue Commandant Hériot ARROUT 09800', '0530054025', NULL, 'GERONTOLOGIE', 9),
(323, 'MONTI', 'Adelphe', '1 rue des Princes SIGOYER 05130', '0446366196', NULL, NULL, 5),
(324, 'NEGRE', 'Alain', '76 rue Commandant Mouchotte AX-LES-THERMES 09110', '0510808813', NULL, NULL, 9),
(325, 'GIORGI', 'Gilles', '64 rue Commandant Hériot ARANDAS 01230', '0466707367', NULL, NULL, 1),
(326, 'ESCOFFIER', 'Fernand', '66 rue du 14 juillet OYONNAX 01100', '0446432036', NULL, NULL, 1),
(327, 'VALENTIN', 'Andrée', '76 rue des Cavaux SORBIERS 05150', '0433833354', NULL, NULL, 5),
(328, 'MOLINA', 'Robert', '67 rue du capitaine Crochet FRESSANCOURT 02800', '0396745829', NULL, NULL, 2),
(329, 'TRON', 'Charles', '81 rue Mallarmé BEAUMONT-EN-BEINE 02300', '0318112146', NULL, NULL, 2),
(330, 'JULLIAN', 'Jérémie', '49 rue de la Pergolat REOTIER 05600', '0452299934', NULL, 'ACUPONCTURE', 5),
(331, 'VIGNE', 'sabine', '73 rue Agniel FEPIN 08170', '0340871558', NULL, NULL, 8),
(332, 'JOUBERT', 'Patrice', '26 rue du renard OYONNAX 01100', '0499920026', NULL, NULL, 1),
(333, 'BAYLE', 'Jules', '21 rue Pasteur SORBIERS 05150', '0497153129', NULL, NULL, 5),
(334, 'BOEUF', 'Alizée', '69 rue de la Pergolat BELLEY 01300', '0485963418', NULL, NULL, 1),
(335, 'CAIRE', 'Armelle', '16 rue des Anses bleues VAUX-CHAMPAGNE 08130', '0334124353', NULL, NULL, 8),
(336, 'GOUIRAND', 'Hector', '73 rue du général de Gaulle AUDRESSEIN 09800', '0593896893', NULL, NULL, 9),
(337, 'ROUSTAN', 'Aristote', '78 rue des Argonautes AUGIREIN 09800', '0560183642', NULL, NULL, 9),
(338, 'ROURE', 'Anne-Jeanne', '20 rue Commandant Hériot BEAUMONT-EN-BEINE 02300', '0335062492', NULL, NULL, 2),
(339, 'PEYRON', 'Anne-Jeanne', '38 rue Louis Aragon SAINTE-MARIE 05150', '0413931222', NULL, NULL, 5),
(340, 'LAGET', 'Jordan', '96 rue Bonaparte SAINTE-MARIE 05150', '0419574602', NULL, NULL, 5),
(341, 'CARMONA', 'Cristophe', '65 rue de la recette HERBEUVAL 08370', '0353219537', NULL, NULL, 8),
(342, 'ROUSSEAU', 'Bénédicte', '2 rue des Armées FALAISE 08400', '0392106994', NULL, NULL, 8),
(343, 'ROMERO', 'sabine', '66 rue des Epines HOUDILCOURT 08190', '0396081849', NULL, 'HOMEOPATHIE', 8),
(344, 'BON', 'Serge', '6 rue du stade NEUVILLE-LES-DAMES 01400', '0441736702', NULL, NULL, 1),
(345, 'GAUDIN', 'Adelphe', '26 rue des Pigeons FEPIN 08170', '0383040737', NULL, 'ACUPONCTURE', 8),
(346, 'DELMAS', 'Julienne', '89 rue Pasteur ASTON 09310', '0558895500', NULL, NULL, 9),
(347, 'PUJOL', 'Austine', '96 rue St Denis BRIANCON 05100', '0442356662', NULL, NULL, 5),
(348, 'BOUVIER', 'Anne-Marie', '88 rue du capitaine Fraquasse FLOING 08200', '0337248343', NULL, 'Pédiatre', 8),
(349, 'AMIEL', 'Austine', '86 rue des Lilas BAGERT 09230', '0564227642', NULL, NULL, 9),
(350, 'CONTRERAS', 'Aristote', '13 rue des Néfliers ARROUT 09800', '0578693214', NULL, NULL, 9),
(351, 'FIORI', 'Reissa', '56 rue du Mont THIN-LE-MOUTIER 08460', '0379320791', NULL, NULL, 8),
(352, 'TARDIEU', 'sabine', '96 rue du général de Gaulle BELLOC 09600', '0517690862', NULL, NULL, 9),
(353, 'LOUIS', 'Marie', '62 rue Hector Berlioz SAVOURNON 05700', '0443661423', NULL, 'ACUPONCTURE', 5),
(354, 'CASTELLI', 'Irénée', '68 rue de la pointe BARENTON-SUR-SERRE 02270', '0313123217', NULL, NULL, 2),
(355, 'ESPANET', 'Adrien', '2 rue des hirondelles HAUTEVILLE 02120', '0385350100', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 2),
(356, 'GONZALES', 'Caline', '13 rue du Mont SAINT-FIRMIN 05800', '0439120333', NULL, NULL, 5),
(357, 'ANTOINE', 'Camille', '38 rue des Chantereines MAYOT 02800', '0390403626', NULL, 'GERONTOLOGIE', 2),
(358, 'PIETRI', 'Ingrid', '73 rue des gatinnes SAINT-ANDRE-DE-ROSANS 05150', '0455695337', NULL, NULL, 5),
(359, 'VELLA', 'Jordan', '47 rue de Paris ROCHEBRUNE 05190', '0488575731', NULL, 'URGENTISTE', 5),
(360, 'SAMAT', 'Andrew', '40 rue Anatole France LAUNOIS-SUR-VENCE 08430', '0395797173', NULL, 'OSTEOPATHIE', 8),
(361, 'BAUDIN', 'Aline', '27 rue des Anges SAINT-FIRMIN 05800', '0454426212', NULL, NULL, 5),
(362, 'GILLY', 'Aurèle', '87 rue de Poligny SAINT-ANDRE-DE-ROSANS 05150', '0437604768', NULL, NULL, 5),
(363, 'SILVESTRE', 'Carole', '17 rue Debussy AVANCON 05230', '0435416748', NULL, NULL, 5),
(364, 'LAN', 'Adelphe', '74 rue des Néfliers AUBENTON 02500', '0369486130', NULL, NULL, 2),
(365, 'GONTIER', 'Irénée', '85 rue du capitaine Crochet JOIGNY-SUR-MEUSE 08700', '0397935550', NULL, 'OSTEOPATHIE', 8),
(366, 'MATHERON', 'Aurélien', '92 rue des oiseaux SAVOURNON 05700', '0452076802', NULL, NULL, 5),
(367, 'CARVIN', 'John', '74 rue des oiseaux BILLIAT 01200', '0463193696', NULL, NULL, 1),
(368, 'DAHAN', 'Jules', '84 rue du stade OYONNAX 01100', '0430814652', NULL, 'GERONTOLOGIE', 1),
(369, 'VERAN', 'Robert', '46 rue des Accacias OYONNAX 01100', '0456783280', NULL, NULL, 1),
(370, 'GOUIN', 'Carole', '18 rue de la Tour NEUVILLE-LES-DAMES 01400', '0411713298', NULL, NULL, 1),
(371, 'GIUDICELLI', 'Firmin', '73 rue du Mont ARROUT 09800', '0532011995', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 9),
(372, 'PIERI', 'Amélie', '79 rue Lampion SAINT-LAURENT-SUR-SAONE 01750', '0499820900', NULL, NULL, 1),
(373, 'LERDA', 'Patrice', '14 rue des Lilas CHEZY-SUR-MARNE 02570', '0310790961', NULL, NULL, 2),
(374, 'BERNARDINI', 'Martial', '32 rue de la poste JOIGNY-SUR-MEUSE 08700', '0351863890', NULL, NULL, 8),
(375, 'FONTANA', 'John', '81 rue Edouard Hériot MAYOT 02800', '0361434057', NULL, NULL, 2),
(376, 'VENTRE', 'Prosper', '99 rue des Pigeons SIGOYER 05130', '0420048322', NULL, 'URGENTISTE', 5),
(377, 'REVEST', 'Camille', '88 rue des oiseaux JUNIVILLE 08310', '0370063871', NULL, 'null', 8),
(378, 'MONIER', 'Adrien', '21 rue de la rose AX-LES-THERMES 09110', '0513336137', NULL, NULL, 9),
(379, 'FARINA', 'Victor', '86 rue des Armées DOMMARTIN 01380', '0447458241', NULL, NULL, 1),
(380, 'PERETTI', 'Bertrand', '91 rue de la rose FEPIN 08170', '0398107919', NULL, NULL, 8),
(381, 'PELLISSIER', 'Serge', '58 rue Pernod MONCEAU-SUR-OISE 02120', '0322992429', NULL, NULL, 2),
(382, 'SORRENTINO', 'Julienne', '93 rue des Néfliers MONCEAU-SUR-OISE 02120', '0348940958', NULL, 'URGENTISTE', 2),
(383, 'MARINI', 'Caline', '8 rue des Anges FEPIN 08170', '0364882312', NULL, NULL, 8),
(384, 'BONNAUD', 'Françoise', '76 rue de Marigny CAMON 09500', '0522112610', NULL, 'OSTEOPATHIE', 9),
(385, 'BERAUD', 'Françoise', '3 rue des Anges AUBENTON 02500', '0397776971', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 2),
(386, 'CADENEL', 'Serge', '92 rue de Paris THIN-LE-MOUTIER 08460', '0365834913', NULL, 'ACUPONCTURE', 8),
(387, 'SUZANNE', 'Prosper', '24 rue de du général Scott BRIANCON 05100', '0493163850', NULL, NULL, 5),
(388, 'GIBERT', 'Dominique', '4 rue Hector Berlioz AX-LES-THERMES 09110', '0585018637', NULL, NULL, 9),
(389, 'CAMPANA', 'Adrien', '30 rue Agniel SAINT-FIRMIN 05800', '0483927775', NULL, NULL, 5),
(390, 'PIRAS', 'Adelphe', '4 rue des Pigeons BARZY-SUR-MARNE 02850', '0391947902', NULL, NULL, 2),
(391, 'GORLIER', 'sabine', '9 rue du Mont BRIANCON 05100', '0423613710', NULL, NULL, 5),
(392, 'FERRETTI', 'Anne-Lucie', '81 rue des Lilas ABBECOURT 02300', '0357752522', NULL, 'HOMEOPATHIE', 2),
(393, 'ROUGIER', 'Aurèle', '78 rue du renard SAINT-LAURENT-SUR-SAONE 01750', '0499152521', NULL, 'URGENTISTE', 1),
(394, 'BONETTO', 'Julienne', '16 rue de la gare BELLOC 09600', '0567014080', NULL, NULL, 9),
(395, 'MARIOTTI', 'Aurélien', '41 rue des Anses bleues ASTON 09310', '0528108863', NULL, 'OSTEOPATHIE', 9),
(396, 'LORENZI', 'François', '52 rue des Epines ATTILLY 02490', '0395338199', NULL, NULL, 2),
(397, 'BARET', 'Bénédicte', '88 rue du renard ORCIERES 05170', '0452809250', NULL, NULL, 5),
(398, 'SARDOU', 'Vénus', '84 rue des Armées MONTIGNY-SUR-MEUSE 08170', '0332562475', NULL, NULL, 8),
(399, 'SERRANO', 'Camille', '20 rue Anatole France MACHAULT 08310', '0394066862', NULL, NULL, 8),
(400, 'BORGHINO', 'Carole', '90 rue Bonaparte OYONNAX 01100', '0446953066', NULL, NULL, 1),
(401, 'PONTIER', 'Cristophe', '22 rue Perdue AX-LES-THERMES 09110', '0533152140', NULL, NULL, 9),
(402, 'TOCHE', 'Anne-Laure', '73 rue Agniel BOURG-EN-BRESSE 01000', '0434367086', NULL, NULL, 1),
(403, 'VALETTE', 'Martial', '61 rue des Cavaux SAINT-LAURENT-SUR-SAONE 01750', '0460367150', NULL, NULL, 1),
(404, 'DONADIO', 'Aurélien', '44 rue des Epines OYONNAX 01100', '0439758191', NULL, NULL, 1),
(405, 'BAILLE', 'Aude', '98 rue des Accacias SIGOYER 05130', '0497650512', NULL, 'OSTEOPATHIE', 5),
(406, 'SIGNORET', 'sabine', '61 rue de la Pergolat AUDRESSEIN 09800', '0566668732', NULL, 'ACUPONCTURE', 9),
(407, 'CONTI', 'Jules', '45 rue du capitaine Crochet EVIGNY 08090', '0351073860', NULL, NULL, 8),
(408, 'VILLARD', 'Rodolphe', '89 rue des oiseaux BOURG-EN-BRESSE 01000', '0436599230', NULL, NULL, 1),
(409, 'GUILLOT', 'Habib', '97 rue Pernod AZY-SUR-MARNE 02400', '0380003737', NULL, 'ACUPONCTURE', 2),
(410, 'TEISSEIRE', 'Bernard', '81 rue des Epines SAINT-CREPIN 05600', '0477707175', NULL, NULL, 5),
(411, 'GIUSTI', 'Habib', '83 rue Malraux ABBECOURT 02300', '0310290366', NULL, NULL, 2),
(412, 'ROUVIERE', 'Mohammed', '70 rue du 14 juillet MONT-LAURENT 08130', '0398765209', NULL, NULL, 8),
(413, 'CLAVEL', 'François', '71 rue du 14 juillet SAINT-SAUVEUR 05200', '0418376454', NULL, 'ACUPONCTURE', 5),
(414, 'TRICON', 'Rodolphe', '99 rue Alphonse Daudet YONCQ 08210', '0367093394', NULL, NULL, 8),
(415, 'PIGNATEL', 'Catherine', '4 rue des Armées AUBENTON 02500', '0368054817', NULL, NULL, 2),
(416, 'CECCALDI', 'Bernard', '64 rue Commandant Hériot TRAVECY 02800', '0315061114', NULL, NULL, 2),
(417, 'RAOUX', 'Armelle', '79 rue des Epines EVIGNY 08090', '0334511766', NULL, NULL, 8),
(418, 'FORTE', 'Julie', '13 rue de la pointe ASTON 09310', '0518564010', NULL, NULL, 9),
(419, 'CHARRIER', 'Dominique', '62 rue Malraux AUGIREIN 09800', '0585303807', NULL, NULL, 9),
(420, 'PERRIER', 'Charles', '71 rue Anatole France CAMON 09500', '0569559189', NULL, NULL, 9),
(421, 'MOUSTIER', 'Cristophe', '85 rue des Argonautes AZY-SUR-MARNE 02400', '0316188975', NULL, 'HOMEOPATHIE', 2),
(422, 'BELTRANDO', 'Dominique', '21 rue des Artistes BELLEY 01300', '0428818011', NULL, 'OSTEOPATHIE', 1),
(423, 'BORG', 'Précilia', '82 rue Victor Hugo LAVAL-MORENCY 08150', '0391802125', NULL, NULL, 8),
(424, 'DANGELO', 'André', '87 rue Anatole France YONCQ 08210', '0311956610', NULL, NULL, 8),
(425, 'RICHIER', 'Fernand', '37 rue du général de Gaulle AUGIREIN 09800', '0517286774', NULL, NULL, 9),
(426, 'AMAR', 'Hamed', '72 rue des hirondelles AGUILCOURT 02190', '0334618532', NULL, NULL, 2),
(427, 'PERRET', 'Hector', '20 rue du capitaine Fraquasse BELLEY 01300', '0447089672', NULL, 'ANGEIOLOGIE', 1),
(428, 'ARRIGHI', 'Patricia', '9 rue des gatinnes CHALLES 01450', '0489226737', NULL, NULL, 1),
(429, 'GUIEU', 'Aline', '12 rue des Anges BRIANCON 05100', '0498699637', NULL, NULL, 5),
(430, 'ARTAUD', 'Austine', '37 rue des Armées SIGOYER 05130', '0485539010', NULL, NULL, 5),
(431, 'GUIDI', 'Hypolite', '33 rue de Paris TRAVECY 02800', '0319460470', NULL, NULL, 2),
(432, 'GARABEDIAN', 'Fernand', '80 rue du Mont BAGERT 09230', '0570483785', NULL, NULL, 9),
(433, 'SEGUIN', 'Anne-Sophie', '18 rue de la recette FLOING 08200', '0335293346', NULL, 'ALLERGOLOGIE', 8),
(434, 'ANDREANI', 'Bénédicte', '71 rue des pyramides MONT-LAURENT 08130', '0364431472', NULL, NULL, 8),
(435, 'COLONNA', 'John', '35 rue Mallarmé ATTILLY 02490', '0384830087', NULL, NULL, 2),
(436, 'FUENTES', 'Patrick', '97 rue du général de Gaulle AUBENTON 02500', '0378805449', NULL, NULL, 2),
(437, 'RIZZO', 'Alice', '3 rue des Lilas ABBECOURT 02300', '0338216554', NULL, NULL, 2),
(438, 'DONATI', 'Jérome', '67 rue Perdue BEDEILLE 09230', '0527487962', NULL, NULL, 9),
(439, 'DAUPHIN', 'Anne-Jeanne', '91 rue Albert Camus SAINT-CREPIN 05600', '0464885309', NULL, NULL, 5),
(440, 'SOULIER', 'Robert', '73 rue Pasteur BOURG-EN-BRESSE 01000', '0451252312', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 1),
(441, 'VALERO', 'Marie', '51 rue Victor Hugo JOIGNY-SUR-MEUSE 08700', '0328058400', NULL, NULL, 8),
(442, 'ROSA', 'Bénédicte', '37 rue Mallarmé SAINT-CREPIN 05600', '0472480246', NULL, NULL, 5),
(443, 'MILLET', 'Hypolite', '97 rue Malraux SAINTE-MARIE 05150', '0471019122', NULL, 'URGENTISTE', 5),
(444, 'MARCELLIN', 'Anne-Marie', '21 rue Blainville MESSINCOURT 08110', '0315472355', NULL, NULL, 8),
(445, 'MARCHI', 'Fatima', '32 rue des Armées MEZIERES-SUR-OISE 02240', '0335733742', NULL, NULL, 2),
(446, 'PRAT', 'sabine', '52 rue des Pigeons PELVOUX 05340', '0424219942', NULL, 'GERONTOLOGIE', 5),
(447, 'RINAUDO', 'Vénus', '96 rue des Chantereines FRESSANCOURT 02800', '0359036944', NULL, NULL, 2),
(448, 'MOUTTE', 'Victor', '96 rue de Paris BETTANT 01500', '0478464491', NULL, NULL, 1),
(449, 'CASTEL', 'Aurèle', '34 rue des oiseaux NEUVILLE-LES-DAMES 01400', '0437142230', NULL, NULL, 1),
(450, 'GRAND', 'Reissa', '89 rue des Pigeons PELVOUX 05340', '0414138297', NULL, NULL, 5),
(451, 'CROUZET', 'Camille', '5 rue des Anges BUZAN 09800', '0550828415', NULL, NULL, 9),
(452, 'FILOSA', 'Marie', '58 rue Victor Hugo BOULIGNEUX 01330', '0432323455', NULL, NULL, 1),
(453, 'BIANCOTTO', 'Camille', '89 rue Beaudelaire AUBENTON 02500', '0341803965', NULL, NULL, 2),
(454, 'SUSINI', 'Fatima', '59 rue Bonaparte EVIGNY 08090', '0326409640', NULL, NULL, 8),
(455, 'LAURENS', 'Anne-Jeanne', '10 rue du capitaine Fraquasse MESSINCOURT 08110', '0315685825', NULL, NULL, 8),
(456, 'ALVAREZ', 'Alice', '94 rue des Cyprés SAINT-FIRMIN 05800', '0492845898', NULL, NULL, 5),
(457, 'BALLESTER', 'Aline', '83 rue des Cavaux CHALLES 01450', '0477868457', NULL, NULL, 1),
(458, 'DOMINICI', 'Françoise', '3 rue des gatinnes FRESSANCOURT 02800', '0310422807', NULL, NULL, 2),
(459, 'COLOMBO', 'Béatrice', '86 rue des Accacias MONTIGNY-SUR-MEUSE 08170', '0351114264', NULL, NULL, 8),
(460, 'SAHRAOUI', 'Anne-Ange', '17 rue des Accacias JOIGNY-SUR-MEUSE 08700', '0354449959', NULL, NULL, 8),
(461, 'IVALDI', 'Alain', '61 rue de du général Scott QUATRE-CHAMPS 08400', '0395171820', NULL, NULL, 8),
(462, 'GAUBERT', 'Alain', '10 rue Alphonse Daudet AGUILCOURT 02190', '0378125914', NULL, NULL, 2),
(463, 'RENAUD', 'Aude', '73 rue Mallarmé SORBIERS 05150', '0415973212', NULL, 'Pédiatrie', 5),
(464, 'GUIGUE', 'Aurélien', '5 rue des pyramides SAVINES-LE-LAC 05160', '0417672103', NULL, NULL, 5),
(465, 'FELIX', 'Amiel', '44 rue Victor Hugo SIGOYER 05130', '0470456938', NULL, NULL, 5),
(466, 'SCOTTO', 'Aude', '45 rue des Lilas FLOING 08200', '0347310971', NULL, NULL, 8),
(467, 'ORTIZ', 'Catherine', '88 rue Alphonse Daudet ARROUT 09800', '0578689528', NULL, NULL, 9),
(468, 'LEBRE', 'Alain', '57 rue Petit SAINT-LAURENT-SUR-SAONE 01750', '0448765649', NULL, NULL, 1),
(469, 'CARTIER', 'Fatima', '47 rue Lampion OYONNAX 01100', '0460692244', NULL, 'OSTEOPATHIE', 1),
(470, 'MANZON', 'Anaelle', '12 rue Albert Camus AX-LES-THERMES 09110', '0569661155', NULL, NULL, 9),
(471, 'CASTELLANI', 'Julie', '3 rue de la pointe SAINT-CREPIN 05600', '0435145304', NULL, NULL, 5),
(472, 'FALCO', 'Alizée', '91 rue Blainville OYONNAX 01100', '0424443942', NULL, NULL, 1),
(473, 'CLERC', 'Anselme', '58 rue Victor Hugo LAVAL-MORENCY 08150', '0387649400', NULL, NULL, 8),
(474, 'REYRE', 'Rodolphe', '57 rue des Epines AZY-SUR-MARNE 02400', '0397983251', NULL, NULL, 2),
(475, 'BOSSY', 'Aristote', '2 rue de Poligny FALAISE 08400', '0379304135', NULL, 'ANGEIOLOGIE', 8),
(476, 'JIMENEZ', 'Anne-Marie', '73 rue du capitaine Crochet CHALLES 01450', '0459580046', NULL, NULL, 1),
(477, 'LEFEVRE', 'Rosalie', '88 rue Hector Berlioz SAINT-LAURENT-SUR-SAONE 01750', '0460756612', NULL, NULL, 1),
(478, 'PICARD', 'Julienne', '54 rue du 14 juillet BEAUMONT-EN-BEINE 02300', '0357974621', NULL, NULL, 2),
(479, 'LEFEBVRE', 'Bernard', '28 rue des perles blanches MONT-LAURENT 08130', '0350608229', NULL, NULL, 8),
(480, 'DOL', 'Ingrid', '14 rue de Paris MONTCEAUX 01090', '0490462674', NULL, NULL, 1),
(481, 'ALFONSI', 'Alice', '84 rue Albert Camus BLYES 01150', '0486949300', NULL, NULL, 1),
(482, 'ROUVIER', 'Reissa', '71 rue des Cavaux FLOING 08200', '0371858489', NULL, NULL, 8),
(483, 'GRASSI', 'Anselme', '67 rue Bonaparte MESSINCOURT 08110', '0353311714', NULL, NULL, 8),
(484, 'PAULET', 'Aristote', '67 rue du renard BUZAN 09800', '0550911167', NULL, NULL, 9),
(485, 'FRANCO', 'Jules', '50 rue des Cyprés BARENTON-SUR-SERRE 02270', '0377237270', NULL, NULL, 2),
(486, 'BARONE', 'François', '98 rue du stade MACHAULT 08310', '0371879519', NULL, 'OSTEOPATHIE', 8),
(487, 'ALLIO', 'Patricia', '8 rue des Pigeons CHEZY-SUR-MARNE 02570', '0360797082', NULL, 'OSTEOPATHIE', 2),
(488, 'GONNET', 'Reissa', '33 rue Beaudelaire BAGERT 09230', '0551753977', NULL, NULL, 9),
(489, 'SANTUCCI', 'Rosalie', '3 rue des Cavaux AMBRIEF 02200', '0325834365', NULL, 'GERONTOLOGIE', 2),
(490, 'BLANCHET', 'Irénée', '16 rue Bonaparte AVANCON 05230', '0429279003', NULL, 'HOMEOPATHIE', 5),
(491, 'MATTIO', 'Armelle', '24 rue des Néfliers QUATRE-CHAMPS 08400', '0371872007', NULL, 'OSTEOPATHIE', 8),
(492, 'ROCCA', 'Serge', '30 rue Albert Camus ARROUT 09800', '0563717429', NULL, NULL, 9),
(493, 'RAMBAUD', 'Bénédicte', '29 rue Victor Hugo AUDRESSEIN 09800', '0525469712', NULL, 'null', 9),
(494, 'DEMARIA', 'Marie', '15 rue de Paris AUBENTON 02500', '0396696281', NULL, NULL, 2),
(495, 'DALMAS', 'Charles-Edouard', '12 rue St Denis MONTCEAUX 01090', '0492465629', NULL, NULL, 1),
(496, 'BERTIN', 'Victor', '12 rue des Anses bleues SAVINES-LE-LAC 05160', '0417736200', NULL, NULL, 5),
(497, 'GILLET', 'Johnny', '35 rue du stade ASTON 09310', '0575380150', NULL, NULL, 9),
(498, 'TOMASI', 'Cristophe', '86 rue Mallarmé ORCIERES 05170', '0488800978', NULL, NULL, 5),
(499, 'GUIBERT', 'Julien', '38 rue Anatole France AUBENTON 02500', '0318610565', NULL, NULL, 2),
(500, 'ALBERTO', 'François', '32 rue du Mont REOTIER 05600', '0425989993', NULL, NULL, 5),
(501, 'PONCET', 'Anaelle', '74 rue de la gare FLEVILLE 08250', '0325218232', NULL, NULL, 8),
(502, 'DECANIS', 'Anselme', '86 rue Victor Hugo MESSINCOURT 08110', '0381133645', NULL, 'null', 8),
(503, 'VERA', 'Cristophe', '86 rue Pasteur NEUVILLE-LES-DAMES 01400', '0432667697', NULL, NULL, 1),
(504, 'PECOUT', 'sabine', '75 rue des Pigeons BEAUMONT-EN-BEINE 02300', '0376547227', NULL, NULL, 2),
(505, 'MORALES', 'Précilia', '66 rue Malraux BUZAN 09800', '0513300693', NULL, NULL, 9),
(506, 'CHABOT', 'Catherine', '27 rue de la Pergolat MONTCEAUX 01090', '0421383743', NULL, 'ALLERGOLOGIE', 1),
(507, 'ANGELINI', 'Alice', '37 rue de Paris CHEZY-SUR-MARNE 02570', '0356410090', NULL, 'ANGEIOLOGIE', 2),
(508, 'GUTIERREZ', 'Habib', '71 rue Bonaparte AGUILCOURT 02190', '0350823331', NULL, NULL, 2),
(509, 'JACQUES', 'Alain', '77 rue des Accacias BRIANCON 05100', '0498867503', NULL, 'GERONTOLOGIE', 5),
(510, 'BRONDINO', 'Patricia', '3 rue de la Tour BILLIAT 01200', '0428025797', NULL, NULL, 1),
(511, 'TOMASINI', 'Austine', '44 rue des Néfliers CHEZY-SUR-MARNE 02570', '0363569859', NULL, NULL, 2);
INSERT INTO `practitioners` (`id`, `lastname`, `firstname`, `address`, `tel`, `notorietyCoeff`, `complementarySpeciality`, `district_id`) VALUES
(512, 'FARRUGIA', 'André', '30 rue Hector Berlioz SAINT-FIRMIN 05800', '0444332279', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 5),
(513, 'DUMONT', 'Johnny', '36 rue Blainville AUBENTON 02500', '0395155855', NULL, NULL, 2),
(514, 'AVON', 'Aurèle', '10 rue du général de Gaulle ARROUT 09800', '0554301843', NULL, NULL, 9),
(515, 'FERRARA', 'Alizée', '35 rue des Pigeons MONT-LAURENT 08130', '0340963504', NULL, NULL, 8),
(516, 'COQUILLAT', 'Fatima', '16 rue Commandant Hériot BANCIGNY 02140', '0334753913', NULL, NULL, 2),
(517, 'SARKISSIAN', 'Adrien', '2 rue Commandant Hériot MONCEAU-SUR-OISE 02120', '0352372278', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 2),
(518, 'ALARCON', 'Andrew', '26 rue des pyramides BOULIGNEUX 01330', '0469707196', NULL, NULL, 1),
(519, 'GRECO', 'Anémone', '9 rue des Epines BLYES 01150', '0440301616', NULL, NULL, 1),
(520, 'PALMIERI', 'Cristophe', '69 rue de la recette DOMMARTIN 01380', '0495802726', NULL, NULL, 1),
(521, 'GOMIS', 'Jules', '24 rue Perdue THIN-LE-MOUTIER 08460', '0328900829', NULL, NULL, 8),
(522, 'BASTIDE', 'Aurélien', '66 rue des Anges BOULIGNEUX 01330', '0417563891', NULL, NULL, 1),
(523, 'TOURREL', 'François', '1 rue Blainville HAUTEVILLE 02120', '0317885243', NULL, NULL, 2),
(524, 'REBUFFAT', 'Irénée', '64 rue des perles blanches QUATRE-CHAMPS 08400', '0316251329', NULL, 'ALLERGOLOGIE', 8),
(525, 'MONNIER', 'Camille', '20 rue du stade AZY-SUR-MARNE 02400', '0339478573', NULL, NULL, 2),
(526, 'MEUNIER', 'Adelphe', '51 rue des gatinnes BRIANCON 05100', '0412521015', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 5),
(527, 'ALCARAZ', 'Andrew', '14 rue Hector Berlioz BRIANCON 05100', '0448191946', NULL, 'GERONTOLOGIE', 5),
(528, 'SANTONI', 'Mohammed', '47 rue Pernod YONCQ 08210', '0371193497', NULL, NULL, 8),
(529, 'CROS', 'Aurèle', '68 rue des Chantereines BUZAN 09800', '0563311027', NULL, 'OSTEOPATHIE', 9),
(530, 'CORNILLE', 'Patricia', '72 rue des pyramides ARROUT 09800', '0551116863', NULL, NULL, 9),
(531, 'COMTE', 'Aude', '35 rue de Poligny CHABESTAN 05400', '0454617092', NULL, NULL, 5),
(532, 'EMERIC', 'Jérémy', '10 rue Malraux FALAISE 08400', '0355875878', NULL, NULL, 8),
(533, 'FOSSATI', 'Jérémy', '12 rue des Anges SAINT-LAURENT-SUR-SAONE 01750', '0476010116', NULL, NULL, 1),
(534, 'BAGNIS', 'Alain', '86 rue de Marigny AUDRESSEIN 09800', '0584761714', NULL, NULL, 9),
(535, 'DELUY', 'Sophie', '54 rue des Epines SAINTE-MARIE 05150', '0447268257', NULL, NULL, 5),
(536, 'BAUDINO', 'Anne-Ange', '44 rue Malraux DOMMARTIN 01380', '0420664795', NULL, NULL, 1),
(537, 'DERDERIAN', 'Anaelle', '65 rue des Accacias BILLIAT 01200', '0463159777', NULL, NULL, 1),
(538, 'RAMOS', 'Julien', '26 rue Pernod AUDRESSEIN 09800', '0564023565', NULL, NULL, 9),
(539, 'PAPAZIAN', 'Jules', '5 rue Albert Camus BAGERT 09230', '0553330696', NULL, NULL, 9),
(540, 'ATTARD', 'Aristote', '71 rue Petit OYONNAX 01100', '0459707313', NULL, 'URGENTISTE', 1),
(541, 'MASSA', 'Fernand', '59 rue des Cavaux YONCQ 08210', '0370679861', NULL, NULL, 8),
(542, 'CARBONE', 'Anselme', '89 rue de la rose THIN-LE-MOUTIER 08460', '0329785730', NULL, NULL, 8),
(543, 'BONO', 'Firmin', '36 rue Blainville MAYOT 02800', '0335413346', NULL, NULL, 2),
(544, 'ALLIONE', 'Hypolite', '77 rue de Paris OYONNAX 01100', '0445547469', NULL, NULL, 1),
(545, 'POURCHIER', 'Cristophe', '24 rue de la Pergolat THIN-LE-MOUTIER 08460', '0394637980', NULL, NULL, 8),
(546, 'PAGANO', 'Habib', '28 rue des Chantereines FEPIN 08170', '0370382521', NULL, NULL, 8),
(547, 'ROGER', 'Amiel', '14 rue Petit AUBENTON 02500', '0324206273', NULL, NULL, 2),
(548, 'SAVELLI', 'Béatrice', '34 rue de la rose AVANCON 05230', '0441382007', NULL, NULL, 5),
(549, 'ANGELI', 'Béatrice', '98 rue du capitaine Crochet AX-LES-THERMES 09110', '0583031525', NULL, NULL, 9),
(550, 'AGNEL', 'Béatrice', '7 rue Hector Berlioz FRESSANCOURT 02800', '0368437171', NULL, NULL, 2),
(551, 'GUIRAUD', 'Fernand', '91 rue Pernod DOMMARTIN 01380', '0417334765', NULL, 'ACUPONCTURE', 1),
(552, 'CARLOTTI', 'Anselme', '82 rue St Denis BOURG-EN-BRESSE 01000', '0467462959', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 1),
(553, 'MAILLET', 'Jérémie', '80 rue Beaudelaire HOUDILCOURT 08190', '0391017675', NULL, NULL, 8),
(554, 'COMBES', 'Fatima', '88 rue du général de Gaulle DOMMARTIN 01380', '0436582548', NULL, 'URGENTISTE', 1),
(555, 'BOTTERO', 'Marie', '65 rue Edouard Hériot ABBECOURT 02300', '0316457802', NULL, 'HOMEOPATHIE', 2),
(556, 'GIRAUDO', 'Amiel', '75 rue des Accacias MAYOT 02800', '0348266841', NULL, NULL, 2),
(557, 'DALLEST', 'Anne-Lucie', '89 rue de la Pergolat SIGOYER 05130', '0423854231', NULL, NULL, 5),
(558, 'EYMARD', 'Patrice', '38 rue Pasteur AVANCON 05230', '0433495288', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 5),
(559, 'GRANGIER', 'Victor', '3 rue des Chantereines AMBRIEF 02200', '0313285058', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 2),
(560, 'ISNARDON', 'John', '99 rue du capitaine Fraquasse MAYOT 02800', '0325788039', NULL, 'URGENTISTE', 2),
(561, 'HONNORAT', 'Anne', '59 rue des Pigeons CEYZERIAT 01250', '0414968284', NULL, NULL, 1),
(562, 'GARZINO', 'Aurèle', '48 rue Anatole France SIGOYER 05130', '0498986897', NULL, NULL, 5),
(563, 'QUENIN', 'Firmin', '2 rue de la Tour AZY-SUR-MARNE 02400', '0334984702', NULL, NULL, 2),
(564, 'GERVAIS', 'Ingrid', '74 rue des Pigeons BELLOC 09600', '0575501098', NULL, 'Pédiatrie', 9),
(565, 'CARLE', 'Prosper', '53 rue de Paris BARENTON-SUR-SERRE 02270', '0390633950', NULL, NULL, 2),
(566, 'BERTON', 'Anne-Lucie', '19 rue du renard FRESSANCOURT 02800', '0380522884', NULL, NULL, 2),
(567, 'TORRE', 'Aline', '76 rue Louis Aragon BOULIGNEUX 01330', '0458483440', NULL, 'URGENTISTE', 1),
(568, 'VITIELLO', 'Serge', '79 rue Petit BUZAN 09800', '0597720760', NULL, 'ANGEIOLOGIE', 9),
(569, 'GALLI', 'Carole', '87 rue de Paris YONCQ 08210', '0386136458', NULL, NULL, 8),
(570, 'SCHMITT', 'Aristote', '89 rue du stade BOURG-EN-BRESSE 01000', '0495804047', NULL, NULL, 1),
(571, 'PAGNI', 'Annie', '81 rue de Poligny ORCIERES 05170', '0484719957', NULL, NULL, 5),
(572, 'BESSONE', 'Anne-Ange', '89 rue Debussy VAUX-CHAMPAGNE 08130', '0398454558', NULL, 'ACUPONCTURE', 8),
(573, 'SAIDI', 'Vénus', '19 rue Bonaparte AUDRESSEIN 09800', '0576161788', NULL, 'ACUPONCTURE', 9),
(574, 'MANCA', 'Irénée', '16 rue de Paris OYONNAX 01100', '0438645340', NULL, NULL, 1),
(575, 'AYME', 'Jérémie', '61 rue Hector Berlioz CHABESTAN 05400', '0488168776', NULL, 'OSTEOPATHIE', 5),
(576, 'DELAYE', 'Aurèle', '64 rue des Epines NEUVILLE-LES-DAMES 01400', '0498004744', NULL, NULL, 1),
(577, 'LION', 'Fatima', '21 rue des Chantereines LAVAL-MORENCY 08150', '0397521640', NULL, 'Pédiatre', 8),
(578, 'DUVAL', 'André', '35 rue Lampion BOURG-EN-BRESSE 01000', '0473219689', NULL, NULL, 1),
(579, 'COLIN', 'Marie', '17 rue des Accacias LAUNOIS-SUR-VENCE 08430', '0369193051', NULL, NULL, 8),
(580, 'MENDY', 'Astine', '94 rue Malraux HAUTEVILLE 02120', '0335672541', NULL, NULL, 2),
(581, 'RIMBAUD', 'Patricia', '75 rue du général de Gaulle FALAISE 08400', '0359521971', NULL, NULL, 8),
(582, 'BELMONTE', 'Charles', '40 rue de la poste JOIGNY-SUR-MEUSE 08700', '0395476454', NULL, NULL, 8),
(583, 'COLL', 'Anne-Laure', '75 rue Victor Hugo MONTCY-NOTRE-DAME 08090', '0333999479', NULL, NULL, 8),
(584, 'OLLIVE', 'Alizée', '51 rue Agniel YONCQ 08210', '0352293505', NULL, NULL, 8),
(585, 'RAHOU', 'Françoise', '9 rue Malraux SAINT-ANDRE-DE-ROSANS 05150', '0433874591', NULL, NULL, 5),
(586, 'NERI', 'Anne-Marie', '90 rue Mallarmé MAYOT 02800', '0363076320', NULL, NULL, 2),
(587, 'ANTONINI', 'Jimmy', '10 rue Hector Berlioz CHABESTAN 05400', '0479570050', NULL, NULL, 5),
(588, 'BARRET', 'Aurélien', '67 rue des Princes AMBRIEF 02200', '0326868610', NULL, NULL, 2),
(589, 'FIGUIERE', 'Anaelle', '86 rue du Mont MONTCEAUX 01090', '0432538873', NULL, 'URGENTISTE', 1),
(590, 'ANDRIEU', 'François', '23 rue de Paris BARZY-SUR-MARNE 02850', '0338114774', NULL, NULL, 2),
(591, 'GENRE', 'François', '33 rue Victor Hugo BELLOC 09600', '0587084727', NULL, NULL, 9),
(592, 'TURC', 'Catherine', '70 rue Malraux BRIANCON 05100', '0446591175', NULL, NULL, 5),
(593, 'LEONETTI', 'Amélie', '26 rue des Accacias MONT-LAURENT 08130', '0347054500', NULL, NULL, 8),
(594, 'VIGUIER', 'Charles', '77 rue des perles blanches BETTANT 01500', '0413532750', NULL, NULL, 1),
(595, 'PARODI', 'Adelphe', '96 rue des Argonautes REOTIER 05600', '0488831908', NULL, NULL, 5),
(596, 'LANFRANCHI', 'Carole', '83 rue du renard AX-LES-THERMES 09110', '0540901782', NULL, NULL, 9),
(597, 'BERTHON', 'Rodolphe', '33 rue Commandant Mouchotte THIN-LE-MOUTIER 08460', '0324607170', NULL, NULL, 8),
(598, 'GASTAUD', 'Yoan', '42 rue Anatole France BEZAC 09100', '0597093071', NULL, 'ALLERGOLOGIE', 9),
(599, 'PESCE', 'Firmin', '66 rue Commandant Hériot AX-LES-THERMES 09110', '0560293085', NULL, NULL, 9),
(600, 'LEONE', 'Caline', '54 rue de la pointe SAINT-SAUVEUR 05200', '0476324085', NULL, NULL, 5),
(601, 'ROLANDO', 'Amélie', '12 rue du capitaine Fraquasse BARZY-SUR-MARNE 02850', '0347886278', NULL, NULL, 2),
(602, 'BOSC', 'Nohan', '87 rue du 14 juillet HERBEUVAL 08370', '0350146870', NULL, NULL, 8),
(603, 'ROS', 'Yoan', '8 rue de Paris MONCEAU-SUR-OISE 02120', '0358800447', NULL, NULL, 2),
(604, 'LIAUTAUD', 'Victor', '26 rue Hector Berlioz ARANDAS 01230', '0426016480', NULL, NULL, 1),
(605, 'INNOCENTI', 'Bertrand', '94 rue des gatinnes MONTCEAUX 01090', '0480493919', NULL, NULL, 1),
(606, 'DESCHAMPS', 'Précilia', '56 rue du capitaine Crochet AUDRESSEIN 09800', '0537599041', NULL, NULL, 9),
(607, 'DEGIOANNI', 'Astine', '58 rue des perles blanches YONCQ 08210', '0380622197', NULL, NULL, 8),
(608, 'DI MEO', 'Anne-Sophie', '52 rue des Artistes FALAISE 08400', '0352041231', NULL, NULL, 8),
(609, 'SPINELLI', 'Anselme', '85 rue des Pigeons AGUILCOURT 02190', '0387135673', NULL, NULL, 2),
(610, 'MARTELLI', 'Julie', '97 rue des Lilas OYONNAX 01100', '0493949488', NULL, NULL, 1),
(611, 'IBANEZ', 'Andrée', '76 rue Alphonse Daudet LAUNOIS-SUR-VENCE 08430', '0355911277', NULL, NULL, 8),
(612, 'FERRY', 'Rosalie', '28 rue des Argonautes SAINTE-MARIE 05150', '0470907768', NULL, 'HOMEOPATHIE', 5),
(613, 'VINCENTI', 'Alizée', '78 rue de Marigny HERBEUVAL 08370', '0347904226', NULL, NULL, 8),
(614, 'GUEDJ', 'Adelphe', '72 rue Albert Camus SAINT-FIRMIN 05800', '0474088419', NULL, NULL, 5),
(615, 'MARTINELLI', 'Rodolphe', '59 rue Pasteur ORCIERES 05170', '0464480776', NULL, NULL, 5),
(616, 'BONNARD', 'Martin', '14 rue Perdue AUBENTON 02500', '0377909038', NULL, 'OSTEOPATHIE', 2),
(617, 'BARON', 'Anne-Ange', '89 rue Pasteur SIGOYER 05130', '0461827483', NULL, 'HOMEOPATHIE', 5),
(618, 'ARNAUDO', 'Marie', '51 rue des Epines ABBECOURT 02300', '0326934571', NULL, NULL, 2),
(619, 'VANNI', 'Julienne', '3 rue des Artistes BLYES 01150', '0413911989', NULL, NULL, 1),
(620, 'CARBONNEL', 'Amélie', '45 rue des Cavaux ABBECOURT 02300', '0372174885', NULL, NULL, 2),
(621, 'BOYADJIAN', 'Jules', '18 rue Agniel AUBENTON 02500', '0368418443', NULL, NULL, 2),
(622, 'SANTI', 'Aurèle', '64 rue de Poligny BRIANCON 05100', '0484091392', NULL, 'OSTEOPATHIE', 5),
(623, 'RENUCCI', 'Bertrand', '68 rue de la gare BOURG-EN-BRESSE 01000', '0416521067', NULL, NULL, 1),
(624, 'GEORGES', 'Jimmy', '66 rue de Paris OYONNAX 01100', '0419790693', NULL, NULL, 1),
(625, 'CALVO', 'Nohan', '55 rue Victor Hugo BANCIGNY 02140', '0350319392', NULL, 'HOMEOPATHIE', 2),
(626, 'FINA', 'Caline', '96 rue Perdue CAMON 09500', '0540178028', NULL, NULL, 9),
(627, 'AMPHOUX', 'André', '34 rue des Princes ROCHEBRUNE 05190', '0444668151', NULL, NULL, 5),
(628, 'CESARI', 'Hector', '75 rue des Anses bleues SAINT-LAURENT-SUR-SAONE 01750', '0478936977', NULL, NULL, 1),
(629, 'MORI', 'Précilia', '39 rue Petit SAINT-LAURENT-SUR-SAONE 01750', '0456796681', NULL, NULL, 1),
(630, 'BARRIELLE', 'Gilles', '11 rue des Pigeons NEUVILLE-LES-DAMES 01400', '0418340885', NULL, NULL, 1),
(631, 'BOUISSON', 'Jordan', '53 rue des Anses bleues PELVOUX 05340', '0474792387', NULL, NULL, 5),
(632, 'TESTA', 'Julien', '76 rue Pasteur PELVOUX 05340', '0439307843', NULL, NULL, 5),
(633, 'RUBIO', 'François', '83 rue Petit BRIANCON 05100', '0481669712', NULL, NULL, 5),
(634, 'VALERY', 'Firmin', '69 rue de la Tour AUGIREIN 09800', '0561526750', NULL, NULL, 9),
(635, 'DE LUCA', 'Bernard', '50 rue Malraux MONCEAU-SUR-OISE 02120', '0330404637', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 2),
(636, 'OLIVERO', 'Aline', '63 rue du général de Gaulle MONTCY-NOTRE-DAME 08090', '0330296222', NULL, NULL, 8),
(637, 'BONELLI', 'Anne-Sophie', '28 rue du général de Gaulle BRIANCON 05100', '0466993498', NULL, 'GERONTOLOGIE', 5),
(638, 'DOMERGUE', 'Bernard', '47 rue du général de Gaulle CAMON 09500', '0534440216', NULL, NULL, 9),
(639, 'MONTOYA', 'Anne-Marie', '15 rue des Princes ASTON 09310', '0584747640', NULL, NULL, 9),
(640, 'MARCEL', 'Aristote', '27 rue des Cavaux FEPIN 08170', '0333376588', NULL, NULL, 8),
(641, 'BUISSON', 'John', '41 rue Commandant Mouchotte HAUTEVILLE 02120', '0328740889', NULL, 'URGENTISTE', 2),
(642, 'TEMPIER', 'Irénée', '42 rue Agniel OYONNAX 01100', '0447938676', NULL, NULL, 1),
(643, 'HONORAT', 'Martin', '67 rue Agniel NEUVILLE-LES-DAMES 01400', '0412803539', NULL, 'URGENTISTE', 1),
(644, 'OLLIER', 'Rosalie', '15 rue Edouard Hériot ARROUT 09800', '0553692792', NULL, NULL, 9),
(645, 'MARTINET', 'Gilles', '64 rue du Mont HAUTEVILLE 02120', '0310558221', NULL, 'GERONTOLOGIE', 2),
(646, 'MARQUES', 'Aude', '25 rue des hirondelles BLYES 01150', '0415240773', NULL, NULL, 1),
(647, 'GUIEN', 'Reissa', '65 rue du général de Gaulle AZY-SUR-MARNE 02400', '0374955418', NULL, NULL, 2),
(648, 'SILVY', 'Andrée', '30 rue du 14 juillet AVANCON 05230', '0463468177', NULL, NULL, 5),
(649, 'CASTINEL', 'Julien', '47 rue Agniel JOIGNY-SUR-MEUSE 08700', '0334063627', NULL, NULL, 8),
(650, 'RAMIREZ', 'Reissa', '62 rue de la Tour ROCHEBRUNE 05190', '0480473643', NULL, NULL, 5),
(651, 'LAPEYRE', 'Sophie', '91 rue Petit AUBENTON 02500', '0348745022', NULL, NULL, 2),
(652, 'LAMBERTI', 'Patricia', '95 rue Pasteur HERBEUVAL 08370', '0354297793', NULL, NULL, 8),
(653, 'CARRIERE', 'Reissa', '25 rue Perdue AX-LES-THERMES 09110', '0540152929', NULL, 'OSTEOPATHIE', 9),
(654, 'PICHON', 'Armelle', '57 rue des Pigeons SAINT-FIRMIN 05800', '0479849596', NULL, NULL, 5),
(655, 'BERT', 'Irénée', '83 rue des pyramides FLEVILLE 08250', '0312351408', NULL, NULL, 8),
(656, 'ANTON', 'Anne-Laure', '58 rue des Argonautes ATTILLY 02490', '0344455589', NULL, NULL, 2),
(657, 'CAPARROS', 'Patrick', '28 rue des Cyprés OYONNAX 01100', '0456081235', NULL, NULL, 1),
(658, 'CHAINE', 'Ines', '65 rue Mallarmé TRAVECY 02800', '0344024000', NULL, NULL, 2),
(659, 'MACCARIO', 'Julie', '30 rue de du général Scott SAINT-FIRMIN 05800', '0440937400', NULL, NULL, 5),
(660, 'DENIS', 'Aurélien', '92 rue des Cyprés BEZAC 09100', '0521006225', NULL, NULL, 9),
(661, 'CAMPO', 'Martial', '41 rue du général de Gaulle AUGIREIN 09800', '0569674646', NULL, NULL, 9),
(662, 'PIAZZA', 'Amiel', '6 rue Malraux HAUTEVILLE 02120', '0336447283', NULL, NULL, 2),
(663, 'BATTINI', 'Jérémy', '62 rue Lampion BEZAC 09100', '0526185264', NULL, NULL, 9),
(664, 'BARRIOL', 'Cristophe', '88 rue du général de Gaulle BOULIGNEUX 01330', '0435544779', NULL, NULL, 1),
(665, 'COURT', 'Ingrid', '6 rue du 14 juillet DOMMARTIN 01380', '0442048091', NULL, NULL, 1),
(666, 'GIOVANNETTI', 'Jimmy', '50 rue Anatole France MACHAULT 08310', '0332316186', NULL, NULL, 8),
(667, 'SIMIAN', 'Aline', '68 rue des Artistes NEUVILLE-LES-DAMES 01400', '0431882334', NULL, NULL, 1),
(668, 'PUGET', 'Irénée', '34 rue des Chantereines BEAUMONT-EN-BEINE 02300', '0337016124', NULL, NULL, 2),
(669, 'BLACHE', 'Gilles', '28 rue du Mont JOIGNY-SUR-MEUSE 08700', '0356982229', NULL, 'OSTEOPATHIE', 8),
(670, 'ORSONI', 'Irénée', '33 rue des perles blanches HOUDILCOURT 08190', '0399670344', NULL, NULL, 8),
(671, 'VIAN', 'Habib', '9 rue des gatinnes BEZAC 09100', '0521113468', NULL, NULL, 9),
(672, 'GUERRINI', 'Cristophe', '18 rue Edouard Hériot CHALLES 01450', '0428126087', NULL, NULL, 1),
(673, 'BARBE', 'Aline', '87 rue de la Tour ORCIERES 05170', '0474417618', NULL, NULL, 5),
(674, 'PARRA', 'Julien', '20 rue des Chantereines SAINT-SAUVEUR 05200', '0430434976', NULL, NULL, 5),
(675, 'MOUNIER', 'Anselme', '14 rue des Anges REOTIER 05600', '0441999912', NULL, NULL, 5),
(676, 'MARION', 'Anne-Lucie', '47 rue Bonaparte AUGIREIN 09800', '0533497900', NULL, NULL, 9),
(677, 'LUCCHINI', 'Alizée', '96 rue Albert Camus BAGERT 09230', '0519203974', NULL, NULL, 9),
(678, 'LEYDET', 'Béatrice', '97 rue Lampion TRAVECY 02800', '0350641861', NULL, NULL, 2),
(679, 'ROYERE', 'Serge', '61 rue Mallarmé SAVINES-LE-LAC 05160', '0489512105', NULL, NULL, 5),
(680, 'GIACALONE', 'Rodolphe', '43 rue des Princes ASTON 09310', '0513212527', NULL, NULL, 9),
(681, 'MESSINA', 'Adelphe', '80 rue des Princes AVANCON 05230', '0446646697', NULL, NULL, 5),
(682, 'MENDEZ', 'Austine', '47 rue Pasteur BEZAC 09100', '0530872724', NULL, NULL, 9),
(683, 'LAUTIER', 'Yoan', '55 rue des Cavaux AGUILCOURT 02190', '0324607617', NULL, NULL, 2),
(684, 'COULET', 'Gilles', '46 rue du stade MONT-LAURENT 08130', '0387328329', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 8),
(685, 'BELTRAN', 'Aude', '98 rue des Cyprés SAINT-CREPIN 05600', '0458369404', NULL, NULL, 5),
(686, 'HUBERT', 'Cristophe', '82 rue Hector Berlioz ARANDAS 01230', '0425003261', NULL, NULL, 1),
(687, 'POUSSEL', 'Jérémy', '21 rue des Princes MONT-LAURENT 08130', '0322135363', NULL, NULL, 8),
(688, 'CHEYLAN', 'Mohammed', '53 rue Pasteur THIN-LE-MOUTIER 08460', '0389514499', NULL, NULL, 8),
(689, 'COPPOLA', 'Précilia', '38 rue Louis Aragon SAVINES-LE-LAC 05160', '0441180757', NULL, NULL, 5),
(690, 'CAVALIER', 'Françoise', '63 rue des Anges AX-LES-THERMES 09110', '0553742065', NULL, 'URGENTISTE', 9),
(691, 'DUTTO', 'sabine', '18 rue Lampion MONTCEAUX 01090', '0474843880', NULL, NULL, 1),
(692, 'MOUTET', 'Julien', '50 rue des Chantereines REOTIER 05600', '0433213809', NULL, NULL, 5),
(693, 'EYRAUD', 'Julie', '29 rue de du général Scott SAINT-ANDRE-DE-ROSANS 05150', '0450980762', NULL, NULL, 5),
(694, 'BARRE', 'Roby', '14 rue Mallarmé LAVAL-MORENCY 08150', '0350310027', NULL, 'ANGEIOLOGIE', 8),
(695, 'ALONSO', 'Jérémy', '42 rue du capitaine Fraquasse JUNIVILLE 08310', '0361117640', NULL, NULL, 8),
(696, 'BOUQUET', 'Anne-Laure', '63 rue Commandant Mouchotte BOURG-EN-BRESSE 01000', '0442277236', NULL, NULL, 1),
(697, 'PHILIPPE', 'Anaelle', '21 rue des Cavaux CHEZY-SUR-MARNE 02570', '0388675304', NULL, NULL, 2),
(698, 'LUCAS', 'Hamed', '74 rue Victor Hugo ARROUT 09800', '0541004550', NULL, NULL, 9),
(699, 'LEONARDI', 'Béatrice', '54 rue Victor Hugo FRESSANCOURT 02800', '0312941986', NULL, 'ALLERGOLOGIE', 2),
(700, 'MARTI', 'Françoise', '98 rue de la Tour MESSINCOURT 08110', '0317883763', NULL, 'GERONTOLOGIE', 8),
(701, 'PELLET', 'Aristote', '73 rue des Anges BARENTON-SUR-SERRE 02270', '0369353331', NULL, NULL, 2),
(702, 'LANDI', 'Johnny', '41 rue Victor Hugo FALAISE 08400', '0393642374', NULL, NULL, 8),
(703, 'RUGGIERI', 'André', '59 rue de la Pergolat BAGERT 09230', '0570809688', NULL, NULL, 9),
(704, 'PIANA', 'Carole', '49 rue de du général Scott HOUDILCOURT 08190', '0318196859', NULL, NULL, 8),
(705, 'VILLEVIEILLE', 'Armelle', '70 rue Mallarmé LAVAL-MORENCY 08150', '0330805895', NULL, NULL, 8),
(706, 'GERIN', 'François', '51 rue des Lilas SAINT-FIRMIN 05800', '0410879788', NULL, NULL, 5),
(707, 'FAVRE', 'Anémone', '66 rue Commandant Mouchotte BRIANCON 05100', '0421542405', NULL, NULL, 5),
(708, 'QUILICHINI', 'Reissa', '73 rue de la Pergolat BRIANCON 05100', '0444698187', NULL, NULL, 5),
(709, 'GUIS', 'John', '2 rue des Princes SAVINES-LE-LAC 05160', '0431249814', NULL, NULL, 5),
(710, 'FERRARO', 'Catherine', '53 rue de Poligny BARZY-SUR-MARNE 02850', '0373513553', NULL, NULL, 2),
(711, 'JAUME', 'Jules', '30 rue Malraux EVIGNY 08090', '0317625916', NULL, 'GERONTOLOGIE', 8),
(712, 'PARISI', 'Martin', '35 rue des perles blanches OYONNAX 01100', '0484949416', NULL, NULL, 1),
(713, 'BENHAMOU', 'Rodolphe', '22 rue du stade AX-LES-THERMES 09110', '0597525447', NULL, NULL, 9),
(714, 'HERMITTE', 'Patrick', '18 rue Perdue NEUVILLE-LES-DAMES 01400', '0454304156', NULL, NULL, 1),
(715, 'SORIANO', 'Bertrand', '65 rue des Anses bleues BELLOC 09600', '0522232477', NULL, NULL, 9),
(716, 'ALI', 'Bernard', '70 rue des pyramides AX-LES-THERMES 09110', '0548800884', NULL, NULL, 9),
(717, 'ALBANO', 'Rosalie', '9 rue Mallarmé SAINT-CREPIN 05600', '0470298666', NULL, NULL, 5),
(718, 'BARALE', 'Jordan', '36 rue Mallarmé MONCEAU-SUR-OISE 02120', '0337902134', NULL, NULL, 2),
(719, 'RICAUD', 'Jérémie', '27 rue de Paris TRAVECY 02800', '0321240986', NULL, 'ANGEIOLOGIE', 2),
(720, 'PUECH', 'Catherine', '25 rue du stade THIN-LE-MOUTIER 08460', '0373019942', NULL, NULL, 8),
(721, 'DARMON', 'Précilia', '58 rue des Chantereines SORBIERS 05150', '0456138900', NULL, NULL, 5),
(722, 'PASQUALINI', 'Roby', '14 rue des Princes REOTIER 05600', '0418201233', NULL, NULL, 5),
(723, 'FLEURY', 'Roby', '7 rue du 14 juillet SAINT-FIRMIN 05800', '0435737841', NULL, NULL, 5),
(724, 'LAMY', 'Alice', '21 rue du 14 juillet AUDRESSEIN 09800', '0549577626', NULL, 'ALLERGOLOGIE', 9),
(725, 'GATTO', 'Sophie', '12 rue Blainville BOULIGNEUX 01330', '0485824681', NULL, NULL, 1),
(726, 'MARKARIAN', 'Armelle', '87 rue des pyramides BANCIGNY 02140', '0380163229', NULL, NULL, 2),
(727, 'VITALI', 'Cristophe', '44 rue St Denis ROCHEBRUNE 05190', '0421833954', NULL, NULL, 5),
(728, 'PONCE', 'Reissa', '27 rue de la gare AUDRESSEIN 09800', '0525862994', NULL, NULL, 9),
(729, 'GROSSO', 'Amélie', '41 rue des pyramides VAUX-CHAMPAGNE 08130', '0343900888', NULL, NULL, 8),
(730, 'GROSSI', 'Andrew', '31 rue de la poste FLOING 08200', '0311338451', NULL, NULL, 8),
(731, 'ABEILLE', 'Marie', '35 rue des gatinnes PELVOUX 05340', '0427092084', NULL, NULL, 5),
(732, 'MIRETTI', 'Alice', '35 rue du renard AX-LES-THERMES 09110', '0579017565', NULL, NULL, 9),
(733, 'BOURGUE', 'Jules', '90 rue de Paris VAUX-CHAMPAGNE 08130', '0386647121', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 8),
(734, 'FERRIGNO', 'Rosalie', '3 rue de Marigny AX-LES-THERMES 09110', '0552021678', NULL, NULL, 9),
(735, 'MOURGUES', 'Astine', '7 rue de la Pergolat BAGERT 09230', '0521392547', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 9),
(736, 'GUIGOU', 'Prosper', '90 rue Bonaparte YONCQ 08210', '0392674994', NULL, NULL, 8),
(737, 'GALLIANO', 'Fernand', '42 rue Edouard Hériot ARROUT 09800', '0515601750', NULL, NULL, 9),
(738, 'VENTURA', 'Anne-Laure', '70 rue du Mont AZY-SUR-MARNE 02400', '0347195732', NULL, NULL, 2),
(739, 'NEGRO', 'Julien', '13 rue des Lilas BANCIGNY 02140', '0339249742', NULL, NULL, 2),
(740, 'BONHOMME', 'Hypolite', '45 rue des Néfliers ORCIERES 05170', '0435503130', NULL, NULL, 5),
(741, 'ZUNINO', 'Irénée', '57 rue Hector Berlioz FEPIN 08170', '0399685398', NULL, NULL, 8),
(742, 'CERUTTI', 'Reissa', '24 rue Hector Berlioz ARROUT 09800', '0564256388', NULL, 'GERONTOLOGIE', 9),
(743, 'SAUNIER', 'Jimmy', '25 rue Albert Camus SAINT-LAURENT-SUR-SAONE 01750', '0442319187', NULL, NULL, 1),
(744, 'PARDIGON', 'Jérémie', '96 rue Anatole France MONT-LAURENT 08130', '0379511159', NULL, NULL, 8),
(745, 'GOIRAND', 'Victor', '37 rue de Marigny SAINTE-MARIE 05150', '0497549880', NULL, NULL, 5),
(746, 'LEGIER', 'Bertrand', '20 rue Pasteur BEDEILLE 09230', '0522586224', NULL, NULL, 9),
(747, 'SAVINO', 'Julien', '44 rue Bonaparte BANCIGNY 02140', '0390688254', NULL, NULL, 2),
(748, 'MENARD', 'Habib', '5 rue du stade AMBRIEF 02200', '0327960352', NULL, NULL, 2),
(749, 'SARRAZIN', 'André', '69 rue Debussy MONCEAU-SUR-OISE 02120', '0363762717', NULL, NULL, 2),
(750, 'ROYER', 'Hypolite', '20 rue Victor Hugo THIN-LE-MOUTIER 08460', '0387692474', NULL, NULL, 8),
(751, 'PORTAL', 'André', '27 rue des Accacias LAUNOIS-SUR-VENCE 08430', '0314089620', NULL, NULL, 8),
(752, 'MANFREDI', 'Mohammed', '48 rue du 14 juillet AX-LES-THERMES 09110', '0557230819', NULL, NULL, 9),
(753, 'COLLET', 'Patrick', '38 rue du renard BILLIAT 01200', '0438986289', NULL, NULL, 1),
(754, 'MINASSIAN', 'Précilia', '3 rue des Epines AUGIREIN 09800', '0555523105', NULL, NULL, 9),
(755, 'GLEIZE', 'Hamed', '43 rue des Epines HERBEUVAL 08370', '0332471585', NULL, NULL, 8),
(756, 'SAUVAIRE', 'Anne-Marie', '26 rue de Paris SORBIERS 05150', '0480449197', NULL, NULL, 5),
(757, 'PARDO', 'Amélie', '33 rue de Marigny BRIANCON 05100', '0429531221', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 5),
(758, 'CHAFFARD', 'Précilia', '17 rue des pyramides MESSINCOURT 08110', '0383254238', NULL, NULL, 8),
(759, 'LEGRAND', 'Précilia', '24 rue Debussy BOURG-EN-BRESSE 01000', '0431348186', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 1),
(760, 'CASTRO', 'Béatrice', '21 rue des perles blanches MONTCY-NOTRE-DAME 08090', '0314453519', NULL, NULL, 8),
(761, 'COSSU', 'Caline', '46 rue Mallarmé MONTCEAUX 01090', '0420799374', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 1),
(762, 'MUSCAT', 'Bénédicte', '90 rue Agniel YONCQ 08210', '0373069363', NULL, NULL, 8),
(763, 'LAI', 'Alain', '17 rue St Denis AGUILCOURT 02190', '0333695801', NULL, NULL, 2),
(764, 'ROMERA', 'Précilia', '34 rue Anatole France BETTANT 01500', '0412141785', NULL, NULL, 1),
(765, 'MAURO', 'Anne-Laure', '24 rue Commandant Mouchotte REOTIER 05600', '0420893209', NULL, NULL, 5),
(766, 'AZZOPARDI', 'Françoise', '80 rue Albert Camus AMBRIEF 02200', '0373756074', NULL, NULL, 2),
(767, 'MOSSE', 'Caline', '30 rue des perles blanches SAINT-LAURENT-SUR-SAONE 01750', '0439831324', NULL, NULL, 1),
(768, 'HADDAD', 'Victor', '14 rue des Lilas CHEZY-SUR-MARNE 02570', '0313300681', NULL, NULL, 2),
(769, 'GASQUET', 'Aristote', '79 rue des Anses bleues ARANDAS 01230', '0420332660', NULL, NULL, 1),
(770, 'FERRANDO', 'Johnny', '34 rue du renard FALAISE 08400', '0370553291', NULL, NULL, 8),
(771, 'TAGUELMINT', 'Jérome', '28 rue Hector Berlioz ORCIERES 05170', '0443297062', NULL, NULL, 5),
(772, 'RIPOLL', 'Françoise', '88 rue du Mont FRESSANCOURT 02800', '0313654986', NULL, 'ANGEIOLOGIE', 2),
(773, 'POUJOL', 'Anaelle', '48 rue des Argonautes ARROUT 09800', '0518603040', NULL, NULL, 9),
(774, 'BARBERIS', 'Jérémie', '67 rue des gatinnes ARANDAS 01230', '0410422676', NULL, NULL, 1),
(775, 'DUPUIS', 'Julie', '4 rue Anatole France DOMMARTIN 01380', '0496807830', NULL, NULL, 1),
(776, 'LUBRANO', 'Jules', '62 rue de la Pergolat BOURG-EN-BRESSE 01000', '0487728945', NULL, NULL, 1),
(777, 'CARTA', 'Amélie', '59 rue Louis Aragon CAMON 09500', '0591653123', NULL, NULL, 9),
(778, 'GARIBALDI', 'Johnny', '80 rue de du général Scott JOIGNY-SUR-MEUSE 08700', '0386814494', NULL, NULL, 8),
(779, 'RENARD', 'Dominique', '35 rue des Epines MONTCEAUX 01090', '0463823233', NULL, 'null', 1),
(780, 'BERTORELLO', 'Amélie', '60 rue des gatinnes BILLIAT 01200', '0487102339', NULL, NULL, 1),
(781, 'AZOULAY', 'Andrée', '20 rue de la Pergolat MONTCEAUX 01090', '0487833849', NULL, NULL, 1),
(782, 'MIRALLES', 'Aristote', '74 rue des Néfliers SAINT-LAURENT-SUR-SAONE 01750', '0417675151', NULL, NULL, 1),
(783, 'STEFANI', 'Anémone', '78 rue Victor Hugo BRIANCON 05100', '0430859878', NULL, NULL, 5),
(784, 'PACE', 'Amiel', '2 rue Perdue AUBENTON 02500', '0334550712', NULL, NULL, 2),
(785, 'JUAN', 'Aline', '88 rue de Poligny FRESSANCOURT 02800', '0399301475', NULL, NULL, 2),
(786, 'BRESSON', 'Prosper', '18 rue des hirondelles BOURG-EN-BRESSE 01000', '0463936581', NULL, NULL, 1),
(787, 'BARD', 'Marie', '47 rue Perdue BRIANCON 05100', '0464689414', NULL, NULL, 5),
(788, 'ALBRAND', 'Hector', '91 rue des hirondelles AX-LES-THERMES 09110', '0583375798', NULL, NULL, 9),
(789, 'FIORE', 'Jérémie', '19 rue Commandant Hériot CEYZERIAT 01250', '0426848534', NULL, 'URGENTISTE', 1),
(790, 'MICHELI', 'Aristote', '96 rue du Mont ROCHEBRUNE 05190', '0486526998', NULL, NULL, 5),
(791, 'BLACHERE', 'Hypolite', '92 rue Beaudelaire JOIGNY-SUR-MEUSE 08700', '0364925968', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 8),
(792, 'BRES', 'Jules', '56 rue du Mont BILLIAT 01200', '0459159687', NULL, NULL, 1),
(793, 'BALESTRA', 'Anne-Lucie', '94 rue Agniel BILLIAT 01200', '0497364094', NULL, NULL, 1),
(794, 'OLIVER', 'Reissa', '37 rue de la pointe HAUTEVILLE 02120', '0398806683', NULL, 'ALLERGOLOGIE', 2),
(795, 'GUIDICELLI', 'Patricia', '5 rue St Denis ABBECOURT 02300', '0355040100', NULL, NULL, 2),
(796, 'BARONI', 'Anne-Lucie', '90 rue Lampion YONCQ 08210', '0399778947', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 8),
(797, 'MAZET', 'Jérémy', '75 rue des Cavaux SAINT-LAURENT-SUR-SAONE 01750', '0466069822', NULL, NULL, 1),
(798, 'MARCO', 'Nohan', '9 rue des Epines SAVOURNON 05700', '0411774310', NULL, NULL, 5),
(799, 'COULON', 'Hector', '87 rue Malraux LAUNOIS-SUR-VENCE 08430', '0359717547', NULL, NULL, 8),
(800, 'CONSTANTIN', 'Aline', '14 rue de la rose BARZY-SUR-MARNE 02850', '0356584101', NULL, NULL, 2),
(801, 'BAUDE', 'Sophie', '66 rue du 14 juillet AVANCON 05230', '0413861599', NULL, NULL, 5),
(802, 'BURLE', 'Dominique', '72 rue des Argonautes BRIANCON 05100', '0465512769', NULL, NULL, 5),
(803, 'AMBROSINO', 'Anne', '78 rue des hirondelles PELVOUX 05340', '0495946694', NULL, NULL, 5),
(804, 'MASSONI', 'Ines', '15 rue des Anses bleues MESSINCOURT 08110', '0312418493', NULL, NULL, 8),
(805, 'CROCE', 'Anémone', '21 rue Commandant Hériot BELLEY 01300', '0465513099', NULL, NULL, 1),
(806, 'CHABAS', 'Sophie', '54 rue du 14 juillet AX-LES-THERMES 09110', '0548859466', NULL, NULL, 9),
(807, 'BARBERO', 'Irénée', '48 rue des perles blanches BRIANCON 05100', '0424065321', NULL, NULL, 5),
(808, 'BRETON', 'John', '34 rue du Mont BETTANT 01500', '0441330897', NULL, 'HOMEOPATHIE', 1),
(809, 'MASSOT', 'Aurélien', '61 rue Pasteur MAYOT 02800', '0356229245', NULL, NULL, 2),
(810, 'MOLINARI', 'sabine', '14 rue des Anges OYONNAX 01100', '0456485843', NULL, NULL, 1),
(811, 'GUY', 'Camille', '67 rue Alphonse Daudet BUZAN 09800', '0531797312', NULL, NULL, 9),
(812, 'DUPRE', 'Mohammed', '6 rue des Pigeons BARENTON-SUR-SERRE 02270', '0370234499', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 2),
(813, 'COLLOMB', 'Amiel', '23 rue Hector Berlioz BETTANT 01500', '0487520515', NULL, NULL, 1),
(814, 'CANU', 'Vénus', '90 rue des Lilas HAUTEVILLE 02120', '0394086731', NULL, NULL, 2),
(815, 'ANTONELLI', 'Hypolite', '80 rue de la gare ARANDAS 01230', '0440645072', NULL, NULL, 1),
(816, 'DURET', 'Anémone', '22 rue des Cyprés BLYES 01150', '0470785500', NULL, NULL, 1),
(817, 'FLORENS', 'Rodolphe', '24 rue des Anges BELLEY 01300', '0459668577', NULL, NULL, 1),
(818, 'FERRI', 'Julie', '88 rue des Pigeons JUNIVILLE 08310', '0391920541', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 8),
(819, 'SANTELLI', 'Alice', '6 rue des hirondelles SAINT-CREPIN 05600', '0478485015', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 5),
(820, 'SAID', 'Carole', '78 rue des Pigeons SAINTE-MARIE 05150', '0433025835', NULL, NULL, 5),
(821, 'DIAZ', 'Anne-Ange', '19 rue de la pointe PELVOUX 05340', '0411070122', NULL, NULL, 5),
(822, 'VICENTE', 'Ingrid', '35 rue Malraux QUATRE-CHAMPS 08400', '0370478563', NULL, 'ALLERGOLOGIE', 8),
(823, 'VACHIER', 'Alain', '27 rue du stade SAINT-LAURENT-SUR-SAONE 01750', '0492470117', NULL, NULL, 1),
(824, 'SAEZ', 'Vénus', '29 rue de Paris AVANCON 05230', '0424123589', NULL, NULL, 5),
(825, 'LA ROCCA', 'Bernard', '53 rue de la poste BAGERT 09230', '0550830599', NULL, 'OSTEOPATHIE', 9),
(826, 'RAYBAUD', 'Serge', '52 rue de Paris SAINT-FIRMIN 05800', '0472679599', NULL, NULL, 5),
(827, 'PASQUINI', 'Anaelle', '92 rue Blainville SAINT-ANDRE-DE-ROSANS 05150', '0474041924', NULL, 'GERONTOLOGIE', 5),
(828, 'JACOB', 'Charles', '47 rue Beaudelaire AMBRIEF 02200', '0356493035', NULL, NULL, 2),
(829, 'ROSSIGNOL', 'Fatima', '73 rue des Anges FRESSANCOURT 02800', '0390943061', NULL, NULL, 2),
(830, 'POURCEL', 'André', '95 rue Edouard Hériot SAINT-FIRMIN 05800', '0483174531', NULL, 'HOMEOPATHIE', 5),
(831, 'GUIGUES', 'André', '24 rue Louis Aragon REOTIER 05600', '0476877380', NULL, NULL, 5),
(832, 'GRECH', 'Ines', '71 rue Edouard Hériot ASTON 09310', '0543065471', NULL, 'HOMEOPATHIE', 9),
(833, 'CLARY', 'Irénée', '72 rue du capitaine Crochet SAVOURNON 05700', '0415947068', NULL, 'ANGEIOLOGIE', 5),
(834, 'PAPPALARDO', 'Armelle', '32 rue de Paris SAINT-LAURENT-SUR-SAONE 01750', '0480648434', NULL, NULL, 1),
(835, 'GUEYDON', 'Serge', '96 rue des oiseaux YONCQ 08210', '0397358254', NULL, NULL, 8),
(836, 'BOURELLY', 'Patrick', '66 rue Blainville FRESSANCOURT 02800', '0330907062', NULL, 'OSTEOPATHIE', 2),
(837, 'SILVESTRI', 'Caline', '84 rue des Epines BRIANCON 05100', '0411957355', NULL, NULL, 5),
(838, 'RIEU', 'Patrice', '93 rue Perdue DOMMARTIN 01380', '0430289650', NULL, NULL, 1),
(839, 'PEROTTI', 'Martin', '96 rue des Pigeons ORCIERES 05170', '0492319447', NULL, NULL, 5),
(840, 'CHAPUS', 'Rosalie', '34 rue des Ormes AX-LES-THERMES 09110', '0577827344', NULL, NULL, 9),
(841, 'REGIS', 'Robert', '97 rue des perles blanches VAUX-CHAMPAGNE 08130', '0315818160', NULL, 'null', 8),
(842, 'DUCROS', 'Patricia', '59 rue Pernod SORBIERS 05150', '0452990036', NULL, 'GERONTOLOGIE', 5),
(843, 'DELERIA', 'Patrice', '30 rue de du général Scott SAINT-SAUVEUR 05200', '0412740574', NULL, NULL, 5),
(844, 'JAYNE', 'Alizée', '24 rue Commandant Hériot HERBEUVAL 08370', '0372811016', NULL, NULL, 8),
(845, 'GANDOLFO', 'Amiel', '30 rue des Epines ARROUT 09800', '0554912883', NULL, NULL, 9),
(846, 'PAOLETTI', 'Anne-Laure', '72 rue des Accacias CEYZERIAT 01250', '0495757649', NULL, NULL, 1),
(847, 'MEFFRE', 'Alain', '89 rue de la Pergolat NEUVILLE-LES-DAMES 01400', '0443139412', NULL, NULL, 1),
(848, 'GUIOT', 'Julien', '52 rue Malraux MAYOT 02800', '0313537125', NULL, NULL, 2),
(849, 'PELLETIER', 'Dominique', '26 rue des Pigeons CHEZY-SUR-MARNE 02570', '0376713314', NULL, NULL, 2),
(850, 'CARMIGNANI', 'Prosper', '34 rue des pyramides DOMMARTIN 01380', '0437007893', NULL, NULL, 1),
(851, 'MESTRE', 'Amélie', '84 rue de Marigny AMBRIEF 02200', '0362342189', NULL, 'GERONTOLOGIE', 2),
(852, 'CAPUTO', 'Carole', '14 rue des Lilas SAVOURNON 05700', '0440474468', NULL, 'ALLERGOLOGIE', 5),
(853, 'CATANIA', 'Adelphe', '32 rue de Marigny CHABESTAN 05400', '0479332407', NULL, 'ANGEIOLOGIE', 5),
(854, 'SOTO', 'Anne-Lucie', '31 rue des pyramides MAYOT 02800', '0352060592', NULL, 'URGENTISTE', 2),
(855, 'SALA', 'Amélie', '90 rue des Néfliers HOUDILCOURT 08190', '0360017048', NULL, NULL, 8),
(856, 'GUERINI', 'Adelphe', '35 rue des Argonautes BOULIGNEUX 01330', '0470938471', NULL, NULL, 1),
(857, 'BOUCHARD', 'Rosalie', '14 rue Blainville FLEVILLE 08250', '0320670229', NULL, NULL, 8),
(858, 'CARLI', 'Caline', '27 rue Pasteur AX-LES-THERMES 09110', '0512150549', NULL, NULL, 9),
(859, 'MURA', 'Astine', '94 rue Debussy MONTIGNY-SUR-MEUSE 08170', '0358772408', NULL, NULL, 8),
(860, 'CARLES', 'Victor', '23 rue St Denis TRAVECY 02800', '0330373632', NULL, NULL, 2),
(861, 'ANDREU', 'Aristote', '55 rue Agniel BEDEILLE 09230', '0597171275', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 9),
(862, 'PINTO', 'Charles-Edouard', '78 rue de la recette MACHAULT 08310', '0325349638', NULL, NULL, 8),
(863, 'GARGUILO', 'Caline', '19 rue Pernod AX-LES-THERMES 09110', '0568016782', NULL, NULL, 9),
(864, 'VITALIS', 'Aurèle', '9 rue de la gare MONTCY-NOTRE-DAME 08090', '0346893168', NULL, NULL, 8),
(865, 'ROQUE', 'Serge', '99 rue de Paris MONTCY-NOTRE-DAME 08090', '0391243175', NULL, NULL, 8),
(866, 'MANOUKIAN', 'Aline', '66 rue des Cyprés ROCHEBRUNE 05190', '0474044568', NULL, 'HOMEOPATHIE', 5),
(867, 'CARUSO', 'Gilles', '13 rue des Ormes BLYES 01150', '0424315941', NULL, 'OSTEOPATHIE', 1),
(868, 'RIBES', 'Johnny', '99 rue des Epines LAUNOIS-SUR-VENCE 08430', '0313668088', NULL, 'ALLERGOLOGIE', 8),
(869, 'VOLPE', 'Jérome', '24 rue des Anses bleues FLOING 08200', '0351576826', NULL, NULL, 8),
(870, 'POULET', 'Amiel', '16 rue des oiseaux OYONNAX 01100', '0480872838', NULL, NULL, 1),
(871, 'AGRESTI', 'Irénée', '24 rue Agniel BOURG-EN-BRESSE 01000', '0457782183', NULL, NULL, 1),
(872, 'GIUSIANO', 'Andrew', '63 rue de du général Scott SAINTE-MARIE 05150', '0496424640', NULL, NULL, 5),
(873, 'CANAVESE', 'Fatima', '9 rue des Cyprés FRESSANCOURT 02800', '0399807861', NULL, NULL, 2),
(874, 'FRANCESCHINI', 'Andrew', '53 rue de la Pergolat CHABESTAN 05400', '0448286750', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 5),
(875, 'TOUATI', 'Gilles', '47 rue du capitaine Fraquasse BANCIGNY 02140', '0397976949', NULL, 'HOMEOPATHIE', 2),
(876, 'BOSQ', 'Marie', '89 rue Albert Camus MONTCY-NOTRE-DAME 08090', '0378321982', NULL, NULL, 8),
(877, 'ROCCHI', 'Anne-Jeanne', '81 rue des Cavaux SAINT-LAURENT-SUR-SAONE 01750', '0463951383', NULL, NULL, 1),
(878, 'SALVADOR', 'Armelle', '76 rue du Mont MONTCEAUX 01090', '0415598111', NULL, NULL, 1),
(879, 'BERGE', 'Anémone', '19 rue Albert Camus CAMON 09500', '0573404038', NULL, NULL, 9),
(880, 'TISSOT', 'Prosper', '67 rue de la gare FLOING 08200', '0324668686', NULL, NULL, 8),
(881, 'ROQUES', 'Anselme', '53 rue des hirondelles FLOING 08200', '0327408227', NULL, NULL, 8),
(882, 'AGUENI', 'Roby', '13 rue du stade OYONNAX 01100', '0474204428', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 1),
(883, 'CHAPPE', 'Vénus', '50 rue des Argonautes HERBEUVAL 08370', '0373456319', NULL, NULL, 8),
(884, 'LEANDRI', 'Aline', '54 rue de la Tour ARROUT 09800', '0573442616', NULL, NULL, 9),
(885, 'SUZAN', 'Alain', '50 rue Anatole France TRAVECY 02800', '0323311091', NULL, NULL, 2),
(886, 'GRAZIANO', 'Mohammed', '78 rue des Epines BLYES 01150', '0431013911', NULL, NULL, 1),
(887, 'MORA', 'sabine', '80 rue de la Tour AX-LES-THERMES 09110', '0516185496', NULL, 'ACUPONCTURE', 9),
(888, 'MOULINAS', 'Adelphe', '43 rue de la pointe AZY-SUR-MARNE 02400', '0325660790', NULL, NULL, 2),
(889, 'PASTORE', 'Annie', '96 rue du général de Gaulle AX-LES-THERMES 09110', '0599243446', NULL, NULL, 9),
(890, 'GUGLIELMI', 'John', '82 rue de la recette AGUILCOURT 02190', '0366228551', NULL, NULL, 2),
(891, 'AMATO', 'Aurélien', '66 rue Louis Aragon BETTANT 01500', '0473878093', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 1),
(892, 'MEYNIER', 'Hypolite', '70 rue des Néfliers CHALLES 01450', '0476171240', NULL, NULL, 1),
(893, 'CORDIER', 'Sophie', '43 rue des Armées BRIANCON 05100', '0415807023', NULL, NULL, 5),
(894, 'BERNE', 'Anselme', '59 rue Petit FRESSANCOURT 02800', '0383782513', NULL, 'GERONTOLOGIE', 2),
(895, 'TIRAN', 'Ines', '43 rue du général de Gaulle AUGIREIN 09800', '0598718886', NULL, NULL, 9),
(896, 'ZIANI', 'Aurélien', '79 rue de la gare BELLEY 01300', '0479776039', NULL, NULL, 1),
(897, 'MOURADIAN', 'Andrew', '18 rue du Mont CHALLES 01450', '0433547437', NULL, NULL, 1),
(898, 'PINELLI', 'Jérome', '89 rue des pyramides MONCEAU-SUR-OISE 02120', '0345551167', NULL, NULL, 2),
(899, 'KLEIN', 'Serge', '97 rue du capitaine Crochet FLOING 08200', '0316196835', NULL, NULL, 8),
(900, 'PHILIBERT', 'Patrice', '25 rue des gatinnes FLEVILLE 08250', '0334902877', NULL, NULL, 8),
(901, 'TRANI', 'Bénédicte', '13 rue Agniel BEZAC 09100', '0566740268', NULL, NULL, 9),
(902, 'ROMANI', 'Jérome', '40 rue des perles blanches SAINT-ANDRE-DE-ROSANS 05150', '0446944245', NULL, NULL, 5),
(903, 'BELAID', 'Jérémie', '78 rue des Epines VAUX-CHAMPAGNE 08130', '0358416091', NULL, NULL, 8),
(904, 'CALABRESE', 'Catherine', '34 rue Malraux MACHAULT 08310', '0384057669', NULL, NULL, 8),
(905, 'BELLONE', 'Prosper', '76 rue des Epines FLOING 08200', '0393379729', NULL, NULL, 8),
(906, 'DEVAUX', 'Patrick', '26 rue Agniel BOURG-EN-BRESSE 01000', '0479180299', NULL, NULL, 1),
(907, 'ARQUIER', 'Julie', '40 rue des Armées AMBRIEF 02200', '0361450183', NULL, NULL, 2),
(908, 'CHIOUSSE', 'Jordan', '27 rue de la rose BANCIGNY 02140', '0352416188', NULL, 'HOMEOPATHIE', 2),
(909, 'MOURIES', 'Julienne', '69 rue des gatinnes AX-LES-THERMES 09110', '0580069967', NULL, NULL, 9),
(910, 'MAYAN', 'Annie', '58 rue du capitaine Fraquasse CHABESTAN 05400', '0467360442', NULL, 'HOMEOPATHIE', 5),
(911, 'BENVENUTI', 'Patrick', '19 rue Pernod SIGOYER 05130', '0457375943', NULL, NULL, 5),
(912, 'MALET', 'Andrew', '83 rue de Paris AMBRIEF 02200', '0395359341', NULL, NULL, 2),
(913, 'LENZI', 'Adelphe', '27 rue Bonaparte CHEZY-SUR-MARNE 02570', '0355084339', NULL, NULL, 2),
(914, 'BIANCIOTTO', 'sabine', '65 rue des Pigeons HERBEUVAL 08370', '0360394232', NULL, NULL, 8),
(915, 'VILLA', 'Irénée', '69 rue de la recette MACHAULT 08310', '0383128193', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 8),
(916, 'SEGOND', 'Martial', '86 rue du général de Gaulle BARZY-SUR-MARNE 02850', '0317141855', NULL, NULL, 2),
(917, 'BOURGEOIS', 'Roby', '9 rue du général de Gaulle SAINT-ANDRE-DE-ROSANS 05150', '0487582509', NULL, NULL, 5),
(918, 'ALEXIS', 'Aurèle', '87 rue des Armées BARZY-SUR-MARNE 02850', '0338003620', NULL, NULL, 2),
(919, 'GHIBAUDO', 'Sophie', '94 rue de Poligny ARROUT 09800', '0557640538', NULL, NULL, 9),
(920, 'HEBRARD', 'Aurèle', '63 rue des Epines ASTON 09310', '0522392505', NULL, NULL, 9),
(921, 'DIJON', 'Bertrand', '46 rue des Néfliers AUBENTON 02500', '0347004937', NULL, NULL, 2),
(922, 'SIMONI', 'Catherine', '75 rue des Pigeons MEZIERES-SUR-OISE 02240', '0361266958', NULL, NULL, 2),
(923, 'BERMOND', 'Anne-Jeanne', '45 rue de la poste MONTCEAUX 01090', '0483591358', NULL, NULL, 1),
(924, 'BAYOL', 'Précilia', '97 rue de Marigny OYONNAX 01100', '0492249302', NULL, NULL, 1),
(925, 'SIMONETTI', 'Julien', '86 rue Pasteur AMBRIEF 02200', '0351207619', NULL, 'ACUPONCTURE', 2),
(926, 'DA SILVA', 'Yoan', '16 rue des Cyprés ROCHEBRUNE 05190', '0447561911', NULL, NULL, 5),
(927, 'RUGGIERO', 'Martin', '12 rue de Marigny SAVOURNON 05700', '0427247399', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 5),
(928, 'BOVERO', 'Alizée', '88 rue Blainville ROCHEBRUNE 05190', '0426259531', NULL, NULL, 5),
(929, 'TREGLIA', 'Anne-Jeanne', '25 rue des Cavaux SAINT-ANDRE-DE-ROSANS 05150', '0453552598', NULL, NULL, 5),
(930, 'ARLAUD', 'Anémone', '52 rue des Argonautes BRIANCON 05100', '0490437250', NULL, NULL, 5),
(931, 'LANTELME', 'Rosalie', '1 rue Albert Camus BOURG-EN-BRESSE 01000', '0436516378', NULL, NULL, 1),
(932, 'MAESTRACCI', 'Julien', '16 rue Mallarmé JUNIVILLE 08310', '0387772024', NULL, NULL, 8),
(933, 'BOURGES', 'Béatrice', '56 rue de du général Scott BLYES 01150', '0497830362', NULL, NULL, 1),
(934, 'VERDIER', 'Irénée', '28 rue Hector Berlioz YONCQ 08210', '0391607943', NULL, NULL, 8),
(935, 'RIBOULET', 'Bernard', '67 rue des Pigeons AZY-SUR-MARNE 02400', '0363260638', NULL, 'ACUPONCTURE', 2),
(936, 'BARTOLINI', 'Nohan', '56 rue de la poste BILLIAT 01200', '0489588610', NULL, NULL, 1),
(937, 'LEMAIRE', 'Hector', '56 rue du Mont AUBENTON 02500', '0317965994', NULL, NULL, 2),
(938, 'LACOMBE', 'Vénus', '42 rue Mallarmé SAINT-FIRMIN 05800', '0496188645', NULL, NULL, 5),
(939, 'KRIKORIAN', 'Ingrid', '69 rue des gatinnes SAINT-LAURENT-SUR-SAONE 01750', '0474955755', NULL, NULL, 1),
(940, 'GIORDANENGO', 'Béatrice', '83 rue Mallarmé LAVAL-MORENCY 08150', '0353669720', NULL, NULL, 8),
(941, 'LAFFONT', 'Aristote', '45 rue des Néfliers ORCIERES 05170', '0410443514', NULL, 'OSTEOPATHIE', 5),
(942, 'GIULIANI', 'Firmin', '86 rue Alphonse Daudet SORBIERS 05150', '0474673714', NULL, NULL, 5),
(943, 'AUTRAN', 'Hypolite', '46 rue Blainville BELLEY 01300', '0432841577', NULL, NULL, 1),
(944, 'NIEL', 'Anne-Laure', '10 rue Debussy BRIANCON 05100', '0488339706', NULL, NULL, 5),
(945, 'MICHAUD', 'Adrien', '16 rue des Lilas CHEZY-SUR-MARNE 02570', '0375598648', NULL, NULL, 2),
(946, 'QUILICI', 'Martial', '48 rue des Cavaux BRIANCON 05100', '0497203279', NULL, NULL, 5),
(947, 'DELESTRADE', 'Adrien', '67 rue Mallarmé NEUVILLE-LES-DAMES 01400', '0483807492', NULL, NULL, 1),
(948, 'BIGGI', 'Andrée', '9 rue Blainville BILLIAT 01200', '0443247634', NULL, NULL, 1),
(949, 'RAPHAEL', 'Austine', '76 rue des Ormes BEDEILLE 09230', '0541576058', NULL, 'GERONTOLOGIE', 9),
(950, 'TAMISIER', 'sabine', '37 rue du stade ARROUT 09800', '0574023557', NULL, NULL, 9),
(951, 'DONNAT', 'Bénédicte', '52 rue Mallarmé SAINT-FIRMIN 05800', '0498785723', NULL, NULL, 5),
(952, 'AMARA', 'Aline', '72 rue des Accacias AX-LES-THERMES 09110', '0548451154', NULL, NULL, 9),
(953, 'ROIG', 'Charles-Edouard', '19 rue des Accacias HOUDILCOURT 08190', '0316020754', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 8),
(954, 'ARNAL', 'Hector', '65 rue des Lilas BEDEILLE 09230', '0574559022', NULL, NULL, 9),
(955, 'SAUZE', 'Anémone', '5 rue du 14 juillet CHEZY-SUR-MARNE 02570', '0337232948', NULL, 'ANGEIOLOGIE', 2),
(956, 'ARTUFEL', 'Ingrid', '92 rue des Epines AX-LES-THERMES 09110', '0561364657', NULL, NULL, 9),
(957, 'SUMIAN', 'Habib', '22 rue de la pointe MESSINCOURT 08110', '0313589708', NULL, NULL, 8),
(958, 'AMADOR', 'Jérémy', '59 rue des perles blanches YONCQ 08210', '0326242380', NULL, 'MEDECINE APPLIQUEE AUX SPORTS', 8),
(959, 'CECCHI', 'Amiel', '96 rue Pasteur ARROUT 09800', '0587698522', NULL, 'ACUPONCTURE', 9),
(960, 'MAGGIO', 'Austine', '65 rue Mallarmé MONTCEAUX 01090', '0470285907', NULL, NULL, 1),
(961, 'BENEDETTO', 'Anne-Jeanne', '32 rue Pernod TRAVECY 02800', '0333270659', NULL, NULL, 2),
(962, 'GRENIER', 'François', '33 rue des Armées JOIGNY-SUR-MEUSE 08700', '0349739798', NULL, NULL, 8),
(963, 'VALENZA', 'Astine', '14 rue de Paris HAUTEVILLE 02120', '0351375540', NULL, NULL, 2),
(964, 'GONDRAN', 'Catherine', '62 rue Petit AUBENTON 02500', '0396351922', NULL, NULL, 2),
(965, 'CAVALLO', 'Dominique', '16 rue Albert Camus MONTCEAUX 01090', '0460614067', NULL, NULL, 1),
(966, 'DEBONO', 'Habib', '43 rue Agniel FEPIN 08170', '0334104949', NULL, 'null', 8),
(967, 'TROUCHE', 'Bertrand', '19 rue des Armées BUZAN 09800', '0568125818', NULL, 'HOMEOPATHIE', 9),
(968, 'MOUSSAOUI', 'Anne-Lucie', '98 rue de la recette CHABESTAN 05400', '0456022326', NULL, NULL, 5),
(969, 'GAZELLE', 'Bernard', '20 rue des Pigeons ARROUT 09800', '0573067550', NULL, NULL, 9),
(970, 'DI DOMENICO', 'Nohan', '43 rue des hirondelles BEDEILLE 09230', '0525181569', NULL, 'URGENTISTE', 9),
(971, 'RODRIGUES', 'Anne-Sophie', '31 rue Blainville BARENTON-SUR-SERRE 02270', '0373526813', NULL, NULL, 2),
(972, 'CASTILLO', 'Alice', '33 rue des Accacias ROCHEBRUNE 05190', '0449350884', NULL, NULL, 5),
(973, 'TAVERNIER', 'Aline', '84 rue du capitaine Crochet MONT-LAURENT 08130', '0325576123', NULL, NULL, 8),
(974, 'RINALDI', 'John', '3 rue de la Tour FRESSANCOURT 02800', '0331446881', NULL, NULL, 2),
(975, 'BALDACCHINO', 'Anne', '96 rue des Anges AUBENTON 02500', '0378136627', NULL, 'GERONTOLOGIE', 2),
(976, 'MEDINA', 'Julienne', '69 rue des Argonautes MONT-LAURENT 08130', '0370869862', NULL, NULL, 8),
(977, 'MORGANTI', 'Amiel', '64 rue Bonaparte PELVOUX 05340', '0488029182', NULL, NULL, 5),
(978, 'FERRAT', 'sabine', '82 rue Petit MONTCEAUX 01090', '0462167372', NULL, NULL, 1),
(979, 'COUSIN', 'Aurélien', '43 rue de la pointe SAINTE-MARIE 05150', '0435284955', NULL, NULL, 5),
(980, 'CAMILLERI', 'François', '82 rue des gatinnes LAVAL-MORENCY 08150', '0342390211', NULL, NULL, 8),
(981, 'ALEXANDRE', 'Anne-Jeanne', '43 rue Hector Berlioz MONTCEAUX 01090', '0423643158', NULL, NULL, 1),
(982, 'SASSO', 'Gilles', '61 rue de la Pergolat FLEVILLE 08250', '0344269218', NULL, NULL, 8),
(983, 'SALLES', 'Anne-Lucie', '10 rue des Armées JUNIVILLE 08310', '0323215933', NULL, 'Pédiatrie', 8),
(984, 'MOSCA', 'Rosalie', '61 rue Lampion MAYOT 02800', '0334037246', NULL, 'ACUPONCTURE', 2),
(985, 'HONORE', 'Marie', '42 rue de la recette MONTCEAUX 01090', '0483490191', NULL, 'ACUPONCTURE', 1),
(986, 'BERENGUIER', 'Alain', '49 rue des Chantereines SAINT-SAUVEUR 05200', '0444873979', NULL, 'ACUPONCTURE', 5),
(987, 'COUTON', 'Yoan', '26 rue Perdue BARENTON-SUR-SERRE 02270', '0383462706', NULL, 'ACUPONCTURE', 2),
(988, 'POURRIERE', 'Anne-Lucie', '30 rue des Néfliers FRESSANCOURT 02800', '0375894393', NULL, NULL, 2),
(989, 'MAGNE', 'Nohan', '35 rue Pernod BELLOC 09600', '0584397641', NULL, 'URGENTISTE', 9),
(990, 'FERRARIS', 'John', '87 rue des Epines JUNIVILLE 08310', '0326912283', NULL, 'ALLERGOLOGIE', 8),
(991, 'ROY', 'Patricia', '11 rue des Armées CAMON 09500', '0564584038', NULL, NULL, 9),
(992, 'MORAND', 'Adelphe', '1 rue des Anges AMBRIEF 02200', '0341912319', NULL, NULL, 2),
(993, 'LEGER', 'Anaelle', '34 rue de la Tour BOURG-EN-BRESSE 01000', '0421198450', NULL, NULL, 1),
(994, 'GENIN', 'Jérome', '1 rue du capitaine Crochet MAYOT 02800', '0322747123', NULL, NULL, 2),
(995, 'BOI', 'Hector', '96 rue des Princes AGUILCOURT 02190', '0344210000', NULL, NULL, 2),
(996, 'CAU', 'Austine', '48 rue Beaudelaire MACHAULT 08310', '0327416806', NULL, NULL, 8),
(997, 'BOMPARD', 'Anne', '37 rue du capitaine Crochet SIGOYER 05130', '0440990856', NULL, NULL, 5),
(998, 'BOURRELY', 'Aude', '87 rue Louis Aragon SAINTE-MARIE 05150', '0458331361', NULL, NULL, 5),
(999, 'GAZEL', 'Aurélien', '83 rue des hirondelles SAINT-LAURENT-SUR-SAONE 01750', '0419114151', NULL, NULL, 1),
(1000, 'VADON', 'Sophie', '83 rue des Chantereines NEUVILLE-LES-DAMES 01400', '0412959203', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `privileges`
--

CREATE TABLE `privileges` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `privileges`
--

INSERT INTO `privileges` (`id`, `type`) VALUES
(1, 'front_access'),
(2, 'back_access'),
(3, 'front_admin'),
(4, 'back_admin');

-- --------------------------------------------------------

--
-- Structure de la table `sectorDistricts`
--

CREATE TABLE `sectorDistricts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sector_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `sectorDistricts`
--

INSERT INTO `sectorDistricts` (`id`, `name`, `sector_id`) VALUES
(1, 'Ile de France', 1),
(2, 'Centre Val de Loire', 1),
(3, 'Bretagne', 2),
(4, 'Pays de la Loire', 2),
(5, 'Normandie', 2),
(6, 'Hauts de France', 3),
(7, 'Grand Est', 3),
(8, 'Bourgogne Franche Comté', 3),
(9, 'Nouvelle Aquitaine', 4),
(10, 'Occitanie', 4),
(11, 'Auvergne Rhone Alpes', 5),
(12, 'Provence Alpes Cote d\'Azur', 5),
(13, 'Corse', 5),
(14, 'Mayotte', 6),
(15, 'La Reunion', 6),
(16, 'Guyane', 7),
(17, 'Guadeloupe', 7),
(18, 'Martinique', 7);

-- --------------------------------------------------------

--
-- Structure de la table `sectors`
--

CREATE TABLE `sectors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `leader_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `sectors`
--

INSERT INTO `sectors` (`id`, `name`, `leader_id`) VALUES
(1, 'Centre', 62),
(2, 'Nord-Ouest', 72),
(3, 'Nord-Est', 76),
(4, 'Sud-Ouest', 56),
(5, 'Sud-Est', 70),
(6, 'DTOM Caraibes-Ameriques', NULL),
(7, 'DTOM Asie-Afrique', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `visitReports`
--

CREATE TABLE `visitReports` (
  `id` int(11) NOT NULL,
  `visits_id` int(11) NOT NULL,
  `creationDate` datetime DEFAULT NULL,
  `comment` varchar(2048) CHARACTER SET utf8 DEFAULT NULL,
  `starScore` int(11) NOT NULL,
  `visitReportStates_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `visitReports`
--

INSERT INTO `visitReports` (`id`, `visits_id`, `creationDate`, `comment`, `starScore`, `visitReportStates_id`) VALUES
(1, 2, '2021-01-02 00:00:00', 'Demande du médecin', 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `visitReportStates`
--

CREATE TABLE `visitReportStates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `visitReportStates`
--

INSERT INTO `visitReportStates` (`id`, `name`) VALUES
(1, 'waiting'),
(2, 'done'),
(3, 'adjusted');

-- --------------------------------------------------------

--
-- Structure de la table `visits`
--

CREATE TABLE `visits` (
  `id` int(11) NOT NULL,
  `practitioners_id` int(11) NOT NULL DEFAULT 0,
  `employees_id` int(11) NOT NULL DEFAULT 0,
  `attendedDate` datetime DEFAULT NULL,
  `visitStates_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `visits`
--

INSERT INTO `visits` (`id`, `practitioners_id`, `employees_id`, `attendedDate`, `visitStates_id`) VALUES
(2, 165, 56, '2020-07-02 19:16:29', 2);

-- --------------------------------------------------------

--
-- Structure de la table `visitStates`
--

CREATE TABLE `visitStates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `visitStates`
--

INSERT INTO `visitStates` (`id`, `name`) VALUES
(1, 'waiting'),
(2, 'done'),
(3, 'postoned'),
(4, 'canceled');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_complementaryActivities_1_idx` (`employee_id`),
  ADD KEY `caState_id` (`activityStates_id`);

--
-- Index pour la table `activities_practitioners`
--
ALTER TABLE `activities_practitioners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ac_num` (`activities_id`),
  ADD KEY `fk_invite_1_idx` (`practitioner_id`);

--
-- Index pour la table `activityStates`
--
ALTER TABLE `activityStates`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `applications_employees_privileges`
--
ALTER TABLE `applications_employees_privileges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `applications_id_2` (`applications_id`,`employees_id`,`privileges_id`),
  ADD KEY `applications_id` (`applications_id`),
  ADD KEY `employees_id` (`employees_id`),
  ADD KEY `privileges_id` (`privileges_id`);

--
-- Index pour la table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departement_id` (`district_id`),
  ADD KEY `leader_id` (`leader_id`);

--
-- Index pour la table `expenseActivityPackages`
--
ALTER TABLE `expenseActivityPackages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `activities_id` (`activities_id`),
  ADD KEY `expenseProofs_id` (`expenseProofs_id`);

--
-- Index pour la table `expenseInPackages`
--
ALTER TABLE `expenseInPackages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_packageCost_packageType1_idx` (`expensePackageType_id`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `expenseOutPackages`
--
ALTER TABLE `expenseOutPackages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_outPackage_justificatory1_idx` (`expenseProofs_id`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `expensePackageTypes`
--
ALTER TABLE `expensePackageTypes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `expenseProofs`
--
ALTER TABLE `expenseProofs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenseProofTypes_id` (`expenseProofTypes_id`);

--
-- Index pour la table `expenseProofTypes`
--
ALTER TABLE `expenseProofTypes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenseSheets_id` (`expenseSheets_id`),
  ADD KEY `expenseStates_id` (`expenseStates_id`);

--
-- Index pour la table `expenseSheets`
--
ALTER TABLE `expenseSheets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_employe_ficheFrais` (`employee_id`),
  ADD KEY `fk_etat_ficheFrais` (`sheetState_id`);

--
-- Index pour la table `expenseSheetStates`
--
ALTER TABLE `expenseSheetStates`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `expenseStates`
--
ALTER TABLE `expenseStates`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `medecineFamilies`
--
ALTER TABLE `medecineFamilies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `medecines_visitReports`
--
ALTER TABLE `medecines_visitReports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mm` (`medicines_id`),
  ADD KEY `index3` (`visitReports_id`);

--
-- Index pour la table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indexFamily` (`family_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `practitioners`
--
ALTER TABLE `practitioners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_practitioner_department1_idx` (`district_id`);

--
-- Index pour la table `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sectorDistricts`
--
ALTER TABLE `sectorDistricts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_district_sector1_idx` (`sector_id`);

--
-- Index pour la table `sectors`
--
ALTER TABLE `sectors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leader_id` (`leader_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Index pour la table `visitReports`
--
ALTER TABLE `visitReports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reportState_id` (`visitReportStates_id`),
  ADD KEY `visits_id` (`visits_id`);

--
-- Index pour la table `visitReportStates`
--
ALTER TABLE `visitReportStates`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `practitioner_id` (`practitioners_id`),
  ADD KEY `employee_id` (`employees_id`),
  ADD KEY `visitState_id` (`visitStates_id`);

--
-- Index pour la table `visitStates`
--
ALTER TABLE `visitStates`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `activities_practitioners`
--
ALTER TABLE `activities_practitioners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `activityStates`
--
ALTER TABLE `activityStates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `applications_employees_privileges`
--
ALTER TABLE `applications_employees_privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT pour la table `expenseInPackages`
--
ALTER TABLE `expenseInPackages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `expenseOutPackages`
--
ALTER TABLE `expenseOutPackages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `expensePackageTypes`
--
ALTER TABLE `expensePackageTypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `expenseProofs`
--
ALTER TABLE `expenseProofs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `expenseProofTypes`
--
ALTER TABLE `expenseProofTypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `expenseSheets`
--
ALTER TABLE `expenseSheets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `expenseSheetStates`
--
ALTER TABLE `expenseSheetStates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `expenseStates`
--
ALTER TABLE `expenseStates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `medecineFamilies`
--
ALTER TABLE `medecineFamilies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `medecines_visitReports`
--
ALTER TABLE `medecines_visitReports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `practitioners`
--
ALTER TABLE `practitioners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT pour la table `privileges`
--
ALTER TABLE `privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `sectorDistricts`
--
ALTER TABLE `sectorDistricts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `sectors`
--
ALTER TABLE `sectors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `visitReports`
--
ALTER TABLE `visitReports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `visitReportStates`
--
ALTER TABLE `visitReportStates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `visitStates`
--
ALTER TABLE `visitStates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `fk_caState_id` FOREIGN KEY (`activityStates_id`) REFERENCES `activityStates` (`id`),
  ADD CONSTRAINT `fk_complementaryActivities_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `activities_practitioners`
--
ALTER TABLE `activities_practitioners`
  ADD CONSTRAINT `fk_ca_id` FOREIGN KEY (`activities_id`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `fk_invite_1` FOREIGN KEY (`practitioner_id`) REFERENCES `practitioners` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `applications_employees_privileges`
--
ALTER TABLE `applications_employees_privileges`
  ADD CONSTRAINT `applications_employees_privileges_ibfk_1` FOREIGN KEY (`applications_id`) REFERENCES `applications` (`id`),
  ADD CONSTRAINT `applications_employees_privileges_ibfk_2` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `applications_employees_privileges_ibfk_3` FOREIGN KEY (`privileges_id`) REFERENCES `privileges` (`id`);

--
-- Contraintes pour la table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_departement` FOREIGN KEY (`district_id`) REFERENCES `sectorDistricts` (`id`),
  ADD CONSTRAINT `fk_leader_id` FOREIGN KEY (`leader_id`) REFERENCES `employees` (`id`);

--
-- Contraintes pour la table `expenseActivityPackages`
--
ALTER TABLE `expenseActivityPackages`
  ADD CONSTRAINT `expenseActivityPackages_ibfk_1` FOREIGN KEY (`id`) REFERENCES `expenses` (`id`),
  ADD CONSTRAINT `expenseActivityPackages_ibfk_2` FOREIGN KEY (`activities_id`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `expenseActivityPackages_ibfk_3` FOREIGN KEY (`expenseProofs_id`) REFERENCES `expenseProofs` (`id`);

--
-- Contraintes pour la table `expenseInPackages`
--
ALTER TABLE `expenseInPackages`
  ADD CONSTRAINT `expenseInPackages_ibfk_1` FOREIGN KEY (`id`) REFERENCES `expenses` (`id`),
  ADD CONSTRAINT `fk_packageCost_packageType1` FOREIGN KEY (`expensePackageType_id`) REFERENCES `expensePackageTypes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `expenseOutPackages`
--
ALTER TABLE `expenseOutPackages`
  ADD CONSTRAINT `expenseOutPackages_ibfk_1` FOREIGN KEY (`expenseProofs_id`) REFERENCES `expenseProofs` (`id`),
  ADD CONSTRAINT `expenseOutPackages_ibfk_2` FOREIGN KEY (`id`) REFERENCES `expenses` (`id`);

--
-- Contraintes pour la table `expenseProofs`
--
ALTER TABLE `expenseProofs`
  ADD CONSTRAINT `expenseProofs_ibfk_1` FOREIGN KEY (`expenseProofTypes_id`) REFERENCES `expenseProofTypes` (`id`);

--
-- Contraintes pour la table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`expenseSheets_id`) REFERENCES `expenseSheets` (`id`),
  ADD CONSTRAINT `expenses_ibfk_2` FOREIGN KEY (`expenseStates_id`) REFERENCES `expenseStates` (`id`);

--
-- Contraintes pour la table `expenseSheets`
--
ALTER TABLE `expenseSheets`
  ADD CONSTRAINT `fk_employe_ficheFrais` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `fk_etat_ficheFrais` FOREIGN KEY (`sheetState_id`) REFERENCES `expenseSheetStates` (`id`);

--
-- Contraintes pour la table `medecines_visitReports`
--
ALTER TABLE `medecines_visitReports`
  ADD CONSTRAINT `fk_offer_1` FOREIGN KEY (`visitReports_id`) REFERENCES `visitReports` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_offer_2` FOREIGN KEY (`medicines_id`) REFERENCES `medicines` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `medicines`
--
ALTER TABLE `medicines`
  ADD CONSTRAINT `fk_medicine_1` FOREIGN KEY (`family_id`) REFERENCES `medecineFamilies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `practitioners`
--
ALTER TABLE `practitioners`
  ADD CONSTRAINT `fk_practitioner_department1` FOREIGN KEY (`district_id`) REFERENCES `sectorDistricts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `sectorDistricts`
--
ALTER TABLE `sectorDistricts`
  ADD CONSTRAINT `fk_district_sector1` FOREIGN KEY (`sector_id`) REFERENCES `sectors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `sectors`
--
ALTER TABLE `sectors`
  ADD CONSTRAINT `sectors_ibfk_1` FOREIGN KEY (`leader_id`) REFERENCES `employees` (`id`);

--
-- Contraintes pour la table `visitReports`
--
ALTER TABLE `visitReports`
  ADD CONSTRAINT `visitReports_ibfk_1` FOREIGN KEY (`visits_id`) REFERENCES `visits` (`id`),
  ADD CONSTRAINT `visitReports_ibfk_2` FOREIGN KEY (`visitReportStates_id`) REFERENCES `visitReportStates` (`id`);

--
-- Contraintes pour la table `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `visits_ibfk_1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `visits_ibfk_3` FOREIGN KEY (`visitStates_id`) REFERENCES `visitStates` (`id`),
  ADD CONSTRAINT `visits_ibfk_4` FOREIGN KEY (`practitioners_id`) REFERENCES `practitioners` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
