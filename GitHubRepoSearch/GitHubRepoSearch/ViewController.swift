//
//  ViewController.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/28/22.
//

import UIKit

class ViewController: UIViewController {

    let networkCall = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        networkCall.findRepositories(matching: "Weather app", sortedBy: .numberOfStars, order: .descending, perPage: 10)
    }


}

