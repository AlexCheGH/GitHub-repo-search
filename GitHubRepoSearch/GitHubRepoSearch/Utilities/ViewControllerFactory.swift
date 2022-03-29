//
//  ViewControllerFactory.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/28/22.
//

import Foundation
import UIKit

struct StoryboardRepresentation {
    let bundle: Bundle?
    let storyboardName: String
    let viewControllerID: String
}


enum TypeOfViewController {
    case main
    case dropDownSearch
    case searchSettings
}

extension TypeOfViewController {
    func storyboardRepresentation() -> StoryboardRepresentation {
        let mainStoryboard = "Main"
        
        switch self {
        case .main:
            return StoryboardRepresentation(bundle: nil, storyboardName: mainStoryboard, viewControllerID: ViewControllerID.main.rawValue)
        case .dropDownSearch:
            return StoryboardRepresentation(bundle: nil, storyboardName: mainStoryboard, viewControllerID: ViewControllerID.dropDownSearch.rawValue)
        case .searchSettings:
            return StoryboardRepresentation(bundle: nil, storyboardName: mainStoryboard, viewControllerID: ViewControllerID.searchSettings.rawValue)
        }
    }
}

class ViewControllerFactory: NSObject {
    static func viewController(for typeOfVC: TypeOfViewController) -> UIViewController {
        let metadata = typeOfVC.storyboardRepresentation()
        let storyboard = UIStoryboard(name: metadata.storyboardName, bundle: metadata.bundle)
        let viewController = storyboard.instantiateViewController(withIdentifier: metadata.viewControllerID)
        
        return viewController
    }
}

fileprivate enum ViewControllerID: String {
    case main = "ViewController"
    case dropDownSearch = "DropDownSearchViewController"
    case searchSettings = "SearchSettingsViewController"
}
