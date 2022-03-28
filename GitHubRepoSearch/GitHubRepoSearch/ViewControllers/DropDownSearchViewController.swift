//
//  DropDownSearchViewController.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/28/22.
//

import UIKit
import Combine

class DropDownSearchViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    let searchView = SearchResultsView.loadViewFromNib()
    let manager = RepositoryManager()
    var subscriber: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchView()
        configureSubscriber()
    }
    
    
    private func configureSubscriber() {
        subscriber = manager.modelPublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: { model in
                guard let model = model, let items = model.items else { return }
                self.searchView.refreshView(with: items)
            })
    }
    
    private func configureSearchView() {
        searchView.configureView()
        
        searchView.frame.size = containerView.frame.size
        containerView.addSubview(searchView)
        
        searchView.cellDelegate = self
        searchView.delegate = self
    }
}

extension DropDownSearchViewController: CellDelegate {
    func onCellTap(title: String) {
        
    }
}

extension DropDownSearchViewController: SearchResultViewDelegate {
    func didSendQuery(query: String) {
        manager.refreshModel(matching: query, sortedBy: .bestMatch, order: .descending, perPage: 30, pageNumber: 1)
    }
}
