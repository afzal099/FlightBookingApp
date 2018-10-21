//
//  AirportSearchViewController.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 21/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import UIKit

class AirportSearchViewController: BaseViewController {

    let searchController = UISearchController(searchResultsController: nil)
    var filteredAirports: [Airport]?
    @IBOutlet weak var searchResultTableView: UITableView!
    
    private func setupSearchController() {
        
        // Setup the Search Controller
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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Search"
        setupSearchController()
    }
    
    func filterContentForSearchText(_ searchText: String) {
        self.filteredAirports = AirportDataManager.shared.airports?.filter({( airport : Airport) -> Bool in
            return airport.searchTags().lowercased().contains(searchText.lowercased())
        })
        searchResultTableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
