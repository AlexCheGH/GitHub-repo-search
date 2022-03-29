//
//  SearchSettingsView.swift
//  GitHubRepoSearch
//
//  Created by Aliaksandr Chekushkin on 3/29/22.
//

import UIKit


protocol SearchSettingsViewDelegate {
    func sortingChanged(value: Int)
    func orderChanged(value: Int)
    func sliderChanged(value: Int)
}

class SearchSettingsView: UIView {
    
    @IBOutlet weak var sortByTitle: UILabel!
    @IBOutlet weak var orderByTitle: UILabel!
    @IBOutlet weak var resultsPerPagetTitle: UILabel!
    @IBOutlet weak var currentSliderValue: UILabel!
    
    @IBOutlet weak var minResultsTitle: UILabel!
    @IBOutlet weak var maxResultsTitle: UILabel!
    @IBOutlet weak var resultsPerPageSlider: UISlider!
    
    @IBOutlet weak var sortingSegmentControl: UISegmentedControl!
    @IBOutlet weak var orderSortingControl: UISegmentedControl!
    
    var delegate: SearchSettingsViewDelegate?
    
    private let localization = Localization.Label.self
    
    private let minSliderValue: Float = 10
    private let maxSliderValue: Float = 100
    
    static func loadViewFromNib() -> SearchSettingsView {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: "SearchSettingsView", bundle: bundle)
        return nib.instantiate(withOwner: nil, options: nil).first as! SearchSettingsView
    }
    
    func configureViews(sortingSegmentValue: Int, orderSegmentValue: Int, sliderValue: Int) {        
        configureSegmentControls(sortingSelected: sortingSegmentValue,
                                 orderSelected: orderSegmentValue)
        configureResultsPerPageSlider(sliderValue: sliderValue)
        
        //needs to be at the bottom to correctly display the titles and values
        configureTitles()
    }
    
    private func configureTitles() {
        
        let localizations = [localization.sortBy, localization.orderBy, localization.resultPerPage]
        let labels = [sortByTitle, orderByTitle, resultsPerPagetTitle]
        
        for index in 0..<labels.count {
            labels[index]?.text = localizations[index]
        }
        
        minResultsTitle.text = String(format: "%.0f", minSliderValue)
        maxResultsTitle.text = String(format: "%.0f", maxSliderValue)
        currentSliderValue.text = String(format: "%.0f", resultsPerPageSlider.value)
    }
    
    private func configureSegmentControls(sortingSelected: Int, orderSelected: Int) {
        let sortSegmentLocs = [localization.forks, localization.bestMatch, localization.stars, localization.updates]
        
        sortingSegmentControl.removeAllSegments()
        orderSortingControl.removeAllSegments()
        
        for index in 0..<sortSegmentLocs.count {
            sortingSegmentControl.insertSegment(with: nil, at: index, animated: true)
            sortingSegmentControl.setTitle(sortSegmentLocs[index], forSegmentAt: index)
        }
        
        sortingSegmentControl.selectedSegmentIndex = sortingSelected
        
        
        let orderSegmentLocs = [localization.descending, localization.ascending]
        
        for index in 0..<orderSegmentLocs.count {
            orderSortingControl.insertSegment(with: nil, at: index, animated: true)
            orderSortingControl.setTitle(orderSegmentLocs[index], forSegmentAt: index)
        }
        
        orderSortingControl.selectedSegmentIndex = orderSelected
        
    }
    
    private func configureResultsPerPageSlider(sliderValue: Int) {
        resultsPerPageSlider.minimumValue = minSliderValue
        resultsPerPageSlider.maximumValue = maxSliderValue
        
        resultsPerPageSlider.value = Float(sliderValue)
    }
    
    
    
    @IBAction func onSegmentControlTap(_ sender: UISegmentedControl) {
        switch sender {
        case sortingSegmentControl:
            delegate?.sortingChanged(value: sender.selectedSegmentIndex)
        case orderSortingControl:
            delegate?.orderChanged(value: sender.selectedSegmentIndex)
        default:
            print("Error with segment control")
        }
    }
    
    @IBAction func onResultsPerPageSlider(_ sender: UISlider) {
        let value = Int(sender.value)
        delegate?.sliderChanged(value: value)
        
        currentSliderValue.text = String(format: "%.0f", resultsPerPageSlider.value)
    }
    

}
