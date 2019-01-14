//
//  Article.swift
//  MagazineDemo
//
//  Created by Asaf h on 1/14/19.
//  Copyright © 2019 A h. All rights reserved.
//

import Foundation

struct Avatar:Codable {
    var imageUrl:String
}

struct Author:Codable {
    var authorAvatar:Avatar
    var authorName:String
}

struct MetaData:Codable {
    var updateTime:String
}

struct Article:Codable {
    var isLiked, isSaved:Bool
    var title, category, imageUrl:String
    var author:Author
    var likesCount:Int
    var metaData:MetaData
}

struct Articles:Codable {
    var data:[Article]
}

extension Decodable {
    init?(url:URL?) throws {
        if (url == nil) {throw "Model url is nil"}
        let jsonData = try Data(contentsOf: url!)
        self = try JSONDecoder().decode(Self.self, from: jsonData)
    }
}
