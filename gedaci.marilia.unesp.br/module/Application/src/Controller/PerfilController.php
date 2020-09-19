<?php

/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Application\Controller;

use Application\Classes\Funcoes;
use Zend\Json\Json;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;

class PerfilController extends AbstractActionController {

    public function perfilAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $params = array(
            'cod_usuario'   => $sessao->cod_usuario,
            'is_adm'        => $sessao->tipo_usuario == 1 ? 1 : 0,
            'membro'        => $this->params()->fromQuery('membro','-1')
        );
            
        if($params['is_adm'] != 1 && $params['membro'] != '-1'){
            header('Location: /');
            exit;
        }
        
        if($params['membro'] != '-1'){
            $params['cod_usuario'] = $params['membro'];
        }
        
        $sql = "call us_buscarDadosPrincipal_sp (:cod_usuario)";
        $result = $funcoes->executarSQL($sql, $params, '');
        
        if(!$result){
            $funcoes->alertBasic('Membros não encontrado.', false, '/usuarios/membros', 'warning', 'Atenção!');
        }
        
        $result['data_nascimento'] = substr($result['data_nascimento'], 0, 10);
        
        $sql = "select cod_nivel,descricao from nivel_escolaridade order by descricao";
        $escolaridades = $funcoes->executarSQL($sql, []);

        $view = new ViewModel(array(
            'usuario' => $result,
            'escolaridades' => $escolaridades,
            'admin' => $params['is_adm']
        ));
        
        if($params['membro'] == '-1'){
            $view->setTemplate('application/perfil/perfil');
        }else{
            $view->setTemplate('application/perfil/perfil-membro');
        }
        return $view;
    }

    public function fotoPerfilAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();
        $request = $this->getRequest();

        if ($request->isPost()) {
            $params = array(
                'usuario' => $sessao->cod_usuario
            );

            $arquivo = $this->params()->fromFiles('foto_perfil_file', '');

            $dir = $_SERVER['DOCUMENT_ROOT'] . '/arquivos/perfil/';

            if (!file_exists($dir)) {
                mkdir($dir, 0777);
            }

            //nome para a foto de perfil
            $params['arquivo_nome'] = 'foto-perfil' . '-' . $params['usuario'] . '-' . date('y-m-d-H-i-s') . '.' . 'jpg';

            // destino
            $destino = $dir . $params['arquivo_nome'];

            //mover para a pasta
            move_uploaded_file($arquivo['tmp_name'], $destino);

            if (file_exists($destino)) {
                unlink($dir . $sessao->foto_perfil);

                $sessao->foto_perfil = $params['arquivo_nome'];

                $sql = "update us_foto_perfil set nome_foto =:arquivo_nome where cod_usuario_fk =:usuario";
                $funcoes->executarSQL($sql, $params);

                return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Foto de Perfil alterada com sucesso.', 'nova_img' => $destino)));
            } else {
                return $response->setContent(Json::encode(array('response' => false, 'msg' => 'Erro ao salvar a foto de perfil.')));
            }
        } else {
            header('Location: /');
            exit;
        }
    }

    public function alterarSenhaAction() {
        
        $view = new ViewModel();
        $view->setTemplate('application/perfil/alterar-senha');
        return $view;
    }

    public function salvarSenhaAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();
        $request = $this->getRequest();

        if ($request->isPost()) {
            $params = array(
                'ant' => $this->params()->fromPost('senha_ant', ''),
                'nova' => $this->params()->fromPost('senha_nova', ''),
                'conf' => $this->params()->fromPost('senha_nova_conf', ''),
                'usuario' => $sessao->cod_usuario,
            );

            $sql = "select senha from us_acesso where cod_usuario_fk =:usuario;";
            $result = $funcoes->executarSQL($sql, $params, '');

            if ($result['senha'] != md5($params['ant'])) {
                return $response->setContent(Json::encode(array('response' => false, 'msg' => 'Senha anterior digitada não é valida. Digite sua senha anterior.')));
            } else {
                $sql = "update us_acesso set senha = :pass where cod_usuario_fk =:usuario;";
                $funcoes->executarSQL($sql, array('pass' => md5($params['nova']), 'usuario' => $params['usuario']));

                return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Senha alterada com sucesso.')));
            }
        } else {
            header('Location: /');
            exit;
        }
    }

    public function alterarDadosAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();
        $request = $this->getRequest();
        $post_data = $this->params()->fromPost();
        $post_data['usuario'] = $sessao->cod_usuario;        
        $post_data['idade'] = $this->calcularIdade($post_data['nascimento']);
        
        $post_data['nome'] = str_replace("'", "", $post_data['nome']);
        $post_data['cpf'] =  str_replace("'", "", $post_data['cpf']);
        $post_data['idade'] =  str_replace("'", "", $post_data['idade']);
        $post_data['sexo'] =  str_replace("'", "", $post_data['sexo']);
        $post_data['email1'] =  str_replace("'", "", $post_data['email1']);
        $post_data['email2'] =  str_replace("'", "", $post_data['email2']);
        $post_data['escolaridade'] =  str_replace("'", "", $post_data['escolaridade']);
        $post_data['endereco'] =  str_replace("'", "", $post_data['endereco']);
        $post_data['num'] =  str_replace("'", "", $post_data['num']);
        $post_data['complemento'] =  str_replace("'", "", $post_data['complemento']);
        $post_data['cidade'] =  str_replace("'", "", $post_data['cidade']);
        $post_data['bairro'] =  str_replace("'", "", $post_data['bairro']);
        $post_data['estado'] =  str_replace("'", "", $post_data['estado']);
        $post_data['cep'] =  str_replace("'", "", $post_data['cep']);
        $post_data['fixo'] =  str_replace("'", "", $post_data['fixo']);
        $post_data['celular'] =  str_replace("'", "", $post_data['celular']);
        $post_data['curso_nome'] =  str_replace("'", "", $post_data['curso_nome']);
        $post_data['curso_atual_serie'] =  str_replace("'", "", $post_data['curso_atual_serie']);
        $post_data['curso_periodo'] =  str_replace("'", "", $post_data['curso_periodo']);
        $post_data['graduacao_nome'] =  str_replace("'", "", $post_data['graduacao_nome']);
        $post_data['graduacao_ano_conclusao'] =  str_replace("'", "", $post_data['graduacao_ano_conclusao']);
        $post_data['graduacao_instituicao'] =  str_replace("'", "", $post_data['graduacao_instituicao']);
        $post_data['pos_graduacao_nome'] =  str_replace("'", "", $post_data['pos_graduacao_nome']);
        $post_data['pos_graduacao_ano'] =  str_replace("'", "", $post_data['pos_graduacao_ano']);
        $post_data['pos_graduacao_instituicao'] =  str_replace("'", "", $post_data['pos_graduacao_instituicao']);
        $post_data['mestrado_nome'] =  str_replace("'", "", $post_data['mestrado_nome']);
        $post_data['mestrado_ano'] =  str_replace("'", "", $post_data['mestrado_ano']);
        $post_data['mestrado_instituicao'] =  str_replace("'", "", $post_data['mestrado_instituicao']);
        $post_data['doutorado_nome'] =  str_replace("'", "", $post_data['doutorado_nome']);
        $post_data['doutorado_ano'] =  str_replace("'", "", $post_data['doutorado_ano']);
        $post_data['doutorado_instituicao'] =  str_replace("'", "", $post_data['doutorado_instituicao']);
        $post_data['civil'] =  str_replace("'", "", $post_data['civil']);
        $post_data['nascimento'] =  str_replace("'", "", $post_data['nascimento']);
        $post_data['rg'] =  str_replace("'", "", $post_data['rg']);
        $post_data['emissor'] =  str_replace("'", "", $post_data['emissor']);
        $post_data['ra'] =  str_replace("'", "", $post_data['ra']);
        $post_data['skype'] =  str_replace("'", "", $post_data['skype']);
        $post_data['facebook'] =  str_replace("'", "", $post_data['facebook']);
        $post_data['lattes'] =  str_replace("'", "", $post_data['lattes']);
        $post_data['banco'] =  str_replace("'", "", $post_data['banco']);
        $post_data['conta'] =  str_replace("'", "", $post_data['conta']);
        $post_data['agencia'] =  str_replace("'", "", $post_data['agencia']);
        $post_data['emp_nome'] =  str_replace("'", "", $post_data['emp_nome']);
        $post_data['emp_endereco'] =  str_replace("'", "", $post_data['emp_endereco']);
        $post_data['emp_numero'] =  str_replace("'", "", $post_data['emp_numero']);
        $post_data['emp_complemento'] =  str_replace("'", "", $post_data['emp_complemento']);
        $post_data['emp_cidade'] =   str_replace("'", "", $post_data['emp_cidade']);
        $post_data['emp_bairro'] =  str_replace("'", "", $post_data['emp_bairro']);
        $post_data['emp_estado'] =   str_replace("'", "", $post_data['emp_estado']);
        $post_data['emp_cep'] =  str_replace("'", "", $post_data['emp_cep']);
        $post_data['emp_telefone'] = str_replace("'", "", $post_data['emp_telefone']); 
        $post_data['emp_celular'] =  str_replace("'", "", $post_data['emp_celular']);
        
        if ($request->isPost()) {
            $post_data['curso_atual_serie'] = $post_data['curso_atual_serie'] == '' ? 0 : $post_data['curso_atual_serie'];
            $post_data['graduacao_ano_conclusao'] = $post_data['graduacao_ano_conclusao'] == '' ? 0 : $post_data['graduacao_ano_conclusao'];
            $post_data['pos_graduacao_ano'] = $post_data['pos_graduacao_ano'] == '' ? 0 : $post_data['pos_graduacao_ano'];
            $post_data['mestrado_ano'] = $post_data['mestrado_ano'] == '' ? 0 : $post_data['mestrado_ano'];
            $post_data['doutorado_ano'] = $post_data['doutorado_ano'] == '' ? 0 : $post_data['doutorado_ano'];
            $post_data['conta'] = $post_data['conta'] == '' ? 0 : $post_data['conta'];
            $post_data['agencia'] = $post_data['agencia'] == '' ? 0 : $post_data['agencia'];
            $post_data['emp_numero'] = $post_data['emp_numero'] == '' ? 0 : $post_data['emp_numero'];
            $post_data['escolaridade'] = $post_data['escolaridade'] == '' ? 0 : $post_data['escolaridade'];
            
            if($sessao->situacao == 2){ //novo membro
                $sql = "insert into us_usuario(cod_usuario, nome, cpf, idade, genero, email, email2, nivel_escolaridade_fk, tipo_usuario_fk, endereco , numero, complemento , cidade , bairro , estado , cep,   fixo, celular , curso_atual_nome, curso_atual_serie , curso_periodo , graduacao_nome , graduacao_ano_conclusao , graduacao_instituicao , pos_graduacao_nome , pos_graduacao_ano ,  pos_graduacao_instituicao,  mestrado_nome,  mestrado_ano,  mestrado_instituicao,  doutorado_nome,  doutorado_ano,  doutorado_instituicao,  estado_civil,  data_nascimento,  rg,  orgao_emissor,  ra,  skype,  whatsapp,  facebook,  lattes,  foto,  num_banco,  num_conta,  num_agencia,  status,  emp_nome,  emp_endereco,  emp_numero,  emp_complemento,  emp_cidade,  emp_bairro,  emp_estado,  emp_cep,  emp_telefone,  emp_celular,  data_entrada, ativo) ".
                                    "values (:usuario, :nome, :cpf, :idade, :sexo, :email1, :email2, :escolaridade        , 2              , :endereco, :num  , :complemento, :cidade, :bairro, :estado, :cep, :fixo, :celular, :curso_nome     , :curso_atual_serie, :curso_periodo, :graduacao_nome, :graduacao_ano_conclusao, :graduacao_instituicao, :pos_graduacao_nome, :pos_graduacao_ano, :pos_graduacao_instituicao, :mestrado_nome, :mestrado_ano, :mestrado_instituicao, :doutorado_nome, :doutorado_ano, :doutorado_instituicao, :civil, :nascimento, :rg, :emissor, :ra, :skype, '', :facebook, :lattes, null, :banco, :conta, :agencia, 1, :emp_nome, :emp_endereco, :emp_numero, :emp_complemento, :emp_cidade, :emp_bairro, :emp_estado, :emp_cep, :emp_telefone, :emp_celular, now(), 1)";                                                                                                                         
                $funcoes->executarSQL($sql, $post_data);
                
                $sessao->nome_usuario = $post_data['nome'];
                
                $sql = "update us_pre_cadastro set situacao = 3 where cod_usuario =:usuario";
                $funcoes->executarSQL($sql, array('usuario' => $sessao->cod_usuario));

                $sessao->situacao = 3;
                $sessao->tipo_usuario = 2;
                $sessao->tipo_usuario_desc = 'Membro';
            }else{//
                
                $sessao->nome_usuario = $post_data['nome'];
                
                $sql = "UPDATE us_usuario SET nome=:nome,cpf=:cpf,idade=:idade,email=:email1,email2=:email2,nivel_escolaridade_fk=:escolaridade,endereco=:endereco,numero=:num,complemento=:complemento,cidade=:cidade,bairro=:bairro,estado=:estado,cep=:cep,fixo=:fixo,celular=:celular,curso_atual_nome=:curso_nome,curso_atual_serie=:curso_atual_serie,curso_periodo=:curso_periodo,graduacao_nome=:graduacao_nome,graduacao_ano_conclusao=:graduacao_ano_conclusao,graduacao_instituicao=:graduacao_instituicao,pos_graduacao_nome=:pos_graduacao_nome,pos_graduacao_ano=:pos_graduacao_ano,pos_graduacao_instituicao=:pos_graduacao_instituicao,mestrado_nome=:mestrado_nome,mestrado_ano=:mestrado_ano,mestrado_instituicao=:mestrado_instituicao,doutorado_nome=:doutorado_nome,doutorado_ano=:doutorado_ano,doutorado_instituicao=:doutorado_instituicao,estado_civil=:civil,genero=:sexo,data_nascimento=:nascimento, rg=:rg, orgao_emissor=:emissor, ra=:ra, skype=:skype,whatsapp=:celular,facebook=:facebook,lattes=:lattes,num_banco=:banco,num_conta=:conta,num_agencia=:agencia,emp_nome=:emp_nome,emp_endereco=:emp_endereco,emp_numero=:emp_numero,emp_complemento=:emp_complemento,emp_cidade=:emp_cidade,emp_bairro=:emp_bairro,emp_estado=:emp_estado,emp_cep=:emp_cep,emp_telefone=:emp_telefone,emp_celular=:emp_celular WHERE cod_usuario =:usuario;";
                $funcoes->executarSQL($sql, $post_data);
                
            }
            return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Perfil alterado com sucesso.')));
        } else {
            header('Location: /');
            exit;
        }
    }
    
    public function termoAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        $request = $this->getRequest();
        
        $params = array(
            'user'      => $sessao->cod_usuario,
            'aceite'    => $this->params()->fromPost('aceite', ''),
            'termo'     => $this->params()->fromPost('termo', '')
        );
        
        $sql = 'insert into us_termo_aceite(cod_usuario_fk, aceite, data, cod_termo_fk) values (:user,:aceite,now(), :termo)';
        $funcoes->executarSQL($sql,$params);
        
        $sessao->termo = $params['aceite'];
        
        return $response->setContent(Json::encode(array('response' => true, 'msg' => '')));
    }
    
    public function alterarTipoAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        $response = $this->getResponse();
        
        if($sessao->tipo_usuario == 1){
            
            $post = $this->params()->fromPost();

            $sql = 'update us_usuario set tipo_usuario_fk=:tipo where cod_usuario = :membro';
            $funcoes->executarSQL($sql, $post);

            return $response->setContent(Json::encode(array('success' => true, 'msg' => "Alterado com sucesso!")));
        }else{
            return $response->setContent(Json::encode(array('success' => false, 'msg' => 'Você não possui permissão!')));
        }
    }
    
    public function calcularIdade($data){
        
        list($ano, $mes, $dia) = explode('-', $data);
        $hoje = mktime(0, 0, 0, date('m'), date('d'), date('Y'));
        $nascimento = mktime(0, 0, 0, $mes, $dia, $ano);
        return floor((((($hoje - $nascimento) / 60) / 60) / 24) / 365.25);
         
    }

}
