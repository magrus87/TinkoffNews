//
//  APIError.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 04/12/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import Foundation

enum APIError: Error {
    case urlError(reason: String)
    case objectSerialization(reason: String)
}

class ErrorHandleService {
    
}
