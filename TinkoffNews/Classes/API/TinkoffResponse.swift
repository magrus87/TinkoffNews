//
//  TinkoffResponse.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 10/12/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import Foundation

struct TinkoffResponse<TPayload: Codable>: Codable {
    var resultCode: String
    var payload: TPayload?
}
