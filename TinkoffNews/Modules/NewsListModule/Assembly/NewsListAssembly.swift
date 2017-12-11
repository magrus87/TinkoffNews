//
//  NewsListModule.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 30/11/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import UIKit

class NewsListModule {
    
    var viewController: ModuleTransition {
        return controller
    }
    
    private let controller = NewsListViewController()
    
    init() {
        let presenter = NewsListPresenter()
        presenter.view = controller
        
        let router = NewsListRouter()
        router.transitionHandler = controller
        
        let interactor = NewsListInteractor()
        interactor.output = presenter
        
        controller.router = router
        controller.interactor = interactor
        controller.moduleInput = presenter
    }
}
