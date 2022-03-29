//
//  SearchSettingsViewController.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/29/22.
//

import UIKit

class SearchSettingsViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    private let searchView = SearchSettingsView.loadViewFromNib()
    private let userPreferences = UserPreferences()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchView.frame.size = containerView.frame.size
        containerView.addSubview(searchView)
        searchView.configureViews(sortingSegmentValue: userPreferences.sortBy,
                                  orderSegmentValue: userPreferences.orderBy,
                                  sliderValue: userPreferences.resultsPerPage)
        
        searchView.delegate = self
    }

}

extension SearchSettingsViewController: SearchSettingsViewDelegate {
    func sortingChanged(value: Int) {
        userPreferences.updateSortBy(value: value)
    }
    
    func orderChanged(value: Int) {
        userPreferences.updateOrderBy(value: value)
    }
    
    func sliderChanged(value: Int) {
        userPreferences.updateResultsPerPage(value: value)
    }
}
