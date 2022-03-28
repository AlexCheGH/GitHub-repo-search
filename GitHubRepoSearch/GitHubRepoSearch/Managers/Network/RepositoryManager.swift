//
//  RepositoryManager.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/28/22.
//

import Foundation
import Combine

class RepositoryManager {
    
    @Published private var model: RepositoryRequest?
    
    private var networkManager = NetworkManager()
    
    
    var modelPublisher: AnyPublisher <RepositoryRequest?, Never> {
        return $model.map{ $0 }
        .eraseToAnyPublisher()
    }

    func refreshModel(matching: String, sortedBy: Sorting, order: Order, perPage: Int, pageNumber: Int) {
        networkManager.findRepositories(matching: matching, sortedBy: sortedBy, order: order, perPage: perPage, pageNumber: pageNumber) {
            value in
            self.model = value
        }
    }
    
    func getRepoLink(for repoTitle: String?) -> String? {
        let link = model?.items?.reduce(into: "") {
            if $1.name == repoTitle {
                $0 = $1.htmlURL
            }
        }
        return link
    }
    
}
