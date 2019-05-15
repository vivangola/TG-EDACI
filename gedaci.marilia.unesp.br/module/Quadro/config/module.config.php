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
                    'route'    => '/quadro-leitura',
                    'defaults' => [
                        'controller' => Controller\QuadroLeituraController::class,
                        'action'     => 'quadro-leitura',
                    ],
                ],
            ],
            'biblioteca' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/biblioteca',
                    'defaults' => [
                        'controller' => Controller\BibliotecaController::class,
                        'action'     => 'biblioteca',
                    ],
                ],
            ],
            'atas' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/atas',
                    'defaults' => [
                        'controller' => Controller\AtasController::class,
                        'action'     => 'atas',
                    ],
                ],
            ],
            'avisos' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/avisos',
                    'defaults' => [
                        'controller' => Controller\QuadroAvisoController::class,
                        'action'     => 'avisos',
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