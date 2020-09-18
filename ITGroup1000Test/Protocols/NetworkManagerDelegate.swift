//
//  NetworkManagerDelegate.swift
//  ITGroup1000Test
//
//  Created by rau4o on 9/18/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Foundation

protocol NetworkManagerDelegate {
    func fetchGenericJSONData<T: Decodable>(target: WebService, response: @escaping(T) -> Void)
}

protocol MovieViewModelDelegate: AnyObject {
    func reloadTableView()
}

