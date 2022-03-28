//
//  NetworkManager.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/28/22.
//

import Foundation

class NetworkManager {
    func findRepositories(matching query: String,
                          sortedBy sorting: Sorting,
                          order: Order,
                          perPage: Int = 10,
                          pageNumber:
                          Int = 1,
                          completion: @escaping (RepositoryRequest?) -> Void ) {
        
        let dataLoader = DataLoader()
        let endpoint = Endpoint.search(matching: query, sortedBy: sorting, order: order, perPage: perPage, pageNumber: pageNumber)
        
        dataLoader.request(endpoint) { result in
            
            switch result {
            case .failure(.urlIsNotValid):
                print("URL is not valid. Check the URL.")
            case .success(let data):
                let result = self.decode(data)
                completion(result)
            case .failure(.wrongMap):
                print("An error occured when trying to map the result.")
            }
        }
    }
    
    private func decode(_ data: Data) -> RepositoryRequest? {
        let decoder = JSONDecoder()
        let result = try? decoder.decode(RepositoryRequest.self, from: data)
        
        return result
    }
}

enum Result<Value, Error: Swift.Error> {
    case success(Value)
    case failure(Error)
}

enum NetworkError: Error {
    case urlIsNotValid
    case wrongMap
}
