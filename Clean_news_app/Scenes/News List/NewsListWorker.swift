//
//  NewsListWorker.swift
//  Clean_news_app
//
//  Created by daniel on 18/05/20.
//  Copyright (c) 2020 Daniel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class NewsListWorker
{
    func getNewsList(query:String?,source:String, date:String, page: Int, completion:@escaping (Result<NewsListModel, Error>)->()) {
        
        var data: [String: Any] = ["page": page,"sources": source, "apiKey": Constants.Server.token, "from" : date]
        if let query = query {
            data["q"] = query
        }
        
        NetworkCall(data: data, url: "/everything", method: .get).request(){
            (result: Result<NewsListModel,Error>) in
            switch result{
            case .success(let data):
                completion(.success(data))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
}
