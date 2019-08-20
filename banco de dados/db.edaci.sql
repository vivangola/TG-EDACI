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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atvs_plano_atividades`
--

LOCK TABLES `atvs_plano_atividades` WRITE;
/*!40000 ALTER TABLE `atvs_plano_atividades` DISABLE KEYS */;
/*!40000 ALTER TABLE `atvs_plano_atividades` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca`
--

LOCK TABLES `biblioteca` WRITE;
/*!40000 ALTER TABLE `biblioteca` DISABLE KEYS */;
INSERT INTO `biblioteca` VALUES (5,4,'teste2',1,'material-2019-08-05-16-08-06.docx','2019-08-05 11:10:06');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca_assunto`
--

LOCK TABLES `biblioteca_assunto` WRITE;
/*!40000 ALTER TABLE `biblioteca_assunto` DISABLE KEYS */;
INSERT INTO `biblioteca_assunto` VALUES (1,4,'Modelos de carta de consentimento','2019-08-05 10:04:04');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disp_quadro_disponibilidade`
--

LOCK TABLES `disp_quadro_disponibilidade` WRITE;
/*!40000 ALTER TABLE `disp_quadro_disponibilidade` DISABLE KEYS */;
INSERT INTO `disp_quadro_disponibilidade` VALUES (9,4,'2019-07-25 14:45:18','2019-07-25','2019-07-26','12:00:00','14:00:00',2),(10,4,'2019-07-25 14:49:54','2019-07-25','2019-07-25','15:00:00','16:00:00',1),(11,4,'2019-07-25 15:19:13','2019-07-25','2019-07-25','12:00:00','18:00:00',1),(12,4,'2019-07-25 15:20:53','2019-07-25','2019-07-25','12:00:00','19:00:00',1),(13,4,'2019-07-29 08:50:49','2019-07-29','2019-07-29','12:00:00','14:00:00',1),(14,4,'2019-07-29 08:51:11','2019-07-29','2019-07-29','00:00:10','14:00:00',1),(15,4,'2019-07-29 08:56:17','0000-00-00','0000-00-00','00:00:00','00:00:00',1),(16,4,'2019-07-29 08:58:06','2019-07-29','2019-07-29','10:00:00','15:00:00',1),(17,4,'2019-07-29 10:02:23','2019-07-29','2019-07-29','10:00:00','12:00:00',2),(18,4,'2019-07-29 10:02:23','2019-07-30','2019-07-30','10:00:00','12:00:00',2),(19,4,'2019-07-29 10:02:23','2019-07-31','2019-07-31','10:00:00','12:00:00',2),(20,4,'2019-07-29 10:02:23','2019-08-01','2019-08-01','10:00:00','12:00:00',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disp_quadro_disponibilidade_semanas`
--

LOCK TABLES `disp_quadro_disponibilidade_semanas` WRITE;
/*!40000 ALTER TABLE `disp_quadro_disponibilidade_semanas` DISABLE KEYS */;
INSERT INTO `disp_quadro_disponibilidade_semanas` VALUES (1,4,NULL,NULL,NULL,NULL,'14:00:00','12:00:00','16:00:00','18:00:00',NULL,NULL,NULL,NULL,'10:00:00','14:00:00','16:00:00','18:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
  `endereco_acesso` varchar(200) DEFAULT NULL,
  `interesse` int(11) DEFAULT NULL,
  `arquivo` varchar(50) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_material`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltr_material_leitura`
--

LOCK TABLES `ltr_material_leitura` WRITE;
/*!40000 ALTER TABLE `ltr_material_leitura` DISABLE KEYS */;
INSERT INTO `ltr_material_leitura` VALUES (1,4,'Base teste','2019-05-01 00:00:00','Como programar em PHP',2018,6,1,12,'Como é programar em PHP','Gilberto',10,25,'teste',1,'teste.doc','2019-09-09 10:00:00'),(2,4,'Base inicial','2019-02-02 00:00:00','Como estudar sozinho',2018,6,1,12,'estudar sozinho é bom','Claudio',10,25,'teste',1,'teste.doc','2019-09-09 10:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel_escolaridade`
--

LOCK TABLES `nivel_escolaridade` WRITE;
/*!40000 ALTER TABLE `nivel_escolaridade` DISABLE KEYS */;
INSERT INTO `nivel_escolaridade` VALUES (1,'Médio','2019-07-08 10:26:53'),(2,'Superior','2019-07-08 10:26:59'),(3,'','2019-08-16 12:29:39'),(4,'teste2','2019-08-16 12:30:51'),(5,'teste3','2019-08-16 12:32:48'),(6,'testeeee','2019-08-16 16:08:15');
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
-- Table structure for table `qst_questao_dependencia`
--

DROP TABLE IF EXISTS `qst_questao_dependencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qst_questao_dependencia` (
  `cod_dependencia` int(11) NOT NULL AUTO_INCREMENT,
  `cod_questao_dependente` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_dependencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qst_questao_dependencia`
--

LOCK TABLES `qst_questao_dependencia` WRITE;
/*!40000 ALTER TABLE `qst_questao_dependencia` DISABLE KEYS */;
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
  `descricacao` varchar(500) DEFAULT NULL,
  `status_questionario` int(11) DEFAULT NULL,
  `cod_tipo_fk` int(11) DEFAULT NULL,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_questionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qst_questionario`
--

LOCK TABLES `qst_questionario` WRITE;
/*!40000 ALTER TABLE `qst_questionario` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reu_atas`
--

LOCK TABLES `reu_atas` WRITE;
/*!40000 ALTER TABLE `reu_atas` DISABLE KEYS */;
INSERT INTO `reu_atas` VALUES (33,'2019-07-24 11:38:20','testee','ata-2019-07-24-16-07-20.docx','2019-07-24 23:33:00',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_aplicacoes`
--

LOCK TABLES `sys_aplicacoes` WRITE;
/*!40000 ALTER TABLE `sys_aplicacoes` DISABLE KEYS */;
INSERT INTO `sys_aplicacoes` VALUES (1,'Atas de Reuniões','atas','/atas',0,1),(2,'Biblioteca','biblioteca','/biblioteca',0,1),(3,'Cadastrar','pre-cadastro','/pre-cadastro',0,1),(4,'Chat','chat','/chat',0,1),(5,'E-mail','email','',0,1),(6,'Enviar E-mail','email','/email/enviar',5,1),(7,'Meus E-mail','email','/email',5,1),(8,'Quadro de Avisos','avisos','/avisos',0,1),(9,'Quadro de Disponibilidade','quadro-disponibilidade','/quadro-disponibilidade',0,1),(10,'Quadro de Eventos','eventos','/eventos',0,1),(11,'Quadro de Literatura','quadro-leitura','/quadro-leitura',0,1),(12,'Níveis de Escolaridade','escolaridade','/escolaridade',0,1),(13,'Plano de Atividades','plano-atividades','/plano_atividades',0,1),(14,'Plano de Metas','plano-metas','/plano-metas',0,1),(15,'Produção de Grupo','producao-grupo','/producao-grupo',0,1),(16,'Questionários','questionario','',0,1),(17,'Aprendizagem','questionario','/questionario/aprendizagem',16,1),(18,'Cadastro','cadastro','/questionario/cadastro',16,1),(19,'Trabalhos de Correção','trabalho-correcao','',0,1),(20,'Meus Trabalhos','trabalho-correcao','/trabalho-correcao',19,1),(21,'Trabalhos Recebidos','trabalho-correcao','/trabalho-correcao/recebidos',19,1),(22,'Usuários','usuarios','',0,1),(23,'Grupos','usuarios','/usuarios/grupos',22,1),(24,'Membros','usuarios','/usuarios/membros',22,1),(25,'Portfolio','portfolio','/portfolio',0,1),(26,'Configurações','configuracao','',0,1),(27,'Meu Perfil','configuracao','/perfil',26,1),(28,'Alterar Senha','configuracao','/alterar-senha',26,1),(29,'Questionário Inicial','questionario','/questionario/inicial',0,1);
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
INSERT INTO `sys_aplicacoes_permissao` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(0,29);
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
) ENGINE=InnoDB AUTO_INCREMENT=712 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log_acesso_aplicacao`
--

LOCK TABLES `sys_log_acesso_aplicacao` WRITE;
/*!40000 ALTER TABLE `sys_log_acesso_aplicacao` DISABLE KEYS */;
INSERT INTO `sys_log_acesso_aplicacao` VALUES (5,4,'Application/Controller/UsuariosController','membros','2019-08-14 16:58:03','::1','local',''),(6,4,'Application/Controller/UsuariosController','membros','2019-08-14 16:58:14','::1','local','{\"pesquisa\":\"gabr\",\"filtros\":\"1\"}'),(7,0,'Login/Controller/LoginController','login','2019-08-14 16:58:30','::1','local',''),(8,0,'Login/Controller/LoginController','login','2019-08-14 17:00:41','::1','local',''),(9,0,'Application/Controller/IndexController','index','2019-08-14 17:04:11','::1','local',''),(10,0,'Login/Controller/LoginController','login','2019-08-14 17:04:12','::1','local',''),(11,4,'Application/Controller/IndexController','index','2019-08-14 17:04:18','::1','local',''),(12,4,'Quadro/Controller/AtasController','atas','2019-08-14 17:04:29','::1','local',''),(13,4,'Quadro/Controller/AtasController','atas','2019-08-14 17:04:35','::1','local','{\"pesquisa\":\"teste\",\"filtros\":\"1\"}'),(14,0,'Application/Controller/IndexController','index','2019-08-15 15:34:39','127.0.0.1','local',''),(15,0,'Login/Controller/LoginController','login','2019-08-15 15:34:40','127.0.0.1','local',''),(16,4,'Application/Controller/IndexController','index','2019-08-15 15:35:04','127.0.0.1','local',''),(17,4,'Application/Controller/UsuariosController','membros','2019-08-15 15:35:13','127.0.0.1','local',''),(18,4,'Quadro/Controller/AtasController','atas','2019-08-15 15:35:40','127.0.0.1','local',''),(19,4,'Quadro/Controller/BibliotecaController','biblioteca','2019-08-15 15:35:42','127.0.0.1','local',''),(20,4,'Cadastro/Controller/PreCadastroController','pre-cadastro','2019-08-15 15:35:45','127.0.0.1','local',''),(21,4,'Chat/Controller/ChatController','chat','2019-08-15 15:35:47','127.0.0.1','local',''),(22,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-15 15:35:55','127.0.0.1','local',''),(23,4,'Application/Controller/IndexController','index','2019-08-15 15:36:10','127.0.0.1','local',''),(24,4,'Quadro/Controller/PlanoMetasController','plano-metas','2019-08-15 15:36:13','127.0.0.1','local',''),(25,4,'Application/Controller/IndexController','index','2019-08-15 15:36:18','127.0.0.1','local',''),(26,4,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-08-15 15:36:22','127.0.0.1','local',''),(27,4,'Quadro/Controller/QuadroLeituraController','quadro-leitura','2019-08-15 15:38:19','127.0.0.1','local',''),(28,4,'Application/Controller/UsuariosController','membros','2019-08-15 15:38:23','127.0.0.1','local',''),(29,0,'Login/Controller/LoginController','login','2019-08-15 16:21:13','127.0.0.1','local',''),(30,0,'Cadastro/Controller/CadastroController','cadastro','2019-08-15 16:21:16','127.0.0.1','local',''),(31,0,'Login/Controller/LoginController','login','2019-08-15 16:21:31','127.0.0.1','local',''),(32,4,'Application/Controller/IndexController','index','2019-08-15 16:39:26','127.0.0.1','local',''),(33,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:39:31','127.0.0.1','local',''),(34,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:41:14','127.0.0.1','local',''),(35,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:41:46','127.0.0.1','local',''),(36,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:41:54','127.0.0.1','local',''),(37,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:44:30','127.0.0.1','local',''),(38,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:44:44','127.0.0.1','local',''),(39,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:46:23','127.0.0.1','local',''),(40,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:46:45','127.0.0.1','local',''),(41,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:47:05','127.0.0.1','local',''),(42,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:47:29','127.0.0.1','local',''),(43,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:48:19','127.0.0.1','local',''),(44,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:48:48','127.0.0.1','local',''),(45,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:48:57','127.0.0.1','local',''),(46,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:50:11','127.0.0.1','local',''),(47,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:50:17','127.0.0.1','local',''),(48,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:50:45','127.0.0.1','local',''),(49,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:51:21','127.0.0.1','local',''),(50,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:51:27','127.0.0.1','local',''),(51,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:52:05','127.0.0.1','local',''),(52,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:52:11','127.0.0.1','local',''),(53,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:52:18','127.0.0.1','local',''),(54,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:52:23','127.0.0.1','local',''),(55,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:53:01','127.0.0.1','local',''),(56,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:53:11','127.0.0.1','local',''),(57,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:54:30','127.0.0.1','local',''),(58,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:55:10','127.0.0.1','local',''),(59,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:55:28','127.0.0.1','local',''),(60,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:55:34','127.0.0.1','local',''),(61,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:56:14','127.0.0.1','local',''),(62,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:56:21','127.0.0.1','local',''),(63,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:56:47','127.0.0.1','local',''),(64,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:56:47','127.0.0.1','local',''),(65,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:57:19','127.0.0.1','local',''),(66,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:57:24','127.0.0.1','local',''),(67,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:57:32','127.0.0.1','local',''),(68,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:58:31','127.0.0.1','local',''),(69,4,'Application/Controller/UsuariosController','membros','2019-08-15 16:59:44','127.0.0.1','local',''),(70,0,'Login/Controller/LoginController','login','2019-08-15 16:59:51','127.0.0.1','local',''),(71,4,'Application/Controller/IndexController','index','2019-08-15 17:00:57','127.0.0.1','local',''),(72,4,'Application/Controller/UsuariosController','membros','2019-08-15 17:01:03','127.0.0.1','local',''),(73,4,'Application/Controller/UsuariosController','membros','2019-08-15 17:01:09','127.0.0.1','local',''),(74,0,'Login/Controller/LoginController','login','2019-08-15 17:01:14','127.0.0.1','local',''),(75,14,'Application/Controller/IndexController','index','2019-08-15 17:01:23','127.0.0.1','local',''),(76,0,'Login/Controller/LoginController','login','2019-08-15 17:13:45','127.0.0.1','local',''),(77,14,'Application/Controller/IndexController','index','2019-08-15 17:14:27','127.0.0.1','local',''),(78,0,'Login/Controller/LoginController','login','2019-08-15 17:14:45','127.0.0.1','local',''),(79,0,'Application/Controller/IndexController','index','2019-08-15 17:17:15','127.0.0.1','local',''),(80,0,'Login/Controller/LoginController','login','2019-08-15 17:17:15','127.0.0.1','local',''),(81,14,'Application/Controller/IndexController','index','2019-08-15 17:17:29','127.0.0.1','local',''),(82,14,'Cadastro/Controller/PreCadastroController','pre-cadastro','2019-08-15 17:34:34','127.0.0.1','local',''),(83,14,'Cadastro/Controller/PreCadastroController','pre-cadastro','2019-08-15 17:35:32','127.0.0.1','local',''),(84,14,'Cadastro/Controller/PreCadastroController','pre-cadastro','2019-08-15 17:36:16','127.0.0.1','local',''),(85,14,'Application/Controller/IndexController','index','2019-08-15 17:36:19','127.0.0.1','local',''),(86,14,'Application/Controller/IndexController','index','2019-08-15 17:40:00','127.0.0.1','local',''),(87,14,'Application/Controller/IndexController','index','2019-08-15 17:41:01','127.0.0.1','local',''),(88,14,'Application/Controller/IndexController','index','2019-08-15 17:41:22','127.0.0.1','local',''),(89,0,'Login/Controller/LoginController','login','2019-08-15 17:41:54','127.0.0.1','local',''),(90,4,'Application/Controller/IndexController','index','2019-08-15 17:42:03','127.0.0.1','local',''),(91,0,'Application/Controller/IndexController','index','2019-08-15 17:42:37','::1','local',''),(92,0,'Login/Controller/LoginController','login','2019-08-15 17:42:38','::1','local',''),(93,4,'Application/Controller/IndexController','index','2019-08-15 17:42:49','::1','local',''),(94,0,'Login/Controller/LoginController','login','2019-08-15 17:43:04','::1','local',''),(95,0,'Login/Controller/LoginController','login','2019-08-15 17:43:13','::1','local',''),(96,4,'Application/Controller/IndexController','index','2019-08-15 17:43:17','::1','local',''),(97,4,'Login/Controller/LoginController','login','2019-08-15 17:44:31','::1','local',''),(98,4,'Application/Controller/IndexController','index','2019-08-15 17:44:33','::1','local',''),(99,0,'Login/Controller/LoginController','login','2019-08-15 17:44:38','::1','local',''),(100,14,'Application/Controller/IndexController','index','2019-08-15 17:44:54','::1','local',''),(101,14,'Cadastro/Controller/PreCadastroController','not-found','2019-08-15 17:44:56','::1','local',''),(102,14,'Application/Controller/IndexController','index','2019-08-15 17:45:04','::1','local',''),(103,14,'Cadastro/Controller/PreCadastroController','not-found','2019-08-15 17:45:07','::1','local',''),(104,0,'Login/Controller/LoginController','login','2019-08-15 17:45:12','::1','local',''),(105,4,'Application/Controller/IndexController','index','2019-08-15 17:45:16','::1','local',''),(106,4,'Cadastro/Controller/PreCadastroController','pre-cadastro','2019-08-15 17:45:19','::1','local',''),(107,4,'Application/Controller/IndexController','index','2019-08-15 17:45:24','::1','local',''),(108,0,'Login/Controller/LoginController','login','2019-08-15 17:45:27','::1','local',''),(109,14,'Application/Controller/IndexController','index','2019-08-15 17:45:33','::1','local',''),(110,14,'Cadastro/Controller/PreCadastroController','not-found','2019-08-15 17:45:36','::1','local',''),(111,14,'Cadastro/Controller/PreCadastroController','not-found','2019-08-15 17:47:52','::1','local',''),(112,14,'Cadastro/Controller/PreCadastroController','not-found','2019-08-15 17:49:35','::1','local',''),(113,14,'Application/Controller/IndexController','index','2019-08-15 17:49:38','::1','local',''),(114,14,'Application/Controller/IndexController','index','2019-08-15 17:50:56','::1','local',''),(115,14,'Application/Controller/IndexController','index','2019-08-16 08:16:44','::1','local',''),(116,14,'Application/Controller/IndexController','index','2019-08-16 08:16:45','::1','local',''),(117,14,'Application/Controller/IndexController','index','2019-08-16 08:18:02','::1','local',''),(118,14,'Application/Controller/IndexController','index','2019-08-16 08:18:19','::1','local',''),(119,14,'Application/Controller/IndexController','index','2019-08-16 08:19:02','::1','local',''),(120,14,'Application/Controller/IndexController','index','2019-08-16 08:25:26','::1','local',''),(121,14,'Application/Controller/IndexController','index','2019-08-16 08:25:50','::1','local',''),(122,14,'Application/Controller/IndexController','index','2019-08-16 08:26:10','::1','local',''),(123,14,'Application/Controller/IndexController','index','2019-08-16 08:28:44','::1','local',''),(124,14,'Application/Controller/IndexController','index','2019-08-16 08:28:57','::1','local',''),(125,14,'Application/Controller/IndexController','index','2019-08-16 08:29:04','::1','local',''),(126,14,'Application/Controller/IndexController','index','2019-08-16 08:30:01','::1','local',''),(127,14,'Application/Controller/IndexController','index','2019-08-16 08:30:21','::1','local',''),(128,14,'Application/Controller/IndexController','index','2019-08-16 08:31:39','::1','local',''),(129,14,'Application/Controller/IndexController','index','2019-08-16 08:33:03','::1','local',''),(130,14,'Application/Controller/IndexController','index','2019-08-16 08:34:17','::1','local',''),(131,14,'Application/Controller/IndexController','index','2019-08-16 08:34:57','::1','local',''),(132,14,'Application/Controller/IndexController','index','2019-08-16 08:35:16','::1','local',''),(133,14,'Application/Controller/IndexController','index','2019-08-16 08:35:30','::1','local',''),(134,14,'Application/Controller/IndexController','index','2019-08-16 08:35:41','::1','local',''),(135,14,'Application/Controller/IndexController','index','2019-08-16 08:39:10','::1','local',''),(136,14,'Application/Controller/IndexController','index','2019-08-16 08:39:38','::1','local',''),(137,14,'Application/Controller/IndexController','index','2019-08-16 08:39:56','::1','local',''),(138,14,'Application/Controller/IndexController','index','2019-08-16 08:40:12','::1','local',''),(139,14,'Application/Controller/IndexController','index','2019-08-16 08:40:16','::1','local',''),(140,14,'Application/Controller/IndexController','index','2019-08-16 08:40:38','::1','local',''),(141,14,'Application/Controller/IndexController','index','2019-08-16 08:41:05','::1','local',''),(142,14,'Application/Controller/IndexController','index','2019-08-16 08:43:29','::1','local',''),(143,14,'Application/Controller/IndexController','index','2019-08-16 08:45:03','::1','local',''),(144,14,'Application/Controller/IndexController','index','2019-08-16 08:45:45','::1','local',''),(145,14,'Application/Controller/IndexController','index','2019-08-16 08:46:57','::1','local',''),(146,14,'Application/Controller/IndexController','index','2019-08-16 08:47:52','::1','local',''),(147,14,'Application/Controller/IndexController','index','2019-08-16 08:48:18','::1','local',''),(148,14,'Application/Controller/IndexController','index','2019-08-16 09:05:39','::1','local',''),(149,14,'Application/Controller/IndexController','index','2019-08-16 09:05:46','::1','local',''),(150,14,'Application/Controller/IndexController','index','2019-08-16 09:05:56','::1','local',''),(151,14,'Application/Controller/IndexController','index','2019-08-16 09:06:05','::1','local',''),(152,14,'Application/Controller/IndexController','index','2019-08-16 09:10:49','::1','local',''),(153,14,'Application/Controller/IndexController','index','2019-08-16 09:10:58','::1','local',''),(154,14,'Application/Controller/IndexController','index','2019-08-16 09:11:20','::1','local',''),(155,14,'Application/Controller/IndexController','index','2019-08-16 09:11:27','::1','local',''),(156,14,'Application/Controller/IndexController','index','2019-08-16 09:11:38','::1','local',''),(157,14,'Application/Controller/IndexController','index','2019-08-16 09:12:50','::1','local',''),(158,14,'Application/Controller/IndexController','index','2019-08-16 09:13:06','::1','local',''),(159,14,'Application/Controller/IndexController','index','2019-08-16 09:13:46','::1','local',''),(160,14,'Application/Controller/IndexController','index','2019-08-16 09:21:17','::1','local',''),(161,14,'Application/Controller/IndexController','bem-vindo','2019-08-16 09:22:07','::1','local',''),(162,14,'Application/Controller/IndexController','index','2019-08-16 09:22:10','::1','local',''),(163,14,'Application/Controller/IndexController','bem-vindo','2019-08-16 09:22:17','::1','local',''),(164,14,'Application/Controller/IndexController','bem-vindo','2019-08-16 09:22:57','::1','local',''),(165,14,'Application/Controller/IndexController','index','2019-08-16 09:23:00','::1','local',''),(166,14,'Application/Controller/IndexController','bem-vindo','2019-08-16 09:23:01','::1','local',''),(167,14,'Application/Controller/IndexController','index','2019-08-16 09:23:05','::1','local',''),(168,14,'Application/Controller/IndexController','bem-vindo','2019-08-16 09:23:05','::1','local',''),(169,14,'Application/Controller/IndexController','index','2019-08-16 09:24:05','::1','local',''),(170,14,'Application/Controller/IndexController','bem-vindo','2019-08-16 09:24:05','::1','local',''),(171,14,'Application/Controller/IndexController','bem-vindo','2019-08-16 09:26:53','::1','local',''),(172,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 09:27:02','::1','local',''),(173,14,'Application/Controller/IndexController','bem-vindo','2019-08-16 09:27:02','::1','local',''),(174,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 09:27:45','::1','local',''),(175,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 09:27:54','::1','local',''),(176,14,'Application/Controller/IndexController','bem-vindo','2019-08-16 09:27:54','::1','local',''),(177,14,'Application/Controller/IndexController','bem-vindo','2019-08-16 09:28:02','::1','local',''),(178,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 09:28:05','::1','local',''),(179,14,'Application/Controller/IndexController','index','2019-08-16 09:28:34','::1','local',''),(180,14,'Application/Controller/IndexController','bem-vindo','2019-08-16 09:28:34','::1','local',''),(181,14,'Application/Controller/IndexController','bem-vindo','2019-08-16 10:06:25','::1','local',''),(182,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:06:27','::1','local',''),(183,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:11:50','::1','local',''),(184,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:12:21','::1','local',''),(185,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:12:42','::1','local',''),(186,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:13:31','::1','local',''),(187,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:15:17','::1','local',''),(188,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:15:42','::1','local',''),(189,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:18:01','::1','local',''),(190,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:18:33','::1','local',''),(191,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:18:48','::1','local',''),(192,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:20:03','::1','local',''),(193,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:20:21','::1','local',''),(194,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:20:31','::1','local',''),(195,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:20:44','::1','local',''),(196,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:21:08','::1','local',''),(197,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:21:32','::1','local',''),(198,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:22:14','::1','local',''),(199,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:22:41','::1','local',''),(200,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:22:51','::1','local',''),(201,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:22:58','::1','local',''),(202,14,'Application/Controller/IndexController','index','2019-08-16 10:23:03','::1','local',''),(203,14,'Application/Controller/IndexController','bem-vindo','2019-08-16 10:23:03','::1','local',''),(204,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:40:08','::1','local',''),(205,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:41:13','::1','local',''),(206,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:46:18','::1','local',''),(207,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:46:57','::1','local',''),(208,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:48:03','::1','local',''),(209,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:49:52','::1','local',''),(210,14,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 10:50:20','::1','local',''),(211,0,'Application/Controller/IndexController','not-found','2019-08-16 10:52:55','::1','local',''),(212,0,'Application/Controller/IndexController','not-found','2019-08-16 10:52:55','::1','local',''),(213,0,'Application/Controller/IndexController','not-found','2019-08-16 10:52:56','::1','local',''),(214,0,'Application/Controller/IndexController','not-found','2019-08-16 10:52:56','::1','local',''),(215,0,'Application/Controller/IndexController','not-found','2019-08-16 10:52:56','::1','local',''),(216,0,'Application/Controller/IndexController','not-found','2019-08-16 10:52:57','::1','local',''),(217,0,'Application/Controller/IndexController','not-found','2019-08-16 10:52:57','::1','local',''),(218,0,'Application/Controller/IndexController','not-found','2019-08-16 10:52:57','::1','local',''),(219,0,'Application/Controller/IndexController','not-found','2019-08-16 10:52:57','::1','local',''),(220,0,'Application/Controller/IndexController','not-found','2019-08-16 10:52:58','::1','local',''),(221,0,'Application/Controller/IndexController','not-found','2019-08-16 10:52:58','::1','local',''),(222,0,'Application/Controller/IndexController','not-found','2019-08-16 10:52:58','::1','local',''),(223,0,'Application/Controller/IndexController','not-found','2019-08-16 10:52:59','::1','local',''),(224,0,'Application/Controller/IndexController','not-found','2019-08-16 10:52:59','::1','local',''),(225,0,'Application/Controller/IndexController','not-found','2019-08-16 10:52:59','::1','local',''),(226,0,'Application/Controller/IndexController','not-found','2019-08-16 10:52:59','::1','local',''),(227,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:00','::1','local',''),(228,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:00','::1','local',''),(229,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:00','::1','local',''),(230,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:01','::1','local',''),(231,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:02','::1','local',''),(232,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:02','::1','local',''),(233,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:03','::1','local',''),(234,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:03','::1','local',''),(235,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:03','::1','local',''),(236,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:04','::1','local',''),(237,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:04','::1','local',''),(238,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:04','::1','local',''),(239,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:04','::1','local',''),(240,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:05','::1','local',''),(241,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:05','::1','local',''),(242,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:05','::1','local',''),(243,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:05','::1','local',''),(244,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:06','::1','local',''),(245,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:06','::1','local',''),(246,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:06','::1','local',''),(247,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:07','::1','local',''),(248,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:07','::1','local',''),(249,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:07','::1','local',''),(250,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:07','::1','local',''),(251,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:08','::1','local',''),(252,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:08','::1','local',''),(253,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:08','::1','local',''),(254,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:09','::1','local',''),(255,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:09','::1','local',''),(256,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:09','::1','local',''),(257,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:14','::1','local',''),(258,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:15','::1','local',''),(259,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:15','::1','local',''),(260,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:15','::1','local',''),(261,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:16','::1','local',''),(262,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:16','::1','local',''),(263,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:16','::1','local',''),(264,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:16','::1','local',''),(265,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:17','::1','local',''),(266,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:17','::1','local',''),(267,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:17','::1','local',''),(268,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:18','::1','local',''),(269,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:18','::1','local',''),(270,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:18','::1','local',''),(271,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:18','::1','local',''),(272,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:19','::1','local',''),(273,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:19','::1','local',''),(274,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:19','::1','local',''),(275,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:20','::1','local',''),(276,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:20','::1','local',''),(277,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:50','::1','local',''),(278,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:50','::1','local',''),(279,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:51','::1','local',''),(280,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:51','::1','local',''),(281,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:51','::1','local',''),(282,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:52','::1','local',''),(283,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:52','::1','local',''),(284,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:52','::1','local',''),(285,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:52','::1','local',''),(286,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:53','::1','local',''),(287,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:53','::1','local',''),(288,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:53','::1','local',''),(289,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:54','::1','local',''),(290,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:54','::1','local',''),(291,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:54','::1','local',''),(292,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:54','::1','local',''),(293,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:55','::1','local',''),(294,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:55','::1','local',''),(295,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:55','::1','local',''),(296,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:56','::1','local',''),(297,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:56','::1','local',''),(298,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:56','::1','local',''),(299,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:56','::1','local',''),(300,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:57','::1','local',''),(301,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:57','::1','local',''),(302,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:57','::1','local',''),(303,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:58','::1','local',''),(304,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:58','::1','local',''),(305,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:58','::1','local',''),(306,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:58','::1','local',''),(307,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:59','::1','local',''),(308,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:59','::1','local',''),(309,0,'Application/Controller/IndexController','not-found','2019-08-16 10:53:59','::1','local',''),(310,0,'Application/Controller/IndexController','not-found','2019-08-16 10:54:00','::1','local',''),(311,0,'Application/Controller/IndexController','not-found','2019-08-16 10:54:00','::1','local',''),(312,0,'Application/Controller/IndexController','not-found','2019-08-16 10:54:20','::1','local',''),(313,0,'Application/Controller/IndexController','not-found','2019-08-16 10:54:40','::1','local',''),(314,0,'Application/Controller/IndexController','not-found','2019-08-16 10:54:56','::1','local',''),(315,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:07','::1','local',''),(316,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:12','::1','local',''),(317,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:13','::1','local',''),(318,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:13','::1','local',''),(319,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:13','::1','local',''),(320,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:13','::1','local',''),(321,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:14','::1','local',''),(322,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:14','::1','local',''),(323,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:14','::1','local',''),(324,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:15','::1','local',''),(325,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:15','::1','local',''),(326,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:15','::1','local',''),(327,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:15','::1','local',''),(328,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:16','::1','local',''),(329,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:16','::1','local',''),(330,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:16','::1','local',''),(331,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:16','::1','local',''),(332,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:17','::1','local',''),(333,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:17','::1','local',''),(334,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:17','::1','local',''),(335,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:18','::1','local',''),(336,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:18','::1','local',''),(337,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:18','::1','local',''),(338,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:19','::1','local',''),(339,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:19','::1','local',''),(340,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:19','::1','local',''),(341,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:20','::1','local',''),(342,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:20','::1','local',''),(343,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:20','::1','local',''),(344,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:20','::1','local',''),(345,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:21','::1','local',''),(346,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:21','::1','local',''),(347,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:21','::1','local',''),(348,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:21','::1','local',''),(349,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:22','::1','local',''),(350,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:22','::1','local',''),(351,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:44','::1','local',''),(352,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:45','::1','local',''),(353,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:45','::1','local',''),(354,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:45','::1','local',''),(355,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:46','::1','local',''),(356,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:46','::1','local',''),(357,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:46','::1','local',''),(358,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:46','::1','local',''),(359,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:47','::1','local',''),(360,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:47','::1','local',''),(361,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:47','::1','local',''),(362,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:48','::1','local',''),(363,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:48','::1','local',''),(364,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:48','::1','local',''),(365,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:48','::1','local',''),(366,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:49','::1','local',''),(367,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:49','::1','local',''),(368,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:49','::1','local',''),(369,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:50','::1','local',''),(370,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:50','::1','local',''),(371,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:50','::1','local',''),(372,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:51','::1','local',''),(373,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:51','::1','local',''),(374,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:51','::1','local',''),(375,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:52','::1','local',''),(376,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:52','::1','local',''),(377,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:52','::1','local',''),(378,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:52','::1','local',''),(379,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:53','::1','local',''),(380,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:53','::1','local',''),(381,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:53','::1','local',''),(382,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:54','::1','local',''),(383,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:54','::1','local',''),(384,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:54','::1','local',''),(385,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:55','::1','local',''),(386,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:55','::1','local',''),(387,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:55','::1','local',''),(388,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:56','::1','local',''),(389,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:56','::1','local',''),(390,0,'Application/Controller/IndexController','not-found','2019-08-16 10:55:56','::1','local',''),(391,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:01','::1','local',''),(392,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:02','::1','local',''),(393,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:02','::1','local',''),(394,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:02','::1','local',''),(395,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:02','::1','local',''),(396,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:03','::1','local',''),(397,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:03','::1','local',''),(398,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:03','::1','local',''),(399,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:04','::1','local',''),(400,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:04','::1','local',''),(401,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:04','::1','local',''),(402,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:05','::1','local',''),(403,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:05','::1','local',''),(404,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:05','::1','local',''),(405,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:05','::1','local',''),(406,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:06','::1','local',''),(407,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:06','::1','local',''),(408,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:06','::1','local',''),(409,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:06','::1','local',''),(410,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:07','::1','local',''),(411,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:07','::1','local',''),(412,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:07','::1','local',''),(413,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:08','::1','local',''),(414,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:08','::1','local',''),(415,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:08','::1','local',''),(416,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:08','::1','local',''),(417,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:09','::1','local',''),(418,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:09','::1','local',''),(419,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:09','::1','local',''),(420,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:10','::1','local',''),(421,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:10','::1','local',''),(422,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:10','::1','local',''),(423,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:11','::1','local',''),(424,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:11','::1','local',''),(425,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:11','::1','local',''),(426,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:12','::1','local',''),(427,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:14','::1','local',''),(428,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:15','::1','local',''),(429,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:15','::1','local',''),(430,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:15','::1','local',''),(431,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:15','::1','local',''),(432,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:16','::1','local',''),(433,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:16','::1','local',''),(434,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:16','::1','local',''),(435,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:16','::1','local',''),(436,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:17','::1','local',''),(437,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:17','::1','local',''),(438,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:17','::1','local',''),(439,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:18','::1','local',''),(440,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:18','::1','local',''),(441,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:18','::1','local',''),(442,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:18','::1','local',''),(443,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:19','::1','local',''),(444,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:19','::1','local',''),(445,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:19','::1','local',''),(446,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:20','::1','local',''),(447,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:20','::1','local',''),(448,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:20','::1','local',''),(449,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:21','::1','local',''),(450,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:21','::1','local',''),(451,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:21','::1','local',''),(452,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:21','::1','local',''),(453,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:22','::1','local',''),(454,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:22','::1','local',''),(455,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:22','::1','local',''),(456,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:23','::1','local',''),(457,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:23','::1','local',''),(458,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:23','::1','local',''),(459,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:23','::1','local',''),(460,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:24','::1','local',''),(461,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:24','::1','local',''),(462,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:24','::1','local',''),(463,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:24','::1','local',''),(464,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:25','::1','local',''),(465,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:25','::1','local',''),(466,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:25','::1','local',''),(467,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:31','::1','local',''),(468,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:31','::1','local',''),(469,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:31','::1','local',''),(470,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:31','::1','local',''),(471,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:32','::1','local',''),(472,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:32','::1','local',''),(473,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:32','::1','local',''),(474,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:33','::1','local',''),(475,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:33','::1','local',''),(476,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:33','::1','local',''),(477,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:33','::1','local',''),(478,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:34','::1','local',''),(479,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:34','::1','local',''),(480,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:34','::1','local',''),(481,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:35','::1','local',''),(482,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:35','::1','local',''),(483,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:35','::1','local',''),(484,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:35','::1','local',''),(485,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:36','::1','local',''),(486,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:36','::1','local',''),(487,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:54','::1','local',''),(488,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:54','::1','local',''),(489,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:55','::1','local',''),(490,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:55','::1','local',''),(491,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:55','::1','local',''),(492,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:56','::1','local',''),(493,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:56','::1','local',''),(494,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:56','::1','local',''),(495,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:56','::1','local',''),(496,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:57','::1','local',''),(497,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:57','::1','local',''),(498,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:57','::1','local',''),(499,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:58','::1','local',''),(500,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:58','::1','local',''),(501,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:58','::1','local',''),(502,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:59','::1','local',''),(503,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:59','::1','local',''),(504,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:59','::1','local',''),(505,0,'Application/Controller/IndexController','not-found','2019-08-16 10:56:59','::1','local',''),(506,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:00','::1','local',''),(507,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:23','::1','local',''),(508,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:23','::1','local',''),(509,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:24','::1','local',''),(510,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:24','::1','local',''),(511,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:24','::1','local',''),(512,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:25','::1','local',''),(513,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:25','::1','local',''),(514,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:25','::1','local',''),(515,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:25','::1','local',''),(516,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:26','::1','local',''),(517,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:26','::1','local',''),(518,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:26','::1','local',''),(519,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:26','::1','local',''),(520,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:27','::1','local',''),(521,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:27','::1','local',''),(522,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:27','::1','local',''),(523,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:28','::1','local',''),(524,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:28','::1','local',''),(525,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:28','::1','local',''),(526,0,'Application/Controller/IndexController','not-found','2019-08-16 10:57:28','::1','local',''),(527,0,'Application/Controller/IndexController','index','2019-08-16 10:59:33','::1','local',''),(528,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 10:59:39','::1','local',''),(529,0,'Login/Controller/LoginController','login','2019-08-16 11:01:23','::1','local',''),(530,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:23','::1','local',''),(531,0,'Login/Controller/LoginController','login','2019-08-16 11:01:23','::1','local',''),(532,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:23','::1','local',''),(533,0,'Login/Controller/LoginController','login','2019-08-16 11:01:24','::1','local',''),(534,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:24','::1','local',''),(535,0,'Login/Controller/LoginController','login','2019-08-16 11:01:25','::1','local',''),(536,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:25','::1','local',''),(537,0,'Login/Controller/LoginController','login','2019-08-16 11:01:26','::1','local',''),(538,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:26','::1','local',''),(539,0,'Login/Controller/LoginController','login','2019-08-16 11:01:26','::1','local',''),(540,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:26','::1','local',''),(541,0,'Login/Controller/LoginController','login','2019-08-16 11:01:27','::1','local',''),(542,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:27','::1','local',''),(543,0,'Login/Controller/LoginController','login','2019-08-16 11:01:27','::1','local',''),(544,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:28','::1','local',''),(545,0,'Login/Controller/LoginController','login','2019-08-16 11:01:28','::1','local',''),(546,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:28','::1','local',''),(547,0,'Login/Controller/LoginController','login','2019-08-16 11:01:28','::1','local',''),(548,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:29','::1','local',''),(549,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:30','::1','local',''),(550,0,'Login/Controller/LoginController','login','2019-08-16 11:01:31','::1','local',''),(551,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:31','::1','local',''),(552,0,'Login/Controller/LoginController','login','2019-08-16 11:01:31','::1','local',''),(553,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:32','::1','local',''),(554,0,'Login/Controller/LoginController','login','2019-08-16 11:01:32','::1','local',''),(555,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:32','::1','local',''),(556,0,'Login/Controller/LoginController','login','2019-08-16 11:01:32','::1','local',''),(557,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:33','::1','local',''),(558,0,'Login/Controller/LoginController','login','2019-08-16 11:01:33','::1','local',''),(559,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:33','::1','local',''),(560,0,'Login/Controller/LoginController','login','2019-08-16 11:01:34','::1','local',''),(561,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:34','::1','local',''),(562,0,'Login/Controller/LoginController','login','2019-08-16 11:01:34','::1','local',''),(563,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:34','::1','local',''),(564,0,'Login/Controller/LoginController','login','2019-08-16 11:01:35','::1','local',''),(565,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:35','::1','local',''),(566,0,'Login/Controller/LoginController','login','2019-08-16 11:01:35','::1','local',''),(567,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:36','::1','local',''),(568,0,'Login/Controller/LoginController','login','2019-08-16 11:01:36','::1','local',''),(569,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:41','::1','local',''),(570,0,'Login/Controller/LoginController','login','2019-08-16 11:01:41','::1','local',''),(571,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:42','::1','local',''),(572,0,'Login/Controller/LoginController','login','2019-08-16 11:01:42','::1','local',''),(573,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:42','::1','local',''),(574,0,'Login/Controller/LoginController','login','2019-08-16 11:01:43','::1','local',''),(575,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:43','::1','local',''),(576,0,'Login/Controller/LoginController','login','2019-08-16 11:01:43','::1','local',''),(577,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:44','::1','local',''),(578,0,'Login/Controller/LoginController','login','2019-08-16 11:01:44','::1','local',''),(579,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:44','::1','local',''),(580,0,'Login/Controller/LoginController','login','2019-08-16 11:01:44','::1','local',''),(581,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:45','::1','local',''),(582,0,'Login/Controller/LoginController','login','2019-08-16 11:01:45','::1','local',''),(583,0,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:01:45','::1','local',''),(584,0,'Login/Controller/LoginController','login','2019-08-16 11:01:46','::1','local',''),(585,0,'Login/Controller/LoginController','login','2019-08-16 11:02:48','::1','local',''),(586,0,'Login/Controller/LoginController','login','2019-08-16 11:04:20','::1','local',''),(587,4,'Application/Controller/IndexController','index','2019-08-16 11:04:23','::1','local',''),(588,4,'Application/Controller/IndexController','index','2019-08-16 11:04:30','::1','local',''),(589,4,'Quadro/Controller/PlanoMetasController','plano-metas','2019-08-16 11:04:33','::1','local',''),(590,0,'Login/Controller/LoginController','login','2019-08-16 11:04:38','::1','local',''),(591,14,'Application/Controller/IndexController','index','2019-08-16 11:04:42','::1','local',''),(592,14,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:04:42','::1','local',''),(593,14,'Quadro/Controller/BibliotecaController','biblioteca','2019-08-16 11:05:15','::1','local',''),(594,14,'Application/Controller/IndexController','bem-vindo','2019-08-16 11:05:16','::1','local',''),(595,0,'Login/Controller/LoginController','login','2019-08-16 11:05:19','::1','local',''),(596,4,'Application/Controller/IndexController','index','2019-08-16 11:05:28','::1','local',''),(597,4,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 11:09:11','::1','local',''),(598,4,'Application/Controller/IndexController','index','2019-08-16 11:13:31','::1','local',''),(599,4,'Questionario/Controller/QuestionarioController','inicial','2019-08-16 11:21:19','::1','local',''),(600,4,'Questionario/Controller/QuestionarioController','cadastro','2019-08-16 11:21:37','::1','local',''),(601,4,'Application/Controller/IndexController','index','2019-08-16 11:23:53','::1','local',''),(602,4,'Questionario/Controller/QuestionarioController','cadastro','2019-08-16 11:23:55','::1','local',''),(603,4,'Questionario/Controller/QuestionarioController','cadastro','2019-08-16 11:24:49','::1','local',''),(604,4,'Questionario/Controller/QuestionarioController','cadastro','2019-08-16 11:51:18','::1','local',''),(605,4,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-08-16 11:51:37','::1','local',''),(606,4,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-08-16 11:57:31','::1','local',''),(607,4,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-08-16 11:57:51','::1','local',''),(608,4,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-08-16 11:58:42','::1','local',''),(609,4,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-08-16 12:00:29','::1','local',''),(610,4,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-08-16 12:01:18','::1','local',''),(611,4,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-08-16 12:02:11','::1','local',''),(612,4,'Application/Controller/UsuariosController','membros','2019-08-16 12:08:00','::1','local',''),(613,4,'Application/Controller/IndexController','index','2019-08-16 12:08:05','::1','local',''),(614,4,'Quadro/Controller/AtasController','atas','2019-08-16 12:08:11','::1','local',''),(615,4,'Quadro/Controller/BibliotecaController','biblioteca','2019-08-16 12:08:15','::1','local',''),(616,4,'Cadastro/Controller/PreCadastroController','pre-cadastro','2019-08-16 12:08:20','::1','local',''),(617,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 12:10:30','::1','local',''),(618,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 12:16:48','::1','local',''),(619,4,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-08-16 12:20:20','::1','local',''),(620,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 12:20:31','::1','local',''),(621,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 12:23:41','::1','local',''),(622,4,'Quadro/Controller/AtasController','atas','2019-08-16 12:23:50','::1','local',''),(623,4,'Quadro/Controller/BibliotecaController','biblioteca','2019-08-16 12:23:53','::1','local',''),(624,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 12:23:58','::1','local',''),(625,4,'Quadro/Controller/AtasController','atas','2019-08-16 12:24:02','::1','local',''),(626,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 12:24:05','::1','local',''),(627,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 12:25:19','::1','local',''),(628,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 12:29:07','::1','local',''),(629,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 12:29:34','::1','local',''),(630,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 12:29:41','::1','local',''),(631,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 12:30:45','::1','local',''),(632,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 12:30:52','::1','local',''),(633,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 12:31:17','::1','local',''),(634,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 12:32:33','::1','local',''),(635,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 12:32:36','::1','local',''),(636,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 12:32:49','::1','local',''),(637,4,'Quadro/Controller/QuadroAvisoController','avisos','2019-08-16 12:34:02','::1','local','{\"pesquisa\":\"\",\"filtros\":\"-1\"}'),(638,4,'Quadro/Controller/QuadroAvisoController','avisos','2019-08-16 12:34:34','::1','local','{\"pesquisa\":\"\",\"filtros\":\"-1\"}'),(639,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 12:34:38','::1','local',''),(640,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 12:34:42','::1','local','{\"pesquisa\":\"\",\"filtros\":\"-1\"}'),(641,0,'Login/Controller/LoginController','login','2019-08-16 12:35:17','::1','local',''),(642,4,'Application/Controller/IndexController','index','2019-08-16 12:35:22','::1','local',''),(643,4,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-08-16 12:40:24','::1','local',''),(644,4,'Application/Controller/IndexController','index','2019-08-16 12:40:25','::1','local',''),(645,4,'Application/Controller/IndexController','index','2019-08-16 12:42:00','::1','local',''),(646,4,'Application/Controller/IndexController','index','2019-08-16 12:42:21','::1','local',''),(647,4,'Application/Controller/IndexController','index','2019-08-16 12:42:57','::1','local',''),(648,4,'Application/Controller/IndexController','index','2019-08-16 12:43:48','::1','local',''),(649,4,'Application/Controller/IndexController','index','2019-08-16 12:44:15','::1','local',''),(650,4,'Application/Controller/IndexController','index','2019-08-16 12:44:28','::1','local',''),(651,4,'Application/Controller/IndexController','index','2019-08-16 12:44:48','::1','local',''),(652,4,'Application/Controller/IndexController','index','2019-08-16 12:45:02','::1','local',''),(653,4,'Application/Controller/IndexController','index','2019-08-16 14:25:51','::1','local',''),(654,4,'Application/Controller/IndexController','index','2019-08-16 14:26:26','::1','local',''),(655,4,'Application/Controller/IndexController','index','2019-08-16 14:26:53','::1','local',''),(656,4,'Application/Controller/IndexController','index','2019-08-16 14:27:41','::1','local',''),(657,4,'Application/Controller/IndexController','index','2019-08-16 14:30:00','::1','local',''),(658,4,'Application/Controller/IndexController','index','2019-08-16 14:30:16','::1','local',''),(659,4,'Application/Controller/IndexController','index','2019-08-16 14:30:50','::1','local',''),(660,4,'Application/Controller/IndexController','index','2019-08-16 14:31:06','::1','local',''),(661,4,'Application/Controller/IndexController','index','2019-08-16 14:31:27','::1','local',''),(662,4,'Application/Controller/IndexController','index','2019-08-16 14:32:10','::1','local',''),(663,4,'Application/Controller/IndexController','index','2019-08-16 14:33:42','::1','local',''),(664,4,'Application/Controller/IndexController','index','2019-08-16 14:34:59','::1','local',''),(665,4,'Application/Controller/IndexController','index','2019-08-16 14:38:56','::1','local',''),(666,4,'Application/Controller/IndexController','index','2019-08-16 14:39:17','::1','local',''),(667,4,'Application/Controller/IndexController','index','2019-08-16 14:39:27','::1','local',''),(668,4,'Application/Controller/IndexController','index','2019-08-16 14:39:51','::1','local',''),(669,4,'Application/Controller/IndexController','index','2019-08-16 14:40:18','::1','local',''),(670,4,'Application/Controller/IndexController','index','2019-08-16 14:42:04','::1','local',''),(671,4,'Application/Controller/IndexController','index','2019-08-16 14:43:18','::1','local',''),(672,4,'Application/Controller/IndexController','index','2019-08-16 14:43:42','::1','local',''),(673,4,'Application/Controller/IndexController','index','2019-08-16 14:43:49','::1','local',''),(674,4,'Application/Controller/IndexController','index','2019-08-16 14:44:23','::1','local',''),(675,4,'Application/Controller/IndexController','index','2019-08-16 14:44:35','::1','local',''),(676,4,'Application/Controller/IndexController','index','2019-08-16 14:46:24','::1','local',''),(677,4,'Application/Controller/IndexController','index','2019-08-16 14:46:31','::1','local',''),(678,4,'Application/Controller/IndexController','index','2019-08-16 14:47:46','::1','local',''),(679,4,'Application/Controller/IndexController','index','2019-08-16 14:48:00','::1','local',''),(680,4,'Application/Controller/IndexController','index','2019-08-16 14:49:08','::1','local',''),(681,4,'Application/Controller/IndexController','index','2019-08-16 14:49:17','::1','local',''),(682,4,'Application/Controller/IndexController','index','2019-08-16 15:01:57','::1','local',''),(683,4,'Application/Controller/IndexController','index','2019-08-16 15:02:22','::1','local',''),(684,4,'Application/Controller/IndexController','index','2019-08-16 15:08:44','::1','local',''),(685,4,'Application/Controller/IndexController','index','2019-08-16 15:09:02','::1','local',''),(686,4,'Application/Controller/IndexController','index','2019-08-16 15:09:16','::1','local',''),(687,4,'Application/Controller/IndexController','index','2019-08-16 15:13:39','::1','local',''),(688,4,'Application/Controller/IndexController','index','2019-08-16 15:14:02','::1','local',''),(689,4,'Application/Controller/IndexController','index','2019-08-16 15:14:07','::1','local',''),(690,4,'Application/Controller/IndexController','index','2019-08-16 15:14:15','::1','local',''),(691,4,'Application/Controller/UsuariosController','membros','2019-08-16 15:23:01','::1','local',''),(692,4,'Application/Controller/UsuariosController','grupos','2019-08-16 15:23:16','::1','local',''),(693,4,'Application/Controller/UsuariosController','membros','2019-08-16 15:23:21','::1','local',''),(694,4,'Quadro/Controller/AtasController','atas','2019-08-16 15:23:27','::1','local',''),(695,4,'Application/Controller/IndexController','index','2019-08-16 15:23:31','::1','local',''),(696,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 15:23:40','::1','local',''),(697,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 15:54:26','::1','local',''),(698,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 15:55:12','::1','local',''),(699,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 15:55:28','::1','local',''),(700,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 15:55:50','::1','local',''),(701,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 15:56:23','::1','local',''),(702,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 15:56:36','::1','local',''),(703,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 15:56:48','::1','local',''),(704,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 15:56:55','::1','local',''),(705,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 15:57:06','::1','local',''),(706,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 15:57:10','::1','local',''),(707,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 16:08:17','::1','local',''),(708,4,'Quadro/Controller/EscolaridadeController','escolaridade','2019-08-16 16:08:27','::1','local','{\"pesquisa\":\"teste\",\"filtros\":\"1\"}'),(709,4,'Application/Controller/IndexController','index','2019-08-16 16:10:45','::1','local',''),(710,4,'Quadro/Controller/AtasController','atas','2019-08-16 16:10:52','::1','local',''),(711,4,'Quadro/Controller/BibliotecaController','biblioteca','2019-08-16 16:10:56','::1','local','');
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
INSERT INTO `us_acesso` VALUES (4,'gabriel@hotmail.com','3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2',1),(14,'denilson@hotmail.com','3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2',1);
/*!40000 ALTER TABLE `us_acesso` ENABLE KEYS */;
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
  PRIMARY KEY (`cod_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_pre_cadastro`
--

LOCK TABLES `us_pre_cadastro` WRITE;
/*!40000 ALTER TABLE `us_pre_cadastro` DISABLE KEYS */;
INSERT INTO `us_pre_cadastro` VALUES (4,'Gabriel da Silva Pereira','gabriel@hotmail.com',1,'2019-08-09 12:25:40',2),(14,'Denílson Perez','denilson@hotmail.com',1,'2019-08-09 11:32:43',1);
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
  `email` varchar(200) DEFAULT NULL,
  `email2` varchar(200) DEFAULT NULL,
  `nivel_escolaridade_fk` int(11) DEFAULT NULL,
  `tipo_usuario_fk` int(11) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
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
  `emp_estado` varchar(2) DEFAULT NULL,
  `emp_cep` varchar(8) DEFAULT NULL,
  `emp_telefone` varchar(20) DEFAULT NULL,
  `emp_celular` varchar(20) DEFAULT NULL,
  `data_entrada` datetime DEFAULT NULL,
  `ativo` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_usuario`
--

LOCK TABLES `us_usuario` WRITE;
/*!40000 ALTER TABLE `us_usuario` DISABLE KEYS */;
INSERT INTO `us_usuario` VALUES (4,'Gabriel da Silva Pereira','gabriel@hotmail.com','gabriel2@hotmail.com',2,1,'Rua Sebastião Barlati','59','Casa','Ipaussu','SP','18950000','33442025','14997846430','Análise e Desenvolvimento de Sistemas',6,0,'Noite','Análise e Desenvolvimento de Sistemas',2019,'FATEC','',0,'','solteiro','M','1998-02-20 00:00:00','','','','','','','','',0,0,0,1,'Kplay','Rua Humberto',818,'Edificio','Piraju','SP','18800000','1433443030','14997846431','2019-07-08 10:34:56',1);
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
	in login varchar(200),
    in senha varchar(1000)
)
proc_name:
BEGIN

	declare cod_usuario int;
    
	if (select count(0) from us_acesso a where a.login = login and a.senha = senha) = 0 
    then
			select '1' as cod, 'Senha ou/e Login não estão corretos.' as msg;
			leave proc_name;
    end if;
    
    if (select count(0) from us_pre_cadastro a where a.email = login and situacao = 0) = 1 -- Pré-cadastro pendente de aceitação
    then
			select '1' as cod, 'A aceitação de seu pré-cadastro está pendente.' as msg;
			leave proc_name;
    end if;
    
    if (select count(0) from us_pre_cadastro a where a.email = login and situacao = 3) = 1 -- Pré-cadastro não foi aceito pelo adm 
    then
			select '1' as cod, 'Seu pré-cadastro não foi aceito pelo Administrador.' as msg;
			leave proc_name;
    end if;
    
    if (select count(0) from us_acesso a where a.login = login and situacao = 0) = 1 
    then
			select '1' as cod, 'Esse usuário foi desativado.<br>Entre em contato com o Administrador do grupo.' as msg;
			leave proc_name;
    end if;
    
    -- situacoes: 0) Pré-cadastro pendente de aceitação 1) Pré-cadastro aceito 2) Pré-cadastro finalizado 3) Pré-cadastro rejeitado pelo adm
    
    select '0' as cod, cod_usuario_fk as cod_usuario from us_acesso a where a.login = login and a.senha = senha;
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
    in senha varchar(1000)
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
    
    
    insert into us_pre_cadastro(nome,email,nivel_escolaridade_fk,data_criacao) values(nome,email,escolaridade,now());
    
    set cod_usuario = (select a.cod_usuario from us_pre_cadastro a where a.email = email);
    
    insert into us_acesso(cod_usuario_fk, login, senha, situacao) values (cod_usuario, email, senha, 0);
    
    select '0' as cod, 'Seu pré-cadastro realizado com sucesso.<br>Aguarde até que ele seja aceito.' as msg;
    
    
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
	
    select a.*,date_format(inicio_exibicao, "%d/%m/%Y %H:%i:%s") as dt_convert
    from avs_avisos a
		inner join us_usuario b on a.nivel_escolaridade_fk = b.nivel_escolaridade_fk
	where b.cod_usuario = cod_usuario;

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
			select cod_usuario as cod, nome, b.cod_tipo as tipo_usuario, b.descricao as tipo_usuario_desc, c.cod_nivel as escolaridade, c.descricao as escolaridade_desc
			from us_usuario a
				inner join us_tipo_usuario b on a.tipo_usuario_fk = b.cod_tipo
				inner join nivel_escolaridade c on c.cod_nivel = a.nivel_escolaridade_fk
			where a.cod_usuario = cod_usuario;
	else 
    
			select cod_usuario as cod, nome, 0 as tipo_usuario, 'Pré-Cadastro' as tipo_usuario_desc 
            from us_pre_cadastro a 
            where a.cod_usuario = cod_usuario; 
    
    end if;
    
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
	In filtro int,
    in pesquisa varchar(100),
    in cod_escolaridade int
)
BEGIN

	set pesquisa = CONCAT('%',pesquisa,'%');
    
    
    if cod_escolaridade = 0 then

		if filtro = 1 then
			
            select cod_nivel,descricao as escolaridade, data_criacao
            from nivel_escolaridade
            where descricao like pesquisa
            order by data_criacao desc;
        
        else 
        
			select cod_nivel,descricao as escolaridade, data_criacao
            from nivel_escolaridade
            order by data_criacao desc;
			
		end if;
		
    else 
    
		select cod_nivel,descricao as escolaridade, data_criacao
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
			
            select a.cod_material as cod, a.titulo_artigo, a.titulo_periodico, a.autor, a.volume,arquivo, CONCAT(mes,'-',ano) as mes_ano, CONCAT(a.pagina_inicial,'-',a.pagina_final) as pagina, b.nome as usuario, date_format(a.data_pesquisa, "%d/%m/%Y") as data_pesquisa
            from ltr_material_leitura a
				inner join us_usuario b on a.cod_usuario_fk = a.cod_usuario_fk
			where a.autor like pesquisa
            order by data_criacao desc;
			
		elseif filtro = 2 then
			
            select a.cod_material as cod, a.titulo_artigo, a.titulo_periodico, a.autor, a.volume,arquivo, CONCAT(mes,'-',ano) as mes_ano, CONCAT(a.pagina_inicial,'-',a.pagina_final) as pagina, b.nome as usuario, date_format(a.data_pesquisa, "%d/%m/%Y") as data_pesquisa
            from ltr_material_leitura a
				inner join us_usuario b on a.cod_usuario_fk = a.cod_usuario_fk
			where a.base like pesquisa
            order by data_criacao desc;
            
        elseif filtro = 3 then
        
			select a.cod_material as cod, a.titulo_artigo, a.titulo_periodico, a.autor, a.volume,arquivo, CONCAT(mes,'-',ano) as mes_ano, CONCAT(a.pagina_inicial,'-',a.pagina_final) as pagina, b.nome as usuario, date_format(a.data_pesquisa, "%d/%m/%Y") as data_pesquisa
            from ltr_material_leitura a
				inner join us_usuario b on a.cod_usuario_fk = a.cod_usuario_fk
            order by data_criacao desc;
        
        elseif filtro = 4 then
        
			select a.cod_material as cod, a.titulo_artigo, a.titulo_periodico, a.autor, a.volume,arquivo, CONCAT(mes,'-',ano) as mes_ano, CONCAT(a.pagina_inicial,'-',a.pagina_final) as pagina, b.nome as usuario, date_format(a.data_pesquisa, "%d/%m/%Y") as data_pesquisa
            from ltr_material_leitura a
				inner join us_usuario b on a.cod_usuario_fk = a.cod_usuario_fk
			where a.titulo_periodico like pesquisa
            order by data_criacao desc;
			
		elseif filtro = 5 then
        
			select a.cod_material as cod, a.titulo_artigo, a.titulo_periodico, a.autor, a.volume,arquivo, CONCAT(mes,'-',ano) as mes_ano, CONCAT(a.pagina_inicial,'-',a.pagina_final) as pagina, b.nome as usuario, date_format(a.data_pesquisa, "%d/%m/%Y") as data_pesquisa
            from ltr_material_leitura a
				inner join us_usuario b on a.cod_usuario_fk = a.cod_usuario_fk
			where b.nome like pesquisa
            order by data_criacao desc;
        
        else 
        
			select a.cod_material as cod, a.titulo_artigo, a.titulo_periodico, a.autor, a.volume,arquivo, CONCAT(mes,'-',ano) as mes_ano, CONCAT(a.pagina_inicial,'-',a.pagina_final) as pagina, b.nome as usuario, date_format(a.data_pesquisa, "%d/%m/%Y") as data_pesquisa
            from ltr_material_leitura a
				inner join us_usuario b on a.cod_usuario_fk = a.cod_usuario_fk
            order by data_criacao desc;
			
		end if;
		
    else 
    
		select a.cod_material as cod, a.titulo_artigo, a.titulo_periodico, a.autor, a.volume, arquivo, CONCAT(mes,'-',ano) as mes_ano, CONCAT(a.pagina_inicial,'-',a.pagina_final) as pagina, b.nome as usuario, date_format(a.data_pesquisa, "%d/%m/%Y") as data_pesquisa
		from ltr_material_leitura a
			inner join us_usuario b on a.cod_usuario_fk = a.cod_usuario
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
		acesso.situacao as ativo -- 0-inativo 1-ativo
	from us_pre_cadastro a
		left join us_usuario b on a.cod_usuario = b.cod_usuario
		left join us_tipo_usuario c on b.tipo_usuario_fk = c.cod_tipo
		left join nivel_escolaridade d on d.cod_nivel = b.nivel_escolaridade_fk -- membro/adm
		left join nivel_escolaridade e on e.cod_nivel = a.nivel_escolaridade_fk -- precadastro
        inner join us_acesso acesso on acesso.cod_usuario_fk = a.cod_usuario;
    
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

-- Dump completed on 2019-08-20  9:34:27
