//
//  NewsListInteractorOutput.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 30/11/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

protocol NewsListInteractorOutput {
    func updatedNews()
    
    func obtain(news: [TinkoffNews]?)
}
