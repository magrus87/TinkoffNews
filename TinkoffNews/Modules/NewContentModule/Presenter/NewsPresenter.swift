//
//  NewContentPresenter.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 30/11/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

class NewContentPresenter {
    var view: NewContentViewInput?
}

//----------------------------------------------------
// MARK: - NewContentModuleInput
//----------------------------------------------------
extension NewContentPresenter: NewContentModuleInput {
    func configureModule(newID: Int) {
        view?.setupInitialState(newID: newID)
    }
}

//----------------------------------------------------
// MARK: - NewContentInteractorOutput
//----------------------------------------------------
extension NewContentPresenter: NewContentInteractorOutput {
    func loadedNewContent(content: TinkoffNewContent?) {
        view?.showNewContent(content: content?.content ?? "")
    }
}
