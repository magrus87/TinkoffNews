//
//  NewContentViewInput.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 30/11/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

protocol NewContentViewInput {
    func setupInitialState(newID: Int)
    
    func showNewContent(content: String)
}
