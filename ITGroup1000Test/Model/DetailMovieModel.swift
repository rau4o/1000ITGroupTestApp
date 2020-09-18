//
//  DetailMovieModel.swift
//  ITGroup1000Test
//
//  Created by rau4o on 9/18/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Foundation

struct WelcomeDetail: Decodable {
    
    let backdropPath: String?
    let budget: Int?
    let homepage: String?
    let id: Int?
    let original_language, original_title, overview: String?
    let popularity: Double?
    let poster_path: String?
    let release_date: String?
    let revenue, runtime: Int?
    let status, tagline, title: String?
    let video: Bool?
    let vote_average: Double?
}
