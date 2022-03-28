//
//  Endpoint.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/28/22.
//

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

extension Endpoint {
    static func search(matching query: String,
                       sortedBy sorting: Sorting = .recency) -> Endpoint {
        return Endpoint(
            path: "/search/repositories",
            queryItems: [
                URLQueryItem(name: "q", value: query),
                URLQueryItem(name: "sort", value: sorting.rawValue)
            ]
        )
    }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = path
        components.queryItems = queryItems

        return components.url
    }
}
