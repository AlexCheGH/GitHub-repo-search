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
