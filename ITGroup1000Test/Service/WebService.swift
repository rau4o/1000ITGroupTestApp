//
//  WebService.swift
//  ITGroup1000Test
//
//  Created by rau4o on 9/18/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Moya

enum WebService {
    case fetchMovie(pages: Int)
    case getDetailMovie(id: Int)
}

extension WebService: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/") else {
            fatalError("error url")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .fetchMovie:
            return "popular"
        case .getDetailMovie(let id):
            return "\(id)"
        }
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .fetchMovie(let page):
            return .requestParameters(parameters: ["api_key": NetworkProperties.API_KEY, "page": page], encoding: URLEncoding.default)
        case .getDetailMovie(let id):
            return .requestParameters(parameters: ["api_key": NetworkProperties.API_KEY, "movie_id": id], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
