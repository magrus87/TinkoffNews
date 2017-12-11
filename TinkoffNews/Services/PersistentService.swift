//
//  PersistentService.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 11/12/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import Foundation
import CoreData

protocol PersistentBase {
    func save(news: [TinkoffNews]?)
    
    func fetchNews() -> [TinkoffNews]?
    
    func save(content: TinkoffNewContent?)
    
    func fetchContent() -> TinkoffNewContent?
}

class PersistentService: PersistentBase {
    
    private func fetch(entityName: String, sortKey: String? = nil, context: NSManagedObjectContext) -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        if let sortKey = sortKey {
            let sortDescriptor = NSSortDescriptor(key: sortKey, ascending: false)
            fetchRequest.sortDescriptors = [sortDescriptor]
        }
        
        var results: [NSManagedObject] = []
        do {
            results = try context.fetch(fetchRequest)
        } catch {
            print(error)
        }
        return results
    }
    
    // MARK: - PersistentBase
    
    func save(news: [TinkoffNews]?) {
        guard let news = news else {
            return
        }
        
        let context = AppPersistentContainer.instance.context
        
        news.forEach {
            let object = NSEntityDescription.insertNewObject(forEntityName: "News", into: context)
            
            object.setValue($0.id, forKeyPath: "id")
            object.setValue($0.text, forKeyPath: "text")
            object.setValue($0.publicationDate, forKeyPath: "publicationDate")
        }
        
        AppPersistentContainer.instance.saveContext()
    }
    
    func fetchNews() -> [TinkoffNews]? {
        let context = AppPersistentContainer.instance.context
        let results = fetch(entityName: "News", sortKey: "publicationDate", context: context)
        
        return results.map { obj -> TinkoffNews? in
            guard let id = obj.value(forKey: "id") as? Int,
                let text = obj.value(forKey: "text") as? String,
                let publicationDate = obj.value(forKey: "publicationDate") as? Date else {
                    return nil
            }
            return TinkoffNews(id: id, text: text, publicationDate: publicationDate)
        }.filter({
            $0 != nil
        }) as? [TinkoffNews]
    }
    
    func save(content: TinkoffNewContent?) {
        guard let content = content else {
            return
        }
        
        let context = AppPersistentContainer.instance.context
        
        let object = NSEntityDescription.insertNewObject(forEntityName: "NewContent", into: context)
        object.setValue(content.content, forKeyPath: "content")
        
        AppPersistentContainer.instance.saveContext()
    }
    
    func fetchContent() -> TinkoffNewContent? {
        let context = AppPersistentContainer.instance.context
        let results = fetch(entityName: "NewContent", context: context)
        
        guard let object = results.first else {
            return nil
        }
        
        guard let content = object.value(forKey: "content") as? String else {
            return nil
        }
        return TinkoffNewContent(content: content)
    }
}
