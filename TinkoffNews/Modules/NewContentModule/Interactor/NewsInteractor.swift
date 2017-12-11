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
    private let persistent = PersistentService()
}

//----------------------------------------------------
// MARK: - NewContentInteractorInput
//----------------------------------------------------
extension NewContentInteractor: NewContentInteractorInput {
    func getNew(id: Int) {
        apiService.getNew(byID: id, completionHandler: { (content, error) in
            if let error = error {
                print(error)
                return
            }
            self.persistent.save(content: content)
            
            DispatchQueue.main.async { [weak self] in
                self?.output?.loadedNewContent(content: content)
            }
        })
    }
}
