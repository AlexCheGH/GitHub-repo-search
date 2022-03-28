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
    
    
    let manager = RepositoryManager(matching: "Weather", sortedBy: .numberOfStars, order: .descending, perPage: 10, pageNumber: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        configureButtons()
    }
    
    
    private func configureButtons() {
        let localization = Localization.Buttons.self
        
        let buttons = [dropDownMenuSearch, fullScreenSearch]
        let localizations = [localization.dropDownMenu, localization.fullScreenSearch]
        
        for index in 0..<buttons.count {
            buttons[index]?.setTitle(localizations[index], for: .normal)
            buttons[index]?.backgroundColor = .black
            buttons[index]?.layer.cornerRadius = 5
        }
    }
    
    @IBAction func onButtonTap(_ sender: UIButton) {
        
        var viewController = UIViewController()
        
        switch sender {
        case dropDownMenuSearch:
            viewController = ViewControllerFactory.viewController(for: .dropDownSearch)
        case fullScreenSearch:
            viewController = ViewControllerFactory.viewController(for: .fullScreenSearch)
        default:
            return
        }
        
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }
}

