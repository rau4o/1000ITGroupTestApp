//
//  NetworkDataFetcher.swift
//  ITGroup1000Test
//
//  Created by rau4o on 9/18/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Foundation

class NetworkDataFetcher {
    
    var networkDataFetcher: NetworkManagerDelegate
    
    init(networkDataFetcher: NetworkManagerDelegate = NetworkManager()) {
        self.networkDataFetcher = networkDataFetcher
    }
    
    func fetchMovieData(page: Int ,completion: @escaping (Welcome) -> Void) {
        networkDataFetcher.fetchGenericJSONData(target: .fetchMovie(pages: page), response: completion)
    }
    
    func fetchDetailMovie(id: Int, completion: @escaping (WelcomeDetail) -> Void) {
        networkDataFetcher.fetchGenericJSONData(target: .getDetailMovie(id: id), response: completion)
    }
}
