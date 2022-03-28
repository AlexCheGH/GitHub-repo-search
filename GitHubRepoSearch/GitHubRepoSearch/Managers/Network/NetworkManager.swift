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
                          perPage: Int = 30,
                          pageNumber: Int = 1) {
        
        let dataLoader = DataLoader()
        dataLoader.request(.search(matching: query,
                                   sortedBy: sorting,
                                   order: order,
                                   perPage: perPage,
                                   pageNumber: pageNumber)) { result in
            
            switch result {
            case .failure(.urlIsNotValid):
                print("Oink!")
            case .failure(.bonk):
                print("Bonk!")
            case .success(let data):
                
                let decoder = JSONDecoder()
                let search = try? decoder.decode(RepositoryRequest.self, from: data)
                
                
                
            }
        }
    }
}

enum Result<Value, Error: Swift.Error> {
    case success(Value)
    case failure(Error)
}

enum NetworkError: Error {
    case urlIsNotValid
    case bonk
}
