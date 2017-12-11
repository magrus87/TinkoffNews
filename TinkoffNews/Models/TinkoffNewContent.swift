//
//  TinkoffNewContent.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 10/12/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import Foundation
import CoreData

@objc(TinkoffNewContent)
final class TinkoffNewContent: NSManagedObject, Codable {
    @NSManaged public var content: String
    
    enum CodingKeys: CodingKey {
        case content
    }
    
    override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    public init(from decoder: Decoder) throws {
        let managedContext = AppPersistentContainer.instance.context
        let entityDescription = NSEntityDescription.entity(forEntityName: "TinkoffNewContent", in: managedContext)
        super.init(entity: entityDescription!, insertInto: managedContext)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        content = try values.decode(String.self, forKey: .content)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(content, forKey: .content)
    }
}

extension TinkoffNewContent {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<TinkoffNewContent> {
        return NSFetchRequest<TinkoffNewContent>(entityName: "TinkoffNewContent")
    }

    @NSManaged public var news: TinkoffNews?
}
