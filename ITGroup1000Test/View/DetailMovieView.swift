//
//  DetailMovieView.swift
//  ITGroup1000Test
//
//  Created by rau4o on 9/19/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class DetailMovieView: UIView {
    
    // MARK: - Properties
    
    var favorited: Bool = true
    
    // UI Elements
    
    lazy var detailMovieImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var detailTitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        label.minimumScaleFactor = 0.8
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }()
    
    lazy var detailDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    
    lazy var detailDescriptionLabel: UITextView = {
        let text = UITextView()
        text.isEditable = false
        text.isSelectable = false
        text.font = UIFont.systemFont(ofSize: 20, weight: .light)
        return text
    }()
    
    lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.backgroundColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 25
        label.clipsToBounds = true
        return label
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper function
    
    private func configureUI() {
        [detailMovieImageView, detailTitleLabel, detailDateLabel, detailDescriptionLabel, rateLabel, starButton].forEach {
            addSubview($0)
        }
        
        detailMovieImageView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(300)
        }
        
        detailDateLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(detailMovieImageView.snp.bottom).inset(10)
            make.left.equalTo(detailMovieImageView.snp.left).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        detailTitleLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(detailDateLabel.snp.top).offset(5)
            make.left.equalTo(detailMovieImageView.snp.left).offset(20)
            make.right.equalTo(detailMovieImageView.snp.right).inset(20)
            make.height.equalTo(35)
        }

        detailDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(detailMovieImageView.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(5)
            make.bottom.equalToSuperview()
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
