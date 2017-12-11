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
        DispatchQueue.main.async { [weak self] in
            self?.output?.obtain(news: self?.persistent.fetchNews())
        }
    }
    
    func getAllNews() {
        apiService.getAllNews { (news, error) in
            if let error = error {
                print(error)
                return
            }
            
            self.persistent.save(news: news)

            DispatchQueue.main.async { [weak self] in
                self?.output?.updatedNews()
            }
        }
    }
}
