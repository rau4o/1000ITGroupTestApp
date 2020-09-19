//
//  ListMovieViewModel.swift
//  ITGroup1000Test
//
//  Created by rau4o on 9/18/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Foundation
import RealmSwift

class ListMovieViewModel {
    
    // MARK: - Properties
    
    var movieData: [MovieModel] = []
    var dataFetcher = NetworkDataFetcher()
    var dataSource: TableViewDataSource<MovieModel, ListMoviesTableViewCell>?
    weak var delegate: MovieViewModelDelegate?
    
    var numberOfMovies: Int {
        return movieData.count
    }
    
    // MARK: - Helper function
    
    func getMovieId(at index: Int) -> MovieModel {
        return movieData[index]
    }
    
    func getMovieData(pages: Int, completion: @escaping () -> Void) {
        dataFetcher.fetchMovieData(page: pages) { [weak self] (result) in
            guard let self = self else {return}
            let movies = result.results
            for i in 0..<movies.count {
                self.movieData.append(movies[i])
            }
            self.didLoadMovie(self.movieData)
            self.delegate?.reloadTableView()
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    private func didLoadMovie(_ movies: [MovieModel]) {
        dataSource = .make(for: movies, reuseIdentifier: "cellId")
    }
    
    func deleteLoadMovie() {
        movieData.removeAll()
        dataSource = .make(for: movieData, reuseIdentifier: "cellId")
    }
}
