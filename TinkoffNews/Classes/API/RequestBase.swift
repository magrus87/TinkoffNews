//
//  RequestBase.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 10/12/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import Foundation

protocol RequestBase {
    var methodPath: String { get set }
    
    var method: HttpMethod { get set}
    
    var parameters: [String: String]? { get set}
}
