//
//  AirportSearchViewController.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 21/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import UIKit

protocol AirportSearchViewControllerDelegate  {
    func didSelectAirport(airport: Airport, type: InputViewType)
}

class AirportSearchViewController: BaseViewController {

    var delegate: AirportSearchViewControllerDelegate?
    let searchController = UISearchController(searchResultsController: nil)
    var filteredAirports: [Airport]?
    var inputType = InputViewType.None
    
    @IBOutlet weak var searchResultTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Search"
        setupSearchController()
    }
    
    //MARK: - Custom
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Airports"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        self.filteredAirports = AirportDataManager.shared.filteredAirports(searchKey: searchText.lowercased())
        searchResultTableView.reloadData()
    }

}

extension AirportSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !self.searchBarIsEmpty() {
            return self.filteredAirports?.count ?? 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kAirportSearchResultCell, for: indexPath) as? AirportSearchResultTableViewCell else {
            fatalError("The dequeued cell is not an instance of ListViewTableViewCell.")
        }
        if let airport = self.filteredAirports?[indexPath.row] {
            cell.refreshCell(airport: airport)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.kkAirportSearchResultCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedAirport = self.filteredAirports?[indexPath.row] else {
            return
        }
        self.delegate?.didSelectAirport(airport: selectedAirport, type: self.inputType)
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension AirportSearchViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let searchText = searchBar.text else {
            return
        }
        filterContentForSearchText(searchText)
    }
}
