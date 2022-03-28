////
////  Model.swift
////  GitHubRepoSearch
////
////  Created by Aliaksandr Chekushkin on 3/28/22.
////
//
//import Foundation
//
//// MARK: - RepositoryRequest
//class RepositoryRequest: Codable {
//    let totalCount: Int?
//    let incompleteResults: Bool?
//    let items: [Item]?
//
//    enum CodingKeys: String, CodingKey {
//        case totalCount = "total_count"
//        case incompleteResults = "incomplete_results"
//        case items
//    }
//
//    init(totalCount: Int?, incompleteResults: Bool?, items: [Item]?) {
//        self.totalCount = totalCount
//        self.incompleteResults = incompleteResults
//        self.items = items
//    }
//}
//
// //MARK: - Item
//class Item: Codable {
//    let id: Int?
//    let nodeID, name, fullName: String?
//    let itemPrivate: Bool?
//    let owner: Owner?
//    let htmlURL: String?
//    let itemDescription: String?
//    let fork: Bool?
//    let url, forksURL: String?
//    let keysURL, collaboratorsURL: String?
//    let teamsURL, hooksURL: String?
//    let issueEventsURL: String?
//    let eventsURL: String?
//    let assigneesURL, branchesURL: String?
//    let tagsURL: String?
//    let blobsURL, gitTagsURL, gitRefsURL, treesURL: String?
//    let statusesURL: String?
//    let languagesURL, stargazersURL, contributorsURL, subscribersURL: String?
//    let subscriptionURL: String?
//    let commitsURL, gitCommitsURL, commentsURL, issueCommentURL: String?
//    let contentsURL, compareURL: String?
//    let mergesURL: String?
//    let archiveURL: String?
//    let downloadsURL: String?
//    let issuesURL, pullsURL, milestonesURL, notificationsURL: String?
//    let labelsURL, releasesURL: String?
//    let deploymentsURL: String?
//    let createdAt, updatedAt, pushedAt: Date?
//    let gitURL, sshURL: String?
//    let cloneURL: String?
//    let svnURL: String?
//    let homepage: String?
//    let size, stargazersCount, watchersCount: Int?
//    let language: String?
//    let hasIssues, hasProjects, hasDownloads, hasWiki: Bool?
//    let hasPages: Bool?
//    let forksCount: Int?
//    let archived, disabled: Bool?
//    let openIssuesCount: Int?
//    let license: License?
//    let allowForking, isTemplate: Bool?
//    let topics: [String]?
//    let visibility: Visibility?
//    let forks, openIssues, watchers: Int?
//    let defaultBranch: DefaultBranch?
//    let score: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case nodeID = "node_id"
//        case name
//        case fullName = "full_name"
//        case itemPrivate = "private"
//        case owner
//        case htmlURL = "html_url"
//        case itemDescription = "description"
//        case fork, url
//        case forksURL = "forks_url"
//        case keysURL = "keys_url"
//        case collaboratorsURL = "collaborators_url"
//        case teamsURL = "teams_url"
//        case hooksURL = "hooks_url"
//        case issueEventsURL = "issue_events_url"
//        case eventsURL = "events_url"
//        case assigneesURL = "assignees_url"
//        case branchesURL = "branches_url"
//        case tagsURL = "tags_url"
//        case blobsURL = "blobs_url"
//        case gitTagsURL = "git_tags_url"
//        case gitRefsURL = "git_refs_url"
//        case treesURL = "trees_url"
//        case statusesURL = "statuses_url"
//        case languagesURL = "languages_url"
//        case stargazersURL = "stargazers_url"
//        case contributorsURL = "contributors_url"
//        case subscribersURL = "subscribers_url"
//        case subscriptionURL = "subscription_url"
//        case commitsURL = "commits_url"
//        case gitCommitsURL = "git_commits_url"
//        case commentsURL = "comments_url"
//        case issueCommentURL = "issue_comment_url"
//        case contentsURL = "contents_url"
//        case compareURL = "compare_url"
//        case mergesURL = "merges_url"
//        case archiveURL = "archive_url"
//        case downloadsURL = "downloads_url"
//        case issuesURL = "issues_url"
//        case pullsURL = "pulls_url"
//        case milestonesURL = "milestones_url"
//        case notificationsURL = "notifications_url"
//        case labelsURL = "labels_url"
//        case releasesURL = "releases_url"
//        case deploymentsURL = "deployments_url"
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case pushedAt = "pushed_at"
//        case gitURL = "git_url"
//        case sshURL = "ssh_url"
//        case cloneURL = "clone_url"
//        case svnURL = "svn_url"
//        case homepage, size
//        case stargazersCount = "stargazers_count"
//        case watchersCount = "watchers_count"
//        case language
//        case hasIssues = "has_issues"
//        case hasProjects = "has_projects"
//        case hasDownloads = "has_downloads"
//        case hasWiki = "has_wiki"
//        case hasPages = "has_pages"
//        case forksCount = "forks_count"
//        case archived, disabled
//        case openIssuesCount = "open_issues_count"
//        case license
//        case allowForking = "allow_forking"
//        case isTemplate = "is_template"
//        case topics, visibility, forks
//        case openIssues = "open_issues"
//        case watchers
//        case defaultBranch = "default_branch"
//        case score
//    }
//
//    init(id: Int?, nodeID: String?, name: String?, fullName: String?, itemPrivate: Bool?, owner: Owner?, htmlURL: String?, itemDescription: String?, fork: Bool?, url: String?, forksURL: String?, keysURL: String?, collaboratorsURL: String?, teamsURL: String?, hooksURL: String?, issueEventsURL: String?, eventsURL: String?, assigneesURL: String?, branchesURL: String?, tagsURL: String?, blobsURL: String?, gitTagsURL: String?, gitRefsURL: String?, treesURL: String?, statusesURL: String?, languagesURL: String?, stargazersURL: String?, contributorsURL: String?, subscribersURL: String?, subscriptionURL: String?, commitsURL: String?, gitCommitsURL: String?, commentsURL: String?, issueCommentURL: String?, contentsURL: String?, compareURL: String?, mergesURL: String?, archiveURL: String?, downloadsURL: String?, issuesURL: String?, pullsURL: String?, milestonesURL: String?, notificationsURL: String?, labelsURL: String?, releasesURL: String?, deploymentsURL: String?, createdAt: Date?, updatedAt: Date?, pushedAt: Date?, gitURL: String?, sshURL: String?, cloneURL: String?, svnURL: String?, homepage: String?, size: Int?, stargazersCount: Int?, watchersCount: Int?, language: String?, hasIssues: Bool?, hasProjects: Bool?, hasDownloads: Bool?, hasWiki: Bool?, hasPages: Bool?, forksCount: Int?, archived: Bool?, disabled: Bool?, openIssuesCount: Int?, license: License?, allowForking: Bool?, isTemplate: Bool?, topics: [String]?, visibility: Visibility?, forks: Int?, openIssues: Int?, watchers: Int?, defaultBranch: DefaultBranch?, score: Int?) {
//        self.id = id
//        self.nodeID = nodeID
//        self.name = name
//        self.fullName = fullName
//        self.itemPrivate = itemPrivate
//        self.owner = owner
//        self.htmlURL = htmlURL
//        self.itemDescription = itemDescription
//        self.fork = fork
//        self.url = url
//        self.forksURL = forksURL
//        self.keysURL = keysURL
//        self.collaboratorsURL = collaboratorsURL
//        self.teamsURL = teamsURL
//        self.hooksURL = hooksURL
//        self.issueEventsURL = issueEventsURL
//        self.eventsURL = eventsURL
//        self.assigneesURL = assigneesURL
//        self.branchesURL = branchesURL
//        self.tagsURL = tagsURL
//        self.blobsURL = blobsURL
//        self.gitTagsURL = gitTagsURL
//        self.gitRefsURL = gitRefsURL
//        self.treesURL = treesURL
//        self.statusesURL = statusesURL
//        self.languagesURL = languagesURL
//        self.stargazersURL = stargazersURL
//        self.contributorsURL = contributorsURL
//        self.subscribersURL = subscribersURL
//        self.subscriptionURL = subscriptionURL
//        self.commitsURL = commitsURL
//        self.gitCommitsURL = gitCommitsURL
//        self.commentsURL = commentsURL
//        self.issueCommentURL = issueCommentURL
//        self.contentsURL = contentsURL
//        self.compareURL = compareURL
//        self.mergesURL = mergesURL
//        self.archiveURL = archiveURL
//        self.downloadsURL = downloadsURL
//        self.issuesURL = issuesURL
//        self.pullsURL = pullsURL
//        self.milestonesURL = milestonesURL
//        self.notificationsURL = notificationsURL
//        self.labelsURL = labelsURL
//        self.releasesURL = releasesURL
//        self.deploymentsURL = deploymentsURL
//        self.createdAt = createdAt
//        self.updatedAt = updatedAt
//        self.pushedAt = pushedAt
//        self.gitURL = gitURL
//        self.sshURL = sshURL
//        self.cloneURL = cloneURL
//        self.svnURL = svnURL
//        self.homepage = homepage
//        self.size = size
//        self.stargazersCount = stargazersCount
//        self.watchersCount = watchersCount
//        self.language = language
//        self.hasIssues = hasIssues
//        self.hasProjects = hasProjects
//        self.hasDownloads = hasDownloads
//        self.hasWiki = hasWiki
//        self.hasPages = hasPages
//        self.forksCount = forksCount
//        self.archived = archived
//        self.disabled = disabled
//        self.openIssuesCount = openIssuesCount
//        self.license = license
//        self.allowForking = allowForking
//        self.isTemplate = isTemplate
//        self.topics = topics
//        self.visibility = visibility
//        self.forks = forks
//        self.openIssues = openIssues
//        self.watchers = watchers
//        self.defaultBranch = defaultBranch
//        self.score = score
//    }
//}
//
//enum DefaultBranch: String, Codable {
//    case develop = "develop"
//    case ghPages = "gh-pages"
//    case main = "main"
//    case master = "master"
//}
//
//// MARK: - License
//class License: Codable {
//    let key, name, spdxID: String?
//    let url: String?
//    let nodeID: String?
//
//    enum CodingKeys: String, CodingKey {
//        case key, name
//        case spdxID = "spdx_id"
//        case url
//        case nodeID = "node_id"
//    }
//
//    init(key: String?, name: String?, spdxID: String?, url: String?, nodeID: String?) {
//        self.key = key
//        self.name = name
//        self.spdxID = spdxID
//        self.url = url
//        self.nodeID = nodeID
//    }
//}
//
//// MARK: - Owner
//class Owner: Codable {
//    let login: String?
//    let id: Int?
//    let nodeID: String?
//    let avatarURL: String?
//    let gravatarID: String?
//    let url, htmlURL, followersURL: String?
//    let followingURL, gistsURL, starredURL: String?
//    let subscriptionsURL, organizationsURL, reposURL: String?
//    let eventsURL: String?
//    let receivedEventsURL: String?
//    let type: TypeEnum?
//    let siteAdmin: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case login, id
//        case nodeID = "node_id"
//        case avatarURL = "avatar_url"
//        case gravatarID = "gravatar_id"
//        case url
//        case htmlURL = "html_url"
//        case followersURL = "followers_url"
//        case followingURL = "following_url"
//        case gistsURL = "gists_url"
//        case starredURL = "starred_url"
//        case subscriptionsURL = "subscriptions_url"
//        case organizationsURL = "organizations_url"
//        case reposURL = "repos_url"
//        case eventsURL = "events_url"
//        case receivedEventsURL = "received_events_url"
//        case type
//        case siteAdmin = "site_admin"
//    }
//
//    init(login: String?, id: Int?, nodeID: String?, avatarURL: String?, gravatarID: String?, url: String?, htmlURL: String?, followersURL: String?, followingURL: String?, gistsURL: String?, starredURL: String?, subscriptionsURL: String?, organizationsURL: String?, reposURL: String?, eventsURL: String?, receivedEventsURL: String?, type: TypeEnum?, siteAdmin: Bool?) {
//        self.login = login
//        self.id = id
//        self.nodeID = nodeID
//        self.avatarURL = avatarURL
//        self.gravatarID = gravatarID
//        self.url = url
//        self.htmlURL = htmlURL
//        self.followersURL = followersURL
//        self.followingURL = followingURL
//        self.gistsURL = gistsURL
//        self.starredURL = starredURL
//        self.subscriptionsURL = subscriptionsURL
//        self.organizationsURL = organizationsURL
//        self.reposURL = reposURL
//        self.eventsURL = eventsURL
//        self.receivedEventsURL = receivedEventsURL
//        self.type = type
//        self.siteAdmin = siteAdmin
//    }
//}
//
//enum TypeEnum: String, Codable {
//    case organization = "Organization"
//    case user = "User"
//}
//
//enum Visibility: String, Codable {
//    case visibilityPublic = "public"
//}
