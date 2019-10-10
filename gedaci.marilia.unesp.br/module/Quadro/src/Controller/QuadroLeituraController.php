    <?php

    /**
     * @copyright Copyright (c) 2019 FATEC OURINHOS
     * @author Gabriel da Silva pereira & Denilson Perez Junior
     * @since 26/07/2018
     */

    namespace Quadro\Controller;

    use Application\Classes\Funcoes;
    use Application\Classes\Relatorio;
    use Zend\Json\Json;
    use Zend\Mvc\Controller\AbstractActionController;
    use Zend\Session\Container;
    use Zend\View\Model\ViewModel;

    class QuadroLeituraController extends AbstractActionController {

        public function quadroLeituraAction() {
            $funcoes = new Funcoes($this);
            $sessao = new Container("usuario");
            $relatorio = new Relatorio();

            $params = array(
                'cod_usuario' => $sessao->cod_usuario,
                'filtro' => $this->params()->fromPost('filtros', '-1'),
                'pesquisa' => $this->params()->fromPost('pesquisa', ''),
            );

            if ($params['filtro'] == '-1') {
                $params['pesquisa'] = '';
            }

            $sql = "call us_buscarLeitura_sp(:filtro,:pesquisa,'0')";
            $result = $funcoes->executarSQL($sql, $params);

            $relatorio->definirColuna('TÍTULO DO ARTIGO', 'titulo_artigo', '8', 'left', 't', 'n', 'n');
            $relatorio->definirColuna('TÍTULO DO PERIÓDICO', 'titulo_periodico', '4', 'center', 't', 'n', 'n');
            $relatorio->definirColuna('AUTOR(es)', 'autor', '4', 'center', 't', 'n', 'n');
            $relatorio->definirColuna('VOLUME', 'volume', '2', 'center', 't', 'n', 'n');
            $relatorio->definirColuna('MÊS/ANO', 'mes_ano', '2', 'center', 't', 'n', 'n');
            $relatorio->definirColuna('PÁGINA', 'pagina', '2', 'center', 't', 'n', 'n');
            $relatorio->definirColuna('ENDEREÇO', 'endereco_acesso', '2', 'center', 't', 'n', 'n');
            $relatorio->definirColuna('PALAVRA CHAVE', 'palavra_chave', '2', 'center', 't', 'n', 'n');
            $relatorio->definirColuna('USUÁRIO', 'usuario', '4', 'center', 't', 'n', 'n');
            $relatorio->definirColuna('DATA PESQUISA', 'data_pesquisa', '4', 'center', 't', 'n', 'n');

            $relatorio->definirColuna('DOWNLOAD', '1', '2', 'center', 't', 'n', 'n');
            $relatorio->definirColuna('ALTERAR', '2', '2', 'center', 't', 'n', 'n');
            $relatorio->definirColuna('EXCLUIR', '3', '2', 'center', 't', 'n', 'n');

            $view = new ViewModel(array(
                'result' => $result,
                'relatorio' => $relatorio,
                'filtro' => $params['filtro'],
                'pesq' => $params['pesquisa']
            ));

            $view->setTemplate('quadro/quadro-leitura');
            return $view;
        }

        public function addAction() {
            $funcoes = new Funcoes($this);
            $sessao = new Container("usuario");

            $response = $this->getResponse();
            $request = $this->getRequest();
            $post_data = $this->params()->fromPost();

            if ($request->isPost()) {
                $params = array(
                    'usuario' => $sessao->cod_usuario,
                    'base' => $post_data['add_base'],
                    'data_pesquisa' => $post_data['add_datapesq'],
                    'titulo_periodico' => $post_data['add_periodico'],
                    'ano' => $post_data['add_ano'] == '' ? 0 : $post_data['add_ano'],
                    'mes' => $post_data['add_mes'] == '' ? 0 : $post_data['add_mes'],
                    'volume' => $post_data['add_volume'] == '' ? 0 : $post_data['add_volume'],
                    'numero' => $post_data['add_numero'] == '' ? 0 : $post_data['add_numero'],
                    'titulo_artigo' => $post_data['add_artigo'],
                    'autor' => $post_data['add_autor'],
                    'pagina_inicial' => $post_data['add_pginicial'] == '' ? 0 : $post_data['add_pginicial'],
                    'pagina_final' => $post_data['add_pgfim'] == '' ? 0 : $post_data['add_pgfim'],
                    'interesse' => 1, //$this->params()->fromPost('add_interesse', ''), 
                    'palavra_chave' => $post_data['add_palavra_chave'],
                    'endereco_acesso' => $post_data['add_endereco']
                );

                $arquivo = $this->params()->fromFiles('add_arquivo', '');

                if ($arquivo) {
                    if ($arquivo['error'] == 0) {
                        $ext = pathinfo($arquivo['name'], PATHINFO_EXTENSION);

                        $dir = $_SERVER['DOCUMENT_ROOT'] . '/arquivos/leitura/';

                        if (!file_exists($dir)) {
                            mkdir($dir, 0777);
                        }

                        $params['arquivo_nome'] = 'material-' . date("Y-m-d-H-m-s") . '.' . $ext;

                        $destino = $dir . $params['arquivo_nome'];

                        move_uploaded_file($arquivo['tmp_name'], $destino);

                        if (file_exists($destino)) {

                            $sql = "insert into ltr_material_leitura(cod_usuario_fk, base, data_pesquisa, titulo_periodico, ano, mes, volume, numero, titulo_artigo, autor, pagina_inicial, pagina_final, interesse, arquivo, data_criacao, palavra_chave, endereco_acesso) " .
                                    "values(:usuario, :base, :data_pesquisa, :titulo_periodico, :ano, :mes, :volume, :numero, :titulo_artigo, :autor, :pagina_inicial, :pagina_final, :interesse, :arquivo_nome, now(), :palavra_chave, :endereco_acesso);";
                            $funcoes->executarSQL($sql, $params);

                            return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Material Adicionado.')));
                        } else {
                            return $response->setContent(Json::encode(array('response' => false, 'msg' => 'Erro ao adicionar o Material.')));
                        }
                    } else {
                        $msg = $funcoes->validaArquivo($arquivo['error']);
                        return $response->setContent(Json::encode(array('response' => false, 'msg' => $msg)));
                    }
                } else {
                    $sql = "insert into ltr_material_leitura(cod_usuario_fk, base, data_pesquisa, titulo_periodico, ano, mes, volume, numero, titulo_artigo, autor, pagina_inicial, pagina_final, interesse, arquivo, data_criacao, palavra_chave, endereco_acesso) " .
                            "values(:usuario, :base, :data_pesquisa, :titulo_periodico, :ano, :mes, :volume, :numero, :titulo_artigo, :autor, :pagina_inicial, :pagina_final, :interesse, '', now(), :palavra_chave, :endereco_acesso);";
                    $funcoes->executarSQL($sql, $params);

                    return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Material Adicionado.')));
                }
            } else {
                return $response->setContent(Json::encode(array('response' => false)));
            }
        }

        public function showEditAction() {
            $funcoes = new Funcoes($this);
            $sessao = new Container("usuario");

            $response = $this->getResponse();
            $request = $this->getRequest();

            if ($request->isPost()) {
                $params = array(
                    'usuario' => $sessao->cod_usuario,
                    'cod' => $this->params()->fromPost('cod', '-1'),
                );

                $sql = "call us_buscarLeitura_sp(0,'',:cod)";
                $result = $funcoes->executarSQL($sql, $params, '');

                return $response->setContent(Json::encode(array('response' => true, 'result' => $result)));
            } else {
                header('Location: /quadro-leitura');
                exit;
            }
        }

        public function editAction() {
            $funcoes = new Funcoes($this);
            $sessao = new Container("usuario");

            $response = $this->getResponse();
            $request = $this->getRequest();
            $post_data = $this->params()->fromPost();

            if ($request->isPost()) {

                $post_data['edit_ano'] = $post_data['edit_ano'] == '' ? 0 : $post_data['edit_ano'];
                $post_data['edit_mes'] = $post_data['edit_mes'] == '' ? 0 : $post_data['edit_mes'];
                $post_data['edit_volume'] = $post_data['edit_volume'] == '' ? 0 : $post_data['edit_volume'];
                $post_data['edit_numero'] = $post_data['edit_numero'] == '' ? 0 : $post_data['edit_numero'];
                $post_data['edit_pginicial'] = $post_data['edit_pginicial'] == '' ? 0 : $post_data['edit_pginicial'];
                $post_data['edit_pgfim'] = $post_data['edit_pgfim'] == '' ? 0 : $post_data['edit_pgfim'];
                $post_data['edit_interesse'] = 1;

                $arquivo = $this->params()->fromFiles('edit_arquivo', '');

                if ($arquivo) {
                    if ($arquivo['error'] == 0) {
                        $ext = pathinfo($arquivo['name'], PATHINFO_EXTENSION);

                        $dir = $_SERVER['DOCUMENT_ROOT'] . '/arquivos/leitura/';

                        if (!file_exists($dir)) {
                            mkdir($dir, 0777);
                        }

                        $post_data['arquivo_nome'] = 'material-' . date("Y-m-d-H-m-s") . '.' . $ext;

                        $destino = $dir . $post_data['arquivo_nome'];

                        move_uploaded_file($arquivo['tmp_name'], $destino);

                        if (file_exists($destino)) {
                            $sql = "update ltr_material_leitura set base = :edit_base, data_pesquisa =:edit_datapesq, titulo_periodico =:edit_periodico, ano=:edit_ano, mes=:edit_mes, volume=:edit_volume, numero=:edit_numero, titulo_artigo=:edit_artigo, autor=:edit_autor, pagina_inicial =:edit_pginicial, pagina_final =:edit_pgfim, interesse=:edit_interesse, palavra_chave =:edit_palavra_chave, endereco_acesso =:edit_endereco, arquivo=:arquivo_nome where cod_material =:edit_cod";
                            $funcoes->executarSQL($sql, $post_data);

                            return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Alterado com sucesso!')));
                        } else {
                            return $response->setContent(Json::encode(array('response' => false, 'msg' => 'Erro ao alterar!')));
                        }
                    } else {
                        $msg = $funcoes->validaArquivo($arquivo['error']);
                        return $response->setContent(Json::encode(array('response' => false, 'msg' => $msg)));
                    }
                } else {
                    $sql = "update ltr_material_leitura set base = :edit_base, data_pesquisa =:edit_datapesq, titulo_periodico =:edit_periodico, ano=:edit_ano, mes=:edit_mes, volume=:edit_volume, numero=:edit_numero, titulo_artigo=:edit_artigo, autor=:edit_autor, pagina_inicial =:edit_pginicial, pagina_final =:edit_pgfim, interesse=:edit_interesse, palavra_chave =:edit_palavra_chave, endereco_acesso =:edit_endereco where cod_material =:edit_cod";
                    $funcoes->executarSQL($sql, $post_data);

                    return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Alterado com sucesso!')));
                }
            } else {
                return $response->setContent(Json::encode(array('response' => false)));
            }
        }

        public function deleteAction() {
            $funcoes = new Funcoes($this);
            $sessao = new Container("usuario");

            $response = $this->getResponse();

            $params = array(
                'cod' => $this->params()->fromPost('cod', ''),
            );

            $sql = "delete from ltr_material_leitura where cod_material =:cod";
            $funcoes->executarSQL($sql, $params);

            return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Material deletado.')));
        }

    }
