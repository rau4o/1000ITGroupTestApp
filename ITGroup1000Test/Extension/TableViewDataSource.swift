//
//  TableViewDataSource.swift
//  ITGroup1000Test
//
//  Created by rau4o on 9/18/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

// MARK: - extension dequeueCell

extension UITableView {
    func dequeueCell<Cell: UITableViewCell>(withIdentifier identifier: String, for indexPath: IndexPath) -> Cell {
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! Cell
    }
}

final class TableViewDataSource<Model, Cell: UITableViewCell>: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    
    typealias CellConfigurator = (Model, Cell) -> Void
    var models: [Model]
    
    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator
    
    // MARK: - Init
    
    init(models: [Model], reuseIdentifier: String, cellConfigurator: @escaping CellConfigurator) {
        self.models = models
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }
    
    // MARK: - Helper function
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: Cell = tableView.dequeueCell(withIdentifier: reuseIdentifier, for: indexPath)
        let model = models[indexPath.row]
        cell.selectionStyle = .none
        cellConfigurator(model,cell)
        return cell
    }
}

// MARK: - TableViewDataSource

extension TableViewDataSource where Model == MovieModel {
    static func make(for model: [MovieModel], reuseIdentifier: String) -> TableViewDataSource {
        return TableViewDataSource(models: model, reuseIdentifier: reuseIdentifier) { (movie, cell) in
            if let cell = cell as? ListMoviesTableViewCell {
                cell.configureCell(with: movie)
            }
        }
    }
}


