//
//  DetailMovieViewModel.swift
//  ITGroup1000Test
//
//  Created by rau4o on 9/18/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Foundation

class DetailMovieViewModel {
    
    // MARK: - Properties
    
    var dataFetcher = NetworkDataFetcher()
    var detailMovie: WelcomeDetail?
    var movieId: Int?
    var showDetailMovie: ((WelcomeDetail) -> ())?
    
    var title: String {
        return detailMovie?.title ?? ""
    }
    
    // MARK: - Helper function
    
    func getDetailMovie(id: Int) {
        dataFetcher.fetchDetailMovie(id: id) { [weak self] (result) in
            guard let self = self else {return}
            self.detailMovie = result
            guard self.detailMovie != nil else {return}
            self.showDetailMovie?(self.detailMovie!)
            
        }
    }
}
