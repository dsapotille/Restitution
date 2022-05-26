-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 26 mai 2022 à 18:44
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bd_osdem_stage(1)`
--

-- --------------------------------------------------------

--
-- Structure de la table `affectation`
--

DROP TABLE IF EXISTS `affectation`;
CREATE TABLE IF NOT EXISTS `affectation` (
  `NumAffectation` bigint(20) NOT NULL AUTO_INCREMENT,
  `DateAffectation` date DEFAULT NULL,
  `DateReception` date DEFAULT NULL,
  `EtatAffectation` tinyint(4) NOT NULL DEFAULT '1',
  `NumAgentAffectation` smallint(6) UNSIGNED NOT NULL,
  PRIMARY KEY (`NumAffectation`),
  KEY `NumAgentAffectation_R` (`NumAgentAffectation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `agent`
--

DROP TABLE IF EXISTS `agent`;
CREATE TABLE IF NOT EXISTS `agent` (
  `NumAgent` smallint(11) NOT NULL,
  `CiviliteAgent` varchar(20) NOT NULL,
  `NomAgent` varchar(100) NOT NULL,
  `PrenomAgent` varchar(100) NOT NULL,
  `PwdAgent` varchar(20) DEFAULT NULL,
  `EmailAgent` varchar(100) DEFAULT NULL,
  `TelAgent` int(20) UNSIGNED DEFAULT NULL,
  `GSMAgent` int(20) UNSIGNED DEFAULT NULL,
  `NumFonctionAgent` bigint(15) UNSIGNED NOT NULL,
  `NumServiceAgent` varchar(10) NOT NULL,
  PRIMARY KEY (`NumAgent`),
  KEY `NumFonctionAgent` (`NumFonctionAgent`,`NumServiceAgent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `agent`
--

INSERT INTO `agent` (`NumAgent`, `CiviliteAgent`, `NomAgent`, `PrenomAgent`, `PwdAgent`, `EmailAgent`, `TelAgent`, `GSMAgent`, `NumFonctionAgent`, `NumServiceAgent`) VALUES
(1000, 'M', 'NORTIA', 'SERVAIS', NULL, NULL, NULL, NULL, 4030100, '4313'),
(1001, 'MME', 'TROUDART', 'MADDLY', NULL, NULL, NULL, NULL, 1110900, '9149'),
(1002, 'M', 'THOMAR', 'PIERRE', NULL, NULL, NULL, NULL, 10010100, '9360'),
(1003, 'M', 'SILVESTRE', 'JOSE', NULL, NULL, NULL, NULL, 8020401, '9422'),
(1004, 'MME', 'LEFFET', 'ROSANNE LOUISE', NULL, NULL, NULL, NULL, 1130107, '5182A');

-- --------------------------------------------------------

--
-- Structure de la table `concerner`
--

DROP TABLE IF EXISTS `concerner`;
CREATE TABLE IF NOT EXISTS `concerner` (
  `NumMaterielConcerner` smallint(6) NOT NULL,
  `NumConstructeur` smallint(6) NOT NULL,
  PRIMARY KEY (`NumMaterielConcerner`,`NumConstructeur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `concerner`
--

INSERT INTO `concerner` (`NumMaterielConcerner`, `NumConstructeur`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `constructeur`
--

DROP TABLE IF EXISTS `constructeur`;
CREATE TABLE IF NOT EXISTS `constructeur` (
  `NumConstructeur` smallint(6) NOT NULL AUTO_INCREMENT,
  `LibelleConstructeur` varchar(100) NOT NULL,
  `ConstructeurActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`NumConstructeur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `constructeur`
--

INSERT INTO `constructeur` (`NumConstructeur`, `LibelleConstructeur`, `ConstructeurActive`) VALUES
(1, 'HP', 1),
(2, 'DELL', 1),
(3, 'IBM', 1);

-- --------------------------------------------------------

--
-- Structure de la table `direction`
--

DROP TABLE IF EXISTS `direction`;
CREATE TABLE IF NOT EXISTS `direction` (
  `NumDirection` smallint(10) UNSIGNED NOT NULL,
  `LibelleDirection` varchar(100) NOT NULL,
  PRIMARY KEY (`NumDirection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `direction`
--

INSERT INTO `direction` (`NumDirection`, `LibelleDirection`) VALUES
(0, 'Libelle Direction'),
(1000, 'DIRECTION GENERALE'),
(1700, 'DIRECTION ADJOINTE OPTIMISATION ET PERFORMANCE'),
(2000, 'DIRECTION GENERALE ADJOINTE'),
(3000, 'DIRECTION ADMINISTRATION GENERALE DES RH'),
(3601, 'DIRECTION PATRIMOINE ET PROGRAMME RELOGEMENT'),
(4000, 'DIRECTION RETRAITE ET DONNES SOCIALES'),
(5000, 'DIRECTION BRANCHE ASSURANCE MALADIE'),
(5197, 'DIRECTION DES ACCUEILS ET RELATION AVEC USAGERS'),
(6000, 'DIRECTION DU RECOUVREMENT'),
(8000, 'DIRECTION  MUTUALITE SOCIALE AGRICOLE'),
(9000, 'DIRECTION COMPTABLE ET FINANCI?RE'),
(9600, 'DIRECTION RISQ PROF  PREV SANTE SOCIALE');

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

DROP TABLE IF EXISTS `fonction`;
CREATE TABLE IF NOT EXISTS `fonction` (
  `NumFonction` bigint(15) UNSIGNED NOT NULL,
  `LibelleFonction` varchar(100) NOT NULL,
  PRIMARY KEY (`NumFonction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fonction`
--

INSERT INTO `fonction` (`NumFonction`, `LibelleFonction`) VALUES
(1010100, 'TECHNICIEN EXPERT'),
(1100100, 'ASSISTANTE CONCILIATEUR'),
(1100102, 'Conciliateur(trice)'),
(1110302, 'TECHN.CONSEIL AM SPEC.'),
(1110303, 'Technicien(ne) de prestations'),
(1110312, 'TECHN.RELATIONS PROF.SANT'),
(1110316, 'CONSEILLER OFFRE DE SERVICE'),
(1110503, 'Conseiller(e) retraite accueil'),
(1110508, 'Expert Conseil Assurance Retraite'),
(1110601, 'TECHNICIEN CONSEIL RETRAITE'),
(1110700, 'ASSISTANT FONCTIONNEL'),
(1110701, 'Technicien(ne) Information et Conseil'),
(1110900, 'TECH.COMPTE PRESTATAIRE'),
(1111300, 'Technicien(ne) action sociale'),
(1111301, 'GESTIONNAIRE CONT'),
(1111303, 'CONSEILLER COTISANT'),
(1111304, 'TECHN. CONSEIL ACTION SOCIALE'),
(1111400, 'GESTIONNAIRE CONS TARIF DES AT/ MP'),
(1111500, 'Gestionnaire du recouvrement'),
(1111602, 'TECHNICIEN RPS'),
(1120301, 'Technicien(ne) d\'accueil'),
(1120302, 'TECHN.D\'ACCUEIL ITINERANT'),
(1120303, 'TELECONSEILLER'),
(1120600, 'Technicien(ne) information et orientation'),
(1120601, 'TECHN TRAITEMENT DE L\'INFO'),
(1130100, 'REFERENT TECH.PRESTATIONS'),
(1130101, 'REF.TECH.PREST.SPECIALISE'),
(1130106, 'REF.TECH.ACT.SANIT.SOCIAL'),
(1130107, 'REFERENT TECHNIQUE'),
(1130700, 'R?f?rent(e) technique retraite'),
(1130800, 'Conseiller(e) technique retraite'),
(1130802, 'CONSEILLER RETRAITE ACCUEIL'),
(1130901, 'REF.TECH.CARRIERE ET DECLARATIONS'),
(1130905, 'Superviseur Technique Carri?re'),
(1131100, 'Conseiller(e) technique compte prestataire'),
(1131200, 'REF.TECH.ACTION SOCIALE'),
(1131300, 'R?f?rent(e) technique recouvrement'),
(1131302, 'Conseiller Technique Recouvrement'),
(1131309, 'Charg? de relations avec les entreprises'),
(1131500, 'Superviseur technique'),
(1140300, 'TECHN. DONNEES SOCIALES'),
(2010100, 'El?ve Contr?leur des Situat. Individuelles'),
(2010102, 'EXPERT'),
(2020100, 'Contr?leur(se) des situations individuelles'),
(2020200, 'Charg?(e) de la lutte contre la fraude'),
(2030100, 'ENQUETEUR RISQUE MALADIE'),
(2030200, 'ENQUETEUR AT/MP'),
(2030300, 'INSPECTEUR TARIF.AT/MP'),
(2030400, 'Investigateur(trice) administratif'),
(2040100, 'Inspecteur(trice) du recouvrement'),
(2040105, 'El?ve inspecteur(trice) du recouvrement'),
(2060100, 'CONTROLEUR DE SITUATIONS INDIVIDUELLES'),
(3010100, 'CONTROLEUR RECOUV'),
(3010101, 'ENQUETEUR RELAT EXTERNE'),
(3010300, 'CONS.INFORMATIQUE SERV.'),
(3020100, 'Conseiller Utilisateur des Offres de Service'),
(3020200, 'CHARGE RELATIONS CLIENTS'),
(4020200, 'ASSISTANT DE SCE SOCIAL'),
(4030100, 'CONS.TECH. ACTION SOCIALE'),
(5010100, 'ASSISTANT EN PREVENTION DES RISQUES PROFS'),
(5010101, 'Charg?(e) d\'Etu. Pr?v. Sant? et Ris. Profes.'),
(5020200, 'ANIMATEUR EDUCATION SANTE'),
(5020400, 'PREVENTEUR'),
(5030101, 'Ing?nieur Conseil (stagiaire)'),
(5050100, 'Contr?leur(se) de s?curit'),
(5050101, 'CONTROLEUR SECURITE REF.'),
(5060300, 'Conseill?re du Travail'),
(6030200, 'Infirmier(e) du travail'),
(7030100, 'DELEGUE ASSURANCE MALADIE'),
(7070100, 'GEST.DU RISQ.ASS.MALADIE'),
(7070300, 'CHARGE MISS.GEST.DU RISQ.'),
(7080100, 'CH.ETUD/QUEST.HOSP.MED-SO'),
(7080201, 'TECHN.HOSPIT/MEDICO SOC.'),
(7100200, 'Conseiller(e) assurance maladie'),
(8010100, 'Conseiller(e) juridique'),
(8010101, 'CONSEIL.JURIDIQUE SPEC.'),
(8010103, 'Assistant(e) juridique'),
(8010200, 'CHARGE ETUD.JURIDIQUE'),
(8010300, 'R?dacteur(trice) juridique'),
(8010400, 'Audiencier(e)'),
(8020100, 'GEST.LITIGES ET CREANCES'),
(8020300, 'Technicien(ne) contentieux'),
(8020401, 'REF.TECH.RECOUV.AMIABLE'),
(8020402, 'REF.TECH.CONTENTIEUX'),
(9010100, 'Auditeur(trice)'),
(9020100, 'Organisateur(trice)'),
(9020102, 'Correspondant Fonctionnel'),
(9030202, 'CONSEILLER(E) PROCESSUS QUALITE'),
(9040101, 'ASSIST.MAITRISE RISQUES'),
(9040200, 'GEST.MAITRISE DES RISQUES'),
(9040300, 'VERIFICATEUR LEGISLATION'),
(9040500, 'REF.TECH.CONTROLE PRESTA.'),
(9040503, 'R?f?rent contr?le interne et lutte contre la fraude'),
(9040505, 'R?f?rent(e) technique v?rification'),
(9040511, 'Expert contr?le des prestations'),
(10010100, 'Comptable'),
(10010200, 'DELEGUE INFORMATIQUE A C'),
(10010400, 'REF.TECH. EN COMPTABILITE'),
(10010600, 'CONS.TECH.COMPTABILITE'),
(10020100, 'Contr?leur(se) de gestion'),
(10020104, 'TECHNICIEN GED'),
(10020300, 'Analyste budg?taire'),
(10020400, 'Superviseur Budg?taire'),
(10020401, 'ASSIST.ANAL.BUDGETAIRE'),
(10030101, 'EXPERT GESTION DE TRESORERIE'),
(11010100, 'CHARGE D\'ETUDES SOCIO.ECO'),
(11010200, 'Statisticien(ne)'),
(11010201, 'Assistant(e) statistiques'),
(12010101, 'Assistant(e) RH'),
(12010200, 'GEST.RESSOURCES HUM.SPEC.'),
(12010203, 'Charg? de formation'),
(12010204, 'CHARGE ETUDES RH'),
(12010303, 'PSYCHOLOGUE'),
(12010401, 'REFERENT TECHNIQUE DE PAIE'),
(12010402, 'Assistant RH-Formation Professionnelle'),
(12020100, 'GEST.ADMINIST.DES RH'),
(12020101, 'ASSIST.GESTION ADM.RH'),
(12020102, 'TECHN.GESTION PERSONNEL'),
(12020103, 'TECHN.GESTION PERSO.SPEC.'),
(12020200, 'ASSIST EN GEST?ADM SANTE AU TRAVAIL'),
(12020201, 'REF.TECH.GEST.PERSO.'),
(13050101, 'Concepteur(trice) d?veloppeur'),
(13050102, 'ASSISTANT DE DEVELOPPEMENT'),
(13060100, 'GESTIONNAIRE INFRASTRUCTURES MATERIEL LOGICIEL'),
(13060121, 'GESTIONNAIRE RESEAUX ET TELECOM'),
(13060122, 'Technicien(ne) r?seaux et t?l?com'),
(13060400, 'EXPERT INFRASTRUCTURES MATERIEL LOGICIEL'),
(13070111, 'Correspondant(e) fonctionnel d\'applications'),
(13070121, 'Conseiller(e) du syst?me d\'information'),
(13070122, 'CONSEILLER  SUPPORTS UTILISATEURS'),
(13070200, 'Technicien(ne) support utilisateurs'),
(13070300, 'CHARGE DAFFAIRES'),
(14020100, 'Charg?(e) de communication'),
(14020104, 'Assistant(e) communication'),
(14030100, 'Documentaliste'),
(14030102, 'Assistant documentaliste'),
(14040100, 'ASSISTANT(E) DE DIRECTION'),
(14040101, 'Secr?taire de direction'),
(14040200, 'Secr?taire'),
(14040201, 'SECRETAIRE SPECIALISE(E)'),
(14040203, 'SECRETAIRE MEDICO-SOCIALE'),
(14040205, 'Assistant(e) contr'),
(14050100, 'TECH.REAL.SUPPORTS DE COM'),
(14050400, 'Webmestre'),
(14060102, 'Technicien(ne) courrier'),
(14060104, 'Agent administratif'),
(14060200, 'R?f?rent(e) Fend'),
(14060300, 'Technicien(ne) d\'archivage'),
(15010100, 'Agent de s?curit'),
(15010103, 'GEST REPARATION PARC AUTOMOBILE'),
(15010200, 'Gestionnaire s?curit'),
(15020103, 'Technicien de surface'),
(15040100, 'Technicien(e) ?ditique'),
(15040200, 'REFERENT TECH.EDITIQUE'),
(15050200, 'CHAUFFEUR'),
(16010200, 'GESTIONNAIRE BIENS/SERV.'),
(16010202, 'GESTION.CONTRATS/MARCHES'),
(16010203, 'ASSIST.CONTRATS/MARCHES'),
(16010205, 'Gestionnaire des budgets'),
(16010206, 'GEST.BUDGETS ACTION SOC.'),
(16010207, 'TECHN.ORDONNANCEMENT'),
(16010208, 'Technicien Approvisionnement'),
(16010209, 'TECHN.GESTION DES STOCKS'),
(16010210, 'TECHN. GEST.PARC INFORM.'),
(16010300, 'GEST.PARC.INFORM.'),
(16010400, 'Superviseur Technique Approvisionnement'),
(16020100, 'GEST ADM ET JUR DU PATRIMOINE IMMO'),
(16020200, 'Dessinateur DAO'),
(16020300, 'Adjoint Technique du Batiment'),
(16020401, 'ASSIST.GEST.PATRIM.IMMOB.'),
(16020502, 'RESP D\'EXPLOITATION ELECTRIQUE CFO/CFA'),
(16030100, 'TECHN.TOUS CORPS D\'ETAT'),
(16030400, 'ASSISTANT(E) LOGISTIQUE'),
(17010100, 'Animateur(trice) d\'?quipe'),
(17010200, 'RESPONSABLE D\'UNITE(S)'),
(17010221, 'Manager DAM'),
(17010223, 'RESP SECURITE DU SYST D\'INFO'),
(17010300, 'RESPONSABLE ADJOINT'),
(17010311, 'RESP.ADJ.MEDICO SOCIAL'),
(17010312, 'RESP.ADJ.SERVICE SOCIAL'),
(17010400, 'RESPONSABLE DE SERVICE'),
(17010501, 'RESPONSABLE D\'AGENCE'),
(17020100, 'RESPONSABLE ADMINISTRATIF ET COMPTABLE'),
(17020500, 'CHEF DE PROJETS'),
(17020511, 'GEST. PROJETS'),
(17020516, 'Chef de projet DD / RSO'),
(17020800, 'Attach?(e) de direction'),
(17020802, 'CHARGE DE MISSION'),
(17030100, 'MANAGER DE SECTEUR'),
(17030101, 'Manager Stat?gique'),
(17030200, 'MANAGER DE BRANCHE'),
(17030501, 'Fond?(e) de pouvoir'),
(17030600, 'DIRECTEUR'),
(17030602, 'Directeur(trice) adjoint'),
(17030700, 'SOUS DIRECTEUR'),
(17030701, 'DCF PAR INTERIM'),
(17030703, 'ADJOINT DU SOUS DIRECTEUR'),
(17030720, 'Directrice de Cabinet'),
(17030800, 'Ing?nieur(e) conseil r?gional');

-- --------------------------------------------------------

--
-- Structure de la table `lignematerielaffecte`
--

DROP TABLE IF EXISTS `lignematerielaffecte`;
CREATE TABLE IF NOT EXISTS `lignematerielaffecte` (
  `NumMaterielLigne` smallint(6) NOT NULL,
  `NumModeleLigne` smallint(6) UNSIGNED DEFAULT NULL,
  `NumAffectationLigne` bigint(20) NOT NULL,
  `AutreMateriel` varchar(100) DEFAULT NULL,
  `NumConstructeurLigne` smallint(6) DEFAULT NULL,
  `NumSerie` varchar(100) DEFAULT NULL,
  `Observation` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`NumMaterielLigne`,`NumAffectationLigne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `lignematerielrestitution`
--

DROP TABLE IF EXISTS `lignematerielrestitution`;
CREATE TABLE IF NOT EXISTS `lignematerielrestitution` (
  `NumMaterielLigne` smallint(6) NOT NULL,
  `NumModeleLigne` smallint(6) NOT NULL,
  `NumRestitutionLigne` bigint(20) NOT NULL,
  `AutreMateriel` varchar(100) DEFAULT NULL,
  `NumConstructeurLigne` smallint(6) NOT NULL,
  `NumSerie` varchar(100) DEFAULT NULL,
  `Observation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`NumMaterielLigne`,`NumRestitutionLigne`),
  KEY `NumModeleLigne` (`NumModeleLigne`),
  KEY `NumConstructeurLigne` (`NumConstructeurLigne`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lignematerielrestitution`
--

INSERT INTO `lignematerielrestitution` (`NumMaterielLigne`, `NumModeleLigne`, `NumRestitutionLigne`, `AutreMateriel`, `NumConstructeurLigne`, `NumSerie`, `Observation`) VALUES
(4, 1, 32, NULL, 2, NULL, NULL),
(3, 1, 31, NULL, 3, '567', NULL),
(6, 1, 30, NULL, 2, '123', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

DROP TABLE IF EXISTS `materiel`;
CREATE TABLE IF NOT EXISTS `materiel` (
  `NumMateriel` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `LibelleMateriel` varchar(100) NOT NULL,
  `MaterielActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`NumMateriel`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `materiel`
--

INSERT INTO `materiel` (`NumMateriel`, `LibelleMateriel`, `MaterielActive`) VALUES
(1, 'PC portable', 1),
(2, 'Imprimante', 1),
(3, 'Tablette tactile', 1),
(4, 'Telephone portable', 0),
(5, 'Disque dur externe', 1),
(6, 'Cle USB', 1),
(7, 'Cle 4G', 1),
(8, 'Cle 5G', 1),
(9, 'Batterie', 1),
(10, 'Housse/sac', 1),
(11, 'Socle', 1),
(12, 'Cable alimentation', 1),
(13, 'Autre', 1);

-- --------------------------------------------------------

--
-- Structure de la table `modele`
--

DROP TABLE IF EXISTS `modele`;
CREATE TABLE IF NOT EXISTS `modele` (
  `NumModele` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `LibelleModele` varchar(100) NOT NULL,
  `ModeleActive` tinyint(1) NOT NULL DEFAULT '1',
  `NumConstructeurModele` smallint(6) NOT NULL,
  PRIMARY KEY (`NumModele`),
  KEY `NumConstructeurModele` (`NumConstructeurModele`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `modele`
--

INSERT INTO `modele` (`NumModele`, `LibelleModele`, `ModeleActive`, `NumConstructeurModele`) VALUES
(1, 'EliteBook 830 G6', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

DROP TABLE IF EXISTS `profil`;
CREATE TABLE IF NOT EXISTS `profil` (
  `NumProfil` tinyint(4) NOT NULL AUTO_INCREMENT,
  `LibelleProfil` varchar(50) NOT NULL,
  PRIMARY KEY (`NumProfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `restitution`
--

DROP TABLE IF EXISTS `restitution`;
CREATE TABLE IF NOT EXISTS `restitution` (
  `NumRestitution` bigint(20) NOT NULL AUTO_INCREMENT,
  `DateRestitution` date DEFAULT NULL,
  `DateReception` date DEFAULT NULL,
  `EtatRestitution` tinyint(4) NOT NULL DEFAULT '1',
  `NumAgentRestitution` smallint(6) NOT NULL,
  PRIMARY KEY (`NumRestitution`),
  KEY `NumAgentRestitution` (`NumAgentRestitution`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `restitution`
--

INSERT INTO `restitution` (`NumRestitution`, `DateRestitution`, `DateReception`, `EtatRestitution`, `NumAgentRestitution`) VALUES
(32, '2022-05-12', '2022-05-12', 1, 1000),
(31, '2022-05-05', '2022-05-13', 1, 1000),
(30, '2022-04-17', '2022-04-14', 1, 1003);

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `NumService` varchar(10) NOT NULL,
  `LibelleService` varchar(100) NOT NULL,
  `NumDirectionService` smallint(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`NumService`),
  KEY `NumDirectionService` (`NumDirectionService`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`NumService`, `LibelleService`, `NumDirectionService`) VALUES
('1000', 'DIRECTION GENERALE', 1000),
('1005', 'COORD GESTION DU RISQUE', 1000),
('1100', 'SECRETARIAT DIR GEN ET CA', 1000),
('1101A', 'CABINET DU DIRECTEUR', 1000),
('1102', 'COMMUNICATION MARKETING', 1000),
('1510', 'SECRETARIAT DECQ', 1000),
('1515', 'MISSION QUAL ACCOMP MANAGERIAL', 1700),
('1521', 'BEO', 1700),
('1601', 'SECRETARIAT  DMG', 3000),
('1610', 'DEPART GESTION BUDGETAIRE', 3000),
('1611', 'BUDGETS', 3000),
('1620', 'CONTROLE DE GESTION', 1700),
('1700', 'DIRECTION ADJOINTE OPTIMISATION ET PERFORMANCE', 1700),
('1701', 'SECRETARIAT DAOP', 1700),
('1901', 'SECRETARIAT DMRC', 1700),
('1902', 'MAITRISE DES RISQUES', 1700),
('1904', 'AUDIT GEN ET FINANC', 1700),
('1905', 'LUTTE CONTRE FRAUDE', 1700),
('1906', 'CONTENTIEUX GENERAL', 1700),
('1907', 'TASS', 1700),
('2000', 'DIRECTION GENERALE ADJOINTE', 2000),
('2105', 'SECRETARIAT GENERAL DGA', 2000),
('3000', 'DIRECTION ADMINISTRATION GENERALE DES RH', 3000),
('3001', 'OBSERVATOIRE ECO ET SOCIAL CGSS', 3000),
('3002', 'ASSISTANCE SOCIALE D\'ENTREPRISE', 3000),
('3010', 'SECRETARIAT  DAGRH', 3000),
('3102', 'DEPART RESSOURCES HUMAINES', 3000),
('3103', 'SECRETARIAT DRH', 3000),
('3105', 'PROSPECTIVE RH', 3000),
('3110', 'FORMATION PROFESSIONNELLE', 3000),
('3201', 'GESTION DES CARRIERES', 3000),
('3300', 'GAP', 3000),
('3400', 'DEPART SANTE QUAL VIE AU TRAVAIL', 3000),
('3410', 'QUALITE DE VIE AU TRAVAIL', 3000),
('3420', 'SANTE AU TRAVAIL', 3000),
('3430', 'RELATIONS SOCIALES', 3000),
('3601', 'DIRECTION PATRIMOINE ET PROGRAMME RELOGEMENT', 3601),
('3605', 'COORDINATION DE LA DPPR', 3601),
('3617', 'ETUD IMMOB DEV DURABLE HYGIENE', 3601),
('3618', 'ETUD IMMOB MAINT LOGIST', 3601),
('3619B', 'SECURITE', 3601),
('3619C', 'SECURITE', 3601),
('3619D', 'SECURITE', 3000),
('3620', 'SERVICE DES ACHATS ET LOGISTIQUE MOB', 3601),
('3621', 'CONTRATS  MARCHES PUBLICS', 3601),
('3622', 'GESTION ADM DES BIENS', 3601),
('3623', 'GEST FINANC DES ACHATS', 3000),
('3624', 'ACHATS ET LOGISTIQUE', 3601),
('3625', 'ECONOMAT', 3601),
('3626', 'TRANSPORT', 3000),
('3627', 'ARCHIVES', 3601),
('4000', 'DIRECTION RETRAITE ET DONNES SOCIALES', 4000),
('4100', 'SECRETARIAT DRDS', 4000),
('4100B', 'SECRETARIAT DRDS', 4000),
('4100D', 'SECRETARIAT DRDS', 4000),
('4110', 'GROUPE EXPERTS', 4000),
('4200', 'CONTROLE ENQUETES', 4000),
('4210', 'CONTX REGLT VIEILLESSE', 4000),
('4220', 'AGENCES  RETRAITE', 4000),
('4221', 'AGCE NORD GRANDE TERRE', 4000),
('4223', 'AGENCE DU CENTRE', 4000),
('4223F', 'AGENCE DU CENTRE', 4000),
('4224', 'SECTEUR CENTRALISE', 4000),
('4230', 'AGENCE RETRAITE BT', 4000),
('4260', 'CARR DECLT?IDENTIF', 4000),
('4261', 'CARRIERES ET DECLARATIONS', 4000),
('4310', 'ACT?SOC.VIEILLESSE', 2000),
('4311', 'CELL ACC TELE GEST COURR', 2000),
('4312', 'CELL MAINT DOM SUIV BUD', 2000),
('4313', 'CELL PREV ACC PRJT REL PART', 2000),
('4314A', 'OFFRE DE SERVICES', 4000),
('5000', 'DIRECTION BRANCHE ASSURANCE MALADIE', 5000),
('5002', 'SECRETARIAT DBAM', 5000),
('5003', 'SECTEUR SUPPORT DBAM', 5000),
('5004', 'PROSPECTIVES', 5000),
('5006', 'STATISTIQUES', 5000),
('5007', 'LOGISTIQUE', 5000),
('5008', 'COURRIER', 5000),
('5009', 'CELLULE DIADEME', 5000),
('5050', 'DEPART ASSURES', 5000),
('5051', 'IJ AS/ KDC', 5000),
('5051A', 'IJ AS/KDC', 5000),
('5052', 'RECONNAISSANCE AT/MP', 5000),
('5054', 'INVALIDITE / CURES', 5000),
('5061', 'RELATION EMPLOYEURS', 5000),
('5100', 'POLE GBEN', 5000),
('5101', 'UNITE GESTION DES DROITS DE BASE', 5000),
('5102', 'UNITE CMUB/CMUC/ACS', 5000),
('5103', 'UNITE AME/MUT/REL INT', 5000),
('5104', 'CELLULE RECLAM', 5000),
('5170A', 'DEPART OFFRE DE SANTE', 5000),
('5170D', 'DEPART OFFRE DE SANTE', 5000),
('5172', 'CELL STATISTIQUE/ENQUETES', 5000),
('5174', 'RELAT ETBS SOINS  (RES)', 5000),
('5175', 'PAIEMENT RES', 5000),
('5176', 'REGULATION', 5000),
('5177', 'GDR', 5000),
('5178', 'ACCOMPAGNEMENT DAM', 5000),
('5179', 'SERVICE EN SANTE', 5000),
('5180', 'ACCOMPAG CONSEIL INF SERV', 5000),
('5181', 'RPS', 5000),
('5182', 'GEST ADM ET CONV RPS', 5000),
('5182A', 'GEST ADM ET CONV RPS', 5000),
('5182D', 'GEST ADM ET CONV RPS', 5000),
('5183', 'UNITE MED DENT CTRE SANT SAG FEMM', 5000),
('5184', 'UNITE AUXILIAIRES MEDICAUX', 5000),
('5185', 'UNITE PHARMACIES FOURNISSEURS', 5000),
('5186', 'UNITE LABO TRANSPORTS', 5000),
('5197', 'DIRECTION DES ACCUEILS ET RELATION AVEC USAGERS', 5197),
('5198', 'SECRETARIAT DARU', 5197),
('5199C', 'RELATIONS AVEC LES USAGERS', 5197),
('5199D', 'RELATION AVEC LES USAGERS', 5197),
('5204', 'CONCILIATION', 5197),
('5205', 'RELATIONS CLIENTS', 5197),
('5207', 'INFO ET OFFRES DE SERV', 5197),
('5210', 'PLAT FORM SERV A M', 5197),
('5211', 'AG CL ACC BERGEVIN', 5197),
('5212', 'AG CL ACC ABYMES', 5197),
('5213', 'AG CL ACC PORT LOUIS', 5197),
('5214', 'AG CL ACC DU MOULE', 5197),
('5215', 'AG CL ACC STFRANCOIS', 5197),
('5216', 'EQUIPE MOBILE DARU', 5197),
('5221', 'AG CL ACC B TERRE', 5197),
('5222', 'AG CL ACC CAPESTERRE', 5197),
('5225', 'AG CL ACC STE ROSE', 5197),
('5232', 'AG CL DE M GALANTE', 5197),
('5233', 'AG DE ST MARTIN ST BARTH', 1000),
('5235', 'ACCUEIL MULTIBRANCHES DES TRAVAILLEURS INDEPENDANT', 5197),
('6000', 'DIRECTION DU RECOUVREMENT', 6000),
('6015', 'SECRETARIAT DR', 6000),
('6016', 'CELLULE STATISTIQUES', 6000),
('6130', 'CELLULE SNP ET APPL SYST INFO', 6000),
('6150', 'GEST DEMAT OFF SERV COMM EXT REC', 6000),
('6170C', 'RELATION COTISANTS', 6000),
('6170E', 'RELATION COTISANTS', 6000),
('6210', 'ACCUEIL RECOUVREMENT', 6000),
('6213', 'POLE IMAGE', 6000),
('6251', 'ACCOMPAGNEMENT ENT ET INDIVIDUS', 6000),
('6260', 'ENQUETEURS', 6000),
('6270', 'CFE/GA', 6000),
('6300', 'ENCAISSEMENT', 6000),
('6302', 'ENCAISSEMENT  GM/TTS', 6000),
('6304', 'ENCAISSEMENT RG', 6000),
('6306', 'CELLULE RSI', 6000),
('6307', 'RELATION COTISANTS TI', 6000),
('6400', 'CTX RECOUVREMENT', 6000),
('6410', 'EDI-HUISSIER', 6000),
('6420', 'CTX GROUPE 1', 6000),
('6421', 'CTX GROUPE 2', 6000),
('6422', 'GRPE ACT GRDS CPTES', 6000),
('6423', 'PREVENT  PRESCRIPTION', 6000),
('6500', 'DEPART CONT EMPLOYEURS', 6000),
('6510', 'CONTROLE EMPLOYEURS', 6000),
('7010', 'ASS ANIMAT PILOTAGE', 1700),
('7110', 'SANTE RETRAITE RG', 1700),
('7115', 'ENTREPRISE RG', 1700),
('7120', 'GESTION INT MSA', 1700),
('7210', 'DEPART EXPERTISE TECHNIQUE', 1700),
('7211', 'RESEAU et TELEPHONIE', 1700),
('7212', 'INFRASTRUCTURE', 1700),
('7300', 'DEPART SERVICES ET SUPP UTILISATEUR', 1700),
('7301', 'DEVELOPPEMENT', 1700),
('7302', 'ASS SUPP AUX UTILISATEURS', 1700),
('7304', 'EDITIQUE', 1700),
('8000', 'DIRECTION  MUTUALITE SOCIALE AGRICOLE', 8000),
('8001', 'MSA', 8000),
('8100', 'SECRETARIAT DMSA', 8000),
('8100I', 'SECRETARIAT DMSA', 8000),
('8105', 'CELLULE CONT INTERNE QUAL', 8000),
('8110', 'CELLULE AGORA', 8000),
('8200', 'A.V.I.A', 8000),
('8300', 'A.M.E.X.A', 8000),
('8410', 'ASSUJ CONTROLE R.A', 8000),
('8412', 'CONTROLE RA', 8000),
('8415', 'GI-GE-COTISATIONS NS', 8000),
('8420', 'RECOUVREMENT COTIS DU RA', 8000),
('8430', 'RELAT CLIENT OFFRES DE SERV', 8000),
('8431', 'ACCUEIL DMSA', 8000),
('8432', 'OFFRES DE SERVICE', 8000),
('9000', 'AGENCE COMPTABLE', 9000),
('9100D', 'SECRETARIAT AC', 9000),
('9148', 'VDC/M RISQ/VERIF RET ET PAIEMT', 9000),
('9149', 'VDC/M RISQ/PAIEMENT RET', 9000),
('9150B', 'VDC/M RISQ/VERIF RET', 9000),
('9150C', 'VDC/M RISQ/VERIF RET', 9000),
('9151A', 'VDC/M RISQ/VERIF MAL', 9000),
('9151B', 'VDC/M RISQ/VERIF MAL', 9000),
('9152', 'VDC/M RISQ/VERIF REC', 9000),
('9154', 'VDC/M RISQ COPERNIC', 9000),
('9249', 'COMPTABILITE MSA', 9000),
('9250', 'COMPTABILITE RA /OVNI', 9000),
('9251', 'VERIFICATION MSA', 9000),
('9254', 'CPTE GEN ET BUDGET', 9000),
('9255', 'PAIE', 9000),
('9300', 'CPTE REC ET GEST TRESO', 9000),
('9350', 'CPTE RECOUVREMENT', 9000),
('9360', 'GESTION TRESORIE', 9000),
('9400', 'CPTE MAL ET RET', 9000),
('9421', 'CPTE PREST MAL', 9000),
('9422', 'GEST CREANC ET OPP MAL', 9000),
('9450', 'CPTE RET', 9000),
('9600', 'DIRECTION RISQ PROF  PREV SANTE SOCIALE', 9600),
('9610', 'ASSIST ET GEST ADM', 9600),
('9650', 'TARIFICATION', 9600),
('9660', 'PREVENTION', 9600),
('9670', 'POLE PREV ET SANTE', 9600),
('9671', 'SERVICE SOCIAL', 9600),
('9671B', 'SERVICE SOCIAL', 9600),
('9671E', 'SERVICE SOCIAL', 9600),
('9671G', 'SERVICE SOCIAL', 9600),
('9671H', 'SERVICE SOCIAL', 9600),
('9671J', 'SERVICE SOCIAL', 9600),
('9671K', 'SERVICE SOCIAL', 9600),
('9672', 'SECRET MEDICO SOCIAL', 9600),
('9672B', 'SECRET MEDICO SOCIAL', 9600),
('9672D', 'SECRET MEDICO SOCIAL', 9600),
('9680', 'EDUCATION P LA SANTE', 9600),
('9681', 'GESTION DES FONDS', 9600),
('9681C', 'GESTION DES FONDS', 9600),
('9682', 'TRANSFERTS SANITAIRES', 9600),
('9682I', 'TRANSFERTS SANITAIRES', 9600),
('9682K', 'TRANSFERTS SANITAIRES', 9600),
('9682L', 'TRANSFERTS SANITAIRES', 9600),
('9690', 'ACT SANIT SOCIALE', 9600),
('Code servi', 'Libelle Service', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
