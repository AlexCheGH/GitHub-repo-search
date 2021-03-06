//
//  SearchResultsView.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/28/22.
//

import UIKit

protocol SearchResultViewDelegate {
    func didSendQuery(query: String)
    func settingsButtonTapped()
}

class SearchResultsView: UIView {
    
    @IBOutlet weak var buttonBottomConstr: NSLayoutConstraint!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textFieldView: UITextField!
    @IBOutlet weak var settingsButton: UIButton!
    
    var cellDelegate: CellDelegate?
    var delegate: SearchResultViewDelegate?
    private var tableViewContrHeight: CGFloat = 0
    private var model: [Item] = []
    
    static func loadViewFromNib() -> SearchResultsView {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: "SearchResultsView", bundle: bundle)
        return nib.instantiate(withOwner: nil, options: nil).first as! SearchResultsView
    }
    
    func configureView() {
        settingsButton.setTitle("", for: .normal)
        addKeyboardObservers()
        configureTableView()
        configureTextField()
    }
    
    
    @IBAction func onSettingsButtonTap(_ sender: UIButton) {
        delegate?.settingsButtonTapped()
    }
    
    
    //keyboard content shifts handling
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if buttonBottomConstr.constant == 0 {
                buttonBottomConstr.constant = keyboardSize.height
                tableViewContrHeight = keyboardSize.height
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        if buttonBottomConstr.constant != 0 {
            buttonBottomConstr.constant = 0
            self.tableViewContrHeight = 0
            
        }
    }
    
    //table view refresh handling. Once new data is recieved - refresh table view
    func refreshView(with model: [Item]) {
        self.model = model
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        configureTableView()
    }
    
    private func configureTextField() {
        textFieldView.delegate = self
    }
    
    private func configureTableView() {
        
        if !model.isEmpty {
            tableView.delegate = self
            tableView.dataSource = self
            
            tableView.register(CompactTableViewCell.nib(), forCellReuseIdentifier: CompactTableViewCell.identifier)
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                self.buttonBottomConstr.constant = self.tableViewContrHeight
                self.layoutIfNeeded()
            }
        }
        
        if model.isEmpty {
            self.buttonBottomConstr.constant = 1000
            self.layoutIfNeeded()
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
        
        if indexPath.row == model.count - 5 {
            cellDelegate?.needMoreData(currentRow: indexPath.row)
        }
        
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
    func needMoreData(currentRow: Int) {
        cellDelegate?.needMoreData(currentRow: currentRow)
    }
    
    func onCellTap(title: String) {
        cellDelegate?.onCellTap(title: title)
    }
}
