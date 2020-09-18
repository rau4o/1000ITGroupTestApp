//
//  NetworkManager.swift
//  ITGroup1000Test
//
//  Created by rau4o on 9/18/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Moya

class NetworkManager: NetworkManagerDelegate {
    
    private let provider = MoyaProvider<WebService>()
    
    func fetchGenericJSONData<T>(target: WebService, response: @escaping (T) -> Void) where T : Decodable {
        provider.request(target) { (result) in
            switch result {
            case .success(let callBack):
                guard let decode = self.decodeJSON(type: T.self, from: callBack.data) else {return}
                response(decode)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data) -> T? {
        do {
            let decoderJSON = JSONDecoder()
            let jsonData = try decoderJSON.decode(type.self, from: from)
            return jsonData
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}
