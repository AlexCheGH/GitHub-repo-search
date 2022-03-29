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
    func needMoreData(currentRow: Int) {
        manager.getMoreEntries()
    }
    
    func onCellTap(title: String) {
        let link = manager.getRepoLink(for: title)
        guard let link = link, let url = URL(string: link) else { return }

        let alert = AlertViewController.externalLinkAlert(url: url)
        navigationController?.present(alert, animated: true, completion: nil)
    }
}

extension DropDownSearchViewController: SearchResultViewDelegate {
    func didSendQuery(query: String) {
        manager.loadModel(matching: query, sortedBy: .bestMatch, order: .descending, perPage: 20, pageNumber: 1)
    }
}
