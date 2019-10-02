-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 02-Out-2019 às 22:07
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edaci`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `lista_questionario` (IN `cod_questionario` INT)  proc_name:
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
	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sys_listarMenu_sp` (IN `cod_usuario` INT, IN `tipo` INT, IN `tipo_usuario` INT)  BEGIN
	
    select *
    from sys_aplicacoes a
		inner join sys_aplicacoes_permissao b on a.cod_aplicacao = b.aplicacao
	where ((tipo = 1 and submenu = 0) or (tipo = 2 and submenu <> 0))
		and tipo_usuario = b.tipo_usuario
        and ativo = 1
    order by a.titulo asc;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sys_Login_sp` (IN `login` VARCHAR(200))  proc_name:
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sys_novoPreCadastro_sp` (IN `nome` VARCHAR(200), IN `email` VARCHAR(200), IN `escolaridade` INT, IN `senha` VARCHAR(1000), IN `adm` INT)  proc_name:
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `us_aceitarPreCadastro_sp` (IN `adm` INT, IN `usuario` INT, IN `aceitar` INT)  proc_name:
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
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarAssunto_sp` (IN `filtro` INT, IN `pesquisa` VARCHAR(100), IN `cod_assunto` INT)  BEGIN

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
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarAtas_sp` (IN `filtro` INT, IN `pesquisa` VARCHAR(100), IN `cod_atas` INT)  BEGIN

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
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarAtividades_sp` (IN `filtro` INT, IN `pesquisa` VARCHAR(100), IN `cod_atividade` INT, IN `dt_ini` DATE, IN `dt_fim` DATE, IN `is_adm` INT)  BEGIN

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
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarAvisos2_sp` (IN `filtro` INT, IN `pesquisa` VARCHAR(100), IN `cod_aviso` INT)  BEGIN

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
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarAvisos_sp` (IN `cod_usuario` INT)  BEGIN
	
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

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarBiblioteca_sp` (IN `filtro` INT, IN `pesquisa` VARCHAR(100), IN `cod_material` INT)  BEGIN

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
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `us_BuscarDados1_sp` (IN `cod_usuario` INT)  BEGIN

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
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarDadosPrincipal_sp` (IN `cod_usuario` INT)  BEGIN
	
    select * 
    from edaci.us_usuario a
    where a.cod_usuario = cod_usuario;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `us_BuscarDisponibilidadesSemanas_sp` (IN `cod_usuario` INT)  BEGIN
    
    select b.nome as usuario , c.color as cor, a.*, case when cod_usuario = a.cod_usuario_fk then 1 else 0 end as edit
    from disp_quadro_disponibilidade_semanas a 
		inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
        inner join disp_quadro_disponibilidade_color c on a.cod_usuario_fk = c.cod_usuario;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `us_BuscarDisponibilidades_sp` (IN `cod_usuario` INT)  BEGIN
    
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarEscolaridade_sp` (IN `filtro` VARCHAR(2), IN `pesquisa` VARCHAR(100), IN `cod_escolaridade` INT)  BEGIN

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
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarLeitura_sp` (IN `filtro` INT, IN `pesquisa` VARCHAR(100), IN `cod_leitura` INT)  BEGIN

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
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `us_BuscarMembros_sp` (IN `cod_usuario` INT)  BEGIN

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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarProducaoGrupo_sp` (IN `filtro` INT, IN `pesquisa` VARCHAR(100), IN `cod_producao` INT)  BEGIN

	set pesquisa = CONCAT('%',pesquisa,'%');
    
    
    if cod_producao = 0 then

		if filtro = 1 then
			
            select a.cod_producao, a.origem, a.titulo, a.autor, a.modalidade, a.nome, a.qualis, a.link, a.esclarecimentos, a.status, b.nome as usuario, a.arquivo, 
            date_format(a.data_publicacao, "%d/%m/%Y") as data_publicacao, date_format(a.data_submissao, "%d/%m/%Y") as data_submissao
            from producao_grupo a
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
			where a.origem like pesquisa
            order by data_submissao desc;
			
		elseif filtro = 2 then
			
            select a.cod_producao, a.origem, a.titulo, a.autor, a.modalidade, a.nome, a.qualis, a.link, a.esclarecimentos, a.status, b.nome as usuario, a.arquivo,
            date_format(a.data_publicacao, "%d/%m/%Y") as data_publicacao, date_format(a.data_submissao, "%d/%m/%Y") as data_submissao
            from producao_grupo a
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
			where a.titulo like pesquisa
            order by data_submissao desc;
            
        elseif filtro = 3 then
        
			select a.cod_producao, a.origem, a.titulo, a.autor, a.modalidade, a.nome, a.qualis, a.link, a.esclarecimentos, a.status, b.nome as usuario,  a.arquivo,
            date_format(a.data_publicacao, "%d/%m/%Y") as data_publicacao, date_format(a.data_submissao, "%d/%m/%Y") as data_submissao
            from producao_grupo a
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
			where a.autor like pesquisa
            order by data_submissao desc;
        
        elseif filtro = 4 then
        
			select a.cod_producao, a.origem, a.titulo, a.autor, a.modalidade, a.nome, a.qualis, a.link, a.esclarecimentos, a.status, b.nome as usuario, a.arquivo,
            date_format(a.data_publicacao, "%d/%m/%Y") as data_publicacao, date_format(a.data_submissao, "%d/%m/%Y") as data_submissao
            from producao_grupo a
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
			where b.nome like pesquisa
            order by data_submissao desc;
        else 
        
			select a.cod_producao, a.origem, a.titulo, a.autor, a.modalidade, a.nome, a.qualis, a.link, a.esclarecimentos, a.status, b.nome as usuario, a.arquivo,
            date_format(a.data_publicacao, "%d/%m/%Y") as data_publicacao, date_format(a.data_submissao, "%d/%m/%Y") as data_submissao
            from producao_grupo a
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
            order by data_submissao desc;
			
		end if;
		
    else 
    
		select a.cod_producao, a.origem, a.titulo, a.autor, a.modalidade, a.nome, a.qualis, a.link, a.esclarecimentos, a.status, b.nome as usuario, a.arquivo,
            date_format(a.data_publicacao, "%d/%m/%Y") as data_publicacao, date_format(a.data_submissao, "%d/%m/%Y") as data_submissao
            from producao_grupo  a
				inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario
			where a.cod_producao = cod_producao
            order by data_submissao desc;
    
    end if;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `us_buscarQuestionarios_sp` (`questionario` INT)  proc_name:
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `us_log_sp` (IN `filtro` INT, IN `pesquisa` VARCHAR(100))  BEGIN

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
  
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `sys_gerarSenha` () RETURNS VARCHAR(500) CHARSET utf8mb4 begin
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
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atvs_plano_atividades`
--

CREATE TABLE `atvs_plano_atividades` (
  `cod_atividade` int(11) NOT NULL,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `tipo_atividade_fk` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `atvs_plano_atividades`
--

INSERT INTO `atvs_plano_atividades` (`cod_atividade`, `cod_usuario_fk`, `descricao`, `mes`, `ano`, `status`, `tipo_atividade_fk`, `data_criacao`) VALUES
(1, 4, 'Ativdade de teste', 4, 2019, 1, 2, '2019-09-20 10:53:10'),
(2, 4, '', 0, 0, 0, 0, '2019-09-20 16:59:57'),
(3, 4, '', 0, 0, 0, 0, '2019-09-20 17:00:43');

-- --------------------------------------------------------

--
-- Estrutura da tabela `atvs_plano_atividades_status`
--

CREATE TABLE `atvs_plano_atividades_status` (
  `cod` int(11) NOT NULL,
  `descricao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `atvs_plano_atividades_status`
--

INSERT INTO `atvs_plano_atividades_status` (`cod`, `descricao`) VALUES
(1, 'Não iniciada'),
(2, 'Em andamento'),
(3, 'Realizada');

-- --------------------------------------------------------

--
-- Estrutura da tabela `atvs_plano_atividades_tipo`
--

CREATE TABLE `atvs_plano_atividades_tipo` (
  `cod` int(11) NOT NULL,
  `descricao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `atvs_plano_atividades_tipo`
--

INSERT INTO `atvs_plano_atividades_tipo` (`cod`, `descricao`) VALUES
(1, 'Projeto Pessoal'),
(2, 'Projeto do Grupo'),
(3, 'Tutorial'),
(4, 'Outros');

-- --------------------------------------------------------

--
-- Estrutura da tabela `avs_avisos`
--

CREATE TABLE `avs_avisos` (
  `cod_aviso` int(11) NOT NULL,
  `assunto` varchar(100) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `nivel_escolaridade_fk` int(11) DEFAULT NULL,
  `inicio_exibicao` datetime DEFAULT NULL,
  `fim_exibicao` datetime DEFAULT NULL,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `avs_avisos`
--

INSERT INTO `avs_avisos` (`cod_aviso`, `assunto`, `descricao`, `nivel_escolaridade_fk`, `inicio_exibicao`, `fim_exibicao`, `cod_usuario_fk`, `data_cadastro`) VALUES
(1, 'Atualização de suas informações', 'Por favor, mantenha sempre suas informações atualizadas.', 2, '2019-07-09 10:00:00', '2019-08-09 12:00:00', 4, '2019-07-10 11:32:42'),
(2, 'Processo Seletivo', 'O processo seletivo de 2019 foi aberto. Inscreva-se.', 2, '2019-02-09 08:00:00', '2019-10-09 10:00:00', 4, '2019-07-10 11:40:50'),
(15, 'tesad', 'sadsdadÃ£Ã£', -1, '2222-02-12 22:22:00', '2222-02-12 22:22:00', 4, '2019-07-18 15:12:09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `biblioteca`
--

CREATE TABLE `biblioteca` (
  `cod` int(11) NOT NULL,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `conteudo` varchar(200) DEFAULT NULL,
  `assunto_fk` int(11) DEFAULT NULL,
  `arquivo` varchar(200) DEFAULT NULL,
  `data_upload` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `biblioteca`
--

INSERT INTO `biblioteca` (`cod`, `cod_usuario_fk`, `conteudo`, `assunto_fk`, `arquivo`, `data_upload`) VALUES
(7, 4, '', 0, 'material-2019-09-04-16-09-15.', '2019-09-04 11:34:15');

-- --------------------------------------------------------

--
-- Estrutura da tabela `biblioteca_assunto`
--

CREATE TABLE `biblioteca_assunto` (
  `cod` int(11) NOT NULL,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `assunto` varchar(200) DEFAULT NULL,
  `data_inclusao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `biblioteca_assunto`
--

INSERT INTO `biblioteca_assunto` (`cod`, `cod_usuario_fk`, `assunto`, `data_inclusao`) VALUES
(1, 4, 'teste', '2019-10-02 12:23:55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `disp_quadro_disponibilidade`
--

CREATE TABLE `disp_quadro_disponibilidade` (
  `cod_disponibilidade` int(11) NOT NULL,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  `dataini` date DEFAULT NULL,
  `datafim` date DEFAULT NULL,
  `horaini` time DEFAULT NULL,
  `horafim` time DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disp_quadro_disponibilidade_color`
--

CREATE TABLE `disp_quadro_disponibilidade_color` (
  `cod_usuario` int(11) NOT NULL,
  `color` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `disp_quadro_disponibilidade_color`
--

INSERT INTO `disp_quadro_disponibilidade_color` (`cod_usuario`, `color`) VALUES
(4, '#18aab1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `disp_quadro_disponibilidade_semanas`
--

CREATE TABLE `disp_quadro_disponibilidade_semanas` (
  `cod` int(11) NOT NULL,
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
  `data_movimento` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `evts_eventos`
--

CREATE TABLE `evts_eventos` (
  `cod_evento` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `data_ini` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  `local` varchar(200) DEFAULT NULL,
  `valor` decimal(18,2) DEFAULT NULL,
  `site` varchar(200) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `evts_evento_usuario`
--

CREATE TABLE `evts_evento_usuario` (
  `codigo` int(11) NOT NULL,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `cod_evento_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ltr_material_leitura`
--

CREATE TABLE `ltr_material_leitura` (
  `cod_material` int(11) NOT NULL,
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
  `endereco_acesso` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ltr_material_palavra_chaves`
--

CREATE TABLE `ltr_material_palavra_chaves` (
  `cod` int(11) NOT NULL,
  `cod_material_fk` int(11) DEFAULT NULL,
  `cod_palavra_chave_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ltr_palavra_chave`
--

CREATE TABLE `ltr_palavra_chave` (
  `cod_palavra_chave` int(11) NOT NULL,
  `descricao` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `material_grupo`
--

CREATE TABLE `material_grupo` (
  `cod_material` int(11) NOT NULL,
  `nivel_escolaridade_fk` int(11) DEFAULT NULL,
  `conteudo_sintetico` varchar(500) DEFAULT NULL,
  `arquivo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mts_metas`
--

CREATE TABLE `mts_metas` (
  `cod_meta` int(11) NOT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `tipo_atividade_fk` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mts_plano_metas`
--

CREATE TABLE `mts_plano_metas` (
  `cod_quadro` int(11) NOT NULL,
  `cod_usuario_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `nivel_escolaridade`
--

CREATE TABLE `nivel_escolaridade` (
  `cod_nivel` int(11) NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `nivel_escolaridade`
--

INSERT INTO `nivel_escolaridade` (`cod_nivel`, `descricao`, `data_criacao`) VALUES
(1, 'Graduação', '2019-07-08 10:26:53'),
(2, 'Pós-Graduação', '2019-07-08 10:26:59'),
(3, 'Mestrado', '2019-09-03 14:59:48'),
(4, 'Doutorado', '2019-09-04 14:59:48');

-- --------------------------------------------------------

--
-- Estrutura da tabela `producao_grupo`
--

CREATE TABLE `producao_grupo` (
  `cod_producao` int(11) NOT NULL,
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
  `data_submissao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `producao_grupo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `qst_questao`
--

CREATE TABLE `qst_questao` (
  `cod_questao` int(11) NOT NULL,
  `descricao_pergunta` varchar(500) DEFAULT NULL,
  `cod_questionario_fk` int(11) DEFAULT NULL,
  `tipo_pergunta_fk` int(11) DEFAULT NULL,
  `nivel_escolaridade_fk` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `qst_questao1`
--

CREATE TABLE `qst_questao1` (
  `cod` int(11) NOT NULL,
  `cod_questionario` int(11) DEFAULT NULL,
  `desc_pergunta` varchar(1000) DEFAULT NULL,
  `tipo_pergunta` int(11) DEFAULT NULL,
  `is_sub` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `qst_questao1`
--

INSERT INTO `qst_questao1` (`cod`, `cod_questionario`, `desc_pergunta`, `tipo_pergunta`, `is_sub`, `data_criacao`) VALUES
(46, 2, 'teste?', 1, 0, '2019-09-18 12:03:40'),
(47, 2, 'sim', 0, 1, '2019-09-18 12:03:40'),
(48, 2, 'nao', 0, 1, '2019-09-18 12:03:40'),
(49, 2, 'voce tem dinheiro', 1, 0, '2019-09-18 12:04:51'),
(50, 2, 'sim', 0, 1, '2019-09-18 12:04:51'),
(51, 2, 'nao', 0, 1, '2019-09-18 12:04:51'),
(52, 2, 'voce tem carro?', 1, 0, '2019-09-18 12:05:23'),
(53, 2, 'nao sei', 0, 1, '2019-09-18 12:05:23'),
(54, 2, 'tenhoi', 0, 1, '2019-09-18 12:05:23'),
(55, 2, 'asdasddssad??', 1, 0, '2019-09-18 12:06:13'),
(56, 2, 'asdasdsa', 0, 1, '2019-09-18 12:06:13'),
(57, 2, 'dasdsad', 0, 1, '2019-09-18 12:06:13'),
(58, 2, 'testeeeeee', 1, 0, '2019-09-18 12:10:57'),
(59, 2, 'sdadad', 0, 1, '2019-09-18 12:10:57'),
(60, 2, 'sadsadsad', 0, 1, '2019-09-18 12:10:57'),
(61, 2, 'asdsadsad', 0, 1, '2019-09-18 12:10:57'),
(62, 2, 'asdsasadad?', 1, 0, '2019-09-18 12:14:10'),
(63, 2, 'testestet', 0, 1, '2019-09-18 12:14:10'),
(64, 2, 'testeste', 0, 1, '2019-09-18 12:14:10'),
(65, 2, 'etsteteste', 0, 1, '2019-09-18 12:14:11'),
(66, 2, 'etesteste', 0, 1, '2019-09-18 12:14:11'),
(67, 2, 'eteste', 0, 1, '2019-09-18 12:14:11'),
(68, 2, 'asdaadsdasdsaadssad', 1, 0, '2019-09-18 12:14:32'),
(69, 2, 'dadad', 0, 1, '2019-09-18 12:14:32'),
(70, 2, 'adadads', 0, 1, '2019-09-18 12:14:32'),
(71, 2, 'testeeeeee', 1, 0, '2019-09-18 12:29:53'),
(72, 2, 'sadadadasd', 0, 1, '2019-09-18 12:29:53'),
(73, 2, 'sadsadsadasada', 0, 1, '2019-09-18 12:29:53'),
(74, 2, 'sadasadadasd', 0, 1, '2019-09-18 12:29:53'),
(75, 2, 'teeeeeeeeeeeeeeeeeeeeeeee', 1, 0, '2019-09-18 12:32:44'),
(76, 2, 'asdsadasd', 0, 1, '2019-09-18 12:32:44'),
(77, 2, 'asdasdsad', 0, 1, '2019-09-18 12:32:44');

-- --------------------------------------------------------

--
-- Estrutura da tabela `qst_questao_dependencia`
--

CREATE TABLE `qst_questao_dependencia` (
  `cod_dependencia` int(11) NOT NULL,
  `cod_questao_dependente` int(11) DEFAULT NULL,
  `cod_questao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `qst_questao_dependencia`
--

INSERT INTO `qst_questao_dependencia` (`cod_dependencia`, `cod_questao_dependente`, `cod_questao`) VALUES
(40, 46, 0),
(41, 47, 46),
(42, 48, 46),
(43, 49, 0),
(44, 50, 49),
(45, 51, 49),
(46, 52, 0),
(47, 53, 52),
(48, 54, 52),
(49, 55, 0),
(50, 56, 55),
(51, 57, 55),
(52, 58, 0),
(53, 59, 58),
(54, 60, 58),
(55, 61, 58),
(56, 62, 0),
(57, 63, 62),
(58, 64, 62),
(59, 65, 62),
(60, 66, 62),
(61, 67, 62),
(62, 68, 0),
(63, 69, 68),
(64, 70, 68),
(65, 71, 0),
(66, 72, 71),
(67, 73, 71),
(68, 74, 71),
(69, 75, 0),
(70, 76, 75),
(71, 77, 75);

-- --------------------------------------------------------

--
-- Estrutura da tabela `qst_questionario`
--

CREATE TABLE `qst_questionario` (
  `cod_questionario` int(11) NOT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `status_questionario` int(11) DEFAULT NULL,
  `cod_tipo_fk` int(11) DEFAULT NULL,
  `cod_usuario_fk` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `qst_questionario`
--

INSERT INTO `qst_questionario` (`cod_questionario`, `descricao`, `status_questionario`, `cod_tipo_fk`, `cod_usuario_fk`, `data_criacao`) VALUES
(1, 'teste', 1, 1, 4, '2019-09-09 15:16:08'),
(2, 'questionario de teste', 1, 1, 4, '2019-09-09 16:00:33');

-- --------------------------------------------------------

--
-- Estrutura da tabela `qst_respostas`
--

CREATE TABLE `qst_respostas` (
  `cod_resposta` int(11) NOT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `is_correta` int(11) DEFAULT NULL,
  `cod_questao_fk` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `qst_tipo_pergunta`
--

CREATE TABLE `qst_tipo_pergunta` (
  `cod_tipo` int(11) NOT NULL,
  `descricao_tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `qst_tipo_questionario`
--

CREATE TABLE `qst_tipo_questionario` (
  `cod_tipo` int(11) NOT NULL,
  `descricacao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `reu_atas`
--

CREATE TABLE `reu_atas` (
  `cod_ata` int(11) NOT NULL,
  `data_inclusao` datetime DEFAULT NULL,
  `conteudo` varchar(100) DEFAULT NULL,
  `texto` varchar(500) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `usuario_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `reu_reuniao`
--

CREATE TABLE `reu_reuniao` (
  `cod_reuniao` int(11) NOT NULL,
  `data_criacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `reu_reuniao_usuario`
--

CREATE TABLE `reu_reuniao_usuario` (
  `cod` int(11) NOT NULL,
  `cod_reuniao_fk` int(11) DEFAULT NULL,
  `cod_usuario_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sys_aplicacoes`
--

CREATE TABLE `sys_aplicacoes` (
  `cod_aplicacao` int(11) NOT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `pagina` varchar(200) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `submenu` int(11) DEFAULT NULL,
  `ativo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `sys_aplicacoes`
--

INSERT INTO `sys_aplicacoes` (`cod_aplicacao`, `titulo`, `pagina`, `link`, `submenu`, `ativo`) VALUES
(1, 'Atas de Reuniões', 'atas', '/atas', 0, 1),
(2, 'Biblioteca', 'biblioteca', '/biblioteca', 0, 1),
(3, 'Cadastrar', 'pre-cadastro', '/pre-cadastro', 0, 1),
(4, 'Chat', 'chat', '/chat', 0, 0),
(5, 'E-mail', 'email', '', 0, 1),
(6, 'Enviar E-mail', 'email', '/email/enviar', 5, 1),
(7, 'Meus E-mail', 'email', '/email', 5, 1),
(8, 'Quadro de Avisos', 'avisos', '/avisos', 0, 1),
(9, 'Quadro de Disponibilidade', 'quadro-disponibilidade', '/quadro-disponibilidade', 0, 1),
(10, 'Quadro de Eventos', 'eventos', '/eventos', 0, 1),
(11, 'Quadro de Literatura', 'quadro-leitura', '/quadro-leitura', 0, 1),
(12, 'Níveis de Escolaridade', 'escolaridade', '/escolaridade', 0, 1),
(13, 'Plano de Atividades', 'plano-atividades', '/plano-atividades', 0, 1),
(14, 'Plano de Metas', 'plano-metas', '/plano-metas', 0, 1),
(15, 'Produção de Grupo', 'producao-grupo', '/producao-grupo', 0, 1),
(16, 'Questionários', 'questionario', '', 0, 1),
(17, 'Aprendizagem', 'questionario', '/questionario/aprendizagem', 16, 1),
(18, 'Cadastro', 'cadastro', '/questionario/cadastro', 16, 1),
(19, 'Trabalhos de Correção', 'trabalho-correcao', '', 0, 1),
(20, 'Meus Trabalhos', 'trabalho-correcao', '/trabalho-correcao', 19, 1),
(21, 'Trabalhos Recebidos', 'trabalho-correcao', '/trabalho-correcao/recebidos', 19, 1),
(22, 'Usuários', 'usuarios', '', 0, 1),
(23, 'Log de Acessos', 'log', '/usuarios/log', 22, 1),
(24, 'Membros', 'membros', '/usuarios/membros', 22, 1),
(25, 'Portfolio', 'portfolio', '/portfolio', 0, 1),
(26, 'Configurações', 'configuracao', '', 0, 1),
(27, 'Meu Perfil', 'perfil', '/perfil', 26, 1),
(28, 'Alterar Senha', 'alterar-senha', '/perfil/alterar-senha', 26, 1),
(29, 'Questionário Inicial', 'questionario', '/questionario/inicial', 0, 1),
(30, 'Assuntos', 'assunto', '/assunto', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sys_aplicacoes_permissao`
--

CREATE TABLE `sys_aplicacoes_permissao` (
  `tipo_usuario` int(11) DEFAULT NULL,
  `aplicacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `sys_aplicacoes_permissao`
--

INSERT INTO `sys_aplicacoes_permissao` (`tipo_usuario`, `aplicacao`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(0, 29),
(1, 30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sys_arquivos`
--

CREATE TABLE `sys_arquivos` (
  `cod` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sys_arquivos`
--

INSERT INTO `sys_arquivos` (`cod`, `nome`, `tipo`) VALUES
(1, NULL, 1),
(2, NULL, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sys_log_acesso_aplicacao`
--

CREATE TABLE `sys_log_acesso_aplicacao` (
  `cod_log` int(11) NOT NULL,
  `cod_usuario` int(11) DEFAULT NULL,
  `cod_aplicacao` int(11) DEFAULT NULL,
  `controller` varchar(200) DEFAULT NULL,
  `action` varchar(200) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `server` varchar(100) DEFAULT NULL,
  `params` varchar(8000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `sys_log_acesso_aplicacao`
--

INSERT INTO `sys_log_acesso_aplicacao` (`cod_log`, `cod_usuario`, `cod_aplicacao`, `controller`, `action`, `data`, `ip`, `server`, `params`) VALUES
(1, 0, NULL, 'Application/Controller/IndexController', 'index', '2019-09-25 12:29:24', '127.0.0.1', 'local', ''),
(2, 0, NULL, 'Login/Controller/LoginController', 'login', '2019-09-25 12:29:24', '127.0.0.1', 'local', ''),
(3, 0, NULL, 'Application/Controller/IndexController', 'index', '2019-09-25 12:29:36', '127.0.0.1', 'local', ''),
(4, 0, NULL, 'Login/Controller/LoginController', 'login', '2019-09-25 12:29:37', '127.0.0.1', 'local', ''),
(5, 0, 11, 'Quadro/Controller/QuadroLeituraController', 'quadro-leitura', '2019-09-25 12:43:14', '127.0.0.1', 'local', ''),
(6, 0, NULL, 'Login/Controller/LoginController', 'login', '2019-09-25 12:43:15', '127.0.0.1', 'local', ''),
(7, 4, NULL, 'Application/Controller/IndexController', 'index', '2019-09-25 12:43:24', '127.0.0.1', 'local', ''),
(8, 4, 11, 'Quadro/Controller/QuadroLeituraController', 'quadro-leitura', '2019-09-25 12:43:30', '127.0.0.1', 'local', ''),
(9, 0, NULL, 'Application/Controller/IndexController', 'index', '2019-09-27 11:10:46', '127.0.0.1', 'local', ''),
(10, 0, NULL, 'Application/Controller/IndexController', 'index', '2019-09-27 11:17:12', '127.0.0.1', 'local', ''),
(11, 0, NULL, 'Login/Controller/LoginController', 'login', '2019-09-27 11:42:16', '127.0.0.1', 'local', ''),
(12, 4, NULL, 'Application/Controller/IndexController', 'index', '2019-09-27 11:42:24', '127.0.0.1', 'local', ''),
(13, 4, NULL, 'Application/Controller/IndexController', 'index', '2019-09-27 11:42:45', '127.0.0.1', 'local', ''),
(14, 4, NULL, 'Application/Controller/IndexController', 'index', '2019-09-27 11:42:59', '127.0.0.1', 'local', ''),
(15, 4, 11, 'Quadro/Controller/QuadroLeituraController', 'quadro-leitura', '2019-09-27 11:43:54', '127.0.0.1', 'local', ''),
(16, 4, NULL, 'Application/Controller/IndexController', 'index', '2019-09-27 11:48:19', '127.0.0.1', 'local', ''),
(17, 4, NULL, 'Application/Controller/IndexController', 'index', '2019-09-27 11:59:17', '127.0.0.1', 'local', ''),
(18, 4, NULL, 'Application/Controller/IndexController', 'index', '2019-09-27 12:00:08', '127.0.0.1', 'local', ''),
(19, 4, NULL, 'Application/Controller/IndexController', 'index', '2019-09-27 12:04:32', '127.0.0.1', 'local', ''),
(20, 0, NULL, 'Application/Controller/IndexController', 'index', '2019-10-02 08:47:52', '127.0.0.1', 'local', ''),
(21, 0, NULL, 'Login/Controller/LoginController', 'login', '2019-10-02 08:47:53', '127.0.0.1', 'local', ''),
(22, 4, NULL, 'Application/Controller/IndexController', 'index', '2019-10-02 08:48:02', '127.0.0.1', 'local', ''),
(23, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 08:48:34', '127.0.0.1', 'local', ''),
(24, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 08:51:34', '127.0.0.1', 'local', ''),
(25, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 08:52:01', '127.0.0.1', 'local', ''),
(26, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 08:53:47', '127.0.0.1', 'local', ''),
(27, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 08:54:12', '127.0.0.1', 'local', ''),
(28, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 08:54:57', '127.0.0.1', 'local', ''),
(29, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 08:55:24', '127.0.0.1', 'local', ''),
(30, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 08:55:40', '127.0.0.1', 'local', ''),
(31, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 08:56:02', '127.0.0.1', 'local', ''),
(32, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 08:56:25', '127.0.0.1', 'local', ''),
(33, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 08:57:55', '127.0.0.1', 'local', ''),
(34, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 08:58:13', '127.0.0.1', 'local', ''),
(35, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 08:58:23', '127.0.0.1', 'local', ''),
(36, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 08:58:38', '127.0.0.1', 'local', ''),
(37, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 08:58:51', '127.0.0.1', 'local', ''),
(38, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 09:00:10', '127.0.0.1', 'local', ''),
(39, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 09:01:30', '127.0.0.1', 'local', ''),
(40, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 09:01:49', '127.0.0.1', 'local', ''),
(41, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 09:01:58', '127.0.0.1', 'local', ''),
(42, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 09:02:24', '127.0.0.1', 'local', ''),
(43, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 09:02:37', '127.0.0.1', 'local', ''),
(44, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 09:02:57', '127.0.0.1', 'local', ''),
(45, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 09:04:02', '127.0.0.1', 'local', ''),
(46, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 09:05:00', '127.0.0.1', 'local', ''),
(47, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 09:07:17', '127.0.0.1', 'local', ''),
(48, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 09:07:39', '127.0.0.1', 'local', ''),
(49, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 09:07:48', '127.0.0.1', 'local', ''),
(50, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 09:08:38', '127.0.0.1', 'local', ''),
(51, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 09:14:37', '127.0.0.1', 'local', ''),
(52, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 09:16:54', '127.0.0.1', 'local', ''),
(53, 4, 27, 'Application/Controller/PerfilController', 'perfil', '2019-10-02 09:17:16', '127.0.0.1', 'local', ''),
(54, 0, NULL, 'Application/Controller/IndexController', 'index', '2019-10-02 11:37:44', '127.0.0.1', 'local', ''),
(55, 0, NULL, 'Login/Controller/LoginController', 'login', '2019-10-02 11:37:45', '127.0.0.1', 'local', ''),
(56, 4, NULL, 'Application/Controller/IndexController', 'index', '2019-10-02 11:37:52', '127.0.0.1', 'local', ''),
(57, 4, 2, 'Quadro/Controller/BibliotecaController', 'biblioteca', '2019-10-02 11:38:09', '127.0.0.1', 'local', ''),
(58, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 11:38:16', '127.0.0.1', 'local', ''),
(59, 4, 1, 'Quadro/Controller/AtasController', 'atas', '2019-10-02 11:38:38', '127.0.0.1', 'local', ''),
(60, 4, 13, 'Quadro/Controller/PlanoAtividadesController', 'atividades', '2019-10-02 11:38:45', '127.0.0.1', 'local', ''),
(61, 4, 13, 'Quadro/Controller/PlanoAtividadesController', 'atividades', '2019-10-02 11:39:03', '127.0.0.1', 'local', ''),
(62, 4, 1, 'Quadro/Controller/AtasController', 'atas', '2019-10-02 11:43:02', '127.0.0.1', 'local', ''),
(63, 4, 2, 'Quadro/Controller/BibliotecaController', 'biblioteca', '2019-10-02 11:43:13', '127.0.0.1', 'local', ''),
(64, 4, 11, 'Quadro/Controller/QuadroLeituraController', 'quadro-leitura', '2019-10-02 11:43:45', '127.0.0.1', 'local', ''),
(65, 4, NULL, 'Application/Controller/IndexController', 'index', '2019-10-02 11:53:55', '127.0.0.1', 'local', ''),
(66, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 11:55:51', '127.0.0.1', 'local', ''),
(67, 4, 30, 'Quadro/Controller/AssuntoController', 'assunto', '2019-10-02 12:23:15', '127.0.0.1', 'local', ''),
(68, 4, 11, 'Quadro/Controller/QuadroLeituraController', 'quadro-leitura', '2019-10-02 12:23:25', '127.0.0.1', 'local', ''),
(69, 4, 3, 'Cadastro/Controller/PreCadastroController', 'pre-cadastro', '2019-10-02 12:23:30', '127.0.0.1', 'local', ''),
(70, 4, 2, 'Quadro/Controller/BibliotecaController', 'biblioteca', '2019-10-02 12:23:32', '127.0.0.1', 'local', ''),
(71, 4, 30, 'Quadro/Controller/AssuntoController', 'assunto', '2019-10-02 12:23:48', '127.0.0.1', 'local', ''),
(72, 4, 30, 'Quadro/Controller/AssuntoController', 'assunto', '2019-10-02 12:23:57', '127.0.0.1', 'local', ''),
(73, 4, 2, 'Quadro/Controller/BibliotecaController', 'biblioteca', '2019-10-02 12:33:09', '127.0.0.1', 'local', ''),
(74, 4, NULL, 'Application/Controller/IndexController', 'index', '2019-10-02 14:36:07', '127.0.0.1', 'local', ''),
(75, 0, NULL, 'Application/Controller/IndexController', 'index', '2019-10-02 15:11:42', '127.0.0.1', 'local', ''),
(76, 0, NULL, 'Login/Controller/LoginController', 'login', '2019-10-02 15:11:43', '127.0.0.1', 'local', ''),
(77, 0, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 15:11:49', '127.0.0.1', 'local', ''),
(78, 0, NULL, 'Login/Controller/LoginController', 'login', '2019-10-02 15:11:50', '127.0.0.1', 'local', ''),
(79, 4, NULL, 'Application/Controller/IndexController', 'index', '2019-10-02 15:12:02', '127.0.0.1', 'local', ''),
(80, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 15:12:14', '127.0.0.1', 'local', ''),
(81, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 15:15:49', '127.0.0.1', 'local', ''),
(82, 4, 1, 'Quadro/Controller/AtasController', 'atas', '2019-10-02 15:15:55', '127.0.0.1', 'local', ''),
(83, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 15:15:59', '127.0.0.1', 'local', ''),
(84, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 15:22:35', '127.0.0.1', 'local', ''),
(85, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 15:22:58', '127.0.0.1', 'local', ''),
(86, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 15:28:15', '127.0.0.1', 'local', ''),
(87, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 15:34:40', '127.0.0.1', 'local', ''),
(88, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 15:44:25', '127.0.0.1', 'local', ''),
(89, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 15:44:57', '127.0.0.1', 'local', ''),
(90, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 15:45:17', '127.0.0.1', 'local', ''),
(91, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 16:06:04', '127.0.0.1', 'local', ''),
(92, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 16:17:56', '127.0.0.1', 'local', ''),
(93, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 16:20:28', '127.0.0.1', 'local', ''),
(94, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 16:22:34', '127.0.0.1', 'local', ''),
(95, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 16:23:48', '127.0.0.1', 'local', ''),
(96, 4, NULL, 'Application/Controller/IndexController', 'index', '2019-10-02 16:39:16', '127.0.0.1', 'local', ''),
(97, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 16:44:35', '127.0.0.1', 'local', ''),
(98, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 16:44:47', '127.0.0.1', 'local', ''),
(99, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 16:46:31', '127.0.0.1', 'local', ''),
(100, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 16:47:00', '127.0.0.1', 'local', ''),
(101, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 16:49:31', '127.0.0.1', 'local', ''),
(102, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 16:49:36', '127.0.0.1', 'local', ''),
(103, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 16:49:44', '127.0.0.1', 'local', ''),
(104, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 16:49:50', '127.0.0.1', 'local', ''),
(105, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 16:52:16', '127.0.0.1', 'local', ''),
(106, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 16:52:30', '127.0.0.1', 'local', ''),
(107, 4, 15, 'Quadro/Controller/ProducaoGrupoController', 'producao-grupo', '2019-10-02 16:53:38', '127.0.0.1', 'local', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sys_meses`
--

CREATE TABLE `sys_meses` (
  `mes` int(11) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `abrev` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `sys_meses`
--

INSERT INTO `sys_meses` (`mes`, `descricao`, `abrev`) VALUES
(1, 'Janeiro', 'Jan'),
(2, 'Fevereiro', 'Fev'),
(3, 'Março', 'Mar'),
(4, 'Abril', 'Abr'),
(5, 'Maio', 'Mai'),
(6, 'Junho', 'Jun'),
(7, 'Julho', 'Jul'),
(8, 'Agosto', 'Ago'),
(9, 'Setembro', 'Set'),
(10, 'Outubro', 'Out'),
(11, 'Novembro', 'Nov'),
(12, 'Dezembro', 'Dez');

-- --------------------------------------------------------

--
-- Estrutura da tabela `temp_dates`
--

CREATE TABLE `temp_dates` (
  `dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `trbl_correcao_trabalho`
--

CREATE TABLE `trbl_correcao_trabalho` (
  `cod` int(11) NOT NULL,
  `destinatario_fk` int(11) DEFAULT NULL,
  `reemetente_fk` int(11) DEFAULT NULL,
  `arquivo` varchar(50) DEFAULT NULL,
  `observacao` varchar(500) DEFAULT NULL,
  `data_enviado` datetime DEFAULT NULL,
  `data_correcao` datetime DEFAULT NULL,
  `corrigido` int(11) DEFAULT NULL,
  `modalidade_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `trbl_tipo_modalidade`
--

CREATE TABLE `trbl_tipo_modalidade` (
  `cod_modalidade` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `us_acesso`
--

CREATE TABLE `us_acesso` (
  `cod_usuario_fk` int(11) NOT NULL,
  `login` varchar(200) DEFAULT NULL,
  `senha` varchar(1000) DEFAULT NULL,
  `situacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `us_acesso`
--

INSERT INTO `us_acesso` (`cod_usuario_fk`, `login`, `senha`, `situacao`) VALUES
(4, 'sandragp@marilia.unesp.br', '202cb962ac59075b964b07152d234b70', 1),
(14, 'denilson@hotmail.com', '202cb962ac59075b964b07152d234b70', 1),
(15, 'teste@teste.com', '202cb962ac59075b964b07152d234b70', 0),
(16, 'teste@teste1.com', '202cb962ac59075b964b07152d234b70', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `us_foto_perfil`
--

CREATE TABLE `us_foto_perfil` (
  `cod_usuario_fk` int(11) NOT NULL,
  `nome_foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `us_foto_perfil`
--

INSERT INTO `us_foto_perfil` (`cod_usuario_fk`, `nome_foto`) VALUES
(4, 'foto-perfil-4-19-09-16-17-37-00.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `us_pre_cadastro`
--

CREATE TABLE `us_pre_cadastro` (
  `cod_usuario` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `nivel_escolaridade_fk` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  `situacao` int(11) DEFAULT NULL,
  `adm` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `us_pre_cadastro`
--

INSERT INTO `us_pre_cadastro` (`cod_usuario`, `nome`, `email`, `nivel_escolaridade_fk`, `data_criacao`, `situacao`, `adm`) VALUES
(4, 'Sandra', 'sandragp@marilia.unesp.br', 1, '2019-09-16 14:45:05', 2, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `us_tipo_usuario`
--

CREATE TABLE `us_tipo_usuario` (
  `cod_tipo` int(11) NOT NULL,
  `descricao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `us_tipo_usuario`
--

INSERT INTO `us_tipo_usuario` (`cod_tipo`, `descricao`) VALUES
(0, 'Pré-Cadastro'),
(1, 'Administrador'),
(2, 'Membro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `us_usuario`
--

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
  `ativo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `us_usuario`
--

INSERT INTO `us_usuario` (`cod_usuario`, `nome`, `cpf`, `idade`, `genero`, `email`, `email2`, `nivel_escolaridade_fk`, `tipo_usuario_fk`, `endereco`, `numero`, `complemento`, `cidade`, `bairro`, `estado`, `cep`, `fixo`, `celular`, `curso_atual_nome`, `curso_atual_serie`, `curso_periodo`, `graduacao_nome`, `graduacao_ano_conclusao`, `graduacao_instituicao`, `pos_graduacao_nome`, `pos_graduacao_ano`, `pos_graduacao_instituicao`, `mestrado_nome`, `mestrado_ano`, `mestrado_instituicao`, `doutorado_nome`, `doutorado_ano`, `doutorado_instituicao`, `estado_civil`, `data_nascimento`, `rg`, `orgao_emissor`, `ra`, `skype`, `whatsapp`, `facebook`, `lattes`, `foto`, `num_banco`, `num_conta`, `num_agencia`, `status`, `emp_nome`, `emp_endereco`, `emp_numero`, `emp_complemento`, `emp_cidade`, `emp_bairro`, `emp_estado`, `emp_cep`, `emp_telefone`, `emp_celular`, `data_entrada`, `ativo`) VALUES
(4, 'Sandra Regina Gimeniz', '410.431.028-09', 22, 'M', 'sandragp@marilia.unesp.br', '', 4, 1, 'qwdqwdqwdqwd', '123', 'qwdqwdqwd', 'qwdqwdqwd', 'qwdqwdqw', 'AC', '18950000', '1433442526', '14997828864', 'ADS', 6, 'MANHA', '', 0, '', '', 0, '', '', 0, '', '', 0, '', 'SOLTEIRO', '1996-10-26 00:00:00', '533515774', 'ssp', '12312312323', '', '14997828864', '', '', NULL, 1, 12312312, 123, NULL, '', '', 0, '', '', '', 'AC', '', '', '', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atvs_plano_atividades`
--
ALTER TABLE `atvs_plano_atividades`
  ADD PRIMARY KEY (`cod_atividade`);

--
-- Indexes for table `atvs_plano_atividades_status`
--
ALTER TABLE `atvs_plano_atividades_status`
  ADD PRIMARY KEY (`cod`);

--
-- Indexes for table `atvs_plano_atividades_tipo`
--
ALTER TABLE `atvs_plano_atividades_tipo`
  ADD PRIMARY KEY (`cod`);

--
-- Indexes for table `avs_avisos`
--
ALTER TABLE `avs_avisos`
  ADD PRIMARY KEY (`cod_aviso`);

--
-- Indexes for table `biblioteca`
--
ALTER TABLE `biblioteca`
  ADD PRIMARY KEY (`cod`);

--
-- Indexes for table `biblioteca_assunto`
--
ALTER TABLE `biblioteca_assunto`
  ADD PRIMARY KEY (`cod`);

--
-- Indexes for table `disp_quadro_disponibilidade`
--
ALTER TABLE `disp_quadro_disponibilidade`
  ADD PRIMARY KEY (`cod_disponibilidade`);

--
-- Indexes for table `disp_quadro_disponibilidade_color`
--
ALTER TABLE `disp_quadro_disponibilidade_color`
  ADD PRIMARY KEY (`cod_usuario`);

--
-- Indexes for table `disp_quadro_disponibilidade_semanas`
--
ALTER TABLE `disp_quadro_disponibilidade_semanas`
  ADD PRIMARY KEY (`cod`);

--
-- Indexes for table `evts_eventos`
--
ALTER TABLE `evts_eventos`
  ADD PRIMARY KEY (`cod_evento`);

--
-- Indexes for table `evts_evento_usuario`
--
ALTER TABLE `evts_evento_usuario`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `ltr_material_leitura`
--
ALTER TABLE `ltr_material_leitura`
  ADD PRIMARY KEY (`cod_material`);

--
-- Indexes for table `ltr_material_palavra_chaves`
--
ALTER TABLE `ltr_material_palavra_chaves`
  ADD PRIMARY KEY (`cod`);

--
-- Indexes for table `ltr_palavra_chave`
--
ALTER TABLE `ltr_palavra_chave`
  ADD PRIMARY KEY (`cod_palavra_chave`);

--
-- Indexes for table `material_grupo`
--
ALTER TABLE `material_grupo`
  ADD PRIMARY KEY (`cod_material`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mts_metas`
--
ALTER TABLE `mts_metas`
  ADD PRIMARY KEY (`cod_meta`);

--
-- Indexes for table `mts_plano_metas`
--
ALTER TABLE `mts_plano_metas`
  ADD PRIMARY KEY (`cod_quadro`);

--
-- Indexes for table `nivel_escolaridade`
--
ALTER TABLE `nivel_escolaridade`
  ADD PRIMARY KEY (`cod_nivel`);

--
-- Indexes for table `producao_grupo`
--
ALTER TABLE `producao_grupo`
  ADD PRIMARY KEY (`cod_producao`);

--
-- Indexes for table `qst_questao`
--
ALTER TABLE `qst_questao`
  ADD PRIMARY KEY (`cod_questao`);

--
-- Indexes for table `qst_questao1`
--
ALTER TABLE `qst_questao1`
  ADD PRIMARY KEY (`cod`);

--
-- Indexes for table `qst_questao_dependencia`
--
ALTER TABLE `qst_questao_dependencia`
  ADD PRIMARY KEY (`cod_dependencia`);

--
-- Indexes for table `qst_questionario`
--
ALTER TABLE `qst_questionario`
  ADD PRIMARY KEY (`cod_questionario`);

--
-- Indexes for table `qst_respostas`
--
ALTER TABLE `qst_respostas`
  ADD PRIMARY KEY (`cod_resposta`);

--
-- Indexes for table `qst_tipo_pergunta`
--
ALTER TABLE `qst_tipo_pergunta`
  ADD PRIMARY KEY (`cod_tipo`);

--
-- Indexes for table `qst_tipo_questionario`
--
ALTER TABLE `qst_tipo_questionario`
  ADD PRIMARY KEY (`cod_tipo`);

--
-- Indexes for table `reu_atas`
--
ALTER TABLE `reu_atas`
  ADD PRIMARY KEY (`cod_ata`);

--
-- Indexes for table `reu_reuniao`
--
ALTER TABLE `reu_reuniao`
  ADD PRIMARY KEY (`cod_reuniao`);

--
-- Indexes for table `reu_reuniao_usuario`
--
ALTER TABLE `reu_reuniao_usuario`
  ADD PRIMARY KEY (`cod`);

--
-- Indexes for table `sys_aplicacoes`
--
ALTER TABLE `sys_aplicacoes`
  ADD PRIMARY KEY (`cod_aplicacao`);

--
-- Indexes for table `sys_arquivos`
--
ALTER TABLE `sys_arquivos`
  ADD PRIMARY KEY (`cod`);

--
-- Indexes for table `sys_log_acesso_aplicacao`
--
ALTER TABLE `sys_log_acesso_aplicacao`
  ADD PRIMARY KEY (`cod_log`);

--
-- Indexes for table `trbl_correcao_trabalho`
--
ALTER TABLE `trbl_correcao_trabalho`
  ADD PRIMARY KEY (`cod`);

--
-- Indexes for table `trbl_tipo_modalidade`
--
ALTER TABLE `trbl_tipo_modalidade`
  ADD PRIMARY KEY (`cod_modalidade`);

--
-- Indexes for table `us_acesso`
--
ALTER TABLE `us_acesso`
  ADD PRIMARY KEY (`cod_usuario_fk`);

--
-- Indexes for table `us_foto_perfil`
--
ALTER TABLE `us_foto_perfil`
  ADD PRIMARY KEY (`cod_usuario_fk`);

--
-- Indexes for table `us_pre_cadastro`
--
ALTER TABLE `us_pre_cadastro`
  ADD PRIMARY KEY (`cod_usuario`);

--
-- Indexes for table `us_tipo_usuario`
--
ALTER TABLE `us_tipo_usuario`
  ADD PRIMARY KEY (`cod_tipo`);

--
-- Indexes for table `us_usuario`
--
ALTER TABLE `us_usuario`
  ADD PRIMARY KEY (`cod_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atvs_plano_atividades`
--
ALTER TABLE `atvs_plano_atividades`
  MODIFY `cod_atividade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `atvs_plano_atividades_status`
--
ALTER TABLE `atvs_plano_atividades_status`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `atvs_plano_atividades_tipo`
--
ALTER TABLE `atvs_plano_atividades_tipo`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `avs_avisos`
--
ALTER TABLE `avs_avisos`
  MODIFY `cod_aviso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `biblioteca`
--
ALTER TABLE `biblioteca`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `biblioteca_assunto`
--
ALTER TABLE `biblioteca_assunto`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `disp_quadro_disponibilidade`
--
ALTER TABLE `disp_quadro_disponibilidade`
  MODIFY `cod_disponibilidade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disp_quadro_disponibilidade_semanas`
--
ALTER TABLE `disp_quadro_disponibilidade_semanas`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evts_eventos`
--
ALTER TABLE `evts_eventos`
  MODIFY `cod_evento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evts_evento_usuario`
--
ALTER TABLE `evts_evento_usuario`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ltr_material_leitura`
--
ALTER TABLE `ltr_material_leitura`
  MODIFY `cod_material` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ltr_material_palavra_chaves`
--
ALTER TABLE `ltr_material_palavra_chaves`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ltr_palavra_chave`
--
ALTER TABLE `ltr_palavra_chave`
  MODIFY `cod_palavra_chave` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `material_grupo`
--
ALTER TABLE `material_grupo`
  MODIFY `cod_material` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mts_metas`
--
ALTER TABLE `mts_metas`
  MODIFY `cod_meta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mts_plano_metas`
--
ALTER TABLE `mts_plano_metas`
  MODIFY `cod_quadro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nivel_escolaridade`
--
ALTER TABLE `nivel_escolaridade`
  MODIFY `cod_nivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `producao_grupo`
--
ALTER TABLE `producao_grupo`
  MODIFY `cod_producao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `qst_questao`
--
ALTER TABLE `qst_questao`
  MODIFY `cod_questao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qst_questao1`
--
ALTER TABLE `qst_questao1`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `qst_questao_dependencia`
--
ALTER TABLE `qst_questao_dependencia`
  MODIFY `cod_dependencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `qst_questionario`
--
ALTER TABLE `qst_questionario`
  MODIFY `cod_questionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qst_respostas`
--
ALTER TABLE `qst_respostas`
  MODIFY `cod_resposta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qst_tipo_pergunta`
--
ALTER TABLE `qst_tipo_pergunta`
  MODIFY `cod_tipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qst_tipo_questionario`
--
ALTER TABLE `qst_tipo_questionario`
  MODIFY `cod_tipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reu_atas`
--
ALTER TABLE `reu_atas`
  MODIFY `cod_ata` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reu_reuniao`
--
ALTER TABLE `reu_reuniao`
  MODIFY `cod_reuniao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reu_reuniao_usuario`
--
ALTER TABLE `reu_reuniao_usuario`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sys_aplicacoes`
--
ALTER TABLE `sys_aplicacoes`
  MODIFY `cod_aplicacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sys_arquivos`
--
ALTER TABLE `sys_arquivos`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sys_log_acesso_aplicacao`
--
ALTER TABLE `sys_log_acesso_aplicacao`
  MODIFY `cod_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `trbl_correcao_trabalho`
--
ALTER TABLE `trbl_correcao_trabalho`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trbl_tipo_modalidade`
--
ALTER TABLE `trbl_tipo_modalidade`
  MODIFY `cod_modalidade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `us_pre_cadastro`
--
ALTER TABLE `us_pre_cadastro`
  MODIFY `cod_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `us_tipo_usuario`
--
ALTER TABLE `us_tipo_usuario`
  MODIFY `cod_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
