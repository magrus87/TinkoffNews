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
    func configureModule() {
        view?.setupInitialState()
    }
}

//----------------------------------------------------
// MARK: - NewContentInteractorOutput
//----------------------------------------------------
extension NewContentPresenter: NewContentInteractorOutput {
    
}
