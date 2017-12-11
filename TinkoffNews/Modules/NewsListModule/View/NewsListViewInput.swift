//
//  NewsListViewInput.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 30/11/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

protocol NewsListViewInput {
    func setupInitialState()
    
    func endRefresh()
    
    func updateViewModel(_ viewModel: NewsListViewModel)
}
