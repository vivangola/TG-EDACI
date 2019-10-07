<?php
/**
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2016 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Questionario;

use Zend\Router\Http\Literal;
use Zend\Router\Http\Segment;
use Zend\ServiceManager\Factory\InvokableFactory;

return [
    'router' => [
        'routes' => [
            'questionario' => [
                'type' => Literal::class,
                'options' => [
                    'route'    => '/questionario',
                    'defaults' => [
                        'controller' => Controller\QuestionarioController::class,
                        'action'     => 'questionario',
                    ],
                ],
            ],
            'questionario-inicial' => [
                'type' => Segment::class,
                'options' => [
                    'route'    => '/questionario/inicial[/:cod_questao]',
                    'defaults' => [
                        'controller' => Controller\QuestionarioController::class,
                        'action'     => 'inicial',
                    ],
                ],
            ],
            'questionario-aprendizagem' => [
                'type' => Segment::class,
                'options' => [
                    'route'    => '/questionario/aprendizagem[/:cod_questao]',
                    'defaults' => [
                        'controller' => Controller\QuestionarioController::class,
                        'action'     => 'aprendizagem',
                    ],
                ],
            ],
            'questionario-cadastro' => [
                'type' => Segment::class,
                'options' => [
                    'route'    => '/questionario/cadastro[/:action]',
                    'defaults' => [
                        'controller' => Controller\QuestionarioController::class,
                        'action'     => 'cadastro',
                    ],
                ],
            ],
            'buscar-questionario' => [
                'type' => Segment::class,
                'options' => [
                    'route'    => '/questionario/buscar-questionario',
                    'defaults' => [
                        'controller' => Controller\QuestionarioController::class,
                        'action'     => 'buscarQuestionario',
                    ],
                ],
            ],
        ],
    ],
    'controllers' => [
        'factories' => [
            Controller\QuestionarioController::class => InvokableFactory::class,
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
