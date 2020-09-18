//
//  MovieModel.swift
//  ITGroup1000Test
//
//  Created by rau4o on 9/18/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Foundation

struct Welcome: Decodable {
    let page: Int?
    let results: [MovieModel]
}

struct MovieModel: Decodable {
    let poster_path: String?
    let id: Int?
    let backdrop_path: String?
    let original_title: String?
    let title: String?
    let vote_average: Double?
    let overview, release_date: String?
}
