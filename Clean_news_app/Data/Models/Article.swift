//
//  Article.swift
//  Clean_news_app
//
//  Created by daniel on 18/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import Foundation

struct Article : Codable {
    let title: String?
    let description : String?
    let source: Source?
    let url: String
    let urlToImage: String?
}
