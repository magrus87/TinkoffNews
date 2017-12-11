//
//  TinkoffRequest.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 10/12/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import Foundation

class TinkoffRequest: RequestBase {
    var methodPath: String = ""
    
    var method: HttpMethod = .get
    
    var parameters: [String : String]?
}
