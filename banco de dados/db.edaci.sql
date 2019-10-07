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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca_assunto`
--

LOCK TABLES `biblioteca_assunto` WRITE;
/*!40000 ALTER TABLE `biblioteca_assunto` DISABLE KEYS */;
INSERT INTO `biblioteca_assunto` VALUES (2,4,'Carta de Consentimento','2019-10-03 11:28:18');
/*!40000 ALTER TABLE `biblioteca_assunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disp_quadro_disponibilidade`
--

DROP TABLE IF EXISTS `disp_quadro_disponibilidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disp_quadro_disponibilidade` (
  `cod_disponibilidade` int(11) NOT NULL,
  `cod_registro` int(11) NOT NULL,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  `dataini` date DEFAULT NULL,
  `datafim` date DEFAULT NULL,
  `horaini` time DEFAULT NULL,
  `horafim` time DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disp_quadro_disponibilidade`
--

LOCK TABLES `disp_quadro_disponibilidade` WRITE;
/*!40000 ALTER TABLE `disp_quadro_disponibilidade` DISABLE KEYS */;
INSERT INTO `disp_quadro_disponibilidade` VALUES (0,1,7,'2019-10-07 14:20:44','2019-10-07','2019-10-07','12:00:00','14:00:00',1);
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
INSERT INTO `disp_quadro_disponibilidade_color` VALUES (4,'#742fd0'),(7,'#834ec2');
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
INSERT INTO `disp_quadro_disponibilidade_semanas` VALUES (1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12:00:00','14:00:00','15:00:00','18:00:00','13:00:00','14:00:00','15:50:00','18:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-03 12:02:59');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel_escolaridade`
--

LOCK TABLES `nivel_escolaridade` WRITE;
/*!40000 ALTER TABLE `nivel_escolaridade` DISABLE KEYS */;
INSERT INTO `nivel_escolaridade` VALUES (1,'Graduação','2019-07-08 10:26:53'),(2,'Pós-Graduação','2019-07-08 10:26:59'),(3,'Mestrado','2019-09-03 14:59:48'),(4,'Doutorado','2019-09-04 14:59:48');
/*!40000 ALTER TABLE `nivel_escolaridade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producao_grupo`
--

DROP TABLE IF EXISTS `producao_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producao_grupo` (
  `cod_producao` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `origem` varchar(100) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `modalidade` varchar(100) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `qualis` varchar(100) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  `esclarecimentos` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `formato` varchar(100) DEFAULT NULL,
  `arquivo` varchar(50) DEFAULT NULL,
  `data_publicacao` datetime DEFAULT NULL,
  `data_submissao` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_producao`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producao_grupo`
--

LOCK TABLES `producao_grupo` WRITE;
/*!40000 ALTER TABLE `producao_grupo` DISABLE KEYS */;
INSERT INTO `producao_grupo` VALUES (7,4,'teste','test','teste','teste','teste','teste','teste','teste','Submetido','eteste','producao-2019-10-03-21-10-13.doc','2019-10-03 00:00:00','2019-10-03 16:19:13');
/*!40000 ALTER TABLE `producao_grupo` ENABLE KEYS */;
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
  `dependencia_questao` int(11) DEFAULT NULL,
  `dependencia_alternativa` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qst_questao1`
--

LOCK TABLES `qst_questao1` WRITE;
/*!40000 ALTER TABLE `qst_questao1` DISABLE KEYS */;
INSERT INTO `qst_questao1` VALUES (123,2,'Isso é um teste?',1,0,0,0,'2019-09-27 11:38:48'),(124,2,'Sim',0,1,NULL,NULL,'2019-09-27 11:38:48'),(125,2,'Não',0,1,NULL,NULL,'2019-09-27 11:38:49'),(126,2,'Se sim, porq?',1,0,123,124,'2019-09-27 11:39:17'),(127,2,'Porq sim',0,1,NULL,NULL,'2019-09-27 11:39:18'),(128,2,'Não sei dizer',0,1,NULL,NULL,'2019-09-27 11:39:18'),(146,2,'simm',0,1,NULL,NULL,'2019-09-30 11:16:31'),(147,2,'naon',0,1,NULL,NULL,'2019-09-30 11:16:31'),(148,2,'11',0,1,NULL,NULL,'2019-09-30 11:16:52'),(149,2,'Mas porq não?',1,0,126,147,'2019-09-30 12:12:52'),(150,2,'n sei dizer',0,1,NULL,NULL,'2019-09-30 12:12:53'),(151,2,'ah sei la tbm',0,1,NULL,NULL,'2019-09-30 12:12:53'),(152,2,'Voce é o gabriel?',1,0,0,0,'2019-09-30 14:49:58'),(153,2,'Sim',0,1,NULL,NULL,'2019-09-30 14:49:58'),(154,2,'Não',0,1,NULL,NULL,'2019-09-30 14:49:58');
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
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qst_questao_dependencia`
--

LOCK TABLES `qst_questao_dependencia` WRITE;
/*!40000 ALTER TABLE `qst_questao_dependencia` DISABLE KEYS */;
INSERT INTO `qst_questao_dependencia` VALUES (121,123,0),(122,124,123),(123,125,123),(128,129,0),(135,135,127),(154,132,124),(158,146,126),(159,147,126),(160,126,124),(161,148,126),(162,149,147),(164,150,149),(165,151,149),(166,152,0),(167,153,152),(168,154,152);
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
INSERT INTO `qst_questionario` VALUES (1,'teste',0,1,4,'2019-09-09 15:16:08'),(2,'questionario de teste',1,1,4,'2019-09-09 16:00:33');
/*!40000 ALTER TABLE `qst_questionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qst_questionario_respostas`
--

DROP TABLE IF EXISTS `qst_questionario_respostas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qst_questionario_respostas` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `cod_questao_fk` int(11) DEFAULT NULL,
  `resposta` varchar(8000) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qst_questionario_respostas`
--

LOCK TABLES `qst_questionario_respostas` WRITE;
/*!40000 ALTER TABLE `qst_questionario_respostas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qst_questionario_respostas` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_aplicacoes`
--

LOCK TABLES `sys_aplicacoes` WRITE;
/*!40000 ALTER TABLE `sys_aplicacoes` DISABLE KEYS */;
INSERT INTO `sys_aplicacoes` VALUES (1,'Atas de Reuniões','atas','/atas',0,1),(2,'Biblioteca','biblioteca','/biblioteca',0,1),(3,'Cadastrar','pre-cadastro','/pre-cadastro',0,1),(4,'Chat','chat','/chat',0,0),(5,'E-mail','email','',0,1),(6,'Enviar E-mail','email','/email/enviar',5,1),(7,'Meus E-mail','email','/email',5,1),(8,'Quadro de Avisos','avisos','/avisos',0,1),(9,'Quadro de Disponibilidade','quadro-disponibilidade','/quadro-disponibilidade',0,1),(10,'Quadro de Eventos','eventos','/eventos',0,1),(11,'Quadro de Literatura','quadro-leitura','/quadro-leitura',0,1),(12,'Níveis de Escolaridade','escolaridade','/escolaridade',0,1),(13,'Plano de Atividades','plano-atividades','/plano-atividades',0,1),(14,'Plano de Metas','plano-metas','/plano-metas',0,1),(15,'Produção de Grupo','producao-grupo','/producao-grupo',0,1),(16,'Questionários','questionario','',0,1),(17,'Aprendizagem','questionario','/questionario/aprendizagem',16,1),(18,'Cadastro','cadastro','/questionario/cadastro',16,1),(19,'Trabalhos de Correção','trabalho-correcao','',0,1),(20,'Meus Trabalhos','trabalho-correcao','/trabalho-correcao',19,1),(21,'Trabalhos Recebidos','trabalho-correcao','/trabalho-correcao/recebidos',19,1),(22,'Usuários','usuarios','',0,1),(23,'Log de Acessos','log','/usuarios/log',22,1),(24,'Membros','membros','/usuarios/membros',22,1),(25,'Portfolio','portfolio','/portfolio',0,1),(26,'Configurações','configuracao','',0,1),(27,'Meu Perfil','perfil','/perfil',26,1),(28,'Alterar Senha','alterar-senha','/perfil/alterar-senha',26,1),(29,'Questionário Inicial','inicial','/questionario/inicial',0,1),(30,'Assuntos','assunto','/assunto',0,1),(31,'Meu Perfil','perfil','/perfil',0,1);
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
INSERT INTO `sys_aplicacoes_permissao` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,30),(1,9),(2,1),(2,2),(2,5),(2,9),(2,10),(2,11),(2,13),(2,14),(2,15),(2,16),(2,19),(2,25),(2,26),(2,6),(2,7),(2,17),(2,20),(2,21),(2,27),(2,28);
/*!40000 ALTER TABLE `sys_aplicacoes_permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_arquivos`
--

DROP TABLE IF EXISTS `sys_arquivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_arquivos` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_arquivos`
--

LOCK TABLES `sys_arquivos` WRITE;
/*!40000 ALTER TABLE `sys_arquivos` DISABLE KEYS */;
INSERT INTO `sys_arquivos` VALUES (1,NULL,1),(2,NULL,2);
/*!40000 ALTER TABLE `sys_arquivos` ENABLE KEYS */;
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
  `cod_aplicacao` int(11) DEFAULT NULL,
  `controller` varchar(200) DEFAULT NULL,
  `action` varchar(200) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `server` varchar(100) DEFAULT NULL,
  `params` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`cod_log`)
) ENGINE=InnoDB AUTO_INCREMENT=963 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log_acesso_aplicacao`
--

LOCK TABLES `sys_log_acesso_aplicacao` WRITE;
/*!40000 ALTER TABLE `sys_log_acesso_aplicacao` DISABLE KEYS */;
INSERT INTO `sys_log_acesso_aplicacao` VALUES (1,7,NULL,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 08:42:11','::1','local',''),(2,0,NULL,'Login/Controller/LoginController','login','2019-09-30 08:43:38','::1','local',''),(3,4,NULL,'Application/Controller/IndexController','index','2019-09-30 08:51:21','::1','local',''),(4,4,18,'Questionario/Controller/QuestionarioController','cadastro','2019-09-30 08:51:32','::1','local',''),(5,4,18,'Questionario/Controller/QuestionarioController','cadastro','2019-09-30 08:55:37','::1','local',''),(6,4,18,'Questionario/Controller/QuestionarioController','cadastro','2019-09-30 08:58:27','::1','local',''),(7,4,18,'Questionario/Controller/QuestionarioController','cadastro','2019-09-30 09:17:06','::1','local',''),(8,4,18,'Questionario/Controller/QuestionarioController','cadastro','2019-09-30 09:21:45','::1','local',''),(9,4,NULL,'Application/Controller/IndexController','index','2019-09-30 10:03:16','::1','local',''),(10,4,18,'Questionario/Controller/QuestionarioController','cadastro','2019-09-30 10:32:48','::1','local',''),(11,4,18,'Questionario/Controller/QuestionarioController','cadastro','2019-09-30 10:33:19','::1','local',''),(12,4,18,'Questionario/Controller/QuestionarioController','cadastro','2019-09-30 10:33:51','::1','local',''),(13,4,18,'Questionario/Controller/QuestionarioController','cadastro','2019-09-30 10:40:43','::1','local',''),(14,4,18,'Questionario/Controller/QuestionarioController','cadastro','2019-09-30 10:43:48','::1','local',''),(15,4,18,'Questionario/Controller/QuestionarioController','cadastro','2019-09-30 10:49:29','::1','local',''),(16,4,18,'Questionario/Controller/QuestionarioController','cadastro','2019-09-30 10:52:22','::1','local',''),(17,4,18,'Questionario/Controller/QuestionarioController','cadastro','2019-09-30 10:53:03','::1','local',''),(18,4,18,'Questionario/Controller/QuestionarioController','cadastro','2019-09-30 11:15:56','::1','local',''),(19,0,NULL,'Login/Controller/LoginController','login','2019-09-30 11:35:44','::1','local',''),(20,7,NULL,'Application/Controller/IndexController','index','2019-09-30 11:35:52','::1','local',''),(21,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-09-30 11:35:52','::1','local',''),(22,7,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 11:35:55','::1','local',''),(23,7,NULL,'Application/Controller/IndexController','index','2019-09-30 12:11:29','::1','local',''),(24,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-09-30 12:11:30','::1','local',''),(25,0,NULL,'Login/Controller/LoginController','login','2019-09-30 12:11:32','::1','local',''),(26,4,NULL,'Application/Controller/IndexController','index','2019-09-30 12:11:38','::1','local',''),(27,4,18,'Questionario/Controller/QuestionarioController','cadastro','2019-09-30 12:11:49','::1','local',''),(28,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 14:36:47','::1','local',''),(29,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 14:38:03','::1','local',''),(30,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 14:47:01','::1','local',''),(31,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 14:48:20','::1','local',''),(32,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 14:54:43','::1','local',''),(33,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 14:54:44','::1','local',''),(34,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 14:55:57','::1','local',''),(35,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 14:56:37','::1','local',''),(36,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 14:56:54','::1','local',''),(37,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 14:57:29','::1','local',''),(38,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 14:57:43','::1','local',''),(39,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 14:58:14','::1','local',''),(40,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 15:01:05','::1','local',''),(41,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 15:01:13','::1','local',''),(42,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 15:17:03','::1','local',''),(43,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 15:17:37','::1','local',''),(44,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 15:20:08','::1','local',''),(45,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 15:24:03','::1','local',''),(46,4,NULL,'Application/Controller/IndexController','index','2019-09-30 15:31:46','::1','local',''),(47,4,NULL,'Questionario/Controller/QuestionarioController','proxima-questao','2019-09-30 15:33:05','::1','local',''),(48,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 16:05:19','::1','local',''),(49,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 16:05:32','::1','local',''),(50,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 16:05:41','::1','local',''),(51,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 16:06:38','::1','local',''),(52,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 16:07:16','::1','local',''),(53,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 16:07:36','::1','local',''),(54,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 16:37:52','::1','local',''),(55,4,18,'Questionario/Controller/QuestionarioController','cadastro','2019-09-30 16:38:02','::1','local',''),(56,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 16:38:05','::1','local',''),(57,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 16:38:12','::1','local',''),(58,4,18,'Questionario/Controller/QuestionarioController','cadastro','2019-09-30 16:38:19','::1','local',''),(59,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 16:38:23','::1','local',''),(60,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 16:38:44','::1','local',''),(61,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 16:40:41','::1','local',''),(62,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 16:41:19','::1','local',''),(63,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 16:44:53','::1','local',''),(64,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 16:54:34','::1','local',''),(65,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 17:03:22','::1','local',''),(66,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 17:05:27','::1','local',''),(67,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 17:06:18','::1','local',''),(68,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-09-30 17:07:23','::1','local',''),(69,4,NULL,'Application/Controller/IndexController','index','2019-10-01 16:30:58','::1','local',''),(70,4,NULL,'Application/Controller/IndexController','index','2019-10-02 08:21:46','::1','local',''),(71,4,NULL,'Application/Controller/IndexController','index','2019-10-02 08:21:47','::1','local',''),(72,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 11:31:30','::1','local',''),(73,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 11:33:40','::1','local',''),(74,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 11:34:07','::1','local',''),(75,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 12:10:03','::1','local',''),(76,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 12:11:11','::1','local',''),(77,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 12:24:21','::1','local',''),(78,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 12:30:06','::1','local',''),(79,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 12:30:48','::1','local',''),(80,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 12:31:16','::1','local',''),(81,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 12:31:41','::1','local',''),(82,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 12:43:02','::1','local',''),(83,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 12:43:35','::1','local',''),(84,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 12:44:24','::1','local',''),(85,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 12:48:11','::1','local',''),(86,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 14:49:42','::1','local',''),(87,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 15:03:57','::1','local',''),(88,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 15:13:26','::1','local',''),(89,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 15:15:07','::1','local',''),(90,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 15:17:06','::1','local',''),(91,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 15:29:36','::1','local',''),(92,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 15:29:47','::1','local',''),(93,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 15:30:35','::1','local',''),(94,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 15:31:02','::1','local',''),(95,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 15:31:22','::1','local',''),(96,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 15:36:57','::1','local',''),(97,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 15:52:27','::1','local',''),(98,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 15:54:07','::1','local',''),(99,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 15:54:50','::1','local',''),(100,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 15:54:57','::1','local',''),(101,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 15:55:08','::1','local',''),(102,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 15:55:37','::1','local',''),(103,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 15:56:02','::1','local',''),(104,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 16:43:02','::1','local',''),(105,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 16:43:25','::1','local',''),(106,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 16:45:49','::1','local',''),(107,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 16:46:09','::1','local',''),(108,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 16:52:22','::1','local',''),(109,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 16:55:36','::1','local',''),(110,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 16:56:06','::1','local',''),(111,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 16:56:46','::1','local',''),(112,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 16:57:03','::1','local',''),(113,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 16:57:11','::1','local',''),(114,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 16:57:34','::1','local',''),(115,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 16:57:55','::1','local',''),(116,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-02 16:58:04','::1','local',''),(117,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 09:00:54','::1','local',''),(118,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 09:34:54','::1','local',''),(119,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 09:36:29','::1','local',''),(120,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 09:39:01','::1','local',''),(121,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 09:41:32','::1','local',''),(122,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 09:42:25','::1','local',''),(123,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 09:42:59','::1','local',''),(124,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 09:43:57','::1','local',''),(125,4,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-03 12:01:52','::1','local',''),(126,4,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-03 12:02:21','::1','local',''),(127,4,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-03 12:03:01','::1','local',''),(128,4,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-03 12:05:26','::1','local',''),(129,4,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-03 12:05:35','::1','local',''),(130,4,11,'Quadro/Controller/QuadroLeituraController','quadro-leitura','2019-10-03 12:06:44','::1','local',''),(131,4,13,'Quadro/Controller/PlanoAtividadesController','atividades','2019-10-03 12:06:56','::1','local',''),(132,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 12:07:33','::1','local',''),(133,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 12:07:54','::1','local',''),(134,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 12:08:04','::1','local',''),(135,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 12:08:22','::1','local',''),(136,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 12:11:04','::1','local',''),(137,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 16:17:53','::1','local',''),(138,4,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 16:18:02','::1','local',''),(139,4,15,'Quadro/Controller/ProducaoGrupoController','producao-grupo','2019-10-03 16:18:19','::1','local',''),(140,4,15,'Quadro/Controller/ProducaoGrupoController','producao-grupo','2019-10-03 16:19:15','::1','local',''),(141,4,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-03 16:23:05','::1','local',''),(142,4,NULL,'Application/Controller/IndexController','index','2019-10-03 16:23:12','::1','local',''),(143,0,NULL,'Login/Controller/LoginController','login','2019-10-03 16:24:14','::1','local',''),(144,7,NULL,'Application/Controller/IndexController','index','2019-10-03 16:24:22','::1','local',''),(145,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-03 16:24:23','::1','local',''),(146,7,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 16:28:43','::1','local',''),(147,0,NULL,'Login/Controller/LoginController','login','2019-10-03 16:28:56','::1','local',''),(148,7,NULL,'Application/Controller/IndexController','index','2019-10-03 16:29:01','::1','local',''),(149,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-03 16:29:01','::1','local',''),(150,7,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 16:29:04','::1','local',''),(151,0,NULL,'Login/Controller/LoginController','login','2019-10-03 16:29:18','::1','local',''),(152,4,NULL,'Application/Controller/IndexController','index','2019-10-03 16:37:29','::1','local',''),(153,4,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-03 16:37:35','::1','local',''),(154,0,NULL,'Login/Controller/LoginController','login','2019-10-03 16:50:06','::1','local',''),(155,7,NULL,'Application/Controller/IndexController','index','2019-10-03 16:50:12','::1','local',''),(156,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-03 16:50:12','::1','local',''),(157,0,NULL,'Login/Controller/LoginController','login','2019-10-03 16:55:43','::1','local',''),(158,7,NULL,'Application/Controller/IndexController','index','2019-10-03 16:55:46','::1','local',''),(159,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-03 16:55:47','::1','local',''),(160,7,NULL,'Application/Controller/IndexController','index','2019-10-03 17:02:10','::1','local',''),(161,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-03 17:02:11','::1','local',''),(162,7,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 17:02:22','::1','local',''),(163,7,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 17:03:08','::1','local',''),(164,0,NULL,'Login/Controller/LoginController','login','2019-10-03 17:03:23','::1','local',''),(165,7,NULL,'Application/Controller/IndexController','index','2019-10-03 17:03:25','::1','local',''),(166,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-03 17:03:25','::1','local',''),(167,7,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-03 17:03:28','::1','local',''),(168,7,NULL,'Application/Controller/IndexController','index','2019-10-04 08:14:03','::1','local',''),(169,7,NULL,'Application/Controller/IndexController','index','2019-10-04 08:14:03','::1','local',''),(170,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 08:14:04','::1','local',''),(171,7,NULL,'Application/Controller/IndexController','index','2019-10-04 14:15:55','::1','local',''),(172,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 14:15:56','::1','local',''),(173,7,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-04 14:19:15','::1','local',''),(174,7,NULL,'Application/Controller/IndexController','index','2019-10-04 14:19:25','::1','local',''),(175,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 14:19:26','::1','local',''),(176,7,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-04 14:19:29','::1','local',''),(177,7,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-04 14:27:24','::1','local',''),(178,7,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-04 14:48:23','::1','local',''),(179,7,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-04 14:49:55','::1','local',''),(180,0,NULL,'Application/Controller/IndexController','index','2019-10-04 14:50:36','::1','local',''),(181,0,NULL,'Login/Controller/LoginController','login','2019-10-04 14:50:37','::1','local',''),(182,0,NULL,'Application/Controller/IndexController','index','2019-10-04 14:50:37','::1','local',''),(183,4,NULL,'Application/Controller/IndexController','index','2019-10-04 14:50:45','::1','local',''),(184,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 14:50:45','::1','local',''),(185,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 14:51:17','::1','local',''),(186,7,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-04 14:51:17','::1','local',''),(187,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 14:51:21','::1','local',''),(188,7,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-04 14:51:22','::1','local',''),(189,7,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-04 14:51:26','::1','local',''),(190,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 14:51:26','::1','local',''),(191,7,NULL,'Application/Controller/IndexController','index','2019-10-04 14:52:23','::1','local',''),(192,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 14:52:23','::1','local',''),(193,4,NULL,'Application/Controller/IndexController','index','2019-10-04 14:52:41','::1','local',''),(194,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 14:52:41','::1','local',''),(195,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 14:54:50','::1','local',''),(196,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 14:54:56','::1','local',''),(197,0,NULL,'Login/Controller/LoginController','login','2019-10-04 14:54:59','::1','local',''),(198,4,NULL,'Application/Controller/IndexController','index','2019-10-04 14:55:07','::1','local',''),(199,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 15:05:24','::1','local',''),(200,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 15:06:47','::1','local',''),(201,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 15:07:07','::1','local',''),(202,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 15:08:15','::1','local',''),(203,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 15:09:12','::1','local',''),(204,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 15:10:35','::1','local',''),(205,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 15:11:05','::1','local',''),(206,7,27,'Application/Controller/PerfilController','perfil','2019-10-04 15:11:09','::1','local',''),(207,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 15:11:10','::1','local',''),(208,7,28,'Application/Controller/PerfilController','alterar-senha','2019-10-04 15:13:27','::1','local',''),(209,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 15:13:27','::1','local',''),(210,7,27,'Application/Controller/PerfilController','perfil','2019-10-04 15:13:32','::1','local',''),(211,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 15:13:32','::1','local',''),(212,7,27,'Application/Controller/PerfilController','perfil','2019-10-04 15:13:48','::1','local',''),(213,7,27,'Application/Controller/PerfilController','perfil','2019-10-04 15:42:40','::1','local',''),(214,7,27,'Application/Controller/PerfilController','perfil','2019-10-04 15:42:48','::1','local',''),(215,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 15:42:48','::1','local',''),(216,7,27,'Application/Controller/PerfilController','perfil','2019-10-04 15:42:58','::1','local',''),(217,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 15:42:58','::1','local',''),(218,7,27,'Application/Controller/PerfilController','perfil','2019-10-04 15:43:18','::1','local',''),(219,7,27,'Application/Controller/PerfilController','perfil','2019-10-04 15:44:54','::1','local',''),(220,0,NULL,'Login/Controller/LoginController','login','2019-10-04 15:45:08','::1','local',''),(221,7,NULL,'Application/Controller/IndexController','index','2019-10-04 15:45:14','::1','local',''),(222,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 15:45:14','::1','local',''),(223,7,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-04 15:45:26','::1','local',''),(224,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 15:45:27','::1','local',''),(225,7,27,'Application/Controller/PerfilController','perfil','2019-10-04 15:45:43','::1','local',''),(226,0,NULL,'Login/Controller/LoginController','login','2019-10-04 15:46:00','::1','local',''),(227,7,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:02','::1','local',''),(228,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 15:46:03','::1','local',''),(229,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:06','::1','local',''),(230,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:07','::1','local',''),(231,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:08','::1','local',''),(232,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:09','::1','local',''),(233,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:09','::1','local',''),(234,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:10','::1','local',''),(235,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:11','::1','local',''),(236,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:11','::1','local',''),(237,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:12','::1','local',''),(238,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:13','::1','local',''),(239,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:15','::1','local',''),(240,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:16','::1','local',''),(241,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:17','::1','local',''),(242,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:17','::1','local',''),(243,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:18','::1','local',''),(244,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:19','::1','local',''),(245,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:19','::1','local',''),(246,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:20','::1','local',''),(247,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:21','::1','local',''),(248,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:21','::1','local',''),(249,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:27','::1','local',''),(250,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:28','::1','local',''),(251,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:29','::1','local',''),(252,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:29','::1','local',''),(253,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:30','::1','local',''),(254,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:31','::1','local',''),(255,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:32','::1','local',''),(256,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:32','::1','local',''),(257,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:33','::1','local',''),(258,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:34','::1','local',''),(259,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:46:36','::1','local',''),(260,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:47:49','::1','local',''),(261,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:21','::1','local',''),(262,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:41','::1','local',''),(263,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:42','::1','local',''),(264,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:42','::1','local',''),(265,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:42','::1','local',''),(266,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:43','::1','local',''),(267,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:43','::1','local',''),(268,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:44','::1','local',''),(269,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:44','::1','local',''),(270,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:45','::1','local',''),(271,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:45','::1','local',''),(272,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:46','::1','local',''),(273,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:46','::1','local',''),(274,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:46','::1','local',''),(275,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:47','::1','local',''),(276,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:47','::1','local',''),(277,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:47','::1','local',''),(278,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:48','::1','local',''),(279,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:48','::1','local',''),(280,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:49','::1','local',''),(281,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:49','::1','local',''),(282,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:51','::1','local',''),(283,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:52','::1','local',''),(284,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:52','::1','local',''),(285,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:53','::1','local',''),(286,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:53','::1','local',''),(287,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:54','::1','local',''),(288,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:54','::1','local',''),(289,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:55','::1','local',''),(290,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:55','::1','local',''),(291,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:55','::1','local',''),(292,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:56','::1','local',''),(293,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:56','::1','local',''),(294,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:56','::1','local',''),(295,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:57','::1','local',''),(296,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:57','::1','local',''),(297,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:58','::1','local',''),(298,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:58','::1','local',''),(299,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:58','::1','local',''),(300,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:59','::1','local',''),(301,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:48:59','::1','local',''),(302,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:05','::1','local',''),(303,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:05','::1','local',''),(304,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:05','::1','local',''),(305,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:06','::1','local',''),(306,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:06','::1','local',''),(307,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:07','::1','local',''),(308,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:07','::1','local',''),(309,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:07','::1','local',''),(310,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:08','::1','local',''),(311,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:08','::1','local',''),(312,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:09','::1','local',''),(313,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:09','::1','local',''),(314,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:09','::1','local',''),(315,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:10','::1','local',''),(316,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:10','::1','local',''),(317,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:10','::1','local',''),(318,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:11','::1','local',''),(319,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:11','::1','local',''),(320,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:12','::1','local',''),(321,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:12','::1','local',''),(322,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:42','::1','local',''),(323,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:43','::1','local',''),(324,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:43','::1','local',''),(325,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:44','::1','local',''),(326,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:44','::1','local',''),(327,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:44','::1','local',''),(328,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:45','::1','local',''),(329,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:45','::1','local',''),(330,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:45','::1','local',''),(331,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:46','::1','local',''),(332,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:46','::1','local',''),(333,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:47','::1','local',''),(334,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:47','::1','local',''),(335,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:47','::1','local',''),(336,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:48','::1','local',''),(337,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:48','::1','local',''),(338,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:48','::1','local',''),(339,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:49','::1','local',''),(340,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:49','::1','local',''),(341,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:49:50','::1','local',''),(342,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:50','::1','local',''),(343,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:50','::1','local',''),(344,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:51','::1','local',''),(345,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:51','::1','local',''),(346,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:51','::1','local',''),(347,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:52','::1','local',''),(348,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:52','::1','local',''),(349,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:53','::1','local',''),(350,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:53','::1','local',''),(351,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:53','::1','local',''),(352,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:54','::1','local',''),(353,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:54','::1','local',''),(354,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:54','::1','local',''),(355,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:55','::1','local',''),(356,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:55','::1','local',''),(357,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:56','::1','local',''),(358,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:56','::1','local',''),(359,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:56','::1','local',''),(360,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:57','::1','local',''),(361,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:50:57','::1','local',''),(362,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 15:51:25','::1','local',''),(363,7,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-04 15:51:31','::1','local',''),(364,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 15:51:32','::1','local',''),(365,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:37','::1','local',''),(366,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:37','::1','local',''),(367,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:38','::1','local',''),(368,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:38','::1','local',''),(369,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:39','::1','local',''),(370,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:39','::1','local',''),(371,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:39','::1','local',''),(372,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:40','::1','local',''),(373,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:40','::1','local',''),(374,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:40','::1','local',''),(375,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:41','::1','local',''),(376,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:41','::1','local',''),(377,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:42','::1','local',''),(378,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:42','::1','local',''),(379,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:42','::1','local',''),(380,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:43','::1','local',''),(381,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:43','::1','local',''),(382,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:43','::1','local',''),(383,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:44','::1','local',''),(384,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:51:44','::1','local',''),(385,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 15:52:12','::1','local',''),(386,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:52:15','::1','local',''),(387,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:53:51','::1','local',''),(388,4,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-04 15:53:59','::1','local',''),(389,4,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-04 15:54:32','::1','local',''),(390,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:54:32','::1','local',''),(391,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:55:08','::1','local',''),(392,4,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-04 15:55:10','::1','local',''),(393,4,NULL,'Application/Controller/IndexController','index','2019-10-04 15:55:13','::1','local',''),(394,7,27,'Application/Controller/PerfilController','perfil','2019-10-04 15:57:35','::1','local',''),(395,4,NULL,'Application/Controller/IndexController','index','2019-10-04 16:10:39','::1','local',''),(396,4,27,'Application/Controller/PerfilController','perfil','2019-10-04 16:10:45','::1','local',''),(397,7,27,'Application/Controller/PerfilController','perfil','2019-10-04 16:10:49','::1','local',''),(398,7,27,'Application/Controller/PerfilController','perfil','2019-10-04 16:13:21','::1','local',''),(399,7,27,'Application/Controller/PerfilController','perfil','2019-10-04 16:14:39','::1','local',''),(400,7,27,'Application/Controller/PerfilController','perfil','2019-10-04 16:17:09','::1','local',''),(401,7,27,'Application/Controller/PerfilController','perfil','2019-10-04 16:21:23','::1','local',''),(402,7,27,'Application/Controller/PerfilController','perfil','2019-10-04 16:25:38','::1','local',''),(403,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:39','::1','local',''),(404,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:39','::1','local',''),(405,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:39','::1','local',''),(406,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:40','::1','local',''),(407,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:40','::1','local',''),(408,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:40','::1','local',''),(409,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:41','::1','local',''),(410,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:41','::1','local',''),(411,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:41','::1','local',''),(412,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:42','::1','local',''),(413,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:42','::1','local',''),(414,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:42','::1','local',''),(415,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:43','::1','local',''),(416,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:43','::1','local',''),(417,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:43','::1','local',''),(418,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:44','::1','local',''),(419,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:44','::1','local',''),(420,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:44','::1','local',''),(421,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:45','::1','local',''),(422,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:46','::1','local',''),(423,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:46','::1','local',''),(424,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:47','::1','local',''),(425,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:47','::1','local',''),(426,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:47','::1','local',''),(427,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:48','::1','local',''),(428,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:48','::1','local',''),(429,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:49','::1','local',''),(430,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:49','::1','local',''),(431,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:49','::1','local',''),(432,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:50','::1','local',''),(433,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:50','::1','local',''),(434,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:50','::1','local',''),(435,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:51','::1','local',''),(436,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:51','::1','local',''),(437,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:51','::1','local',''),(438,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:52','::1','local',''),(439,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:52','::1','local',''),(440,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:52','::1','local',''),(441,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:53','::1','local',''),(442,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:58','::1','local',''),(443,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 16:25:59','::1','local',''),(444,7,NULL,'Login/Controller/LoginController','login','2019-10-04 16:25:59','::1','local',''),(445,4,24,'Application/Controller/UsuariosController','membros','2019-10-04 16:57:53','::1','local',''),(446,4,NULL,'Application/Controller/UsuariosController','not-found','2019-10-04 16:57:55','::1','local',''),(447,4,NULL,'Application/Controller/IndexController','index','2019-10-04 16:57:56','::1','local',''),(448,4,24,'Application/Controller/UsuariosController','membros','2019-10-04 17:02:17','::1','local',''),(449,4,24,'Application/Controller/UsuariosController','membros','2019-10-04 17:02:35','::1','local',''),(450,4,NULL,'Application/Controller/UsuariosController','not-found','2019-10-04 17:02:36','::1','local',''),(451,4,NULL,'Application/Controller/IndexController','index','2019-10-04 17:02:36','::1','local',''),(452,4,24,'Application/Controller/UsuariosController','membros','2019-10-04 17:06:08','::1','local',''),(453,4,24,'Application/Controller/UsuariosController','membros','2019-10-04 17:06:15','::1','local',''),(454,7,NULL,'Application/Controller/IndexController','index','2019-10-04 17:06:21','::1','local',''),(455,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:06:22','::1','local',''),(456,7,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-04 17:06:29','::1','local',''),(457,0,NULL,'Login/Controller/LoginController','login','2019-10-04 17:06:49','::1','local',''),(458,7,NULL,'Application/Controller/IndexController','index','2019-10-04 17:06:52','::1','local',''),(459,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:06:52','::1','local',''),(460,7,27,'Application/Controller/PerfilController','perfil','2019-10-04 17:07:01','::1','local',''),(461,7,27,'Application/Controller/PerfilController','perfil','2019-10-04 17:07:26','::1','local',''),(462,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:26','::1','local',''),(463,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:27','::1','local',''),(464,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:27','::1','local',''),(465,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:27','::1','local',''),(466,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:28','::1','local',''),(467,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:28','::1','local',''),(468,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:28','::1','local',''),(469,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:29','::1','local',''),(470,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:29','::1','local',''),(471,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:29','::1','local',''),(472,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:30','::1','local',''),(473,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:30','::1','local',''),(474,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:30','::1','local',''),(475,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:31','::1','local',''),(476,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:31','::1','local',''),(477,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:31','::1','local',''),(478,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:32','::1','local',''),(479,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:32','::1','local',''),(480,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:32','::1','local',''),(481,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:33','::1','local',''),(482,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:34','::1','local',''),(483,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:34','::1','local',''),(484,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:34','::1','local',''),(485,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:35','::1','local',''),(486,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:35','::1','local',''),(487,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:36','::1','local',''),(488,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:36','::1','local',''),(489,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:36','::1','local',''),(490,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:37','::1','local',''),(491,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:37','::1','local',''),(492,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:37','::1','local',''),(493,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:38','::1','local',''),(494,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:38','::1','local',''),(495,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:38','::1','local',''),(496,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:39','::1','local',''),(497,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:39','::1','local',''),(498,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:39','::1','local',''),(499,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:40','::1','local',''),(500,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:40','::1','local',''),(501,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:46','::1','local',''),(502,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:46','::1','local',''),(503,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:46','::1','local',''),(504,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:47','::1','local',''),(505,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:47','::1','local',''),(506,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:48','::1','local',''),(507,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:48','::1','local',''),(508,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:49','::1','local',''),(509,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:50','::1','local',''),(510,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:51','::1','local',''),(511,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:51','::1','local',''),(512,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:52','::1','local',''),(513,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:53','::1','local',''),(514,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:53','::1','local',''),(515,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:54','::1','local',''),(516,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:56','::1','local',''),(517,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:56','::1','local',''),(518,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:56','::1','local',''),(519,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:57','::1','local',''),(520,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:57','::1','local',''),(521,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:57','::1','local',''),(522,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:58','::1','local',''),(523,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:58','::1','local',''),(524,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:58','::1','local',''),(525,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:59','::1','local',''),(526,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:59','::1','local',''),(527,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:07:59','::1','local',''),(528,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:08:00','::1','local',''),(529,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:08:00','::1','local',''),(530,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:08:00','::1','local',''),(531,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:08:01','::1','local',''),(532,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:08:01','::1','local',''),(533,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:08:01','::1','local',''),(534,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-04 17:08:02','::1','local',''),(535,7,NULL,'Login/Controller/LoginController','login','2019-10-04 17:08:07','::1','local',''),(536,0,NULL,'Application/Controller/IndexController','index','2019-10-07 08:25:32','127.0.0.1','local',''),(537,0,NULL,'Login/Controller/LoginController','login','2019-10-07 08:25:33','127.0.0.1','local',''),(538,0,NULL,'Application/Controller/IndexController','index','2019-10-07 08:25:48','127.0.0.1','local',''),(539,0,NULL,'Login/Controller/LoginController','login','2019-10-07 08:25:48','127.0.0.1','local',''),(540,7,NULL,'Application/Controller/IndexController','index','2019-10-07 09:50:36','::1','local',''),(541,7,NULL,'Application/Controller/IndexController','index','2019-10-07 09:50:36','::1','local',''),(542,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:37','::1','local',''),(543,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:38','::1','local',''),(544,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:39','::1','local',''),(545,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:40','::1','local',''),(546,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:41','::1','local',''),(547,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:41','::1','local',''),(548,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:42','::1','local',''),(549,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:43','::1','local',''),(550,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:44','::1','local',''),(551,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:44','::1','local',''),(552,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:45','::1','local',''),(553,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:46','::1','local',''),(554,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:46','::1','local',''),(555,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:47','::1','local',''),(556,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:48','::1','local',''),(557,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:49','::1','local',''),(558,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:49','::1','local',''),(559,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:50','::1','local',''),(560,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:51','::1','local',''),(561,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:52','::1','local',''),(562,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:53','::1','local',''),(563,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:54','::1','local',''),(564,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:55','::1','local',''),(565,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:55','::1','local',''),(566,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:56','::1','local',''),(567,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:57','::1','local',''),(568,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:58','::1','local',''),(569,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:58','::1','local',''),(570,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:50:59','::1','local',''),(571,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:00','::1','local',''),(572,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:00','::1','local',''),(573,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:01','::1','local',''),(574,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:02','::1','local',''),(575,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:03','::1','local',''),(576,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:03','::1','local',''),(577,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:04','::1','local',''),(578,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:05','::1','local',''),(579,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:06','::1','local',''),(580,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:06','::1','local',''),(581,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:13','::1','local',''),(582,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:14','::1','local',''),(583,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:15','::1','local',''),(584,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:15','::1','local',''),(585,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:16','::1','local',''),(586,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:17','::1','local',''),(587,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:18','::1','local',''),(588,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:18','::1','local',''),(589,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:19','::1','local',''),(590,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:20','::1','local',''),(591,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:21','::1','local',''),(592,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:21','::1','local',''),(593,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:23','::1','local',''),(594,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:24','::1','local',''),(595,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:25','::1','local',''),(596,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:25','::1','local',''),(597,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:26','::1','local',''),(598,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:27','::1','local',''),(599,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:28','::1','local',''),(600,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:51:28','::1','local',''),(601,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:01','::1','local',''),(602,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:02','::1','local',''),(603,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:03','::1','local',''),(604,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:04','::1','local',''),(605,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:05','::1','local',''),(606,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:05','::1','local',''),(607,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:06','::1','local',''),(608,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:07','::1','local',''),(609,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:08','::1','local',''),(610,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:08','::1','local',''),(611,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:09','::1','local',''),(612,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:10','::1','local',''),(613,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:11','::1','local',''),(614,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:11','::1','local',''),(615,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:12','::1','local',''),(616,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:13','::1','local',''),(617,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:14','::1','local',''),(618,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:15','::1','local',''),(619,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:15','::1','local',''),(620,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:52:16','::1','local',''),(621,7,NULL,'Login/Controller/LoginController','login','2019-10-07 09:52:35','::1','local',''),(622,4,NULL,'Application/Controller/IndexController','index','2019-10-07 09:58:33','::1','local',''),(623,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:33','::1','local',''),(624,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:33','::1','local',''),(625,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:34','::1','local',''),(626,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:34','::1','local',''),(627,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:34','::1','local',''),(628,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:35','::1','local',''),(629,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:35','::1','local',''),(630,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:35','::1','local',''),(631,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:36','::1','local',''),(632,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:36','::1','local',''),(633,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:36','::1','local',''),(634,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:37','::1','local',''),(635,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:37','::1','local',''),(636,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:37','::1','local',''),(637,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:38','::1','local',''),(638,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:38','::1','local',''),(639,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:38','::1','local',''),(640,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:39','::1','local',''),(641,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:39','::1','local',''),(642,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:40','::1','local',''),(643,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:40','::1','local',''),(644,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:40','::1','local',''),(645,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:41','::1','local',''),(646,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:41','::1','local',''),(647,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:41','::1','local',''),(648,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:42','::1','local',''),(649,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:42','::1','local',''),(650,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:42','::1','local',''),(651,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:43','::1','local',''),(652,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:43','::1','local',''),(653,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:44','::1','local',''),(654,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:44','::1','local',''),(655,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:44','::1','local',''),(656,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:45','::1','local',''),(657,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:45','::1','local',''),(658,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:46','::1','local',''),(659,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:46','::1','local',''),(660,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:46','::1','local',''),(661,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:47','::1','local',''),(662,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:52','::1','local',''),(663,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:52','::1','local',''),(664,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:53','::1','local',''),(665,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:53','::1','local',''),(666,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:54','::1','local',''),(667,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:54','::1','local',''),(668,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:54','::1','local',''),(669,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:55','::1','local',''),(670,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:55','::1','local',''),(671,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:55','::1','local',''),(672,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:56','::1','local',''),(673,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:56','::1','local',''),(674,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:57','::1','local',''),(675,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:57','::1','local',''),(676,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:57','::1','local',''),(677,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:57','::1','local',''),(678,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:58','::1','local',''),(679,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:58','::1','local',''),(680,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:58','::1','local',''),(681,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:58:59','::1','local',''),(682,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:29','::1','local',''),(683,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:30','::1','local',''),(684,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:31','::1','local',''),(685,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:32','::1','local',''),(686,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:32','::1','local',''),(687,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:33','::1','local',''),(688,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:34','::1','local',''),(689,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:34','::1','local',''),(690,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:35','::1','local',''),(691,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:36','::1','local',''),(692,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:37','::1','local',''),(693,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:37','::1','local',''),(694,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:38','::1','local',''),(695,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:39','::1','local',''),(696,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:39','::1','local',''),(697,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:40','::1','local',''),(698,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:41','::1','local',''),(699,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:42','::1','local',''),(700,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:42','::1','local',''),(701,4,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 09:59:43','::1','local',''),(702,4,NULL,'Login/Controller/LoginController','login','2019-10-07 10:06:10','::1','local',''),(703,4,NULL,'Application/Controller/IndexController','index','2019-10-07 10:06:15','::1','local',''),(704,4,18,'Questionario/Controller/QuestionarioController','cadastro','2019-10-07 10:11:36','::1','local',''),(705,0,NULL,'Login/Controller/LoginController','login','2019-10-07 10:11:46','::1','local',''),(706,0,NULL,'Application/Controller/IndexController','index','2019-10-07 10:13:06','::1','local',''),(707,0,NULL,'Login/Controller/LoginController','login','2019-10-07 10:13:06','::1','local',''),(708,0,NULL,'Application/Controller/IndexController','index','2019-10-07 10:13:07','::1','local',''),(709,4,NULL,'Application/Controller/IndexController','index','2019-10-07 10:13:12','::1','local',''),(710,4,24,'Application/Controller/UsuariosController','membros','2019-10-07 10:13:22','::1','local',''),(711,4,24,'Application/Controller/UsuariosController','membros','2019-10-07 10:13:34','::1','local',''),(712,7,NULL,'Application/Controller/IndexController','index','2019-10-07 10:14:08','::1','local',''),(713,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 10:14:09','::1','local',''),(714,7,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-07 10:41:12','::1','local',''),(715,7,29,'Questionario/Controller/QuestionarioController','inicial','2019-10-07 10:42:18','::1','local',''),(716,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 10:42:18','::1','local',''),(717,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 10:42:48','::1','local',''),(718,7,27,'Application/Controller/PerfilController','perfil','2019-10-07 10:42:52','::1','local',''),(719,7,27,'Application/Controller/PerfilController','perfil','2019-10-07 10:49:43','::1','local',''),(720,7,27,'Application/Controller/PerfilController','perfil','2019-10-07 10:49:49','::1','local',''),(721,7,27,'Application/Controller/PerfilController','perfil','2019-10-07 10:51:23','::1','local',''),(722,0,NULL,'Login/Controller/LoginController','login','2019-10-07 11:23:47','::1','local',''),(723,7,NULL,'Application/Controller/IndexController','index','2019-10-07 11:27:18','::1','local',''),(724,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:18','::1','local',''),(725,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:19','::1','local',''),(726,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:19','::1','local',''),(727,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:19','::1','local',''),(728,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:20','::1','local',''),(729,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:20','::1','local',''),(730,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:21','::1','local',''),(731,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:21','::1','local',''),(732,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:21','::1','local',''),(733,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:22','::1','local',''),(734,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:22','::1','local',''),(735,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:22','::1','local',''),(736,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:23','::1','local',''),(737,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:23','::1','local',''),(738,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:24','::1','local',''),(739,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:24','::1','local',''),(740,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:24','::1','local',''),(741,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:25','::1','local',''),(742,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:25','::1','local',''),(743,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:26','::1','local',''),(744,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:26','::1','local',''),(745,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:26','::1','local',''),(746,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:27','::1','local',''),(747,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:27','::1','local',''),(748,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:28','::1','local',''),(749,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:28','::1','local',''),(750,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:28','::1','local',''),(751,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:29','::1','local',''),(752,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:29','::1','local',''),(753,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:29','::1','local',''),(754,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:30','::1','local',''),(755,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:30','::1','local',''),(756,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:30','::1','local',''),(757,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:31','::1','local',''),(758,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:31','::1','local',''),(759,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:31','::1','local',''),(760,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:32','::1','local',''),(761,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:32','::1','local',''),(762,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:33','::1','local',''),(763,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:38','::1','local',''),(764,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:38','::1','local',''),(765,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:39','::1','local',''),(766,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:39','::1','local',''),(767,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:39','::1','local',''),(768,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:40','::1','local',''),(769,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:40','::1','local',''),(770,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:40','::1','local',''),(771,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:41','::1','local',''),(772,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:41','::1','local',''),(773,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:41','::1','local',''),(774,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:42','::1','local',''),(775,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:42','::1','local',''),(776,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:43','::1','local',''),(777,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:43','::1','local',''),(778,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:43','::1','local',''),(779,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:44','::1','local',''),(780,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:44','::1','local',''),(781,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:44','::1','local',''),(782,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:27:45','::1','local',''),(783,7,NULL,'Application/Controller/IndexController','index','2019-10-07 11:28:09','::1','local',''),(784,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:28:09','::1','local',''),(785,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:28:09','::1','local',''),(786,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:28:10','::1','local',''),(787,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:28:10','::1','local',''),(788,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:28:10','::1','local',''),(789,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:28:11','::1','local',''),(790,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:28:11','::1','local',''),(791,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:28:11','::1','local',''),(792,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:28:12','::1','local',''),(793,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:28:12','::1','local',''),(794,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:28:13','::1','local',''),(795,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:28:13','::1','local',''),(796,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:28:13','::1','local',''),(797,7,NULL,'Login/Controller/LoginController','login','2019-10-07 11:28:13','::1','local',''),(798,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:28:14','::1','local',''),(799,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:28:14','::1','local',''),(800,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:28:14','::1','local',''),(801,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:28:15','::1','local',''),(802,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:28:15','::1','local',''),(803,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:28:16','::1','local',''),(804,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:16','::1','local',''),(805,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:16','::1','local',''),(806,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:17','::1','local',''),(807,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:17','::1','local',''),(808,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:17','::1','local',''),(809,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:18','::1','local',''),(810,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:18','::1','local',''),(811,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:19','::1','local',''),(812,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:19','::1','local',''),(813,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:19','::1','local',''),(814,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:20','::1','local',''),(815,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:20','::1','local',''),(816,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:20','::1','local',''),(817,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:21','::1','local',''),(818,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:21','::1','local',''),(819,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:22','::1','local',''),(820,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:22','::1','local',''),(821,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:22','::1','local',''),(822,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:23','::1','local',''),(823,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:23','::1','local',''),(824,7,NULL,'Application/Controller/IndexController','index','2019-10-07 11:29:57','::1','local',''),(825,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:57','::1','local',''),(826,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:57','::1','local',''),(827,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:58','::1','local',''),(828,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:58','::1','local',''),(829,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:58','::1','local',''),(830,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:59','::1','local',''),(831,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:29:59','::1','local',''),(832,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:00','::1','local',''),(833,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:00','::1','local',''),(834,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:00','::1','local',''),(835,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:01','::1','local',''),(836,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:01','::1','local',''),(837,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:01','::1','local',''),(838,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:02','::1','local',''),(839,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:02','::1','local',''),(840,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:02','::1','local',''),(841,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:03','::1','local',''),(842,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:03','::1','local',''),(843,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:03','::1','local',''),(844,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:06','::1','local',''),(845,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:06','::1','local',''),(846,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:07','::1','local',''),(847,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:07','::1','local',''),(848,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:07','::1','local',''),(849,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:08','::1','local',''),(850,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:08','::1','local',''),(851,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:08','::1','local',''),(852,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:09','::1','local',''),(853,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:09','::1','local',''),(854,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:09','::1','local',''),(855,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:10','::1','local',''),(856,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:10','::1','local',''),(857,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:10','::1','local',''),(858,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:11','::1','local',''),(859,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:11','::1','local',''),(860,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:11','::1','local',''),(861,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:12','::1','local',''),(862,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:12','::1','local',''),(863,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:12','::1','local',''),(864,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:18','::1','local',''),(865,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:18','::1','local',''),(866,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:18','::1','local',''),(867,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:19','::1','local',''),(868,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:19','::1','local',''),(869,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:19','::1','local',''),(870,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:20','::1','local',''),(871,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:20','::1','local',''),(872,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:20','::1','local',''),(873,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:21','::1','local',''),(874,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:21','::1','local',''),(875,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:21','::1','local',''),(876,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:22','::1','local',''),(877,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:22','::1','local',''),(878,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:22','::1','local',''),(879,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:23','::1','local',''),(880,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:23','::1','local',''),(881,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:23','::1','local',''),(882,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:24','::1','local',''),(883,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:24','::1','local',''),(884,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:30:43','::1','local',''),(885,7,NULL,'Application/Controller/IndexController','index','2019-10-07 11:30:47','::1','local',''),(886,7,NULL,'Application/Controller/IndexController','index','2019-10-07 11:31:16','::1','local',''),(887,7,NULL,'Application/Controller/IndexController','index','2019-10-07 11:33:48','::1','local',''),(888,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:33:58','::1','local',''),(889,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:33:58','::1','local',''),(890,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:33:59','::1','local',''),(891,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:33:59','::1','local',''),(892,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:33:59','::1','local',''),(893,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:34:00','::1','local',''),(894,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:34:00','::1','local',''),(895,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:34:00','::1','local',''),(896,7,NULL,'Login/Controller/LoginController','login','2019-10-07 11:34:00','::1','local',''),(897,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:34:01','::1','local',''),(898,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:34:01','::1','local',''),(899,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:34:01','::1','local',''),(900,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:34:02','::1','local',''),(901,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:34:02','::1','local',''),(902,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:34:02','::1','local',''),(903,7,NULL,'Application/Controller/IndexController','index','2019-10-07 11:36:24','::1','local',''),(904,7,NULL,'Application/Controller/IndexController','index','2019-10-07 11:36:30','::1','local',''),(905,7,NULL,'Application/Controller/IndexController','bem-vindo','2019-10-07 11:36:30','::1','local',''),(906,7,27,'Application/Controller/PerfilController','perfil','2019-10-07 11:36:34','::1','local',''),(907,7,27,'Application/Controller/PerfilController','perfil','2019-10-07 12:07:08','::1','local',''),(908,7,NULL,'Application/Controller/IndexController','index','2019-10-07 12:07:09','::1','local',''),(909,7,27,'Application/Controller/PerfilController','perfil','2019-10-07 12:07:22','::1','local',''),(910,7,NULL,'Application/Controller/IndexController','index','2019-10-07 12:07:23','::1','local',''),(911,7,NULL,'Application/Controller/IndexController','index','2019-10-07 12:14:17','::1','local',''),(912,7,NULL,'Application/Controller/IndexController','index','2019-10-07 12:21:26','::1','local',''),(913,0,NULL,'Login/Controller/LoginController','login','2019-10-07 12:21:30','::1','local',''),(914,4,NULL,'Application/Controller/IndexController','index','2019-10-07 12:21:33','::1','local',''),(915,4,NULL,'Application/Controller/IndexController','index','2019-10-07 12:25:13','::1','local',''),(916,4,30,'Quadro/Controller/AssuntoController','assunto','2019-10-07 12:25:19','::1','local',''),(917,4,1,'Quadro/Controller/AtasController','atas','2019-10-07 12:25:28','::1','local',''),(918,4,30,'Quadro/Controller/AssuntoController','assunto','2019-10-07 12:25:34','::1','local',''),(919,0,NULL,'Login/Controller/LoginController','login','2019-10-07 12:26:33','::1','local',''),(920,7,NULL,'Application/Controller/IndexController','index','2019-10-07 12:26:39','::1','local',''),(921,7,30,'Quadro/Controller/AssuntoController','assunto','2019-10-07 12:26:42','::1','local',''),(922,0,NULL,'Login/Controller/LoginController','login','2019-10-07 12:26:51','::1','local',''),(923,7,NULL,'Application/Controller/IndexController','index','2019-10-07 12:26:55','::1','local',''),(924,7,NULL,'Application/Controller/IndexController','index','2019-10-07 12:31:11','::1','local',''),(925,7,NULL,'Application/Controller/IndexController','index','2019-10-07 12:31:26','::1','local',''),(926,0,NULL,'Login/Controller/LoginController','login','2019-10-07 12:31:44','::1','local',''),(927,7,NULL,'Application/Controller/IndexController','index','2019-10-07 12:31:46','::1','local',''),(928,7,NULL,'Application/Controller/IndexController','index','2019-10-07 12:33:15','::1','local',''),(929,0,NULL,'Login/Controller/LoginController','login','2019-10-07 12:33:20','::1','local',''),(930,7,NULL,'Application/Controller/IndexController','index','2019-10-07 12:33:22','::1','local',''),(931,7,27,'Application/Controller/PerfilController','perfil','2019-10-07 12:33:27','::1','local',''),(932,7,27,'Application/Controller/PerfilController','perfil','2019-10-07 12:33:39','::1','local',''),(933,0,NULL,'Login/Controller/LoginController','login','2019-10-07 12:34:19','::1','local',''),(934,7,NULL,'Application/Controller/IndexController','index','2019-10-07 12:34:22','::1','local',''),(935,7,NULL,'Application/Controller/IndexController','index','2019-10-07 12:35:38','::1','local',''),(936,7,27,'Application/Controller/PerfilController','perfil','2019-10-07 12:35:47','::1','local',''),(937,7,27,'Application/Controller/PerfilController','perfil','2019-10-07 12:35:57','::1','local',''),(938,7,27,'Application/Controller/PerfilController','perfil','2019-10-07 12:36:17','::1','local',''),(939,7,27,'Application/Controller/PerfilController','perfil','2019-10-07 12:36:25','::1','local',''),(940,7,NULL,'Application/Controller/IndexController','index','2019-10-07 12:36:51','::1','local',''),(941,7,1,'Quadro/Controller/AtasController','atas','2019-10-07 12:36:54','::1','local',''),(942,7,NULL,'Application/Controller/IndexController','index','2019-10-07 12:36:56','::1','local',''),(943,7,NULL,'Application/Controller/IndexController','index','2019-10-07 12:37:09','::1','local',''),(944,7,NULL,'Application/Controller/IndexController','index','2019-10-07 12:39:21','::1','local',''),(945,7,1,'Quadro/Controller/AtasController','atas','2019-10-07 12:39:24','::1','local',''),(946,7,NULL,'Application/Controller/IndexController','index','2019-10-07 13:49:38','::1','local',''),(947,7,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-07 14:02:45','::1','local',''),(948,7,NULL,'Application/Controller/IndexController','index','2019-10-07 14:17:23','::1','local',''),(949,7,15,'Quadro/Controller/ProducaoGrupoController','producao-grupo','2019-10-07 14:17:31','::1','local',''),(950,7,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-07 14:20:26','::1','local',''),(951,7,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-07 14:20:45','::1','local',''),(952,7,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-07 14:22:32','::1','local',''),(953,7,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-07 14:22:42','::1','local',''),(954,7,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-07 14:24:41','::1','local',''),(955,7,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-07 14:25:35','::1','local',''),(956,7,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-07 14:25:44','::1','local',''),(957,7,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-07 14:26:46','::1','local',''),(958,7,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-07 14:26:53','::1','local',''),(959,7,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-07 14:27:15','::1','local',''),(960,7,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-07 14:27:30','::1','local',''),(961,7,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-07 14:31:57','::1','local',''),(962,7,9,'Quadro/Controller/QuadroDisponibilidadeController','quadro-disponibilidade','2019-10-07 14:32:03','::1','local','');
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
INSERT INTO `us_acesso` VALUES (4,'sandragp@marilia.unesp.br','202cb962ac59075b964b07152d234b70',1),(7,'teste@teste.com','202cb962ac59075b964b07152d234b70',1);
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
INSERT INTO `us_foto_perfil` VALUES (4,'foto-perfil-4-19-09-16-17-37-00.jpg'),(7,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_pre_cadastro`
--

LOCK TABLES `us_pre_cadastro` WRITE;
/*!40000 ALTER TABLE `us_pre_cadastro` DISABLE KEYS */;
INSERT INTO `us_pre_cadastro` VALUES (4,'Sandra','sandragp@marilia.unesp.br',1,'2019-09-16 14:45:05',3,0),(7,'membro de testes','teste@teste.com',3,'2019-09-26 16:06:37',3,1);
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
  `genero` char(1) DEFAULT NULL,
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
  `curso_periodo` varchar(20) DEFAULT NULL,
  `graduacao_nome` varchar(100) DEFAULT NULL,
  `graduacao_ano_conclusao` int(11) DEFAULT NULL,
  `graduacao_instituicao` varchar(100) DEFAULT NULL,
  `pos_graduacao_nome` varchar(100) DEFAULT NULL,
  `pos_graduacao_ano` int(11) DEFAULT NULL,
  `pos_graduacao_instituicao` varchar(100) DEFAULT NULL,
  `mestrado_nome` varchar(100) DEFAULT NULL,
  `mestrado_ano` int(11) DEFAULT NULL,
  `mestrado_instituicao` varchar(100) DEFAULT NULL,
  `doutorado_nome` varchar(100) DEFAULT NULL,
  `doutorado_ano` int(11) DEFAULT NULL,
  `doutorado_instituicao` varchar(100) DEFAULT NULL,
  `estado_civil` varchar(30) DEFAULT NULL,
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
INSERT INTO `us_usuario` VALUES (4,'Sandra Regina Gimeniz','410.431.028-09',22,'M','sandragp@marilia.unesp.br','',4,1,'qwdqwdqwdqwd','123','qwdqwdqwd','qwdqwdqwd','qwdqwdqw','AC','18950000','1433442526','14997828864','ADS',6,'MANHA','',0,'','',0,'','',0,'','',0,'','SOLTEIRO','1996-10-26 00:00:00','533515774','ssp','12312312323','','14997828864','','',NULL,1,12312312,123,NULL,'','',0,'','','','AC','','','',NULL,1),(7,'Membro para Testes','54645645776',0,'M','teste@teste.com','',0,2,'TESTE 2','sdsd','asdasd','Piraju','adad','SP','18800000','','','',0,'','',0,'','',0,'','',0,'','',0,'','SOLTEIRO','2019-10-07 00:00:00','3424234','teste','sadsad','','','','',NULL,1,34343,3434,1,'','',0,'','','','SP','','','','2019-10-07 12:07:07',1);
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
    IN tipo_usuario int,
    IN situacao_usuario int
)
BEGIN
	
    create temporary table finaltbl(cod_aplicacao int, titulo varchar(80), pagina varchar(80), link varchar(80), submenu int, ativo int, tipo_usuario int, aplicacao int);
    
    insert into finaltbl
    select *
    from sys_aplicacoes a
		inner join sys_aplicacoes_permissao b on a.cod_aplicacao = b.aplicacao
	where ((tipo = 1 and submenu = 0) or (tipo = 2 and submenu <> 0))
		and tipo_usuario = b.tipo_usuario
        and ativo = 1
    order by a.titulo asc;
    
    if situacao_usuario = 1 and tipo = 1 -- permitir questionario inicial
    then
		insert into finaltbl
        select cod_aplicacao, titulo, pagina, link, submenu, ativo, 0, 0
		from sys_aplicacoes a
        where a.submenu = 0 and cod_aplicacao = 29;
    end if;
    
    if situacao_usuario = 2 and tipo = 1 -- permitir perfil
    then
		insert into finaltbl
        select cod_aplicacao, titulo, pagina, link, submenu, ativo, 0, 0
		from sys_aplicacoes a
        where a.submenu = 0 and cod_aplicacao = 31;
    end if;
    
    select * from finaltbl;
    drop table finaltbl;
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
    
    if (select count(0) from us_pre_cadastro a where a.email = login and situacao = 4) = 1 -- Pré-cadastro não foi aceito pelo adm 
    then
			select '1' as cod, senha_usuario, 'Seu pré-cadastro não foi aceito pelo Administrador.' as msg;
			leave proc_name;
    end if;
    
    if (select count(0) from us_acesso a where a.login = login and situacao = 0) = 1 
    then
			select '1' as cod, senha_usuario, 'Esse usuário foi desativado.<br>Entre em contato com o Administrador do grupo.' as msg;
			leave proc_name;
    end if;
    
    -- situacoes: 0) Pré-cadastro pendente de aceitação 1) Pré-cadastro aceito 2) Pré-cadastro finalizado 4) Pré-cadastro rejeitado pelo adm
    
    select '0' as cod, senha_usuario, cod_usuario_fk as cod_usuario from us_acesso a where a.login = login;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sys_mudarTipoUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sys_mudarTipoUsuario`(
	IN cod_user int,
    IN tipo_usuario int -- -1) usuario não aceito
						--  0) pendente de aceitação
						--  1) usuario aceito = responder questionario ;
						--  2) usuario aceito + respondeu questionario = alterar dados do perfil;
                        --  3) usuario aceito + respondeu questionario + alterou perfil = novo membro;
)
proc_name:
BEGIN
	
    if tipo_usuario < 3 then
		delete from us_usuario where cod_usuario = cod_user;
        delete from qst_questionario_respostas where cod_usuario_fk = cod_user;
	end if;
    
    if tipo_usuario = -1 then 
    
		update us_pre_cadastro set situacao = 4 where cod_usuario = cod_user;
		
	end if;
    
    if tipo_usuario = 0 then 
    
		update us_pre_cadastro set situacao = 0 where cod_usuario = cod_user;
		
	end if;
    
    if tipo_usuario = 1 then 
    
		update us_pre_cadastro set situacao = 1 where cod_usuario = cod_user;
		
	end if;
    
    if tipo_usuario = 2 then 
    
		update us_pre_cadastro set situacao = 2 where cod_usuario = cod_user;
		
	end if;
    
    if tipo_usuario = 3 then 
    
		update us_pre_cadastro set situacao = 3 where cod_usuario = cod_user;
		
	end if;
    
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
        
        insert into disp_quadro_disponibilidade_color values (cod_usuario, '#629bad');
    
		select '0' as cod, 'Pré-cadastro realizado com sucesso.<br>As informações de acesso ao sistema, foram enviadas ao email do novo membro.' as msg;
	else
		-- fluxo normal
		insert into us_pre_cadastro(nome,email,nivel_escolaridade_fk,data_criacao,situacao,adm) values(nome,email,escolaridade,now(),0,0);
    
		set cod_usuario = (select a.cod_usuario from us_pre_cadastro a where a.email = email);
    
		insert into us_acesso(cod_usuario_fk, login, senha, situacao) values (cod_usuario, email, senha, 0);
        
        insert into us_foto_perfil(cod_usuario_fk, nome_foto) values (cod_usuario, '');
        
        insert into disp_quadro_disponibilidade_color values (cod_usuario, '#629bad');
    
		select '0' as cod, 'Seu pré-cadastro foi realizado com sucesso.<br>Aguarde até que ele seja aceito.' as msg;
	end if;
    
    
    
    -- us_acesso situacooes = 0)Bloqueado 1)Ativo
    
    -- us_pre_cadastro situacoes =
    -- 0) Pré-cadastro pendente de aceitação 
    -- 1) Pré-cadastro aceito e relizar questionario inicial 
    -- 2) Pré-cadastro questinario inicial realizado e realizar alteração no perfil
    -- 3) Pré-cadastro finalizado 
    -- 4) Pré-cadastro rejeitado pelo adm
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sys_verificaPermissao_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sys_verificaPermissao_sp`(
	IN cod_usuario int,
    IN tipo_usuario int,
    IN situacao_usuario int,
    IN cod_aplicacao int
)
proc_name:
BEGIN
	
    if situacao_usuario < 3 then 
			
            if (situacao_usuario = 1 and cod_aplicacao = 29) then
				select 0 as cod;
                leave proc_name;
            end if;
            
            if (situacao_usuario = 2 and (cod_aplicacao = 31 or cod_aplicacao = 27)) then
				select 0 as cod;
                leave proc_name;
            end if;
            
    end if;
    
    if (select count(0) from sys_aplicacoes_permissao b where cod_aplicacao = b.aplicacao and tipo_usuario = b.tipo_usuario) = 1 then
		select 0 as cod;
		leave proc_name;
	end if;
    
    select 1 as cod;
	leave proc_name;
    
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

	if(select count(0) from us_pre_cadastro a where a.cod_usuario = cod_usuario and situacao = 3) = 1
    then
			select cod_usuario as cod, nome, b.cod_tipo as tipo_usuario, b.descricao as tipo_usuario_desc, c.cod_nivel as escolaridade, c.descricao as escolaridade_desc, d.nome_foto, 4 as situacao
			from us_usuario a
				inner join us_tipo_usuario b on a.tipo_usuario_fk = b.cod_tipo
				left join nivel_escolaridade c on c.cod_nivel = a.nivel_escolaridade_fk
                inner join us_foto_perfil d on d.cod_usuario_fk = a.cod_usuario
			where a.cod_usuario = cod_usuario;
	else 
    
			select cod_usuario as cod, nome, 0 as tipo_usuario, 'Pré-Cadastro' as tipo_usuario_desc, case when d.nome_foto is null then '' else d.nome_foto end as nome_foto, a.situacao
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
	
	if(select count(0) from us_pre_cadastro a where a.cod_usuario = cod_usuario and situacao = 3) = 1
    then
			select *
			from us_usuario a
			where a.cod_usuario = cod_usuario;
	else 
    
			select cod_usuario,
				nome,
				'' as cpf,
				'' as idade,
				'' as  genero,
				a.email,
				'' as email2,
				'-1' as nivel_escolaridade_fk,
				'' as endereco, 
				'' as numero,
				'' as complemento,
				'' as cidade,
				'' as bairro,
				'' as estado,
				'' as cep,
				'' as fixo,
				'' as celular,
				'' as curso_atual_nome,
				'' as curso_atual_serie,
				'' as curso_periodo,
				'' as graduacao_nome,
				'' as graduacao_ano_conclusao,
				'' as graduacao_instituicao,
				'' as pos_graduacao_nome, 
				'' as pos_graduacao_ano,
				'' as pos_graduacao_instituicao,
				'' as mestrado_nome,
				'' as mestrado_ano,
				'' as mestrado_instituicao,
				'' as doutorado_nome,
				'' as doutorado_ano,
				'' as doutorado_instituicao,
				'' as estado_civil,
				'' as data_nascimento,
				'' as rg,
				'' as orgao_emissor,
				'' as ra, 
				'' as skype, 
				'' as whatsapp, 
				'' as facebook, 
				'' as lattes, 
				'' as foto, 
				'' as num_banco,
				'' as num_conta, 
				'' as num_agencia,
				'' as status, 
				'' as emp_nome,
				'' as emp_endereco, 
				'' as emp_numero,
				'' as emp_complemento, 
				'' as emp_cidade,
				'' as emp_bairro,
				'' as emp_estado,
				'' as emp_cep, 
				'' as emp_telefone,
				'' as emp_celular,
				'' as data_entrada, 
				'' as ativo
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

    create temporary table finalDisp (cod int, cod_registro int, usuario varchar(100), cor varchar(20), dataini datetime, datafim datetime, tipo int, edit int, inicio varchar(50), fim varchar(50), horaini time, horafim time); 
    
	insert into finalDisp (cod,cod_registro,usuario,cor,dataini,datafim,tipo,edit,inicio,fim,horaini,horafim) 
	select a.cod_disponibilidade, a.cod_registro, b.nome , case when c.color is null then '#6CB4C4' else c.color end, CONCAT(dataini,' ',horaini) as dtini, CONCAT(datafim,' ',horafim) as dtfim, '1', 1, date_format(dataini, "%d/%m/%Y") as inicio, CONCAT(date_format(datafim, "%d/%m/%Y"), ' ', horafim) as fim, horaini,horafim 
	from disp_quadro_disponibilidade a 
			inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario 
			left join disp_quadro_disponibilidade_color c on a.cod_usuario_fk = c.cod_usuario 
	where tipo = 1; 

	insert into finalDisp (cod,cod_registro,usuario,cor,dataini,datafim,tipo,edit,inicio,fim,horaini,horafim) 
	select a.cod_disponibilidade, a.cod_registro, b.nome , case when c.color is null then '#6CB4C4' else c.color end, CONCAT(dataini,' ',horaini) as dtini, CONCAT(datafim,' ',horafim) as dtfim, '1', 2, date_format(dataini, "%d/%m/%Y") as inicio, CONCAT(date_format(datafim, "%d/%m/%Y"), ' ', horafim) as fim, horaini,horafim 
	from disp_quadro_disponibilidade a 
		inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario 
		left join disp_quadro_disponibilidade_color c on a.cod_usuario_fk = c.cod_usuario 
	where tipo = 2; 

	select * from finalDisp; drop temporary table finalDisp; 
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
/*!50003 DROP PROCEDURE IF EXISTS `us_buscarProducaoGrupo_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarProducaoGrupo_sp`(IN `filtro` INT, IN `pesquisa` VARCHAR(100), IN `cod_producao` INT)
BEGIN		
	set pesquisa = CONCAT('%',pesquisa,'%');		
    		
    		
    if cod_producao = 0 then		
		if filtro = 1 then		
					
            select a.cod_producao, a.origem, a.titulo, a.autor, a.modalidade, a.nome, a.qualis, a.link, a.esclarecimentos, a.status, b.nome as usuario, a.arquivo, a.formato,		
            date_format(a.data_publicacao, "%d/%m/%Y") as data_publicacao, date_format(a.data_submissao, "%d/%m/%Y") as data_submissao		
            from producao_grupo a		
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario		
			where a.origem like pesquisa		
            order by data_submissao desc;		
					
		elseif filtro = 2 then		
					
            select a.cod_producao, a.origem, a.titulo, a.autor, a.modalidade, a.nome, a.qualis, a.link, a.esclarecimentos, a.status, b.nome as usuario, a.arquivo, a.formato,		
            date_format(a.data_publicacao, "%d/%m/%Y") as data_publicacao, date_format(a.data_submissao, "%d/%m/%Y") as data_submissao		
            from producao_grupo a		
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario		
			where a.titulo like pesquisa		
            order by data_submissao desc;		
            		
        elseif filtro = 3 then		
        		
			select a.cod_producao, a.origem, a.titulo, a.autor, a.modalidade, a.nome, a.qualis, a.link, a.esclarecimentos, a.status, b.nome as usuario,  a.arquivo, a.formato,		
            date_format(a.data_publicacao, "%d/%m/%Y") as data_publicacao, date_format(a.data_submissao, "%d/%m/%Y") as data_submissao		
            from producao_grupo a		
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario		
			where a.autor like pesquisa		
            order by data_submissao desc;		
        		
        elseif filtro = 4 then		
        		
			select a.cod_producao, a.origem, a.titulo, a.autor, a.modalidade, a.nome, a.qualis, a.link, a.esclarecimentos, a.status, b.nome as usuario, a.arquivo, a.formato,		
            date_format(a.data_publicacao, "%d/%m/%Y") as data_publicacao, date_format(a.data_submissao, "%d/%m/%Y") as data_submissao		
            from producao_grupo a		
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario		
			where b.nome like pesquisa		
            order by data_submissao desc;		
        else 		
        		
			select a.cod_producao, a.origem, a.titulo, a.autor, a.modalidade, a.nome, a.qualis, a.link, a.esclarecimentos, a.status, b.nome as usuario, a.arquivo, a.formato,		
            date_format(a.data_publicacao, "%d/%m/%Y") as data_publicacao, date_format(a.data_submissao, "%d/%m/%Y") as data_submissao		
            from producao_grupo a		
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario		
            order by data_submissao desc;		
					
		end if;		
				
    else 		
    		
		select a.cod_producao, a.origem, a.titulo, a.autor, a.modalidade, a.nome, a.qualis, a.link, a.esclarecimentos, a.status, b.nome as usuario, a.arquivo, date_format(a.data_publicacao, "%Y-%m-%d") as dt_pub, a.formato,		
            date_format(a.data_publicacao, "%d/%m/%Y") as data_publicacao, date_format(a.data_submissao, "%d/%m/%Y") as data_submissao		
            from producao_grupo  a		
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario		
			where a.cod_producao = cod_producao		
            order by data_submissao desc;		
    		
    end if;		
    		
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
			
			select b.cod as id,is_sub, 0 as parent, b.desc_pergunta as name, 1 as num_qst, b.dependencia_questao, b.dependencia_alternativa
			from qst_questionario a
				inner join qst_questao1 b on a.cod_questionario = b.cod_questionario
			where a.cod_questionario = questionario and is_sub = 0 order by b.cod asc;

	end;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `us_log_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `us_log_sp`(
	In filtro int,
    in pesquisa varchar(100)
)
BEGIN

	set pesquisa = CONCAT('%',pesquisa,'%');
    

	if filtro = 1 then
	
		select nome as user, c.titulo as aplicacao, date_format(a.data, "%d/%m/%Y %H:%i:%s") as data_movimento, link
		from sys_log_acesso_aplicacao a
			inner join us_usuario b on a.cod_usuario = b.cod_usuario
			inner join sys_aplicacoes c on c.cod_aplicacao = a.cod_aplicacao
		where b.nome like pesquisa
		order by data desc;
		
	else
	
		select nome as user, c.titulo as aplicacao, date_format(a.data, "%d/%m/%Y %H:%i:%s") as data_movimento, link
		from sys_log_acesso_aplicacao a
			inner join us_usuario b on a.cod_usuario = b.cod_usuario
			inner join sys_aplicacoes c on c.cod_aplicacao = a.cod_aplicacao
		where c.titulo like pesquisa
		order by data desc;
		
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

-- Dump completed on 2019-10-07 14:32:31
