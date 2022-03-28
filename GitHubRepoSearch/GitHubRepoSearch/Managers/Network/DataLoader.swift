//
//  DataLoader.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/28/22.
//

import Foundation

class DataLoader {
    func request(_ endpoint: Endpoint, then handler: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let url = endpoint.url else {
            return handler(.failure(NetworkError.urlIsNotValid))
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            let result = data.map(Result.success) ?? .failure(NetworkError.bonk)
            handler(result)
            
        }
        print(url)
        task.resume()
    }
}
