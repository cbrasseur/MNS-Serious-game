-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: serious_game
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `inscrire`
--

DROP TABLE IF EXISTS `inscrire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscrire` (
  `Id_UTILISATEUR` int NOT NULL,
  `Id_SCENARIO` int NOT NULL,
  PRIMARY KEY (`Id_UTILISATEUR`,`Id_SCENARIO`),
  KEY `inscrire_ibfk_2` (`Id_SCENARIO`),
  CONSTRAINT `inscrire_ibfk_1` FOREIGN KEY (`Id_UTILISATEUR`) REFERENCES `utilisateur` (`Id_UTILISATEUR`),
  CONSTRAINT `inscrire_ibfk_2` FOREIGN KEY (`Id_SCENARIO`) REFERENCES `scenario` (`Id_SCENARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscrire`
--

LOCK TABLES `inscrire` WRITE;
/*!40000 ALTER TABLE `inscrire` DISABLE KEYS */;
INSERT INTO `inscrire` VALUES (1,1),(2,1),(1,2),(2,2),(3,2),(1,3),(2,3),(3,3);
/*!40000 ALTER TABLE `inscrire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `Id_Questions` int NOT NULL AUTO_INCREMENT,
  `Question` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Difficulté` int DEFAULT NULL,
  `place` int DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Id_SCENARIO` int NOT NULL,
  PRIMARY KEY (`Id_Questions`),
  KEY `Id_SCENARIO` (`Id_SCENARIO`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`Id_SCENARIO`) REFERENCES `scenario` (`Id_SCENARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'Est-ce que  Microsoft Publisher est utile pour votre correspondance courante?',1,NULL,NULL,1),(2,'Connaissez vous de logiciel de traitement de données?',1,NULL,NULL,1),(3,'Savez quels sont les documents qui peuvent etre lus par Adode Acrobat?',1,NULL,NULL,1),(4,'Connaissez vous cette icone?',1,NULL,'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Microsoft_Office_PowerPoint_%282019%E2%80%93present%29.svg/langfr-1024px-Microsoft_Office_PowerPoint_%282019%E2%80%93present%29.svg.png',1),(5,'Pouvez vous nommer une police de caractère couramment utilisée pour la correspondance professionnelle?',1,NULL,NULL,1),(6,'Quel combinaison de touches clavier vous permet d\'annuler votre derniere action à l\'écran?',1,NULL,NULL,1),(7,'Quelle est la facon la plus securisée de sauvegarder des documents?',1,NULL,NULL,1),(8,'Si vous deviez expliquer rapidement ce qu\'est le logiciel Microsoft Acces, vous diriez:',1,NULL,NULL,1),(9,'Savez vous a quoi correspond le G dans les options de police Word?',1,NULL,'https://www.faclic.com/files/formation-word/traiter-paragraphe-word-2.png',1),(10,'Qu\'est l\'option WordArt?',1,NULL,NULL,1),(11,'Que permet le bouton x²',2,NULL,NULL,1),(12,'Dans le logiciel Word, comment accede t on directment à une page du document',2,NULL,NULL,1),(13,'Dans un document Word, comment inserer une image entourée par le texte ?',2,NULL,NULL,1),(14,'Quand vous mettez en page en texte, que signifie : \"Justifier\"',2,NULL,NULL,1),(15,'Dans un tableur Excel que fait la formule =SOMME(B4:E4) ?',2,NULL,NULL,1),(16,'Dans un graphique (histogramme Excel) est il possible de remplacer les barres traditionnelles par une image?',2,NULL,NULL,1),(17,'Comment feriez vous pour ranger par ordre alphabétique une colonne de tableur Excel?',2,NULL,NULL,1),(18,'Dans un classeur Excel, à l\'onglet FICHIER/INFORMATIONS/PROTEGER LE CLASSEUR a quoi sert la commande : \"Ajouter une signature numérique\"?',2,NULL,NULL,1),(19,'Dans un tableau avez enregistré les participants à un diner de fête avec leur age. Comment allez compter les enfants de moins de 10 ans?',2,NULL,NULL,1),(20,'Quel est le but du logiciel PowerPoint',2,NULL,NULL,1),(21,'A partir de quelle année Microsoft a groupé l\'ensemble de ses outils bureautique sous la dénomination \"Office\"?',3,NULL,NULL,1),(22,'Quel logiciel ne figurait pas dans la premiere version d\'office?',3,NULL,NULL,1),(23,'Le format \".doc\" a été crée pour Word',3,NULL,NULL,1),(24,'Jusqu\'en 2003 la suite Office possedait un outil de conception de site web, quel était son nom?',3,NULL,NULL,1),(25,'Quelle est la particularité d\'un fichier Word enregistré avec l\'extension .doc?',3,NULL,NULL,1),(26,'Dans un document Word, pourquoi des champs peuvent manqués lors de la création d\'une table des matieres?',3,NULL,NULL,1),(27,'Dans une cellule de classeur Excel, est il possible de limiter les saisies utilisateur?',3,NULL,NULL,1),(28,'Lorsque vous saisissez une valeur commencant par 0, la cellule supprime ce 0. Comment faire pour garder l\'affichage de ce chiffre?',3,NULL,NULL,1),(29,'Dans le logiciel Excel, qu\'est ce qu\'une macro?',3,NULL,NULL,1),(30,'Pour une presentation PowerPoint quelle est l\'interet de créer un masque de diapositive?',3,NULL,NULL,1),(31,'Citez un moteur de recherche Internet qui offre des services équivalent à Google',1,NULL,NULL,2),(32,'Qu\'est ce que Mozilla Firefox?',1,NULL,NULL,2),(33,'Quels sont les services qui ne sont pas proposés par Amazon?',1,NULL,NULL,2),(34,'Connaissez vous un concurent francais au site de vidéo Youtube',1,NULL,NULL,2),(35,'Qu\'est ce que le Cloud?',1,NULL,NULL,2),(36,'Qu\'est ce qu\'un FAI ( ou provider) ?',1,NULL,NULL,2),(37,'Pour quel motif pouvez vous recevoir un courier de mise en garde de l\'Hadopi?',1,NULL,NULL,2),(38,'Quelle est l\'erreur à ne pas commettre sur les réseaux sociaux?',1,NULL,NULL,2),(39,'A quoi sert la navigation privée?',1,NULL,NULL,2),(40,'Avez entendu parler du Pishing ( ou hameçonnage)?',1,NULL,NULL,2),(41,'Quelle est l\'utilité d\'une URL (Uniform Ressource Locator) ?',2,NULL,NULL,2),(42,'Si on ne considère pas le delicieux gateaux, qu\'est ce qu\'un cookie.',2,NULL,NULL,2),(43,'Qu\'est ce que la RGPD?',2,NULL,NULL,2),(44,'Il existe en Europe un droit à l\'oubli.De quoi s\'agit-il?',2,NULL,NULL,2),(45,'Quelle est la spécifité d\'Instagram par rapport aux autres reseaux sociaux?',2,NULL,NULL,2),(46,'Comment pouvez vous savoir que vous naviguez sur un site sécurisé et que votre achat en ligne est protégé?',2,NULL,NULL,2),(47,'Savez vous qu\'est ce que le streaming?',2,NULL,NULL,2),(48,'Qu\'appelle-t-on Web 2.0?',2,NULL,NULL,2),(49,'Quel support est le plus utilisé pour la consultation d\'internet?',2,NULL,NULL,2),(50,'La plateforme Pharos mise en ligne par le ministere de l\'interieur permet :',2,NULL,NULL,2),(51,'Dans votre barre de navigateur internet vous verrez l\'adresse qui débute par HTTP. A quoi correspond cet acronyme?',3,NULL,NULL,2),(52,'Qu\'est ce que le code source de la page affichée dans votre navigteur?',3,NULL,NULL,2),(53,'Vous avez déjà rencontré des difficultés à lire une page web en recevant une erreur de type 404.Que signifie ce nombre?',3,NULL,NULL,2),(54,'Quel est le role d\'un serveur HTML ( Apache par exemple )?',3,NULL,NULL,2),(55,'Que nomme t on faille XSS?',3,NULL,NULL,2),(56,'Connaissez vous le single page application?',3,NULL,NULL,2),(57,'Votre poste de travail utilise tous les jours le protocole Pop3, de quoi s\'agit-il?',3,NULL,NULL,2),(58,'A quoi sert le Domain Name System ( ou DNS)?',3,NULL,NULL,2),(59,'Qu\'est qu\'un VPN?',3,NULL,NULL,2),(60,'Connaissez vous ARPANET?',3,NULL,NULL,2),(61,'Question inutile scenario 3',1,NULL,NULL,3),(62,'Question inutile scenario 3',1,NULL,NULL,3),(63,'Question inutile scenario 3',1,NULL,NULL,3),(64,'Question inutile scenario 3',1,NULL,NULL,3),(65,'Question inutile scenario 3',1,NULL,NULL,3),(66,'Question inutile scenario 3',1,NULL,NULL,3),(67,'Question inutile scenario 3',1,NULL,NULL,3),(68,'Question inutile scenario 3',1,NULL,NULL,3),(69,'Question inutile scenario 3',1,NULL,NULL,3),(70,'Question inutile scenario 3',1,NULL,NULL,3),(71,'Question inutile scenario 3',1,NULL,NULL,3),(72,'Question inutile scenario 3',1,NULL,NULL,3),(73,'Question inutile scenario 3',2,NULL,NULL,3),(74,'Question inutile scenario 3',2,NULL,NULL,3),(75,'Question inutile scenario 3',2,NULL,NULL,3),(76,'Question inutile scenario 3',2,NULL,NULL,3),(77,'Question inutile scenario 3',2,NULL,NULL,3),(78,'Question inutile scenario 3',2,NULL,NULL,3),(79,'Question inutile scenario 3',2,NULL,NULL,3),(80,'Question inutile scenario 3',2,NULL,NULL,3),(81,'Question inutile scenario 3',2,NULL,NULL,3),(82,'Question inutile scenario 3',2,NULL,NULL,3),(83,'Question inutile scenario 3',2,NULL,NULL,3),(84,'Question inutile scenario 3',2,NULL,NULL,3),(85,'Question inutile scenario 3',3,NULL,NULL,3),(86,'Question inutile scenario 3',3,NULL,NULL,3),(87,'Question inutile scenario 3',3,NULL,NULL,3),(88,'Question inutile scenario 3',3,NULL,NULL,3),(89,'Question inutile scenario 3',3,NULL,NULL,3),(90,'Question inutile scenario 3',3,NULL,NULL,3),(91,'Question inutile scenario 3',3,NULL,NULL,3),(92,'Question inutile scenario 3',3,NULL,NULL,3),(93,'Question inutile scenario 3',3,NULL,NULL,3),(94,'Question inutile scenario 3',3,NULL,NULL,3),(95,'Question inutile scenario 3',3,NULL,NULL,3),(96,'Question inutile scenario 3',3,NULL,NULL,3);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repond`
--

DROP TABLE IF EXISTS `repond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repond` (
  `Id_UTILISATEUR` int NOT NULL,
  `Id_Questions` int NOT NULL,
  `Id_REPONSE` int NOT NULL,
  `dateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id_UTILISATEUR`,`Id_Questions`,`Id_REPONSE`),
  KEY `Id_Questions` (`Id_Questions`),
  KEY `Id_REPONSE` (`Id_REPONSE`),
  CONSTRAINT `repond_ibfk_1` FOREIGN KEY (`Id_UTILISATEUR`) REFERENCES `utilisateur` (`Id_UTILISATEUR`),
  CONSTRAINT `repond_ibfk_2` FOREIGN KEY (`Id_Questions`) REFERENCES `question` (`Id_Questions`),
  CONSTRAINT `repond_ibfk_3` FOREIGN KEY (`Id_REPONSE`) REFERENCES `reponse` (`Id_REPONSE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repond`
--

LOCK TABLES `repond` WRITE;
/*!40000 ALTER TABLE `repond` DISABLE KEYS */;
INSERT INTO `repond` VALUES (1,2,3,'2021-05-05 11:44:50'),(1,15,30,'2021-05-05 11:44:58'),(1,36,71,'2021-05-26 14:38:50'),(1,73,145,'2021-05-01 08:16:27'),(1,75,149,'2021-05-01 08:16:29'),(1,86,171,'2021-05-01 08:16:35'),(1,87,173,'2021-05-01 08:16:36'),(1,88,175,'2021-05-01 08:16:42'),(1,89,177,'2021-05-01 08:16:31'),(1,90,179,'2021-05-01 08:16:33'),(1,91,181,'2021-05-01 08:16:38'),(1,92,183,'2021-05-01 08:16:37'),(1,93,185,'2021-05-01 08:16:32'),(1,94,187,'2021-05-01 08:16:43'),(1,95,189,'2021-05-01 08:16:30'),(1,96,191,'2021-05-01 08:16:40');
/*!40000 ALTER TABLE `repond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reponse` (
  `Id_REPONSE` int NOT NULL AUTO_INCREMENT,
  `reponse` varchar(550) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `valeur` tinyint(1) DEFAULT NULL,
  `Id_Questions` int NOT NULL,
  PRIMARY KEY (`Id_REPONSE`),
  KEY `reponse_ibfk_2` (`Id_Questions`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reponse`
--

LOCK TABLES `reponse` WRITE;
/*!40000 ALTER TABLE `reponse` DISABLE KEYS */;
INSERT INTO `reponse` VALUES (1,'Non, un logiciel de type Word ou Writer est un traitement de texte  plus utile pour, Publisher est un outil de publication assisté par ordinateur.',1,1),(2,'Oui, Publisher permet de réaliser des documents de communication de grande qualité. Tous ces outils sont d\'une grande aide au quotidien.',0,1),(3,'Il existe des logiciels comme les tableurs Excel ou Calc',1,2),(4,'Il existe les logiciels de calcul comme Microsoft Maths ou OpenOffice Compta',0,2),(5,'Il s\'agit du format pdf qui permet d\'enregistrer des documents texte dans un format facilement partageable',1,3),(6,'Il s\'agit du logiciel qui lit les fichiers vocaux que la fonction dictaphone de Apple permet d\'enregistrer',0,3),(7,'Oui il s\'agit du logo de Microsoft PowerPoint',1,4),(8,'Oui, il s\'agit du logo du logiciel Microsoft Project',0,4),(9,'Calibri sans serif',1,5),(10,'Colibri sans serif',0,5),(11,'Ctrl + Z',1,6),(12,'Ctrl + A',0,6),(13,'Une sauvegarde du travail de la journée sur un disque dur externe et sur le cloud',1,7),(14,'Une sauvegarde sur votre poste de travail uniquement pour eviter les problèmes de confidentialité.',0,7),(15,'Qu\'il s\'agit d\'une base de données pour stocker des informations',1,8),(16,'Qu\'il s\'agit d\'un logiciel d\'acces aux differents comptes utilisateurs de l\'ordinateur',0,8),(17,'C\'est l\'option de mise en gras des caracteres',1,9),(18,'C\'est l\'option qui permet de griser du texte.',0,9),(19,'C\'est une option qui permet d\'ecrire de gros caractères graphiques ( pour une affiche par exemple)',1,10),(20,'C\'est une option qui permet de dessiner dans un document texte et inserer des illustrations.',0,10),(21,'Mettre le texte en exposant',2,11),(22,'De trouver les doublons dans le texte,',0,11),(23,'Il existe un raccourci clavier : touche F5',2,12),(24,'Il existe un raccourci clavier : Fleche BAS + numero de la page à atteindre',0,12),(25,'J\'utilise l\'outil : Disposition d\'image',2,13),(26,'J\'utilise l\'outil: Habillage',0,13),(27,'Il s\'agit de donner la même longueur à toutes les lignes du texte.',2,14),(28,'Il s\'agit de donner des explications sur les sources utilisées pour rediger le texte.',0,14),(29,'L\'addition des cellule B4 et E4',2,15),(30,'Le calcul de la division B4:E4',0,15),(31,'Oui grâce à l\'option Remplissage, il suffit de coller l\'image choisie.',2,16),(32,'Non, l\'interet des graphiques est d\'etre clair et lisible.Une image rendrait la comprehension difficile. ',0,16),(33,'Dans le menu Données , il existe une fonction Trier.',2,17),(34,'Dans le menu Données , il existe une fonction Filtrer.',0,17),(35,'A garantir l\'intégrité du classeur',2,18),(36,'A garantir la provenance et l\'expéditeur du document.',0,18),(37,'La fonction SOMME.SI() permet d\'additionner avec une conditions (ici age<10)',2,19),(38,'Il suffit de trier par age les convives et compter toutes les lignes jusqu\'au critere d\'age = 11',0,19),(39,'Réaliser des presentations synthétiques sous forme de diapositives avec textes, images, graphiques, tableaux et animations',2,20),(40,'Il permet de réaliser de gros documents structurés en chapitres expliquant en détail les sujets abordés.',0,20),(41,'C\'était en 1989',3,21),(42,'C\'était en 1997',0,21),(43,'Outlook',3,22),(44,'Access',0,22),(45,'FAUX',3,23),(46,'VRAI',0,23),(47,'FrontPage',3,24),(48,'WebEditor',0,24),(49,'Il s\'agit d\'une archive compréssée, ce qui permet de stocker toutes les informations necessaires à la constituion du document.',3,25),(50,'Il s\'agit d\'un simple fichier texte ce qui limite sa taille pour un stockage et un transfert plus aisés.',0,25),(51,'Certains titres ne sont pas formatés au format titre',3,26),(52,'Certains sauts de pages ont été négligés.',0,26),(53,'Oui, dans le menu Données il y a une option \"Validation des données\" qui permet de filtrer les ajouts',3,27),(54,'Non, la saisie d\'informations est libre. C\'est la grande force de l\'outil.',0,27),(55,'Il suffit d\'ajouter une apostrophe devant la saisie.',3,28),(56,'Il suffit de mettre le 0 entre parenthèse.',0,28),(57,'C\'est un enregistrement d\'actions répétitives qui permet d\'automatiser des actions courantes.',3,29),(58,'Ce sont des fonctions qui permettent d\'afficher séparement des parties de son classeur Excel de facon à les agrandir et en faciliter la lecture.',0,29),(59,'Cela permet d\'avoir des elements normés pour pouvoir les disposer sur toutes ses diapositives et ainsi avoir une cohérence lors de la présentation.',3,30),(60,'Cela permet de cacher certains elements pour les afficher seulement lorsque l\'utilisateur le souhaite.',0,30),(61,'Microsoft Bing',1,31),(62,'Apple Safari',0,31),(63,'Un navigateur Internet qui permet d\'afficher des pages Web',1,32),(64,'Une messagerie internet qui permet de gérer ses emails.',0,32),(65,'La banque en ligne et l\'offre de téléphonie mobile',1,33),(66,'La vente en ligne de produits d\'épicerie et la livraison en 24 heures.',0,33),(67,'DailyMotion.com',1,34),(68,'MaVideo.fr',0,34),(69,'C\'est la possibilité de stocker des informations sur des serveurs en ligne, d\'acceder à ses données depuis n\'importe quel poste. Le cloud represente la présence des données comme en suspension sur le web.',1,35),(70,'Il s\'agit de la possibilité d\'être relié à tous ses contacts sur les réseaux sociaux d\'où l\'appelation de Cloud ( nuage en anglais)',0,35),(71,'C\'est un opérateur qui établit contre abonnement la connexion au réseau (Fournisseur Acces Internet)',1,36),(72,'C\'est un logiciel autonome qui a pour objectif d\'eviter les saturations du réseau (Fully Automatic Installation)',0,36),(73,'Pour le téléchargement illégale de contenus (musique, livre, film, série )',1,37),(74,'Pour l\'inactivité de votre compte Facebook depuis plus de 3 mois.',0,37),(75,'Partager les dates de ses vacances.',1,38),(76,'Partager ses souvenirs de vacances.',0,38),(77,'Ils\'agit d\'un mode du navigateur internet qui supprime l\'historique de votre navigation',1,39),(78,'Il s\'agit d\'un mode de votre navigateur qui rend votre navigation totalement invisible de tous.',0,39),(79,'Avez entendu parler du Pishing ( ou hameçonnage)?',1,40),(80,'C\'est une pratique frauduleuse qui consiste pour l\'escroc à se faire passer pour une institution et voler des données personnelles',0,40),(81,'L\'URL est l\'adresse d\'un site internet qui permet à l\'utilisateur d\'accéder à la page souhaitée.',2,41),(82,'L\'URL est le logiciel utilisé par les moteurs de recherches pour localiser les informations demandées par l’utilisateur.',0,41),(83,'C\'est un petit fichier texte envoyé par le site internet qui contient des informations utiles de l\'utilisateur comme par exemple son identifiant.',2,42),(84,'C\'est une page web qui demande à l\'utilisateurs son consentements pour la gestion des données personnelles liées à la consultation d\'un site internet.',0,42),(85,'Il s\'agit du reglement général sur la protection des données. C\'est la legislation europeenne sur le traitement des informations personnelles.',2,43),(86,'Il s\'agit de la reglementation globale du partage de données.C\'est la charte de fonctionnement du réseau au niveau mondiale.',0,43),(87,'C\'est la possibilité d\'effacer les traces de son activité numériques et/ou un déférencement des moteurs de rechercches.',2,44),(88,'Il s\'agit de l\'obligation pour les sites internet de proposer la possibilité aux utilisateurs de recuperer leurs identifiants s\'ils sont perdus ou oubliés.',0,44),(89,'La particularité d\'Instagram réside dans le partage de photos et videos',2,45),(90,'La particularité d\'Instagram est le blogging d\'informations spécialisées technologie numériques.',0,45),(91,'La barre d\'adresse du site internet commence par https et un petit cadenas apparait sur certains navigateurs.',2,46),(92,'Le site internet vous propose d\'entrer votre mot de passe et ainsi proteger vos connexions.',0,46),(93,'C\'est l\'envoi de données progressif qui permet de lire une video ou de l\'audio sans le telecharger completment au préalable.',2,47),(94,'Il s\'agit de logiciels de lecture video qui permettent de regarder un film ou ecouter de la musique en ligne.',0,47),(95,'Il s\'agit de l\'evolution du web vers plus d\'interactivité et plus seulement la consultion de sites statiques.',2,48),(96,'Il s\'agit d\'une nouvelle norme des navigateurs internet qui a permis d\'integrer des contenus videos.',0,48),(97,'Les appareils mobiles (smartphones)',2,49),(98,'Les ordinateurs ( portables et bureau)',0,49),(99,'de signaler les crimes et délits en ligne.',2,50),(100,'d\'effectuer ses démarches administratives en ligne.',0,50),(101,'Il correspond au protocole de transfert d\'informations.Il s\'agit plus simplement du langage que parlent votre machine et le serveur qui lui répond.',3,51),(102,'Il equivaut à un code de cryptage qui sécurise vos communication entre votre machine et le serveur du site internet que vous visitez.',0,51),(103,'Il s\'agit du texte envoyé par le serveur.Ce texte sera lu et compris par votre navigateur et ce dernier sera en mesure d\'afficher ce que les concepteurs du site ont souhaité.',3,52),(104,'Il s\'agit du code qui contient toutes les données concernant votre équipement, navigateur et autres logiciels permettant d\'afficher les informations trouvées sur internet.',0,52),(105,'Il s\'agit du code de l\'erreur signifiant que le page demandée n\'est pas disponible sur le serveur.',3,53),(106,'Il s\'agit du code signifiant que vôtre ordinateur ou téléphone n\'est pas en mesure de lire la page reçue.',0,53),(107,'C\'est le serveur qui recoit votre demande de page Web ( requete HTML ) prépare les informations demandées et vous la retourne excecutée.',3,54),(108,'C\'est le serveur qui centralise le protocole HTML ( langage de communication entre machines) et qui permet à tous les acteurs du web de dialoguer entre eux.',0,54),(109,'C\'est une faiblesse d\'un site internet ou un utilisateur peut ecrire du code informatique là ou il ne devrait pouvoir qu\'utiliser les services proposés.',3,55),(110,'C\'est une faiblesse de votre machine qui ne dispose plus d\'assez de mémoire pour continuer a afficher votre page correctement.',0,55),(111,'Dans une application web monopage tout le contenu que vous pouvez consulter se trouve sur une page unique, évitant la recharge et la charge du serveur. ',3,56),(112,'Il s\'agit d\'une application web qui envoie une seule page après l\'autre afin d\'alleger le trafic et fluidifier votre navigation. ',0,56),(113,'C\'est le langage qui permet d\'aller récuper ses emails sur un serveur distant.',3,57),(114,'C\'est la langage qui permet d\'afficher des fenetres web que l\'on nomme pop up, souvent utilisées pour l\'affichage de publicité ou d\'avertissement.',0,57),(115,'Il s\'agit du système de nom de domaine. Il traduit l\'adresse que vous cherchez (URL) en code numerique ( IP) pour localiser le serveur qui repondra à votre demande.',3,58),(116,'Il s\'agit du système qui delivre les noms de domaine ( adresse du site internet ) afin d\'eviter que deux sites portent le meme nom et ainsi lui attribue une immatriculation ( adresse IP)',0,58),(117,'C\'est un système qui anonymise vos connexions.',3,59),(118,'C\'est un système qui protege contre les virus.',0,59),(119,'Il s\'agit du premier réseau informatique (d\'origine militaire) utilisant les bases de ce que sera l\'internet grand public. ',3,60),(120,'Il s\'agit de l\'évolution d\'internet. C\'est la version securisée de tous les protocoles actuels.',0,60),(121,'VRAI',1,61),(122,'FAUX',0,61),(123,'VRAI',1,62),(124,'FAUX',0,62),(125,'VRAI',1,63),(126,'FAUX',0,63),(127,'VRAI',1,64),(128,'FAUX',0,64),(129,'VRAI',1,65),(130,'FAUX',0,65),(131,'VRAI',1,66),(132,'FAUX',0,66),(133,'VRAI',1,67),(134,'FAUX',0,67),(135,'VRAI',1,68),(136,'FAUX',0,68),(137,'VRAI',1,69),(138,'FAUX',0,69),(139,'VRAI',1,70),(140,'FAUX',0,70),(141,'VRAI',1,71),(142,'FAUX',0,71),(143,'VRAI',1,72),(144,'FAUX',0,72),(145,'VRAI',2,73),(146,'FAUX',0,73),(147,'VRAI',2,74),(148,'FAUX',0,74),(149,'VRAI',2,75),(150,'FAUX',0,75),(151,'VRAI',2,76),(152,'FAUX',0,76),(153,'VRAI',2,77),(154,'FAUX',0,77),(155,'VRAI',2,78),(156,'FAUX',0,78),(157,'VRAI',2,79),(158,'FAUX',0,79),(159,'VRAI',2,80),(160,'FAUX',0,80),(161,'VRAI',2,81),(162,'FAUX',0,81),(163,'VRAI',2,82),(164,'FAUX',0,82),(165,'VRAI',2,83),(166,'FAUX',0,83),(167,'VRAI',2,84),(168,'FAUX',0,84),(169,'VRAI',3,85),(170,'FAUX',0,85),(171,'VRAI',3,86),(172,'FAUX',0,86),(173,'VRAI',3,87),(174,'FAUX',0,87),(175,'VRAI',3,88),(176,'FAUX',0,88),(177,'VRAI',3,89),(178,'FAUX',0,89),(179,'VRAI',3,90),(180,'FAUX',0,90),(181,'VRAI',3,91),(182,'FAUX',0,91),(183,'VRAI',3,92),(184,'FAUX',0,92),(185,'VRAI',3,93),(186,'FAUX',0,93),(187,'VRAI',3,94),(188,'FAUX',0,94),(189,'VRAI',3,95),(190,'FAUX',0,95),(191,'VRAI',3,96),(192,'FAUX',0,96);
/*!40000 ALTER TABLE `reponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `satisafaction`
--

DROP TABLE IF EXISTS `satisafaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `satisafaction` (
  `Id_Satisafaction` int NOT NULL AUTO_INCREMENT,
  `Note` int DEFAULT NULL,
  `Commentaires` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Id_UTILISATEUR` int NOT NULL,
  PRIMARY KEY (`Id_Satisafaction`),
  KEY `Id_UTILISATEUR` (`Id_UTILISATEUR`),
  CONSTRAINT `satisafaction_ibfk_1` FOREIGN KEY (`Id_UTILISATEUR`) REFERENCES `utilisateur` (`Id_UTILISATEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `satisafaction`
--

LOCK TABLES `satisafaction` WRITE;
/*!40000 ALTER TABLE `satisafaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `satisafaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenario`
--

DROP TABLE IF EXISTS `scenario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scenario` (
  `Id_SCENARIO` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date_crea` datetime DEFAULT NULL,
  `date_modif` datetime DEFAULT NULL,
  `Id_UTILISATEUR` int NOT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `illustration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nbQuestions` int NOT NULL,
  PRIMARY KEY (`Id_SCENARIO`),
  KEY `Id_UTILISATEUR` (`Id_UTILISATEUR`),
  CONSTRAINT `scenario_ibfk_1` FOREIGN KEY (`Id_UTILISATEUR`) REFERENCES `utilisateur` (`Id_UTILISATEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenario`
--

LOCK TABLES `scenario` WRITE;
/*!40000 ALTER TABLE `scenario` DISABLE KEYS */;
INSERT INTO `scenario` VALUES (1,'Bureautique ','2021-04-14 00:00:00','2021-04-14 00:00:00',2,'Testez vos connaissances en bureautique.L\'informatique de bureau a t elle encore des secrets pour vous? ','http://icons.iconarchive.com/icons/tpdkdesign.net/refresh-cl/256/folder-orange-mydocuments-icon.png',30),(2,'Internet         ','2021-04-14 00:00:00','2021-04-14 00:00:00',2,'Connaissez vous internet ,ses astuces, ses pièges? Lancez vous...','https://www.transparentpng.com/thumb/wi-fi/red-circuits-and-electronics-archives-wi-fi-png-0.png',30),(3,'Juste pour tester ','2021-04-14 00:00:00','2021-04-14 00:00:00',2,'36 questions inutiles',NULL,36);
/*!40000 ALTER TABLE `scenario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur` (
  `Id_UTILISATEUR` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Prenom` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Niveau` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Profil` tinyint NOT NULL,
  PRIMARY KEY (`Id_UTILISATEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'VANNI','Olivier','olivier@jojo.fr','cRDtpNCeBiql5KOQsKVyrA0sAiA=','Débutant',1),(2,'Admin','istrateur','admin@admin.com','cRDtpNCeBiql5KOQsKVyrA0sAiA=','Débutant',2),(3,'Jupiter','Mars','mars@toto.fr','cRDtpNCeBiql5KOQsKVyrA0sAiA=','Débutant',1);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-27 16:25:30
