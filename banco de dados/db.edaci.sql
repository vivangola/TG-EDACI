-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: edaci
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.36-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `atvs_plano_atividades`
--

DROP TABLE IF EXISTS `atvs_plano_atividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atvs_plano_atividades` (
  `cod_atividade` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `tipo_atividade_fk` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_atividade`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atvs_plano_atividades`
--

LOCK TABLES `atvs_plano_atividades` WRITE;
/*!40000 ALTER TABLE `atvs_plano_atividades` DISABLE KEYS */;
INSERT INTO `atvs_plano_atividades` VALUES (1,4,'Ativdade de teste',4,2019,1,2,'2019-09-20 10:53:10'),(2,4,'',0,0,0,0,'2019-09-20 16:59:57'),(3,4,'',0,0,0,0,'2019-09-20 17:00:43');
/*!40000 ALTER TABLE `atvs_plano_atividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atvs_plano_atividades_status`
--

DROP TABLE IF EXISTS `atvs_plano_atividades_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atvs_plano_atividades_status` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atvs_plano_atividades_status`
--

LOCK TABLES `atvs_plano_atividades_status` WRITE;
/*!40000 ALTER TABLE `atvs_plano_atividades_status` DISABLE KEYS */;
INSERT INTO `atvs_plano_atividades_status` VALUES (1,'Não iniciada'),(2,'Em andamento'),(3,'Realizada');
/*!40000 ALTER TABLE `atvs_plano_atividades_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atvs_plano_atividades_tipo`
--

DROP TABLE IF EXISTS `atvs_plano_atividades_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atvs_plano_atividades_tipo` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atvs_plano_atividades_tipo`
--

LOCK TABLES `atvs_plano_atividades_tipo` WRITE;
/*!40000 ALTER TABLE `atvs_plano_atividades_tipo` DISABLE KEYS */;
INSERT INTO `atvs_plano_atividades_tipo` VALUES (1,'Projeto Pessoal'),(2,'Projeto do Grupo'),(3,'Tutorial'),(4,'Outros');
/*!40000 ALTER TABLE `atvs_plano_atividades_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avs_avisos`
--

DROP TABLE IF EXISTS `avs_avisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avs_avisos` (
  `cod_aviso` int(11) NOT NULL AUTO_INCREMENT,
  `assunto` varchar(100) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `nivel_escolaridade_fk` int(11) DEFAULT NULL,
  `inicio_exibicao` datetime DEFAULT NULL,
  `fim_exibicao` datetime DEFAULT NULL,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_aviso`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avs_avisos`
--

LOCK TABLES `avs_avisos` WRITE;
/*!40000 ALTER TABLE `avs_avisos` DISABLE KEYS */;
INSERT INTO `avs_avisos` VALUES (1,'Atualização de suas informações','Por favor, mantenha sempre suas informações atualizadas.',2,'2019-07-09 10:00:00','2019-08-09 12:00:00',4,'2019-07-10 11:32:42'),(2,'Processo Seletivo','O processo seletivo de 2019 foi aberto. Inscreva-se.',2,'2019-02-09 08:00:00','2019-10-09 10:00:00',4,'2019-07-10 11:40:50'),(15,'tesad','sadsdadÃ£Ã£',-1,'2222-02-12 22:22:00','2222-02-12 22:22:00',4,'2019-07-18 15:12:09');
/*!40000 ALTER TABLE `avs_avisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblioteca`
--

DROP TABLE IF EXISTS `biblioteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biblioteca` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `conteudo` varchar(200) DEFAULT NULL,
  `assunto_fk` int(11) DEFAULT NULL,
  `arquivo` varchar(200) DEFAULT NULL,
  `data_upload` datetime DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca`
--

LOCK TABLES `biblioteca` WRITE;
/*!40000 ALTER TABLE `biblioteca` DISABLE KEYS */;
INSERT INTO `biblioteca` VALUES (7,4,'',0,'material-2019-09-04-16-09-15.','2019-09-04 11:34:15');
/*!40000 ALTER TABLE `biblioteca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblioteca_assunto`
--

DROP TABLE IF EXISTS `biblioteca_assunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biblioteca_assunto` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `assunto` varchar(200) DEFAULT NULL,
  `data_inclusao` datetime DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca_assunto`
--

LOCK TABLES `biblioteca_assunto` WRITE;
/*!40000 ALTER TABLE `biblioteca_assunto` DISABLE KEYS */;
/*!40000 ALTER TABLE `biblioteca_assunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disp_quadro_disponibilidade`
--

DROP TABLE IF EXISTS `disp_quadro_disponibilidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disp_quadro_disponibilidade` (
  `cod_disponibilidade` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  `dataini` date DEFAULT NULL,
  `datafim` date DEFAULT NULL,
  `horaini` time DEFAULT NULL,
  `horafim` time DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_disponibilidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disp_quadro_disponibilidade`
--

LOCK TABLES `disp_quadro_disponibilidade` WRITE;
/*!40000 ALTER TABLE `disp_quadro_disponibilidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `disp_quadro_disponibilidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disp_quadro_disponibilidade_color`
--

DROP TABLE IF EXISTS `disp_quadro_disponibilidade_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disp_quadro_disponibilidade_color` (
  `cod_usuario` int(11) NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disp_quadro_disponibilidade_color`
--

LOCK TABLES `disp_quadro_disponibilidade_color` WRITE;
/*!40000 ALTER TABLE `disp_quadro_disponibilidade_color` DISABLE KEYS */;
INSERT INTO `disp_quadro_disponibilidade_color` VALUES (4,'#18aab1');
/*!40000 ALTER TABLE `disp_quadro_disponibilidade_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disp_quadro_disponibilidade_semanas`
--

DROP TABLE IF EXISTS `disp_quadro_disponibilidade_semanas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disp_quadro_disponibilidade_semanas` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `domingo_1_ini` time DEFAULT NULL,
  `domingo_1_fim` time DEFAULT NULL,
  `domingo_2_ini` time DEFAULT NULL,
  `domingo_2_fim` time DEFAULT NULL,
  `segunda_1_ini` time DEFAULT NULL,
  `segunda_1_fim` time DEFAULT NULL,
  `segunda_2_ini` time DEFAULT NULL,
  `segunda_2_fim` time DEFAULT NULL,
  `terca_1_ini` time DEFAULT NULL,
  `terca_1_fim` time DEFAULT NULL,
  `terca_2_ini` time DEFAULT NULL,
  `terca_2_fim` time DEFAULT NULL,
  `quarta_1_ini` time DEFAULT NULL,
  `quarta_1_fim` time DEFAULT NULL,
  `quarta_2_ini` time DEFAULT NULL,
  `quarta_2_fim` time DEFAULT NULL,
  `quinta_1_ini` time DEFAULT NULL,
  `quinta_1_fim` time DEFAULT NULL,
  `quinta_2_ini` time DEFAULT NULL,
  `quinta_2_fim` time DEFAULT NULL,
  `sexta_1_ini` time DEFAULT NULL,
  `sexta_1_fim` time DEFAULT NULL,
  `sexta_2_ini` time DEFAULT NULL,
  `sexta_2_fim` time DEFAULT NULL,
  `sabado_1_ini` time DEFAULT NULL,
  `sabado_1_fim` time DEFAULT NULL,
  `sabado_2_ini` time DEFAULT NULL,
  `sabado_2_fim` time DEFAULT NULL,
  `data_movimento` datetime DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disp_quadro_disponibilidade_semanas`
--

LOCK TABLES `disp_quadro_disponibilidade_semanas` WRITE;
/*!40000 ALTER TABLE `disp_quadro_disponibilidade_semanas` DISABLE KEYS */;
/*!40000 ALTER TABLE `disp_quadro_disponibilidade_semanas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evts_evento_usuario`
--

DROP TABLE IF EXISTS `evts_evento_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evts_evento_usuario` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `cod_evento_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evts_evento_usuario`
--

LOCK TABLES `evts_evento_usuario` WRITE;
/*!40000 ALTER TABLE `evts_evento_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `evts_evento_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evts_eventos`
--

DROP TABLE IF EXISTS `evts_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evts_eventos` (
  `cod_evento` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `data_ini` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  `local` varchar(200) DEFAULT NULL,
  `valor` decimal(18,2) DEFAULT NULL,
  `site` varchar(200) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evts_eventos`
--

LOCK TABLES `evts_eventos` WRITE;
/*!40000 ALTER TABLE `evts_eventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `evts_eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltr_material_leitura`
--

DROP TABLE IF EXISTS `ltr_material_leitura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ltr_material_leitura` (
  `cod_material` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `base` varchar(100) DEFAULT NULL,
  `data_pesquisa` datetime DEFAULT NULL,
  `titulo_periodico` varchar(200) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `titulo_artigo` varchar(200) DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `pagina_inicial` int(11) DEFAULT NULL,
  `pagina_final` int(11) DEFAULT NULL,
  `interesse` int(11) DEFAULT NULL,
  `arquivo` varchar(50) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  `palavra_chave` varchar(20) DEFAULT NULL,
  `endereco_acesso` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_material`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltr_material_leitura`
--

LOCK TABLES `ltr_material_leitura` WRITE;
/*!40000 ALTER TABLE `ltr_material_leitura` DISABLE KEYS */;
/*!40000 ALTER TABLE `ltr_material_leitura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltr_material_palavra_chaves`
--

DROP TABLE IF EXISTS `ltr_material_palavra_chaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ltr_material_palavra_chaves` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `cod_material_fk` int(11) DEFAULT NULL,
  `cod_palavra_chave_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltr_material_palavra_chaves`
--

LOCK TABLES `ltr_material_palavra_chaves` WRITE;
/*!40000 ALTER TABLE `ltr_material_palavra_chaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `ltr_material_palavra_chaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltr_palavra_chave`
--

DROP TABLE IF EXISTS `ltr_palavra_chave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ltr_palavra_chave` (
  `cod_palavra_chave` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cod_palavra_chave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltr_palavra_chave`
--

LOCK TABLES `ltr_palavra_chave` WRITE;
/*!40000 ALTER TABLE `ltr_palavra_chave` DISABLE KEYS */;
/*!40000 ALTER TABLE `ltr_palavra_chave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_grupo`
--

DROP TABLE IF EXISTS `material_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_grupo` (
  `cod_material` int(11) NOT NULL AUTO_INCREMENT,
  `nivel_escolaridade_fk` int(11) DEFAULT NULL,
  `conteudo_sintetico` varchar(500) DEFAULT NULL,
  `arquivo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_material`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_grupo`
--

LOCK TABLES `material_grupo` WRITE;
/*!40000 ALTER TABLE `material_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mts_metas`
--

DROP TABLE IF EXISTS `mts_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mts_metas` (
  `cod_meta` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(500) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `tipo_atividade_fk` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_meta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mts_metas`
--

LOCK TABLES `mts_metas` WRITE;
/*!40000 ALTER TABLE `mts_metas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mts_metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mts_plano_metas`
--

DROP TABLE IF EXISTS `mts_plano_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mts_plano_metas` (
  `cod_quadro` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_quadro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mts_plano_metas`
--

LOCK TABLES `mts_plano_metas` WRITE;
/*!40000 ALTER TABLE `mts_plano_metas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mts_plano_metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel_escolaridade`
--

DROP TABLE IF EXISTS `nivel_escolaridade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivel_escolaridade` (
  `cod_nivel` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel_escolaridade`
--

LOCK TABLES `nivel_escolaridade` WRITE;
/*!40000 ALTER TABLE `nivel_escolaridade` DISABLE KEYS */;
INSERT INTO `nivel_escolaridade` VALUES (1,'Médio','2019-07-08 10:26:53'),(2,'Superior','2019-07-08 10:26:59'),(7,'Fundamental','2019-09-03 14:59:48');
/*!40000 ALTER TABLE `nivel_escolaridade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qst_questao`
--

DROP TABLE IF EXISTS `qst_questao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qst_questao` (
  `cod_questao` int(11) NOT NULL AUTO_INCREMENT,
  `descricao_pergunta` varchar(500) DEFAULT NULL,
  `cod_questionario_fk` int(11) DEFAULT NULL,
  `tipo_pergunta_fk` int(11) DEFAULT NULL,
  `nivel_escolaridade_fk` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_questao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qst_questao`
--

LOCK TABLES `qst_questao` WRITE;
/*!40000 ALTER TABLE `qst_questao` DISABLE KEYS */;
/*!40000 ALTER TABLE `qst_questao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qst_questao1`
--

DROP TABLE IF EXISTS `qst_questao1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qst_questao1` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `cod_questionario` int(11) DEFAULT NULL,
  `desc_pergunta` varchar(1000) DEFAULT NULL,
  `tipo_pergunta` int(11) DEFAULT NULL,
  `is_sub` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qst_questao1`
--

LOCK TABLES `qst_questao1` WRITE;
/*!40000 ALTER TABLE `qst_questao1` DISABLE KEYS */;
INSERT INTO `qst_questao1` VALUES (46,2,'teste?',1,0,'2019-09-18 12:03:40'),(47,2,'sim',0,1,'2019-09-18 12:03:40'),(48,2,'nao',0,1,'2019-09-18 12:03:40'),(49,2,'voce tem dinheiro',1,0,'2019-09-18 12:04:51'),(50,2,'sim',0,1,'2019-09-18 12:04:51'),(51,2,'nao',0,1,'2019-09-18 12:04:51'),(52,2,'voce tem carro?',1,0,'2019-09-18 12:05:23'),(53,2,'nao sei',0,1,'2019-09-18 12:05:23'),(54,2,'tenhoi',0,1,'2019-09-18 12:05:23'),(55,2,'asdasddssad??',1,0,'2019-09-18 12:06:13'),(56,2,'asdasdsa',0,1,'2019-09-18 12:06:13'),(57,2,'dasdsad',0,1,'2019-09-18 12:06:13'),(58,2,'testeeeeee',1,0,'2019-09-18 12:10:57'),(59,2,'sdadad',0,1,'2019-09-18 12:10:57'),(60,2,'sadsadsad',0,1,'2019-09-18 12:10:57'),(61,2,'asdsadsad',0,1,'2019-09-18 12:10:57'),(62,2,'asdsasadad?',1,0,'2019-09-18 12:14:10'),(63,2,'testestet',0,1,'2019-09-18 12:14:10'),(64,2,'testeste',0,1,'2019-09-18 12:14:10'),(65,2,'etsteteste',0,1,'2019-09-18 12:14:11'),(66,2,'etesteste',0,1,'2019-09-18 12:14:11'),(67,2,'eteste',0,1,'2019-09-18 12:14:11'),(68,2,'asdaadsdasdsaadssad',1,0,'2019-09-18 12:14:32'),(69,2,'dadad',0,1,'2019-09-18 12:14:32'),(70,2,'adadads',0,1,'2019-09-18 12:14:32'),(71,2,'testeeeeee',1,0,'2019-09-18 12:29:53'),(72,2,'sadadadasd',0,1,'2019-09-18 12:29:53'),(73,2,'sadsadsadasada',0,1,'2019-09-18 12:29:53'),(74,2,'sadasadadasd',0,1,'2019-09-18 12:29:53'),(75,2,'teeeeeeeeeeeeeeeeeeeeeeee',1,0,'2019-09-18 12:32:44'),(76,2,'asdsadasd',0,1,'2019-09-18 12:32:44'),(77,2,'asdasdsad',0,1,'2019-09-18 12:32:44');
/*!40000 ALTER TABLE `qst_questao1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qst_questao_dependencia`
--

DROP TABLE IF EXISTS `qst_questao_dependencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qst_questao_dependencia` (
  `cod_dependencia` int(11) NOT NULL AUTO_INCREMENT,
  `cod_questao_dependente` int(11) DEFAULT NULL,
  `cod_questao` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_dependencia`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qst_questao_dependencia`
--

LOCK TABLES `qst_questao_dependencia` WRITE;
/*!40000 ALTER TABLE `qst_questao_dependencia` DISABLE KEYS */;
INSERT INTO `qst_questao_dependencia` VALUES (40,46,0),(41,47,46),(42,48,46),(43,49,0),(44,50,49),(45,51,49),(46,52,0),(47,53,52),(48,54,52),(49,55,0),(50,56,55),(51,57,55),(52,58,0),(53,59,58),(54,60,58),(55,61,58),(56,62,0),(57,63,62),(58,64,62),(59,65,62),(60,66,62),(61,67,62),(62,68,0),(63,69,68),(64,70,68),(65,71,0),(66,72,71),(67,73,71),(68,74,71),(69,75,0),(70,76,75),(71,77,75);
/*!40000 ALTER TABLE `qst_questao_dependencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qst_questionario`
--

DROP TABLE IF EXISTS `qst_questionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qst_questionario` (
  `cod_questionario` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(500) DEFAULT NULL,
  `status_questionario` int(11) DEFAULT NULL,
  `cod_tipo_fk` int(11) DEFAULT NULL,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_questionario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qst_questionario`
--

LOCK TABLES `qst_questionario` WRITE;
/*!40000 ALTER TABLE `qst_questionario` DISABLE KEYS */;
INSERT INTO `qst_questionario` VALUES (1,'teste',1,1,4,'2019-09-09 15:16:08'),(2,'questionario de teste',1,1,4,'2019-09-09 16:00:33');
/*!40000 ALTER TABLE `qst_questionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qst_respostas`
--

DROP TABLE IF EXISTS `qst_respostas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qst_respostas` (
  `cod_resposta` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(500) DEFAULT NULL,
  `is_correta` int(11) DEFAULT NULL,
  `cod_questao_fk` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_resposta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qst_respostas`
--

LOCK TABLES `qst_respostas` WRITE;
/*!40000 ALTER TABLE `qst_respostas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qst_respostas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qst_tipo_pergunta`
--

DROP TABLE IF EXISTS `qst_tipo_pergunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qst_tipo_pergunta` (
  `cod_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao_tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qst_tipo_pergunta`
--

LOCK TABLES `qst_tipo_pergunta` WRITE;
/*!40000 ALTER TABLE `qst_tipo_pergunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `qst_tipo_pergunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qst_tipo_questionario`
--

DROP TABLE IF EXISTS `qst_tipo_questionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qst_tipo_questionario` (
  `cod_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `descricacao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qst_tipo_questionario`
--

LOCK TABLES `qst_tipo_questionario` WRITE;
/*!40000 ALTER TABLE `qst_tipo_questionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `qst_tipo_questionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reu_atas`
--

DROP TABLE IF EXISTS `reu_atas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reu_atas` (
  `cod_ata` int(11) NOT NULL AUTO_INCREMENT,
  `data_inclusao` datetime DEFAULT NULL,
  `conteudo` varchar(100) DEFAULT NULL,
  `texto` varchar(500) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `usuario_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_ata`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reu_atas`
--

LOCK TABLES `reu_atas` WRITE;
/*!40000 ALTER TABLE `reu_atas` DISABLE KEYS */;
/*!40000 ALTER TABLE `reu_atas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reu_reuniao`
--

DROP TABLE IF EXISTS `reu_reuniao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reu_reuniao` (
  `cod_reuniao` int(11) NOT NULL AUTO_INCREMENT,
  `data_criacao` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_reuniao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reu_reuniao`
--

LOCK TABLES `reu_reuniao` WRITE;
/*!40000 ALTER TABLE `reu_reuniao` DISABLE KEYS */;
/*!40000 ALTER TABLE `reu_reuniao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reu_reuniao_usuario`
--

DROP TABLE IF EXISTS `reu_reuniao_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reu_reuniao_usuario` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `cod_reuniao_fk` int(11) DEFAULT NULL,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reu_reuniao_usuario`
--

LOCK TABLES `reu_reuniao_usuario` WRITE;
/*!40000 ALTER TABLE `reu_reuniao_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `reu_reuniao_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_aplicacoes`
--

DROP TABLE IF EXISTS `sys_aplicacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_aplicacoes` (
  `cod_aplicacao` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) DEFAULT NULL,
  `pagina` varchar(200) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `submenu` int(11) DEFAULT NULL,
  `ativo` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_aplicacao`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_aplicacoes`
--

LOCK TABLES `sys_aplicacoes` WRITE;
/*!40000 ALTER TABLE `sys_aplicacoes` DISABLE KEYS */;
INSERT INTO `sys_aplicacoes` VALUES (1,'Atas de Reuniões','atas','/atas',0,1),(2,'Biblioteca','biblioteca','/biblioteca',0,1),(3,'Cadastrar','pre-cadastro','/pre-cadastro',0,1),(4,'Chat','chat','/chat',0,0),(5,'E-mail','email','',0,1),(6,'Enviar E-mail','email','/email/enviar',5,1),(7,'Meus E-mail','email','/email',5,1),(8,'Quadro de Avisos','avisos','/avisos',0,1),(9,'Quadro de Disponibilidade','quadro-disponibilidade','/quadro-disponibilidade',0,1),(10,'Quadro de Eventos','eventos','/eventos',0,1),(11,'Quadro de Literatura','quadro-leitura','/quadro-leitura',0,1),(12,'Níveis de Escolaridade','escolaridade','/escolaridade',0,1),(13,'Plano de Atividades','plano-atividades','/plano-atividades',0,1),(14,'Plano de Metas','plano-metas','/plano-metas',0,1),(15,'Produção de Grupo','producao-grupo','/producao-grupo',0,1),(16,'Questionários','questionario','',0,1),(17,'Aprendizagem','questionario','/questionario/aprendizagem',16,1),(18,'Cadastro','cadastro','/questionario/cadastro',16,1),(19,'Trabalhos de Correção','trabalho-correcao','',0,1),(20,'Meus Trabalhos','trabalho-correcao','/trabalho-correcao',19,1),(21,'Trabalhos Recebidos','trabalho-correcao','/trabalho-correcao/recebidos',19,1),(22,'Usuários','usuarios','',0,1),(24,'Membros','membros','/usuarios/membros',22,1),(25,'Portfolio','portfolio','/portfolio',0,1),(26,'Configurações','configuracao','',0,1),(27,'Meu Perfil','perfil','/perfil',26,1),(28,'Alterar Senha','alterar-senha','/perfil/alterar-senha',26,1),(29,'Questionário Inicial','questionario','/questionario/inicial',0,1),(30,'Assuntos','assunto','/assunto',0,1);
/*!40000 ALTER TABLE `sys_aplicacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_aplicacoes_permissao`
--

DROP TABLE IF EXISTS `sys_aplicacoes_permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_aplicacoes_permissao` (
  `tipo_usuario` int(11) DEFAULT NULL,
  `aplicacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_aplicacoes_permissao`
--

LOCK TABLES `sys_aplicacoes_permissao` WRITE;
/*!40000 ALTER TABLE `sys_aplicacoes_permissao` DISABLE KEYS */;
INSERT INTO `sys_aplicacoes_permissao` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(0,29),(1,30);
/*!40000 ALTER TABLE `sys_aplicacoes_permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log_acesso_aplicacao`
--

DROP TABLE IF EXISTS `sys_log_acesso_aplicacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log_acesso_aplicacao` (
  `cod_log` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario` int(11) DEFAULT NULL,
  `controller` varchar(200) DEFAULT NULL,
  `action` varchar(200) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `server` varchar(100) DEFAULT NULL,
  `params` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`cod_log`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log_acesso_aplicacao`
--

LOCK TABLES `sys_log_acesso_aplicacao` WRITE;
/*!40000 ALTER TABLE `sys_log_acesso_aplicacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_log_acesso_aplicacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_meses`
--

DROP TABLE IF EXISTS `sys_meses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_meses` (
  `mes` int(11) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `abrev` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_meses`
--

LOCK TABLES `sys_meses` WRITE;
/*!40000 ALTER TABLE `sys_meses` DISABLE KEYS */;
INSERT INTO `sys_meses` VALUES (1,'Janeiro','Jan'),(2,'Fevereiro','Fev'),(3,'Março','Mar'),(4,'Abril','Abr'),(5,'Maio','Mai'),(6,'Junho','Jun'),(7,'Julho','Jul'),(8,'Agosto','Ago'),(9,'Setembro','Set'),(10,'Outubro','Out'),(11,'Novembro','Nov'),(12,'Dezembro','Dez');
/*!40000 ALTER TABLE `sys_meses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_dates`
--

DROP TABLE IF EXISTS `temp_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_dates` (
  `dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_dates`
--

LOCK TABLES `temp_dates` WRITE;
/*!40000 ALTER TABLE `temp_dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trbl_correcao_trabalho`
--

DROP TABLE IF EXISTS `trbl_correcao_trabalho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trbl_correcao_trabalho` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `destinatario_fk` int(11) DEFAULT NULL,
  `reemetente_fk` int(11) DEFAULT NULL,
  `arquivo` varchar(50) DEFAULT NULL,
  `observacao` varchar(500) DEFAULT NULL,
  `data_enviado` datetime DEFAULT NULL,
  `data_correcao` datetime DEFAULT NULL,
  `corrigido` int(11) DEFAULT NULL,
  `modalidade_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trbl_correcao_trabalho`
--

LOCK TABLES `trbl_correcao_trabalho` WRITE;
/*!40000 ALTER TABLE `trbl_correcao_trabalho` DISABLE KEYS */;
/*!40000 ALTER TABLE `trbl_correcao_trabalho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trbl_tipo_modalidade`
--

DROP TABLE IF EXISTS `trbl_tipo_modalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trbl_tipo_modalidade` (
  `cod_modalidade` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_modalidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trbl_tipo_modalidade`
--

LOCK TABLES `trbl_tipo_modalidade` WRITE;
/*!40000 ALTER TABLE `trbl_tipo_modalidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `trbl_tipo_modalidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_acesso`
--

DROP TABLE IF EXISTS `us_acesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `us_acesso` (
  `cod_usuario_fk` int(11) NOT NULL,
  `login` varchar(200) DEFAULT NULL,
  `senha` varchar(1000) DEFAULT NULL,
  `situacao` int(11) NOT NULL,
  PRIMARY KEY (`cod_usuario_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_acesso`
--

LOCK TABLES `us_acesso` WRITE;
/*!40000 ALTER TABLE `us_acesso` DISABLE KEYS */;
INSERT INTO `us_acesso` VALUES (4,'sandragp@marilia.unesp.br','202cb962ac59075b964b07152d234b70',1),(14,'denilson@hotmail.com','202cb962ac59075b964b07152d234b70',1),(15,'teste@teste.com','202cb962ac59075b964b07152d234b70',0),(16,'teste@teste1.com','202cb962ac59075b964b07152d234b70',1);
/*!40000 ALTER TABLE `us_acesso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_foto_perfil`
--

DROP TABLE IF EXISTS `us_foto_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `us_foto_perfil` (
  `cod_usuario_fk` int(11) NOT NULL,
  `nome_foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_usuario_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_foto_perfil`
--

LOCK TABLES `us_foto_perfil` WRITE;
/*!40000 ALTER TABLE `us_foto_perfil` DISABLE KEYS */;
INSERT INTO `us_foto_perfil` VALUES (4,'foto-perfil-4-19-09-16-17-37-00.jpg');
/*!40000 ALTER TABLE `us_foto_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_pre_cadastro`
--

DROP TABLE IF EXISTS `us_pre_cadastro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `us_pre_cadastro` (
  `cod_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `nivel_escolaridade_fk` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  `situacao` int(11) DEFAULT NULL,
  `adm` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_pre_cadastro`
--

LOCK TABLES `us_pre_cadastro` WRITE;
/*!40000 ALTER TABLE `us_pre_cadastro` DISABLE KEYS */;
INSERT INTO `us_pre_cadastro` VALUES (4,'Sandra','sandragp@marilia.unesp.br',1,'2019-09-16 14:45:05',2,0);
/*!40000 ALTER TABLE `us_pre_cadastro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_tipo_usuario`
--

DROP TABLE IF EXISTS `us_tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `us_tipo_usuario` (
  `cod_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_tipo_usuario`
--

LOCK TABLES `us_tipo_usuario` WRITE;
/*!40000 ALTER TABLE `us_tipo_usuario` DISABLE KEYS */;
INSERT INTO `us_tipo_usuario` VALUES (0,'Pré-Cadastro'),(1,'Administrador'),(2,'Membro');
/*!40000 ALTER TABLE `us_tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_usuario`
--

DROP TABLE IF EXISTS `us_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `us_usuario` (
  `cod_usuario` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `email2` varchar(200) DEFAULT NULL,
  `nivel_escolaridade_fk` int(11) DEFAULT NULL,
  `tipo_usuario_fk` int(11) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `fixo` varchar(15) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `curso_atual_nome` varchar(100) DEFAULT NULL,
  `curso_atual_serie` int(11) DEFAULT NULL,
  `curso_tipo_estudante` int(11) DEFAULT NULL,
  `curso_periodo` varchar(20) DEFAULT NULL,
  `graduacao_atual` varchar(100) DEFAULT NULL,
  `graduacao_ano_conclusao` int(11) DEFAULT NULL,
  `graduacao_instituicao` varchar(100) DEFAULT NULL,
  `pos_graduacao_nome` varchar(100) DEFAULT NULL,
  `pos_graduacao_ano` int(11) DEFAULT NULL,
  `pos_graduacao_instituicao` varchar(100) DEFAULT NULL,
  `estado_civil` varchar(30) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `data_nascimento` datetime DEFAULT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `orgao_emissor` varchar(50) DEFAULT NULL,
  `ra` varchar(50) DEFAULT NULL,
  `skype` varchar(100) DEFAULT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `lattes` varchar(100) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `num_banco` int(11) DEFAULT NULL,
  `num_conta` int(11) DEFAULT NULL,
  `num_agencia` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `emp_nome` varchar(100) DEFAULT NULL,
  `emp_endereco` varchar(200) DEFAULT NULL,
  `emp_numero` int(11) DEFAULT NULL,
  `emp_complemento` varchar(100) DEFAULT NULL,
  `emp_cidade` varchar(100) DEFAULT NULL,
  `emp_bairro` varchar(200) DEFAULT NULL,
  `emp_estado` varchar(2) DEFAULT NULL,
  `emp_num` varchar(45) DEFAULT NULL,
  `emp_cep` varchar(8) DEFAULT NULL,
  `emp_telefone` varchar(20) DEFAULT NULL,
  `emp_celular` varchar(20) DEFAULT NULL,
  `data_entrada` datetime DEFAULT NULL,
  `ativo` int(11) DEFAULT NULL,
  `agencia` varchar(45) DEFAULT NULL,
  `conta` varchar(45) DEFAULT NULL,
  `us_usuariocol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_usuario`
--

LOCK TABLES `us_usuario` WRITE;
/*!40000 ALTER TABLE `us_usuario` DISABLE KEYS */;
INSERT INTO `us_usuario` VALUES (4,'Sandra Regina Gimeniz',NULL,NULL,NULL,'sandragp@marilia.unesp.br','gabriel2@hotmail.com',2,1,'Rua teste','01','Casa','Marília','Bairro teste','SP','14405101','33443344','14997846430','Análise e Desenvolvimento de Sistemas',6,0,'Noite','Análise e Desenvolvimento de Sistemas',2019,'FATEC','',0,'','solteiro','M','1998-02-20 00:00:00','','','','','','','','',0,0,0,1,'Kplay','Rua Humberto',818,'Edificio','Piraju',NULL,'SP',NULL,'18800000','1433443030','14997846431','2019-07-08 10:34:56',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `us_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'edaci'
--
/*!50003 DROP FUNCTION IF EXISTS `sys_gerarSenha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `sys_gerarSenha`() RETURNS varchar(500) CHARSET utf8mb4
begin
	declare v_codigo bigint; 
    declare v_complemento bigint;
    declare v_c1 varchar(500);
    declare v_x1 int;
    declare v_x2 int;
	declare v_r1 double; 
    declare v_l1 varchar(5);
    declare v_l2 varchar(5);  declare v_l3 varchar(5);

	select rand() as rand into v_r1;
    
    set v_x1= cast(v_r1*20 as UNSIGNED) + 1, v_x2= cast(v_r1*400 as UNSIGNED) + 1;
    
	set v_codigo=datepart(second,now())*datepart(minute,timestampadd(minute,v_x1,now()));
    
	set v_codigo=datepart(minute,now())+v_codigo;
    
	if (datepart(second,now())<30) then
		set v_complemento = datepart(minute,timestampadd(minute,v_x2,now()))*v_x1;
	else
		set v_complemento = datepart(minute,now())*v_x2;
	end if;
    
	set v_l1=substring(datename(month,timestampadd(month,v_x1*3,now())),3,1);
    
	set v_l2=substring(datename(weekday,timestampadd(month,v_x1*1,now())),2,1);
    
	set v_l3=substring(datename(month,timestampadd(month,v_x1*1,now())),1,1);
    
	set v_c1=left(convert(v_x2, char(100)),1) + v_l1 + left(concat(convert(v_codigo, char(100))
		,date_format(v_complemento,0)),1)+v_l2 + convert(v_x1, char(100)) + v_l3;
	set v_c1=upper(dbo.shuffle(replace(replace(v_c1,'o','B'),'I','g')));

	return v_c1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lista_questionario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lista_questionario`(
	in cod_questionario int
)
proc_name:
BEGIN
	
    create temporary table final1(cod_questao int, cod_questao_up int, desc_pergunta varchar(100), tipo_pergunta int, is_sub int);
    create temporary table final3(cod_questao int, cod_questao_up int, desc_pergunta varchar(100), tipo_pergunta int, is_sub int);

	insert into final1
	select b.cod, b.cod, b.desc_pergunta,b.tipo_pergunta,b.is_sub
	from qst_questionario a
		inner join qst_questao1 b on a.cod_questionario = b.cod_questionario
	where is_sub = 0 and a.cod_questionario = 1;
    
    while exists(select * from final1 limit 1) do
    begin
		select * from final1 limit 1;
        
        delete from final1 limit 1;
    end;
    end while;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sys_listarMenu_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sys_listarMenu_sp`(
	IN cod_usuario int,
    IN tipo int,
    IN tipo_usuario int
)
BEGIN
	
    select *
    from sys_aplicacoes a
		inner join sys_aplicacoes_permissao b on a.cod_aplicacao = b.aplicacao
	where ((tipo = 1 and submenu = 0) or (tipo = 2 and submenu <> 0))
		and tipo_usuario = b.tipo_usuario
        and ativo = 1
    order by a.titulo asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sys_Login_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sys_Login_sp`(
	in login varchar(200)
)
proc_name:
BEGIN

	declare cod_usuario int;
    declare senha_usuario varchar(8000);
    
	if (select count(0) from us_acesso a where a.login = login) = 0 
    then
			select '1' as cod, 'Senha ou/e Login não estão corretos.' as msg;
			leave proc_name;
    end if;
    
    set senha_usuario = (select a.senha from us_acesso a where a.login = login);
    
    if (select count(0) from us_pre_cadastro a where a.email = login and situacao = 0) = 1 -- Pré-cadastro pendente de aceitação
    then
			select '1' as cod, senha_usuario, 'A aceitação de seu pré-cadastro está pendente.' as msg;
			leave proc_name;
    end if;
    
    if (select count(0) from us_pre_cadastro a where a.email = login and situacao = 3) = 1 -- Pré-cadastro não foi aceito pelo adm 
    then
			select '1' as cod, senha_usuario, 'Seu pré-cadastro não foi aceito pelo Administrador.' as msg;
			leave proc_name;
    end if;
    
    if (select count(0) from us_acesso a where a.login = login and situacao = 0) = 1 
    then
			select '1' as cod, senha_usuario, 'Esse usuário foi desativado.<br>Entre em contato com o Administrador do grupo.' as msg;
			leave proc_name;
    end if;
    
    -- situacoes: 0) Pré-cadastro pendente de aceitação 1) Pré-cadastro aceito 2) Pré-cadastro finalizado 3) Pré-cadastro rejeitado pelo adm
    
    select '0' as cod, senha_usuario, cod_usuario_fk as cod_usuario from us_acesso a where a.login = login;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sys_novoPreCadastro_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sys_novoPreCadastro_sp`(
	in nome varchar(200),
    in email varchar(200),
    in escolaridade int,
    in senha varchar(1000),
    in adm int
)
proc_name:
BEGIN

	declare cod_usuario int;
    
	if (select count(0) from us_pre_cadastro a where a.email = email) 
    then
			select '1' as cod, 'Esse email já está cadastrado.' as msg;
			leave proc_name;
    end if;
    
    if (select count(0) from us_acesso a where a.login = email) 
    then
			select '1' as cod, 'Esse email já está cadastrado.' as msg;
			leave proc_name;
    end if;
    
    if adm = 1
    then
		-- caso o pré-cadastro seja feito pelo adm
		insert into us_pre_cadastro(nome,email,nivel_escolaridade_fk,data_criacao,situacao,adm) values(nome,email,escolaridade,now(),1,1);
    
		set cod_usuario = (select a.cod_usuario from us_pre_cadastro a where a.email = email);
    
		insert into us_acesso(cod_usuario_fk, login, senha, situacao) values (cod_usuario, email, senha, 1);
        
        insert into us_foto_perfil(cod_usuario_fk, nome_foto) values (cod_usuario, '');
    
		select '0' as cod, 'Pré-cadastro realizado com sucesso.<br>As informações de acesso ao sistema, foram enviadas ao email do novo membro.' as msg;
	else
		-- fluxo normal
		insert into us_pre_cadastro(nome,email,nivel_escolaridade_fk,data_criacao,situacao,adm) values(nome,email,escolaridade,now(),0,0);
    
		set cod_usuario = (select a.cod_usuario from us_pre_cadastro a where a.email = email);
    
		insert into us_acesso(cod_usuario_fk, login, senha, situacao) values (cod_usuario, email, senha, 0);
        
        insert into us_foto_perfil(cod_usuario_fk, nome_foto) values (cod_usuario, '');
    
		select '0' as cod, 'Seu pré-cadastro foi realizado com sucesso.<br>Aguarde até que ele seja aceito.' as msg;
	end if;
    
    
    
    -- us_acesso situacooes = 0)Bloqueado 1)Ativo
    
    -- us_pre_cadastro situacoes = 0) Pré-cadastro pendente de aceitação 1) Pré-cadastro aceito 2) Pré-cadastro finalizado 3) Pré-cadastro rejeitado pelo adm
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `us_aceitarPreCadastro_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `us_aceitarPreCadastro_sp`(
	in adm int,
    in usuario int,
    in aceitar int
)
proc_name:
BEGIN
    
    update us_pre_cadastro set situacao = aceitar
    where cod_usuario = usuario;
    
    if aceitar = 2
    then
			select '0' as cod, 'Pré-Cadastro recusado com sucesso.' as msg;
			leave proc_name;
    end if;
    
    if aceitar = 1
    then
			update us_acesso set situacao = 1
            where cod_usuario_fk = usuario;
			
            select '0' as cod, 'Pré-Cadastro aceito com sucesso.' as msg;
			leave proc_name;
    end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `us_buscarAssunto_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarAssunto_sp`(
	In filtro int,
    in pesquisa varchar(100),
    in cod_assunto int
)
BEGIN

	set pesquisa = CONCAT('%',pesquisa,'%');
    
    
    if cod_assunto = 0 then

		if filtro = 1 then
		
			select cod,assunto,date_format(data_inclusao, "%d/%m/%Y %H:%i:%s") as dt_convert,b.nome as usuario
            from biblioteca_assunto a
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
            where a.assunto like pesquisa;
			
		else
		
			select cod,assunto,date_format(data_inclusao, "%d/%m/%Y %H:%i:%s") as dt_convert,b.nome as usuario
            from biblioteca_assunto a
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
            where b.nome like pesquisa;
			
		end if;
        
    else
    
		select cod,assunto,date_format(data_inclusao, "%d/%m/%Y %H:%i:%s") as dt_convert,b.nome as usuario
		from biblioteca_assunto a
			inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
		where cod = cod_assunto;
    
    end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `us_buscarAtas_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarAtas_sp`(
	In filtro int,
    in pesquisa varchar(100),
    in cod_atas int
)
BEGIN

	set pesquisa = CONCAT('%',pesquisa,'%');
    
    
    if cod_atas = 0 then

		if filtro = 1 then
		
			select cod_ata,conteudo,texto,data_inclusao,date_format(data, "%d/%m/%Y %H:%i:%s") as dt_convert,b.nome as usuario
            from reu_atas a
				inner join us_usuario b on a.usuario_fk = b.cod_usuario
            where a.conteudo like pesquisa;
			
		else
		
			select cod_ata,conteudo,texto,data_inclusao,date_format(data, "%d/%m/%Y %H:%i:%s") as dt_convert,b.nome as usuario
            from reu_atas a
				inner join us_usuario b on a.usuario_fk = b.cod_usuario
            where b.nome like pesquisa;
			
		end if;
        
    else
    
		select cod_ata,conteudo,texto,data_inclusao,date_format(data, "%d/%m/%Y %H:%i:%s") as dt_convert,b.nome as usuario,
        date_format(data, "%Y-%m-%d") as dt_only,
        date_format(data, "%H:%i") as hr_only
        from reu_atas a
			inner join us_usuario b on a.usuario_fk = b.cod_usuario
        where a.cod_ata = cod_atas;
    
    end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `us_buscarAtividades_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarAtividades_sp`(
	In filtro int,
    in pesquisa varchar(100),
    in cod_atividade int,
    in dt_ini date,
    in dt_fim date,
    in is_adm int
)
BEGIN

	set pesquisa = CONCAT('%',pesquisa,'%');
    
    
    if cod_atividade = 0 then

		if filtro = 1 then
			
			select a.cod_atividade as cod, a.descricao, CONCAT(mes,'-',ano) as mes_ano, c.descricao as tipo_atividade, d.descricao as status, b.nome as usuario
			from atvs_plano_atividades a
				inner join us_usuario b on b.cod_usuario = a.cod_usuario_fk
				inner join atvs_plano_atividades_tipo c on a.tipo_atividade_fk = c.cod
                inner join atvs_plano_atividades_status d on a.status = d.cod
			where 
				(dt_ini is null and dt_fim is null) or ((dt_ini is not null and dt_fim is not null) and (cast(concat(a.ano,'-',a.mes,'-','01') as date) between dt_ini and dt_fim))
				and
				c.descricao like pesquisa
			order by data_criacao desc;
			
		elseif filtro = 2 then
			
			select a.cod_atividade as cod, a.descricao, CONCAT(mes,'-',ano) as mes_ano, c.descricao as tipo_atividade, d.descricao as status, b.nome as usuario
			from atvs_plano_atividades a
				inner join us_usuario b on b.cod_usuario = a.cod_usuario_fk
				inner join atvs_plano_atividades_tipo c on a.tipo_atividade_fk = c.cod
                inner join atvs_plano_atividades_status d on a.status = d.cod
			where 
				(dt_ini is null and dt_fim is null) or ((dt_ini is not null and dt_fim is not null) and (cast(concat(a.ano,'-',a.mes,'-','01') as date) between dt_ini and dt_fim))
				and
				d.descricao like pesquisa
			order by data_criacao desc;
            
        elseif filtro = 3 then
        
			
			select a.cod_atividade as cod, a.descricao, CONCAT(mes,'-',ano) as mes_ano, c.descricao as tipo_atividade, d.descricao as status, b.nome as usuario
			from atvs_plano_atividades a
				inner join us_usuario b on b.cod_usuario = a.cod_usuario_fk
				inner join atvs_plano_atividades_tipo c on a.tipo_atividade_fk = c.cod
                inner join atvs_plano_atividades_status d on a.status = d.cod
			where 
				(dt_ini is null and dt_fim is null) or ((dt_ini is not null and dt_fim is not null) and (cast(concat(a.ano,'-',a.mes,'-','01') as date) between dt_ini and dt_fim))
				and
				a.mes like pesquisa
			order by data_criacao desc;
        
        elseif filtro = 4 then
        
			
			select a.cod_atividade as cod, a.descricao, CONCAT(mes,'-',ano) as mes_ano, c.descricao as tipo_atividade, d.descricao as status, b.nome as usuario
			from atvs_plano_atividades a
				inner join us_usuario b on b.cod_usuario = a.cod_usuario_fk
				inner join atvs_plano_atividades_tipo c on a.tipo_atividade_fk = c.cod
                inner join atvs_plano_atividades_status d on a.status = d.cod
			where 
				(dt_ini is null and dt_fim is null) or ((dt_ini is not null and dt_fim is not null) and (cast(concat(a.ano,'-',a.mes,'-','01') as date) between dt_ini and dt_fim))
				and
				a.ano like pesquisa
			order by data_criacao desc;
			
		elseif filtro = 5 then
        
			
			select a.cod_atividade as cod, a.descricao, CONCAT(mes,'-',ano) as mes_ano, c.descricao as tipo_atividade, d.descricao as status, b.nome as usuario
			from atvs_plano_atividades a
				inner join us_usuario b on b.cod_usuario = a.cod_usuario_fk
				inner join atvs_plano_atividades_tipo c on a.tipo_atividade_fk = c.cod
                inner join atvs_plano_atividades_status d on a.status = d.cod
			where 
				(dt_ini is null and dt_fim is null) or ((dt_ini is not null and dt_fim is not null) and (cast(concat(a.ano,'-',a.mes,'-','01') as date) between dt_ini and dt_fim))
				and
				b.nome like pesquisa
			order by data_criacao desc;
        
        else 
			
			select a.cod_atividade as cod, a.descricao, CONCAT(mes,'-',ano) as mes_ano, c.descricao as tipo_atividade, d.descricao as status, b.nome as usuario
			from atvs_plano_atividades a
				inner join us_usuario b on b.cod_usuario = a.cod_usuario_fk
				inner join atvs_plano_atividades_tipo c on a.tipo_atividade_fk = c.cod
                inner join atvs_plano_atividades_status d on a.status = d.cod
			order by data_criacao desc;
			
		end if;
		
    else 
    
		select a.cod_atividade as cod, a.descricao, CONCAT(mes,'-',ano) as mes_ano, c.descricao as tipo_atividade, d.descricao as status, b.nome as usuario
		from atvs_plano_atividades a
			inner join us_usuario b on b.cod_usuario = a.cod_usuario_fk
			inner join atvs_plano_atividades_tipo c on a.tipo_atividade_fk = c.cod
			inner join atvs_plano_atividades_status d on a.status = d.cod
		where 
			a.cod_atividade = cod_atividade;
    
    end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `us_buscarAvisos2_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarAvisos2_sp`(
	In filtro int,
    in pesquisa varchar(100),
    in cod_aviso int
)
BEGIN

	set pesquisa = CONCAT('%',pesquisa,'%');
    
    
    if cod_aviso = 0 then

		if filtro = 1 then
		
			select a.cod_aviso,a.assunto as aviso_assunto, a.descricao as aviso_desc, b.descricao, b.cod_nivel,
				date_format(inicio_exibicao, "%d/%m/%Y %H:%i:%s") as inicio_exibicao,
				date_format(fim_exibicao, "%d/%m/%Y %H:%i:%s") as fim_exibicao,
                date_format(inicio_exibicao, "%d/%m/%Y") as inicio_exibicao_dt,
				date_format(fim_exibicao, "%d/%m/%Y") as fim_exibicao_dt,
                date_format(inicio_exibicao, "%H:%i:%s") as inicio_hora,
                date_format(fim_exibicao, "%H:%i:%s") as fim_hora,
                date_format(inicio_exibicao, "%Y-%m-%d") as date_ini,
                date_format(fim_exibicao, "%Y-%m-%d") as date_fim,
				inicio_exibicao as date_ini,
                fim_exibicao as date_fim
			from avs_avisos a
				inner join nivel_escolaridade b on a.nivel_escolaridade_fk = b.cod_nivel
			where a.assunto like pesquisa
			order by data_cadastro;
			
		else
		
			select a.cod_aviso,a.assunto as aviso_assunto, a.descricao as aviso_desc, b.descricao, b.cod_nivel,
				date_format(inicio_exibicao, "%d/%m/%Y %H:%i:%s") as inicio_exibicao,
				date_format(fim_exibicao, "%d/%m/%Y %H:%i:%s") as fim_exibicao,
                date_format(inicio_exibicao, "%d/%m/%Y") as inicio_exibicao_dt,
				date_format(fim_exibicao, "%d/%m/%Y") as fim_exibicao_dt,
                date_format(inicio_exibicao, "%H:%i:%s") as inicio_hora,
                date_format(fim_exibicao, "%H:%i:%s") as fim_hora,
                date_format(inicio_exibicao, "%Y-%m-%d") as date_ini,
                date_format(fim_exibicao, "%Y-%m-%d") as date_fim,
				inicio_exibicao as date_ini,
                fim_exibicao as date_fim
			from avs_avisos a
				inner join nivel_escolaridade b on a.nivel_escolaridade_fk = b.cod_nivel
			where b.descricao like pesquisa
			order by data_cadastro;
			
		end if;
        
    else
    
		select a.cod_aviso,a.assunto as aviso_assunto, a.descricao as aviso_desc, b.descricao, b.cod_nivel,
				date_format(inicio_exibicao, "%d/%m/%Y %H:%i:%s") as inicio_exibicao,
				date_format(fim_exibicao, "%d/%m/%Y %H:%i:%s") as fim_exibicao,
                date_format(inicio_exibicao, "%d/%m/%Y") as inicio_exibicao_dt,
				date_format(fim_exibicao, "%d/%m/%Y") as fim_exibicao_dt,
                date_format(inicio_exibicao, "%H:%i:%s") as inicio_hora,
                date_format(fim_exibicao, "%H:%i:%s") as fim_hora,
                date_format(inicio_exibicao, "%Y-%m-%d") as date_ini,
                date_format(fim_exibicao, "%Y-%m-%d") as date_fim
			from avs_avisos a
			inner join nivel_escolaridade b on a.nivel_escolaridade_fk = b.cod_nivel
		where a.cod_aviso = cod_aviso
		order by data_cadastro;
    
    end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `us_buscarAvisos_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarAvisos_sp`(
	IN cod_usuario int
)
BEGIN
	
	IF (select u.tipo_usuario_fk from us_usuario u where u.cod_usuario = cod_usuario) = 1 THEN
		select *,date_format(inicio_exibicao, "%d/%m/%Y %H:%i:%s") as dt_convert
		from avs_avisos 
                where now() between inicio_exibicao and fim_exibicao;
	ELSE
		select a.*,date_format(inicio_exibicao, "%d/%m/%Y %H:%i:%s") as dt_convert
		from avs_avisos a
			inner join us_usuario b on a.nivel_escolaridade_fk = b.nivel_escolaridade_fk
		where b.cod_usuario = cod_usuario and now() between a.inicio_exibicao and a.fim_exibicao;
	
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `us_buscarBiblioteca_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarBiblioteca_sp`(
	In filtro int,
    in pesquisa varchar(100),
    in cod_material int
)
BEGIN

	set pesquisa = CONCAT('%',pesquisa,'%');
    
    
    if cod_material = 0 then

		if filtro = 1 then
		
			select a.cod, a.conteudo, c.cod as cod_assunto, c.assunto, b.nome as usuario, a.arquivo, date_format(a.data_upload, "%d/%m/%Y %H:%i:%s") as data_upload
            from biblioteca a
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
                inner join biblioteca_assunto c on c.cod = a.assunto_fk
			where a.conteudo like pesquisa
			order by data_upload desc;
			
		elseif filtro = 2 then
			
            select a.cod, a.conteudo, c.cod as cod_assunto, c.assunto, b.nome as usuario, a.arquivo, date_format(a.data_upload, "%d/%m/%Y %H:%i:%s") as data_upload
            from biblioteca a
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
                inner join biblioteca_assunto c on c.cod = a.assunto_fk
			where b.nome like pesquisa
			order by data_upload desc;
        
        elseif filtro = 3 then
        
			select a.cod, a.conteudo, c.cod as cod_assunto, c.assunto, b.nome as usuario, a.arquivo, date_format(a.data_upload, "%d/%m/%Y %H:%i:%s") as data_upload
            from biblioteca a
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
                inner join biblioteca_assunto c on c.cod = a.assunto_fk
			where c.assunto like pesquisa
			order by data_upload desc;
        
        else 
        
			select a.cod, a.conteudo, c.cod as cod_assunto, c.assunto, b.nome as usuario, a.arquivo, date_format(a.data_upload, "%d/%m/%Y %H:%i:%s") as data_upload
            from biblioteca a
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
                inner join biblioteca_assunto c on c.cod = a.assunto_fk
			order by data_upload desc;
			
		end if;
		
    else 
    
		select a.cod, a.conteudo, c.cod as cod_assunto, c.assunto, b.nome as usuario, a.arquivo, date_format(a.data_upload, "%d/%m/%Y %H:%i:%s") as data_upload
		from biblioteca a
			inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
			inner join biblioteca_assunto c on c.cod = a.assunto_fk
		where a.cod = cod_material
		order by data_upload desc;
    
    end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `us_BuscarDados1_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `us_BuscarDados1_sp`(
	In cod_usuario int
)
BEGIN

	if(select count(0) from us_pre_cadastro a where a.cod_usuario = cod_usuario and situacao = 2) = 1
    then
			select cod_usuario as cod, nome, b.cod_tipo as tipo_usuario, b.descricao as tipo_usuario_desc, c.cod_nivel as escolaridade, c.descricao as escolaridade_desc, d.nome_foto
			from us_usuario a
				inner join us_tipo_usuario b on a.tipo_usuario_fk = b.cod_tipo
				left join nivel_escolaridade c on c.cod_nivel = a.nivel_escolaridade_fk
                inner join us_foto_perfil d on d.cod_usuario_fk = a.cod_usuario
			where a.cod_usuario = cod_usuario;
	else 
    
			select cod_usuario as cod, nome, 0 as tipo_usuario, 'Pré-Cadastro' as tipo_usuario_desc, case when d.nome_foto is null then '' else d.nome_foto end as nome_foto
            from us_pre_cadastro a 
				 left join us_foto_perfil d on d.cod_usuario_fk = a.cod_usuario
            where a.cod_usuario = cod_usuario; 
    
    end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `us_buscarDadosPrincipal_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarDadosPrincipal_sp`(
	IN cod_usuario int
)
BEGIN
	
    select * 
    from edaci.us_usuario a
    where a.cod_usuario = cod_usuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `us_BuscarDisponibilidadesSemanas_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `us_BuscarDisponibilidadesSemanas_sp`(
	In cod_usuario int
)
BEGIN
    
    select b.nome as usuario , c.color as cor, a.*, case when cod_usuario = a.cod_usuario_fk then 1 else 0 end as edit
    from disp_quadro_disponibilidade_semanas a 
		inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
        inner join disp_quadro_disponibilidade_color c on a.cod_usuario_fk = c.cod_usuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `us_BuscarDisponibilidades_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `us_BuscarDisponibilidades_sp`(
	In cod_usuario int
)
BEGIN
    
	create temporary table finalDisp (cod int, usuario varchar(100), cor varchar(20), dataini datetime, datafim datetime, tipo int, edit int, inicio varchar(50), fim varchar(50), horaini time, horafim time);
    
    insert into finalDisp (cod,usuario,cor,dataini,datafim,tipo,edit,inicio,fim,horaini,horafim)
    select cod_disponibilidade, b.nome , c.color,  CONCAT(dataini,' ',horaini) as dtini, CONCAT(datafim,' ',horafim) as dtfim, '1', case when cod_usuario = cod_usuario_fk then 1 else 0 end  ,
		date_format(dataini, "%d/%m/%Y") as inicio, CONCAT(date_format(datafim, "%d/%m/%Y"), ' ', horafim) as fim,
        horaini,horafim
    from disp_quadro_disponibilidade a 
		inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
        inner join disp_quadro_disponibilidade_color c on a.cod_usuario_fk = c.cod_usuario
    where tipo = 1;
    
    
    insert into finalDisp (cod,usuario,cor,dataini,datafim,tipo,edit,inicio,fim,horaini,horafim)
    select cod_disponibilidade, b.nome , c.color,  CONCAT(dataini,' ',horaini) as dtini, CONCAT(datafim,' ',horafim) as dtfim, '1', case when cod_usuario = cod_usuario_fk then 1 else 0 end  ,
		date_format(dataini, "%d/%m/%Y") as inicio, CONCAT(date_format(datafim, "%d/%m/%Y"), ' ', horafim) as fim,
        horaini,horafim
    from disp_quadro_disponibilidade a 
		inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
        inner join disp_quadro_disponibilidade_color c on a.cod_usuario_fk = c.cod_usuario
    where tipo = 2;
    
    
    select * from finalDisp;
    
    drop temporary table finalDisp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `us_buscarEscolaridade_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarEscolaridade_sp`(
	In filtro varchar(2),
    in pesquisa varchar(100),
    in cod_escolaridade int
)
BEGIN

	set pesquisa = CONCAT('%',pesquisa,'%');
    
    
    if cod_escolaridade = 0 then

		if filtro = '1' then
			
            select cod_nivel,descricao as escolaridade, date_format(data_criacao, "%d/%m/%Y %H:%i:%s") as data_criacao 
            from nivel_escolaridade
            where descricao like pesquisa
            order by data_criacao desc;
        
        else 
        
			select cod_nivel,descricao as escolaridade, date_format(data_criacao, "%d/%m/%Y %H:%i:%s")  as data_criacao 
            from nivel_escolaridade
            order by data_criacao desc;
			
		end if;
		
    else 
    
		select cod_nivel,descricao as escolaridade, date_format(data_criacao, "%d/%m/%Y %H:%i:%s")  as data_criacao 
		from nivel_escolaridade
		where cod_nivel = cod_escolaridade
		order by data_criacao desc;
    
    end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `us_buscarLeitura_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarLeitura_sp`(
	In filtro int,
    in pesquisa varchar(100),
    in cod_leitura int
)
BEGIN

	set pesquisa = CONCAT('%',pesquisa,'%');
    
    
    if cod_leitura = 0 then

		if filtro = 1 then
			
            select a.cod_material as cod, a.titulo_artigo, a.titulo_periodico, a.autor, a.volume,arquivo, CONCAT(mes,'-',ano) as mes_ano, CONCAT(a.pagina_inicial,'-',a.pagina_final) as pagina, b.nome as usuario, date_format(a.data_pesquisa, "%d/%m/%Y") as data_pesquisa, palavra_chave, endereco_acesso
            from ltr_material_leitura a
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
			where a.autor like pesquisa
            order by data_criacao desc;
			
		elseif filtro = 2 then
			
            select a.cod_material as cod, a.titulo_artigo, a.titulo_periodico, a.autor, a.volume,arquivo, CONCAT(mes,'-',ano) as mes_ano, CONCAT(a.pagina_inicial,'-',a.pagina_final) as pagina, b.nome as usuario, date_format(a.data_pesquisa, "%d/%m/%Y") as data_pesquisa, palavra_chave, endereco_acesso
            from ltr_material_leitura a
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
			where a.base like pesquisa
            order by data_criacao desc;
            
        elseif filtro = 3 then
        
			select a.cod_material as cod, a.titulo_artigo, a.titulo_periodico, a.autor, a.volume,arquivo, CONCAT(mes,'-',ano) as mes_ano, CONCAT(a.pagina_inicial,'-',a.pagina_final) as pagina, b.nome as usuario, date_format(a.data_pesquisa, "%d/%m/%Y") as data_pesquisa, palavra_chave, endereco_acesso
            from ltr_material_leitura a
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
            order by data_criacao desc;
        
        elseif filtro = 4 then
        
			select a.cod_material as cod, a.titulo_artigo, a.titulo_periodico, a.autor, a.volume,arquivo, CONCAT(mes,'-',ano) as mes_ano, CONCAT(a.pagina_inicial,'-',a.pagina_final) as pagina, b.nome as usuario, date_format(a.data_pesquisa, "%d/%m/%Y") as data_pesquisa, palavra_chave, endereco_acesso
            from ltr_material_leitura a
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
			where a.titulo_periodico like pesquisa
            order by data_criacao desc;
			
		elseif filtro = 5 then
        
			select a.cod_material as cod, a.titulo_artigo, a.titulo_periodico, a.autor, a.volume,arquivo, CONCAT(mes,'-',ano) as mes_ano, CONCAT(a.pagina_inicial,'-',a.pagina_final) as pagina, b.nome as usuario, date_format(a.data_pesquisa, "%d/%m/%Y") as data_pesquisa, palavra_chave, endereco_acesso
            from ltr_material_leitura a
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
			where b.nome like pesquisa
            order by data_criacao desc;
        
        else 
        
			select a.cod_material as cod, a.titulo_artigo, a.titulo_periodico, a.autor, a.volume,arquivo, CONCAT(mes,'-',ano) as mes_ano, CONCAT(a.pagina_inicial,'-',a.pagina_final) as pagina, b.nome as usuario, date_format(a.data_pesquisa, "%d/%m/%Y") as data_pesquisa, palavra_chave, endereco_acesso
            from ltr_material_leitura a
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
            order by data_criacao desc;
			
		end if;
		
    else 
    
		select a.cod_material as cod,a.numero, a.base, a.titulo_artigo, a.titulo_periodico, a.autor, a.volume, arquivo,mes,ano, CONCAT(mes,'-',ano) as mes_ano, CONCAT(a.pagina_inicial,'-',a.pagina_final) as pagina, b.nome as usuario, date_format(a.data_pesquisa, "%d/%m/%Y") as data_pesquisa,a.pagina_inicial,a.pagina_final,date_format(a.data_pesquisa, "%Y-%m-%d") as dt_pesq, palavra_chave, endereco_acesso
		from ltr_material_leitura a
			inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
		where a.cod_material = cod_leitura
		order by data_criacao desc;
    
    end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `us_BuscarMembros_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `us_BuscarMembros_sp`(
	In cod_usuario int
)
BEGIN

	select a.cod_usuario as cod, a.nome, date_format(a.data_criacao, "%d/%m/%Y %H:%i:%s") as data_criacao,
		case when b.tipo_usuario_fk is null then 0 else b.tipo_usuario_fk end as tipo_usuario,
		case when b.tipo_usuario_fk is null then 'Pré-cadastro' else c.descricao end as tipo_usuario_desc,
		case when b.tipo_usuario_fk is null then e.cod_nivel else d.cod_nivel end as escolaridade,
		case when b.tipo_usuario_fk is null then e.descricao else d.descricao end as escolaridade_descricao,
        a.situacao as pre_cadastro, -- 0-pendente 1-aceito 2-rejeitado
		acesso.situacao as ativo, -- 0-inativo 1-ativo
        a.adm,
        f.nome_foto 
	from us_pre_cadastro a
		left join us_usuario b on a.cod_usuario = b.cod_usuario
		left join us_tipo_usuario c on b.tipo_usuario_fk = c.cod_tipo
		left join nivel_escolaridade d on d.cod_nivel = b.nivel_escolaridade_fk -- membro/adm
		left join nivel_escolaridade e on e.cod_nivel = a.nivel_escolaridade_fk -- precadastro
        inner join us_acesso acesso on acesso.cod_usuario_fk = a.cod_usuario
        left join us_foto_perfil f on f.cod_usuario_fk = a.cod_usuario
    where cod_tipo <> 1 or cod_tipo is null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `us_buscarQuestionarios_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarQuestionarios_sp`(
	questionario int
)
proc_name:
BEGIN
	
	declare while_i int;
    declare while_max int;
    declare num_qst2 int;
    
	if questionario = 0 then
    begin
		select a.cod_questionario, a.descricao, a.status_questionario,b.nome,date_format(a.data_criacao, "%d/%m/%Y %H:%i:%s") as data_criacao
		from qst_questionario a
			inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario;
	end;
    else
    begin
			CREATE TEMPORARY TABLE finalQest AS (
				select b.cod as id,is_sub, case when is_sub = 0 then 0 else c.cod_questao end as parent, b.desc_pergunta as name, 1 as num_qst
				from qst_questionario a
						inner join qst_questao1 b on a.cod_questionario = b.cod_questionario
						inner join qst_questao_dependencia c on c.cod_questao_dependente = b.cod
				where a.cod_questionario = questionario order by b.cod asc
            );


			set @while_i = (select min(id) from finalQest);
            set @while_max = (select max(id) from finalQest);

            
            WHILE @while_i < @while_max DO
                    
					update finalQest set num_qst = @num_qst2 where id = while_i and is_sub = 0;
                    
                    set @num_qst2 = (select max(num_qst) from finalQest) + 1;
                    
                    set @while_i = @while_i + 1;
			END WHILE;

            select * from finalQest;
             drop table finalQest;
	end;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-20 17:08:12
