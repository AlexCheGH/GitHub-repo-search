//
//  ViewController.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/28/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var dropDownMenuSearch: UIButton!
    @IBOutlet weak var fullScreenSearch: UIButton!
    @IBOutlet weak var clutteredSpaceSearch: UIButton!
    
    
    let manager = RepositoryManager(matching: "Weather", sortedBy: .numberOfStars, order: .descending, perPage: 10, pageNumber: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButtons()
    }
    
    
    private func configureButtons() {
        let localization = Localization.Buttons.self
        
        let buttons = [dropDownMenuSearch, fullScreenSearch, clutteredSpaceSearch]
        let localizations = [localization.dropDownMenu, localization.fullScreenSearch, localization.clutteredScreenSearch]
        
        for index in 0..<buttons.count {
            buttons[index]?.setTitle(localizations[index], for: .normal)
            buttons[index]?.backgroundColor = .black
            buttons[index]?.layer.cornerRadius = 5
        }
    }
    
    @IBAction func onButtonTap(_ sender: UIButton) {
        
        switch sender {
        case dropDownMenuSearch:
            print("dropDownMenuSearch")
        case fullScreenSearch:
            print("fullScreenSearch")
        case clutteredSpaceSearch:
            print("clutteredSpaceSearch")
        default:
            return
        }
    }
}

