//
//  DetailMovieViewController.swift
//  ITGroup1000Test
//
//  Created by rau4o on 9/19/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import Kingfisher

class DetailMovieViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel = DetailMovieViewModel()
    
    // MARK: - UI Elements
    
    lazy var detailView: DetailMovieView = {
        let view = DetailMovieView(frame: .zero)
        return view
    }()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        fetchMovieDetail()
        bindUI()
    }
    
    // MARK: - Helper function
    
    private func fetchMovieDetail() {
        guard let detailMovieId = viewModel.movieId else {return}
        viewModel.getDetailMovie(id: detailMovieId)
    }
    
    private func bindUI() {
        viewModel.showDetailMovie = { [weak self] (movie) in
            guard let self = self,
                let url = movie.poster_path,
                let vote = movie.vote_average else {return}
            self.title = movie.title
            self.detailView.detailTitleLabel.text = movie.title
            self.detailView.detailDateLabel.text = movie.release_date
            self.detailView.detailMovieImageView.kf.indicatorType = .activity
            self.detailView.detailMovieImageView.kf.setImage(with: URL(string: "http://image.tmdb.org/t/p/original\(url)"))
            self.detailView.detailDescriptionLabel.text = movie.overview
            self.detailView.rateLabel.text = "\(String(describing: vote))"
        }
    }
}

// MARK: - LayoutUI

private extension DetailMovieViewController {
    
    func initialSetup() {
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(detailView)
        
        detailView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
