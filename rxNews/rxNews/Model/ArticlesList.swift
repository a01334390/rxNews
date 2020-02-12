//
//  ArticlesList.swift
//  rxNews
//
//  Created by Fernando Martin Garcia Del Angel on 11/02/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import Foundation

extension ArticleList {
    static var all: Resource<ArticleList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=471ba8410e7645edbb5a8e2e63c71a7a")!
        return Resource(url: url)
    }()
}

struct ArticleList: Decodable {
    let articles:[Article]
}
