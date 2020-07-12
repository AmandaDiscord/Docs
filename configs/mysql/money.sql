-- MySQL dump 10.17  Distrib 10.3.22-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: amanda.moe    Database: money
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AccountPrefixes`
--

DROP TABLE IF EXISTS `AccountPrefixes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccountPrefixes` (
  `userID` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`,`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BackgroundSync`
--

DROP TABLE IF EXISTS `BackgroundSync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BackgroundSync` (
  `machineID` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userID` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`machineID`,`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CSRFTokens`
--

DROP TABLE IF EXISTS `CSRFTokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CSRFTokens` (
  `token` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loginToken` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`token`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DailyCooldown`
--

DROP TABLE IF EXISTS `DailyCooldown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DailyCooldown` (
  `userID` varchar(22) NOT NULL,
  `lastClaim` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GenderGifBacklog`
--

DROP TABLE IF EXISTS `GenderGifBacklog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GenderGifBacklog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` mediumtext COLLATE utf8mb4_unicode_ci,
  `type` mediumtext COLLATE utf8mb4_unicode_ci,
  `author` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GenderGifBlacklist`
--

DROP TABLE IF EXISTS `GenderGifBlacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GenderGifBlacklist` (
  `blid` int(11) NOT NULL AUTO_INCREMENT,
  `url` text,
  PRIMARY KEY (`blid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GenderGifCharacters`
--

DROP TABLE IF EXISTS `GenderGifCharacters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GenderGifCharacters` (
  `characterid` int(11) NOT NULL AUTO_INCREMENT,
  `gifid` int(11) DEFAULT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `importance` int(11) DEFAULT NULL,
  PRIMARY KEY (`characterid`)
) ENGINE=InnoDB AUTO_INCREMENT=1231 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GenderGifsV2`
--

DROP TABLE IF EXISTS `GenderGifsV2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GenderGifsV2` (
  `gifid` int(11) NOT NULL AUTO_INCREMENT,
  `url` text,
  `type` text,
  PRIMARY KEY (`gifid`)
) ENGINE=InnoDB AUTO_INCREMENT=901 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `InteractionGifs`
--

DROP TABLE IF EXISTS `InteractionGifs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InteractionGifs` (
  `type` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MoneyCooldown`
--

DROP TABLE IF EXISTS `MoneyCooldown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MoneyCooldown` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(22) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `command` text COLLATE utf8mb4_unicode_ci,
  `date` bigint(20) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3023 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PeriodicHistory`
--

DROP TABLE IF EXISTS `PeriodicHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PeriodicHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=671666 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PlaylistSongs`
--

DROP TABLE IF EXISTS `PlaylistSongs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlaylistSongs` (
  `playlistID` int(11) NOT NULL,
  `videoID` char(11) NOT NULL,
  `next` char(11) DEFAULT NULL,
  PRIMARY KEY (`playlistID`,`videoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Playlists`
--

DROP TABLE IF EXISTS `Playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Playlists` (
  `playlistID` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(22) DEFAULT NULL,
  `name` mediumtext,
  `playCount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playlistID`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Premium`
--

DROP TABLE IF EXISTS `Premium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Premium` (
  `userID` varchar(22) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RestartNotify`
--

DROP TABLE IF EXISTS `RestartNotify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RestartNotify` (
  `botID` varchar(22) NOT NULL,
  `mentionID` varchar(22) NOT NULL,
  `channelID` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`botID`,`mentionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ServerPermissions`
--

DROP TABLE IF EXISTS `ServerPermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServerPermissions` (
  `serverID` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `music` int(11) NOT NULL,
  PRIMARY KEY (`serverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SettingsGuild`
--

DROP TABLE IF EXISTS `SettingsGuild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SettingsGuild` (
  `keyID` varchar(22) NOT NULL,
  `setting` varchar(50) NOT NULL,
  `value` text,
  PRIMARY KEY (`keyID`,`setting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SettingsSelf`
--

DROP TABLE IF EXISTS `SettingsSelf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SettingsSelf` (
  `keyID` varchar(22) NOT NULL,
  `setting` varchar(50) NOT NULL,
  `value` text,
  PRIMARY KEY (`keyID`,`setting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Songs`
--

DROP TABLE IF EXISTS `Songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Songs` (
  `videoID` char(11) NOT NULL,
  `name` mediumtext,
  `length` int(11) DEFAULT NULL,
  PRIMARY KEY (`videoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StatLogs`
--

DROP TABLE IF EXISTS `StatLogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StatLogs` (
  `time` bigint(20) NOT NULL,
  `id` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ramUsageKB` int(11) DEFAULT NULL,
  `users` int(11) DEFAULT NULL,
  `guilds` int(11) DEFAULT NULL,
  `channels` int(11) DEFAULT NULL,
  `voiceConnections` int(11) DEFAULT NULL,
  `uptime` int(11) DEFAULT NULL,
  `shard` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`time`,`id`,`shard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StatTest`
--

DROP TABLE IF EXISTS `StatTest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StatTest` (
  `timestamp` bigint(20) NOT NULL,
  `clientID` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shard` int(11) NOT NULL,
  `guilds` int(11) DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`clientID`,`shard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StatusMessages`
--

DROP TABLE IF EXISTS `StatusMessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StatusMessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dates` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `demote` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StatusRanges`
--

DROP TABLE IF EXISTS `StatusRanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StatusRanges` (
  `label` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startmonth` tinyint(4) DEFAULT NULL,
  `startday` tinyint(4) DEFAULT NULL,
  `endmonth` tinyint(4) DEFAULT NULL,
  `endday` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`label`),
  UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StatusUsers`
--

DROP TABLE IF EXISTS `StatusUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StatusUsers` (
  `label` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userID` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`label`,`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Todo`
--

DROP TABLE IF EXISTS `Todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `complete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TodoTags`
--

DROP TABLE IF EXISTS `TodoTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TodoTags` (
  `id` int(11) NOT NULL,
  `tag` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserPermissions`
--

DROP TABLE IF EXISTS `UserPermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserPermissions` (
  `userID` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `music` int(11) NOT NULL,
  `eval` int(11) NOT NULL,
  `owner` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WaifuGifts`
--

DROP TABLE IF EXISTS `WaifuGifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WaifuGifts` (
  `transactionID` int(11) NOT NULL AUTO_INCREMENT,
  `senderID` varchar(22) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiverID` varchar(22) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`transactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WebTokens`
--

DROP TABLE IF EXISTS `WebTokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WebTokens` (
  `userID` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staging` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WebhookAliases`
--

DROP TABLE IF EXISTS `WebhookAliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WebhookAliases` (
  `webhookID` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `webhook_username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userID` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_discriminator` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`webhookID`,`webhook_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `money`
--

DROP TABLE IF EXISTS `money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `money` (
  `userID` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coins` bigint(20) NOT NULL DEFAULT '5000',
  `woncoins` bigint(20) NOT NULL DEFAULT '0',
  `lostcoins` bigint(20) NOT NULL DEFAULT '0',
  `givencoins` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `userID` varchar(22) DEFAULT NULL,
  `guildID` varchar(22) DEFAULT NULL,
  `waifuAlert` int(11) DEFAULT NULL,
  `gamblingAlert` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `waifu`
--

DROP TABLE IF EXISTS `waifu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waifu` (
  `userID` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waifuID` varchar(22) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-12 17:16:38
