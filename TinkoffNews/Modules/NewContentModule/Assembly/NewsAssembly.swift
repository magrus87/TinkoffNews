//
//  NewContentModule.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 30/11/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import UIKit

class NewContentModule {
    
    var viewController: ModuleTransition {
        return controller
    }
    
    private let controller = NewContentViewController()
    
    init() {
        let presenter = NewContentPresenter()
        presenter.view = controller
        
        let router = NewContentRouter()
        router.transitionHandler = controller
        
        let interactor = NewContentInteractor()
        interactor.output = presenter
        
        controller.router = router
        controller.interactor = interactor
        controller.moduleInput = presenter
    }
}
