//
//  TinkoffNews.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 04/12/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import Foundation

struct TinkoffNews: Codable {
    var id: Int
    var text: String
    var publicationDate: Date
    
    enum CodingKeys: CodingKey {
        case id
        case text
        case publicationDate
    }
    
    enum DateKeys: String, CodingKey {
        case milliseconds
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = Int(try values.decode(String.self, forKey: .id))!
        text = try values.decode(String.self, forKey: .text)
        
        let date = try values.nestedContainer(keyedBy: DateKeys.self, forKey: .publicationDate)
        let milliseconds = try date.decode(Double.self, forKey: .milliseconds)
        publicationDate = Date(timeIntervalSince1970: milliseconds/1000)
    }
    
    init(id: Int, text: String, publicationDate: Date) {        
        self.id = id
        self.text = text
        self.publicationDate = publicationDate
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(text, forKey: .text)
        try container.encode(publicationDate, forKey: .publicationDate)
    }
}
