//
//  SearchResultsView.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/28/22.
//

import UIKit

protocol SearchResultViewDelegate {
    func didSendQuery(query: String)
}

class SearchResultsView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textFieldView: UITextField!
    
    var cellDelegate: CellDelegate?
    var delegate: SearchResultViewDelegate?
    
    var tableViewHeight: CGFloat = 0
    
    var model: [Item] = []
    
    static func loadViewFromNib() -> SearchResultsView {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: "SearchResultsView", bundle: bundle)
        return nib.instantiate(withOwner: nil, options: nil).first as! SearchResultsView
    }
    
    func configureView() {
        
        tableViewHeight = tableView.bounds.size.height
        
        configureTableView()
        configureTextField()
    }
    
    func refreshView(with model: [Item]) {
        self.model = model
        reloadTableView()
    }
    
    private func reloadTableView() {
        tableView.reloadData()
    }
    
    private func configureTextField() {
        textFieldView.delegate = self
    }
    
    private func configureTableView() {
        
        if !model.isEmpty {
            self.tableView.bounds.size.height = self.tableViewHeight
            
            tableView.delegate = self
            tableView.dataSource = self
            
            tableView.register(CompactTableViewCell.nib(), forCellReuseIdentifier: CompactTableViewCell.identifier)}
        else {
            self.tableView.bounds.size.height = 0
        }
        
    }
    
}

extension SearchResultsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CompactTableViewCell.identifier) as! CompactTableViewCell
        
        let container = model[indexPath.row]
        let title = container.name
        let ownerName = container.owner?.author
        
        cell.configureCell(title: title, ownerName: ownerName)
        cell.delegate = self
        
        return cell
    }
}

extension SearchResultsView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        
        if !text.isEmpty {
            delegate?.didSendQuery(query: text)
            return true
        }
        return false
    }
}


extension SearchResultsView: CellDelegate {
    func onCellTap(title: String) {
        cellDelegate?.onCellTap(title: title)
    }
}
