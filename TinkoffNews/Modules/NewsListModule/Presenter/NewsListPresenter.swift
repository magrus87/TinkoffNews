//
//  NewsListPresenter.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 30/11/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

class NewsListPresenter {
    var view: NewsListViewInput?
}

//----------------------------------------------------
// MARK: - NewsListModuleInput
//----------------------------------------------------
extension NewsListPresenter: NewsListModuleInput {
    func configureModule() {
        view?.setupInitialState()
    }
}

//----------------------------------------------------
// MARK: - NewsListInteractorOutput
//----------------------------------------------------
extension NewsListPresenter: NewsListInteractorOutput {
    func updatedNews() {
        view?.endRefresh()
    }
}
