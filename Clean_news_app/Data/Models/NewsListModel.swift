//
//  NewsModel.swift
//  Clean_news_app
//
//  Created by daniel on 18/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import Foundation

struct NewsListModel : Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

