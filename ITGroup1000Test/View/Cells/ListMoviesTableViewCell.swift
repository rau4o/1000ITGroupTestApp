//
//  ListMoviesTableViewCell.swift
//  ITGroup1000Test
//
//  Created by rau4o on 9/18/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class ListMoviesTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var favorited: Bool = true
    var actionStarButton: (() -> Void)?
    
    // MARK: - UI Elements
    
    lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.backgroundColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 25
        label.clipsToBounds = true
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        label.addShadowLabel()
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .white
        label.addShadowLabel()
        return label
    }()
    
    lazy var blackView: UIView = {
        let tintView = UIView()
        tintView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return tintView
    }()
    
    lazy var imageMovie: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    lazy var starButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.setImage(UIImage(named: "un_star"), for: .normal)
        button.addTarget(self, action: #selector(handleStar), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        rateLabel.layer.cornerRadius = 25
        backgroundColor = #colorLiteral(red: 0.07843137255, green: 0.1333333333, blue: 0.1843137255, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper function
    
    private func configureUI() {
        [imageMovie, titleLabel, dateLabel, rateLabel, starButton].forEach {
            addSubview($0)
        }
        
        imageMovie.addSubview(blackView)
        
        imageMovie.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(10)
        }
        
        blackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }

        rateLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(20)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        starButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(20)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
    }
    
    func configureCell(with model: MovieModel) {
        guard let vote = model.vote_average else {return}
        titleLabel.text = model.title
        dateLabel.text = model.release_date
        rateLabel.text = "\(vote)"
        if let url = model.poster_path {
            imageMovie.kf.indicatorType = .activity
            imageMovie.kf.setImage(with: URL(string:("http://image.tmdb.org/t/p/original/\(url)")))
        }
    }
    
    // MARK: - @objc func
    
    @objc private func handleStar() {
        self.favorited = !self.favorited
        
        if self.favorited {
            self.starButton.setImage(UIImage(named: "star"), for: .normal)
        } else {
            self.starButton.setImage(UIImage(named: "un_star"), for: .normal)
        }
    }
}
