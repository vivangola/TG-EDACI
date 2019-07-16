CREATE DATABASE  IF NOT EXISTS `edaci` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `edaci`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avs_avisos`
--

LOCK TABLES `avs_avisos` WRITE;
/*!40000 ALTER TABLE `avs_avisos` DISABLE KEYS */;
INSERT INTO `avs_avisos` VALUES (1,'Atualização de suas informações','Por favor, mantenha sempre suas informações atualizadas.',2,'2019-07-09 00:00:00','2019-08-09 00:00:00',4,'2019-07-10 11:32:42'),(2,'Processo Seletivo','O processo seletivo de 2019 foi aberto. Inscreva-se.',2,'2019-02-09 00:00:00','2019-10-09 00:00:00',4,'2019-07-10 11:40:50');
/*!40000 ALTER TABLE `avs_avisos` ENABLE KEYS */;
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
  `data` datetime DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
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
  `cod_quadro_fk` int(11) DEFAULT NULL,
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
-- Table structure for table `ltr_quadro_leitura`
--

DROP TABLE IF EXISTS `ltr_quadro_leitura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ltr_quadro_leitura` (
  `cod_quadro` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_quadro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltr_quadro_leitura`
--

LOCK TABLES `ltr_quadro_leitura` WRITE;
/*!40000 ALTER TABLE `ltr_quadro_leitura` DISABLE KEYS */;
/*!40000 ALTER TABLE `ltr_quadro_leitura` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel_escolaridade`
--

LOCK TABLES `nivel_escolaridade` WRITE;
/*!40000 ALTER TABLE `nivel_escolaridade` DISABLE KEYS */;
INSERT INTO `nivel_escolaridade` VALUES (1,'Médio','2019-07-08 10:26:53'),(2,'Superior','2019-07-08 10:26:59');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_aplicacoes`
--

LOCK TABLES `sys_aplicacoes` WRITE;
/*!40000 ALTER TABLE `sys_aplicacoes` DISABLE KEYS */;
INSERT INTO `sys_aplicacoes` VALUES (1,'Atas de Reuniões','atas','/atas',0,1),(2,'Biblioteca','biblioteca','/biblioteca',0,1),(3,'Cadastrar','pre-cadastro','/pre-cadastro',0,1),(4,'Chat','chat','/chat',0,1),(5,'E-mail','email','',0,1),(6,'Enviar E-mail','email','/email/enviar',5,1),(7,'Meus E-mail','email','/email',5,1),(8,'Quadro de Avisos','avisos','/avisos',0,1),(9,'Quadro de Disponibilidade','quadro-disponibilidade','/quadro-disponibilidade',0,1),(10,'Quadro de Eventos','eventos','/eventos',0,1),(11,'Quadro de Literatura','quadro-leitura','/quadro-leitura',0,1),(12,'Níveis de Escolaridade','escolaridade','/escolaridade',0,1),(13,'Plano de Atividades','plano-atividades','/plano_atividades',0,1),(14,'Plano de Metas','plano-metas','/plano-metas',0,1),(15,'Produção de Grupo','producao-grupo','/producao-grupo',0,1),(16,'Questionários','questionario','',0,1),(17,'Aprendizagem','questionario','/questionario/aprendizagem',16,1),(18,'Cadastro','cadastro','/questionario/cadastro',16,1),(19,'Trabalhos de Correção','trabalho-correcao','',0,1),(20,'Meus Trabalhos','trabalho-correcao','/trabalho-correcao',19,1),(21,'Trabalhos Recebidos','trabalho-correcao','/trabalho-correcao/recebidos',19,1),(22,'Usuários','usuarios','',0,1),(23,'Grupos','usuarios','/usuarios/grupos',22,1),(24,'Membros','usuarios','/usuarios/membros',22,1);
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
INSERT INTO `sys_aplicacoes_permissao` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24);
/*!40000 ALTER TABLE `sys_aplicacoes_permissao` ENABLE KEYS */;
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
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(200) DEFAULT NULL,
  `senha` varchar(50) NOT NULL,
  `situacao` int(11) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_acesso`
--

LOCK TABLES `us_acesso` WRITE;
/*!40000 ALTER TABLE `us_acesso` DISABLE KEYS */;
INSERT INTO `us_acesso` VALUES (4,'gabriel@hotmail.com','123',1),(5,'denilson@hotmail.com','123',1);
/*!40000 ALTER TABLE `us_acesso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_pre_cadastro`
--

DROP TABLE IF EXISTS `us_pre_cadastro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `us_pre_cadastro` (
  `cod_cadastro` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `nivel_escolaridade_fk` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_cadastro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_pre_cadastro`
--

LOCK TABLES `us_pre_cadastro` WRITE;
/*!40000 ALTER TABLE `us_pre_cadastro` DISABLE KEYS */;
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
INSERT INTO `us_tipo_usuario` VALUES (1,'Administrador'),(2,'Estudante');
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
	IN cod_usuario int
)
BEGIN
	
    select *
    from sys_aplicacoes a
		inner join sys_aplicacoes_permissao b on a.cod_aplicacao = b.aplicacao
		inner join us_usuario c on c.tipo_usuario_fk = b.tipo_usuario
	where c.cod_usuario = cod_usuario;

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
	
    select *,date_format(inicio_exibicao, "%d/%m/%Y %H:%i:%s") as dt_convert
    from avs_avisos a
		inner join us_usuario b on a.nivel_escolaridade_fk = b.nivel_escolaridade_fk
	where b.cod_usuario = cod_usuario;

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

-- Dump completed on 2019-07-16 16:11:08
