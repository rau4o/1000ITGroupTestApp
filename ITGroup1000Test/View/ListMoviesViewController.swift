//
//  ListMoviesViewController.swift
//  ITGroup1000Test
//
//  Created by rau4o on 9/18/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

private let cellId = "cellId"
private let heightCell: CGFloat = 350

class ListMoviesViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel = ListMovieViewModel()
    
    // MARK: - UI Elements
    
    private lazy var refresher: UIRefreshControl = {
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return rc
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ListMoviesTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.backgroundColor = #colorLiteral(red: 0.07843137255, green: 0.1333333333, blue: 0.1843137255, alpha: 1)
        return tableView
    }()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        bindUI()
    }
    
    // MARK: - Helper function
    
    private func bindUI() {
        viewModel.delegate = self
        viewModel.getMovieData(pages: 10) { [weak self] in
            guard let self = self else {return}
            self.tableView.dataSource = self.viewModel.dataSource
            self.tableView.reloadData()
            self.refresher.endRefreshing()
        }
    }
    
    // MARK: - @objc method
    
    @objc private func refreshData() {
        bindUI()
    }
}

// MARK: - MovieViewModelDelegate

extension ListMoviesViewController: MovieViewModelDelegate {
    func reloadTableView() {
        tableView.reloadData()
    }
}

// MARK: - LayoutUI

private extension ListMoviesViewController {
    func initialSetup() {
        configureUI()
        configureNavigationBar()
        view.backgroundColor = #colorLiteral(red: 0.07843137255, green: 0.1333333333, blue: 0.1843137255, alpha: 1)
    }
    
    private func configureUI() {
        view.addSubview(tableView)
        tableView.addSubview(refresher)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func configureNavigationBar() {
        title = "News"
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.07843137255, green: 0.1333333333, blue: 0.1843137255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}

// MARK: - UITableViewDelegate

extension ListMoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = DetailMovieViewController()
        self.navigationController?.pushViewController(detailController, animated: true)
        let movieIndexPath = viewModel.getMovieId(at: indexPath.row)
        detailController.viewModel.movieId = movieIndexPath.id
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightCell
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y > scrollView.contentSize.height * 0.95 {
            bindUI()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        var pagesCount = 0

        if offsetY > contentHeight - scrollView.frame.size.height {

            pagesCount += 1
            
            viewModel.getMovieData(pages: pagesCount) { [weak self] in
                guard let self = self else {return}
                self.tableView.dataSource = self.viewModel.dataSource
                self.tableView.reloadData()
                self.refresher.endRefreshing()
            }
        }
    }
}
