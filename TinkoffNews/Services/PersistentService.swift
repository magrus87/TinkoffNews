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
    func fetchedResultsController(entityName: String, sortKey: String, context: NSManagedObjectContext) -> NSFetchedResultsController<NSFetchRequestResult>
}

class PersistentService: PersistentBase {
    
    func fetchedResultsController(entityName: String, sortKey: String, context: NSManagedObjectContext) -> NSFetchedResultsController<NSFetchRequestResult> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let sortDescriptor = NSSortDescriptor(key: sortKey, ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                  managedObjectContext: context,
                                                                  sectionNameKeyPath: nil,
                                                                  cacheName: nil)
        return fetchedResultsController
    }
}
