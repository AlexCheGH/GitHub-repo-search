//
//  RepositoryManager.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/28/22.
//

import Foundation

class RepositoryManager {
    
    var model: RepositoryRequest?
    
    private var networkManager = NetworkManager()
    
    init(matching: String, sortedBy: Sorting, order: Order, perPage: Int, pageNumber: Int) {
        networkManager.findRepositories(matching: matching, sortedBy: sortedBy, order: order, perPage: perPage, pageNumber: pageNumber) {
            value in
            self.model = value
            print(self.model)
        }
    }
    
}
