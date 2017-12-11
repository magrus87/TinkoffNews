//
//  NewContentInteractor.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 30/11/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import Foundation

class NewContentInteractor {
    var output: NewContentInteractorOutput?
    
    private let apiService = TinkoffAPIService()
}

//----------------------------------------------------
// MARK: - NewContentInteractorInput
//----------------------------------------------------
extension NewContentInteractor: NewContentInteractorInput {
    func getNew(id: Int) {
        apiService.getNew(byID: id, completionHandler: { (newContent, error) in
            if let error = error {
                print(error)
                return
            }
            AppPersistentContainer.instance.saveContext()
            
            print("----getNew----")
        })
    }
}
