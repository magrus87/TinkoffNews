//
//  TinkoffNews.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 04/12/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import Foundation
import CoreData

@objc(TinkoffNews)
final class TinkoffNews: NSManagedObject, Codable {
    @NSManaged public var id: Int
    @NSManaged public var text: String
    @NSManaged public var publicationDate: Date
    
    enum CodingKeys: CodingKey {
        case id
        case text
        case publicationDate
    }
    
    enum DateKeys: String, CodingKey {
        case milliseconds
    }
    
    override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    public init(from decoder: Decoder) throws {
        let managedContext = AppPersistentContainer.instance.context
        let entityDescription = NSEntityDescription.entity(forEntityName: "TinkoffNews", in: managedContext)
        
        super.init(entity: entityDescription!, insertInto: managedContext)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = Int(try values.decode(String.self, forKey: .id))!
        text = try values.decode(String.self, forKey: .text)
        
        let date = try values.nestedContainer(keyedBy: DateKeys.self, forKey: .publicationDate)
        let milliseconds = try date.decode(Double.self, forKey: .milliseconds)
        publicationDate = Date(timeIntervalSince1970: milliseconds/1000)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(text, forKey: .text)
        try container.encode(publicationDate, forKey: .publicationDate)
    }
}

extension TinkoffNews {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<TinkoffNews> {
        return NSFetchRequest<TinkoffNews>(entityName: "TinkoffNews")
    }
    
    @NSManaged public var content: TinkoffNewContent?
    
}
