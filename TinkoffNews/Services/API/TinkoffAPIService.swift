//
//  TinkoffAPIService.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 03/12/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import Foundation

protocol TinkoffNewsAPIProtocol {
    func getAllNews(completionHandler: @escaping ([TinkoffNews]?, Error?) -> Void)
    
    func getNew(byID id: Int, completionHandler: @escaping (TinkoffNewContent?, Error?) -> Void)
}

class TinkoffAPIService: APIBaseService, TinkoffNewsAPIProtocol {
    private enum TinkoffAPIMethods: String {
        case allNews = "news"
        case newContent = "news_content"
    }
    
    // MARK: - TinkoffNewsAPIProtocol
    
    func getAllNews(completionHandler: @escaping ([TinkoffNews]?, Error?) -> Void) {
        let request = TinkoffRequest()
        request.methodPath = "\(getServicePathAddress() ?? "")\(TinkoffAPIMethods.allNews.rawValue)"
        
        send(request: request) { (data, error) in
            guard let data = data else {
                completionHandler(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(TinkoffResponse<[TinkoffNews]>.self, from: data)
                completionHandler(response.payload, nil)
            } catch {
                print(error)
                completionHandler(nil, error)
            }
        }
    }
    
    func getNew(byID id: Int, completionHandler: @escaping (TinkoffNewContent?, Error?) -> Void) {
        let request = TinkoffRequest()
        request.methodPath = "\(getServicePathAddress() ?? "")\(TinkoffAPIMethods.newContent.rawValue)"
        request.parameters = ["id": "\(id)"]
        
        send(request: request) { (data, error) in
            guard let data = data else {
                completionHandler(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(TinkoffResponse<TinkoffNewContent>.self, from: data)
                completionHandler(response.payload, nil)
            } catch {
                print(error)
                completionHandler(nil, error)
            }
        }
    }
}
