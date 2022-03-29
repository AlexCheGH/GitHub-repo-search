//
//  Localization.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/28/22.
//

import Foundation

struct Localization {
    
    struct Label {
        static let github = NSLocalizedString("git_hub", comment: "")
        static let search = NSLocalizedString("search", comment: "")
        static let alert = NSLocalizedString("Alert", comment: "")
        
        static let orderBy = NSLocalizedString("order_by", comment: "")
        static let sortBy = NSLocalizedString("sort_by", comment: "")
        static let resultPerPage = NSLocalizedString("results_per_page", comment: "")
        static let stars = NSLocalizedString("stars", comment: "")
        static let forks = NSLocalizedString("forks", comment: "")
        static let updates = NSLocalizedString("updates", comment: "")
        static let helpWanted = NSLocalizedString("help_wanted_issues", comment: "")
        static let bestMatch = NSLocalizedString("best_match", comment: "")
        static let descending = NSLocalizedString("desc", comment: "")
        static let ascending = NSLocalizedString("asc", comment: "")
        
    }
    
    struct Buttons {
        static let dropDownMenu = NSLocalizedString("drop_down_menu_button", comment: "")
        static let exitButton = NSLocalizedString("exit_button", comment: "")
        static let open = NSLocalizedString("open", comment: "")
        static let cancel = NSLocalizedString("cancel", comment: "")
    }
    
    struct AlertPrompt {
        static let externalLink = NSLocalizedString("external_link_prompt", comment: "")
    }
    
}
