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
    private var userPreference = UserPreferences()
    private var networkManager = NetworkManager()
    
    private var matching: String?// needs for additional data uploads
    private var pageNumber = 1 // needs for additional data uploads
    
   
    
    var modelPublisher: AnyPublisher <RepositoryRequest?, Never> {
        return $model.map{ $0 }
        .eraseToAnyPublisher()
    }
    
    func loadModel(matching: String, pageNumber: Int) {
        self.matching = matching
        self.pageNumber = pageNumber
        self.pageNumber += 1
        
        self.userPreference = UserPreferences() //applies any changes to prefs
        let sortBy = userPreference.sortBy
        let order = userPreference.orderBy
        let perPage = userPreference.resultsPerPage
        
        
        networkManager.findRepositories(matching: matching, sortedBy: Sorting.allCases[sortBy], order: Order.allCases[order], perPage: perPage, pageNumber: pageNumber) {
            value in
            self.model = value
        }
    }
    
    func getMoreEntries() {
        guard let matching = matching else { return }
        
        self.userPreference = UserPreferences() //applies any changes to prefs
        let sortBy = userPreference.sortBy
        let order = userPreference.orderBy
        
        networkManager.findRepositories(matching: matching, sortedBy: Sorting.allCases[sortBy], order: Order.allCases[order], pageNumber: self.pageNumber) { value in
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
