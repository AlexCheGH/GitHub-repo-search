//
//  FullScreenSearchViewController.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/28/22.
//

import UIKit

class FullScreenSearchViewController: UIViewController {

    let searchView = SearchResultsView.loadViewFromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        searchView.configureView()
        searchView.backgroundColor = .blue
        
        searchView.frame.size = view.frame.size
        view.addSubview(searchView)
        
        
        searchView.cellDelegate = self
        searchView.delegate = self
        
    }
    
}

extension FullScreenSearchViewController: CellDelegate {
    func onCellTap(title: String) {
        print(title)
    }
}

extension FullScreenSearchViewController: SearchResultViewDelegate {
    func didSendQuery(query: String) {
        
    }
}
