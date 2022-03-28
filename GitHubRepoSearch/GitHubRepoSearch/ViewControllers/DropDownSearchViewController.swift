//
//  DropDownSearchViewController.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/28/22.
//

import UIKit

class DropDownSearchViewController: UIViewController {
    
    @IBOutlet weak var popButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       configureButton()
    }
    
    private func configureButton() {
        popButton.setTitle(Localization.Buttons.exitButton, for: .normal)
    }
    
    @IBAction func onButtonTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
