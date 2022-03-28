//
//  NetworkManager.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/28/22.
//

import Foundation

class NetworkManager {
    
    func findRepositories(matching query: String, sortedBy sorting: Sorting) {
        
        let dataLoader = DataLoader()
        dataLoader.request(.search(matching: query, sortedBy: sorting)) { result in
            
            switch result {
            case .failure(.urlIsNotValid):
                print("Oink!")
            case .failure(.bonk):
                print("Bonk!")
            case .success(let data):
                print(data)
            }
        }
    }
}

enum Sorting: String {
    case numberOfStars = "stars"
    case numberOfForks = "forks"
    case recency = "updated"
}

//Default: desc; ignored if there's no Sorting
enum Order: String {
    case descending = "desc"
    case ascending = "asc"
    
}


enum Result<Value, Error: Swift.Error> {
    case success(Value)
    case failure(Error)
}

enum NetworkError: Error {
    case urlIsNotValid
    case bonk
}
