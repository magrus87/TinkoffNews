//
//  NewsListRouter.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 30/11/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import UIKit

class NewsListRouter {
    var transitionHandler: ModuleTransition?
}

//----------------------------------------------------
// MARK: - NewsListRouterInput
//----------------------------------------------------
extension NewsListRouter: NewsListRouterInput {
    func showNewsContentModule(newID: Int) {
        let newsModule = NewContentModule()
        if let moduleInput = newsModule.viewController.moduleInput as? NewContentModuleInput {
            moduleInput.configureModule(newID: newID)
        }
        transitionHandler?.navigationController?.pushViewController(newsModule.viewController, animated: true)
    }
}
