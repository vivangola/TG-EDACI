<?php
/**
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2016 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Quadro;

use Zend\Router\Http\Literal;
use Zend\Router\Http\Segment;
use Zend\ServiceManager\Factory\InvokableFactory;

return [
    'router' => [
        'routes' => [
            'quadro-leitura' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/quadro-leitura[/:action]',
                    'defaults' => [
                        'controller' => Controller\QuadroLeituraController::class,
                        'action'     => 'quadro-leitura',
                    ],
                ],
            ],
            'biblioteca' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/biblioteca[/:action]',
                    'defaults' => [
                        'controller' => Controller\BibliotecaController::class,
                        'action'     => 'biblioteca',
                    ],
                ],
            ],
            'atas' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/atas[/:action]',
                    'defaults' => [
                        'controller' => Controller\AtasController::class,
                        'action'     => 'atas',
                    ],
                ],
            ],
            'avisos' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/avisos[/:action]',
                    'defaults' => [
                        'controller' => Controller\QuadroAvisoController::class,
                        'action'     => 'avisos',
                    ],
                ],
            ],
            'eventos' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/eventos[/:action]',
                    'defaults' => [
                        'controller' => Controller\EventosController::class,
                        'action'     => 'eventos',
                    ],
                ],
            ],
            'quadro-disponibilidade' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/quadro-disponibilidade[/:action]',
                    'defaults' => [
                        'controller' => Controller\QuadroDisponibilidadeController::class,
                        'action'     => 'quadro-disponibilidade',
                    ],
                ],
            ],
            'plano-atividades' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/plano-atividades[/:action]',
                    'defaults' => [
                        'controller' => Controller\PlanoAtividadesController::class,
                        'action'     => 'plano-atividades',
                    ],
                ],
            ],
            'plano-metas' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/plano-metas[/:action]',
                    'defaults' => [
                        'controller' => Controller\PlanoMetasController::class,
                        'action'     => 'plano-metas',
                    ],
                ],
            ],
            'nivel-escolaridade' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/escolaridade[/:action]',
                    'defaults' => [
                        'controller' => Controller\EscolaridadeController::class,
                        'action'     => 'escolaridade',
                    ],
                ],
            ],
            'plano-atividades' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/plano-atividades[/:action]',
                    'defaults' => [
                        'controller' => Controller\PlanoAtividadesController::class,
                        'action'     => 'atividades',
                    ],
                ],
            ],
            'producao-grupo' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/producao-grupo[/:action]',
                    'defaults' => [
                        'controller' => Controller\ProducaoGrupoController::class,
                        'action'     => 'producao-grupo',
                    ],
                ],
            ],
            'trabalho-correcao' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/trabalho-correcao[/:action]',
                    'defaults' => [
                        'controller' => Controller\TrabalhoCorrecaoController::class,
                        'action'     => 'trabalho-correcao',
                    ],
                ],
            ],
            'assunto' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/assunto[/:action]',
                    'defaults' => [
                        'controller' => Controller\AssuntoController::class,
                        'action'     => 'assunto',
                    ],
                ],
            ],
            'portfolio' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/portfolio[/:action]',
                    'defaults' => [
                        'controller' => Controller\PortfolioController::class,
                        'action'     => 'portfolio',
                    ],
                ],
            ],
        ],
    ],
    'controllers' => [
        'factories' => [
            Controller\LoginController::class => InvokableFactory::class,
            Controller\QuadroLeituraController::class => InvokableFactory::class,
            Controller\BibliotecaController::class => InvokableFactory::class,
            Controller\AtasController::class => InvokableFactory::class,
            Controller\QuadroAvisoController::class => InvokableFactory::class,
            Controller\EventosController::class => InvokableFactory::class,
            Controller\QuadroDisponibilidadeController::class => InvokableFactory::class,
            Controller\PlanoAtividadesController::class => InvokableFactory::class,
            Controller\PlanoMetasController::class => InvokableFactory::class,
            Controller\EscolaridadeController::class => InvokableFactory::class,
            Controller\AssuntoController::class => InvokableFactory::class,
            Controller\ProducaoGrupoController::class => InvokableFactory::class,
            Controller\TrabalhoCorrecaoController::class => InvokableFactory::class,
            Controller\PlanoAtividadesController::class => InvokableFactory::class,
            Controller\PortfolioController::class => InvokableFactory::class
        ],
    ],
    'view_manager' => [
        'display_not_found_reason' => true,
        'display_exceptions'       => true,
        'doctype'                  => 'HTML5',
        'not_found_template'       => 'error/404',
        'exception_template'       => 'error/index',
        'template_map' => [
            'layout/layout'           => __DIR__ . '/../view/layout/layout.phtml',
            'application/index/index' => __DIR__ . '/../view/application/index/index.phtml',
            'error/404'               => __DIR__ . '/../view/error/404.phtml',
            'error/index'             => __DIR__ . '/../view/error/index.phtml',
        ],
        'template_path_stack' => [
            __DIR__ . '/../view',
        ],
    ],
];
