//
//  UserDefaultsManager.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/29/22.
//

import Foundation


enum UserDefaultsKeys: String {
    case sortingBy = "sortingBy"
    case orderBy = "orderBy"
    case resultsPerPage = "resultsPerPage"
}

enum SortByPreference: Int {
    case forks = 0
    case bestMatch
    case stars
    case updates
}

enum OrderByPreference: Int {
    case desc = 0
    case acs
}

struct UserPreferences {
    
    
    var sortBy: Int {
        let key = UserDefaultsKeys.sortingBy.rawValue
        return UserDefaults().integer(forKey: key)
    }
    
    var orderBy: Int {
        let key = UserDefaultsKeys.orderBy.rawValue
        return UserDefaults().integer(forKey: key)
    }
    
    var resultsPerPage: Int {
        let key = UserDefaultsKeys.resultsPerPage.rawValue
        let value = UserDefaults().integer(forKey: key)
        
        if value == 0 { return 10 }
        else { return value }
        
    }
    
    func updateSortBy(value: Int) {
        let key = UserDefaultsKeys.sortingBy.rawValue
        UserDefaults().set(value, forKey: key)
    }
    
    func updateOrderBy(value: Int) {
        let key = UserDefaultsKeys.orderBy.rawValue
        UserDefaults().set(value, forKey: key)
    }
    
    func updateResultsPerPage(value: Int) {
        let key = UserDefaultsKeys.resultsPerPage.rawValue
        UserDefaults().set(value, forKey: key)
    }
}
