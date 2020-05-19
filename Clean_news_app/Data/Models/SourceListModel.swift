//
//  SourceListModel.swift
//  Clean_news_app
//
//  Created by daniel on 18/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import Foundation

struct SourceListModel: Codable {
    let status: String
    var sources: [Source]
}
