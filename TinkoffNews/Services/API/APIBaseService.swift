//
//  APIBaseService.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 03/12/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import Foundation

protocol APIBase {
    var configKeyBaseAddress: String { get }
    
    var configKeyServicePath: String { get }
    
    func getBaseAddress() -> String?
    
    func getServicePathAddress() -> String?
    
    func send(request: RequestBase, completionHandler: @escaping (Data?, Error?) -> Void)
}

class APIBaseService: APIBase {
    internal var configKeyBaseAddress: String {
        return "Tinkoff.API.BaseAddress"
    }
    
    internal var configKeyServicePath: String {
        return "Tinkoff.API.ServicePath"
    }
    
    internal func getBaseAddress() -> String? {
        return Bundle.main.object(forInfoDictionaryKey: configKeyBaseAddress) as? String
    }
    
    internal func getServicePathAddress() -> String? {
        guard let baseAdsress = getBaseAddress(),
            let servicePath = Bundle.main.object(forInfoDictionaryKey: configKeyServicePath) as? String else {
            return nil
        }
        return "\(baseAdsress)\(servicePath)"
    }
    
    internal func send(request: RequestBase, completionHandler: @escaping (Data?, Error?) -> Void) {
        guard let url = url(with: request.methodPath, method: request.method, parameters: request.parameters) else {
            let error = APIError.urlError(reason: "Could not construct URL")
            completionHandler(nil, error)
            return
        }
        
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        if request.method == .post {
            urlRequest.httpBody = postString(forParameters: request.parameters).data(using: .utf8)
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            guard error == nil else {
                completionHandler(nil, error!)
                return
            }
            
            guard let responseData = data else {
                let error = APIError.objectSerialization(reason: "No data in response")
                completionHandler(nil, error)
                return
            }
            
            completionHandler(responseData, nil)
        })
        task.resume()
    }
    
    private func url(with string: String, method: HttpMethod, parameters:[String : String]?) -> URL? {
        switch method {
        case .get:
            return urlWithItems(string: string, parameters: parameters ?? [:])
        case .post:
            return URL(string: string)
        }
    }
    
    private func urlWithItems(string: String, parameters:[String : String]) -> URL? {
        let urlComponents = NSURLComponents(string: string)
        
        let items: [URLQueryItem] = parameters.map({ (key, value) in
            URLQueryItem(name: key, value: value)
        }).filter{
            !$0.name.isEmpty
        }
        
        if !items.isEmpty {
            urlComponents?.queryItems = items
        }
        return urlComponents?.url
    }
    
    private func postString(forParameters parameters: [String : String]?) -> String {
        var result = ""
        
        parameters?.forEach { (key, value) in
            result += "\(key)=\(value)"
        }
        
        return result
    }
}
