//
//  Structs.swift
//  Lab4
//
//  Created by 黄越 on 10/14/19.
//  Copyright © 2019 黄越. All rights reserved.
//

import Foundation
struct APIResults:Decodable {
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [Movie]
}
struct MovieVideo:Decodable{
    let key:String
    let site:String
}
struct VideoResults:Decodable {
    let results:[MovieVideo]
}
struct Movie: Decodable {
    let id: Int!
    let adult: Bool
    let poster_path: String?
    let title: String
    let release_date: String
    let vote_average: Double
    let overview: String
    let vote_count:Int!
}
