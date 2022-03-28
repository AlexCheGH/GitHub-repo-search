//
//  ViewController.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/28/22.
//

import UIKit

class ViewController: UIViewController {

    let manager = RepositoryManager(matching: "Weather", sortedBy: .numberOfStars, order: .descending, perPage: 10, pageNumber: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

