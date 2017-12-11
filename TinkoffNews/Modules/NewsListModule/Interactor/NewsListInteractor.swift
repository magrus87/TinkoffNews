//
//  NewsListInteractor.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 30/11/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import UIKit
import CoreData

class NewsListInteractor {
    var output: NewsListInteractorOutput?
    
    private let apiService = TinkoffAPIService()
    
    private let persistent = PersistentService()
}

//----------------------------------------------------
// MARK: - NewsListInteractorInput
//----------------------------------------------------
extension NewsListInteractor: NewsListInteractorInput {
    func fetchNews() {
        do {
            let entityName = "TinkoffNews"
            let sortKey = TinkoffNews.CodingKeys.publicationDate.stringValue
            let context = AppPersistentContainer.instance.context
            let fetchedResultsController = persistent.fetchedResultsController(entityName: entityName,
                                                                               sortKey: sortKey,
                                                                               context: context)
            try fetchedResultsController.performFetch()
            
            fetchedResultsController.object(at: <#T##IndexPath#>). .fetchedObjects.map({
                $0 as! TinkoffNews
            })
            
        } catch  {
            print(error)
        }
    }
    
    func getAllNews() {
        apiService.getAllNews { (news, error) in
            if let error = error {
                print(error)
                return
            }
            AppPersistentContainer.instance.saveContext()
            
            DispatchQueue.main.async { [weak self] in
                self?.output?.updatedNews()
            }
        }
    }
}
