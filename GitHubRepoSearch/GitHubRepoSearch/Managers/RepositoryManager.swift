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
    
    //Need the values for infinite scroll
    private var matching: String?
    private var sortedBy: Sorting = .bestMatch
    private var order: Order = .descending
    private let perpage = 30
    private var pageNumber = 1
    
    
    var modelPublisher: AnyPublisher <RepositoryRequest?, Never> {
        return $model.map{ $0 }
        .eraseToAnyPublisher()
    }
    
    func loadModel(matching: String, sortedBy: Sorting, order: Order, perPage: Int, pageNumber: Int) {
        
        self.matching = matching
        self.sortedBy = sortedBy
        self.order = order
        self.pageNumber = pageNumber
        self.pageNumber += 1
        
        networkManager.findRepositories(matching: matching, sortedBy: sortedBy, order: order, perPage: perPage, pageNumber: pageNumber) {
            value in
            self.model = value
        }
    }
    
    func getMoreEntries() {
        guard let matching = matching else { return }
        
        networkManager.findRepositories(matching: matching, sortedBy: self.sortedBy, order: self.order) { value in
            value?.items?.forEach{ self.model?.items?.append($0)
            }
            self.model = self.model
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
