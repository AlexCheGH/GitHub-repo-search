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
                       sortedBy sorting: Sorting = .recency,
                       order: Order = .descending,
                       perPage: Int = 30,
                       pageNumber: Int = 1) -> Endpoint {
        return Endpoint(
            path: "/search/repositories",
            queryItems: [
                URLQueryItem(name: QueryName.q.rawValue, value: query),
                URLQueryItem(name: QueryName.sort.rawValue, value: sorting.rawValue),
                URLQueryItem(name: QueryName.order.rawValue, value: order.rawValue),
                URLQueryItem(name: QueryName.perPage.rawValue, value: "\(perPage)"),
                URLQueryItem(name: QueryName.page.rawValue, value: "\(pageNumber)")
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

enum QueryName: String {
    case q = "q"
    case sort = "sort"
    case order = "order" //Default: desc; ignored if there's no Sorting
    case perPage = "per_page" // results per page, 30 - default, 100 - max
    case page = "page" // page number to fetch, default: 1
}


enum Sorting: String {
    case numberOfStars = "stars"
    case numberOfForks = "forks"
    case recency = "updated"
    case helpWantedIssues = "help-wanted-issues"
    case bestMatch = "bestmatch"
    
}


enum Order: String {
    case descending = "desc"
    case ascending = "asc"
}
