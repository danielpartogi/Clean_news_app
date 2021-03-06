//
//  SourceListWorker.swift
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

class SourceListWorker
{
    func getSources(category: String, completion:@escaping (Result<SourceListModel, Error>)->()) {
        
        let data: [String: Any] = ["category":category, "apiKey": Constants.Server.token]
        
        
        NetworkCall(data: data, url: "/sources", method: .get).request(){
            (result: Result<SourceListModel,Error>) in
            switch result{
            case .success(let data):
                completion(.success(data))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
}
