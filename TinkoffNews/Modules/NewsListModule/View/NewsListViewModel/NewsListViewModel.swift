//
//  NewsListViewModel.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 10/12/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import Foundation

struct NewsListViewModel {
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter
    }()
    
    var title: String {
        return "NEWS_LIST_TITLE".localized
    }
    
    private var news: [TinkoffNews] = []
    
    var newsCount: Int {
        return news.count
    }
    
    func newsPreview(index: Int) -> String? {
        guard index < newsCount else {
            return nil
        }
        
        return news[index].text
    }
    
    func date(index: Int) -> String? {
        guard index < newsCount else {
            return nil
        }

        return dateFormatter.string(from: news[index].publicationDate)
    }
    
    func newID(index: Int) -> Int? {
        guard index < newsCount else {
            return nil
        }
        
        return news[index].id
    }
    
    init(news: [TinkoffNews]) {
        self.news = news
    }
}
