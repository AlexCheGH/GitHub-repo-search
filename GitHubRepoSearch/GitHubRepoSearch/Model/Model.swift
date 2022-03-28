//
//  Model.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/28/22.
//

import Foundation

// MARK: - RepositoryRequest
class RepositoryRequest: Codable {
    
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [Item]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }

    init(totalCount: Int?, incompleteResults: Bool?, items: [Item]) {
        self.totalCount = totalCount
        self.incompleteResults = incompleteResults
        self.items = items
    }
}

// MARK: - Item
class Item: Codable {

    let name: String?
    let htmlURL: String?
    let owner: Owner?


    enum CodingKeys: String, CodingKey {
        case name
        case htmlURL = "html_url"
        case owner
    }

}

class Owner: Codable {

    let author: String?
    let avatarURL: String?

    enum CodingKeys: String, CodingKey {
        case author = "login"
        case avatarURL = "avatar_url"
    }
}
