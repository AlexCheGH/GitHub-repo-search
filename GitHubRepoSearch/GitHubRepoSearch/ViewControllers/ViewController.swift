//
//  ViewController.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/28/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var dropDownMenuSearch: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        configureButton()
    }
    
    
    private func configureButton() {
        let localization = Localization.Buttons.self
        dropDownMenuSearch.setTitle(localization.dropDownMenu, for: .normal)
        dropDownMenuSearch.backgroundColor = .black
        dropDownMenuSearch.layer.cornerRadius = 5
    }
    
    @IBAction func onButtonTap(_ sender: UIButton) {
        
        var viewController = UIViewController()
        //switch statement for future button additions
        switch sender {
        case dropDownMenuSearch:
            viewController = ViewControllerFactory.viewController(for: .dropDownSearch)
        default:
            return
        }
        
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }
}

