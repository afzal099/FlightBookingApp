//
//  FlightScheduleListViewController.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 22/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import UIKit

class FlightScheduleListViewController: BaseViewController {

    var datasource: [Schedule]!
    var selectedSchedule: Schedule!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Schedules"
        sortDatasource()
        
    }
    
    // MARK: - Custom

    func sortDatasource() {
        self.datasource.sort(by: { first, second in
            guard let date1 = first.departureTime else {
                return false
            }
            guard let date2 = second.departureTime else {
                return false
            }
            return date1 < date2
        })
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mapController = segue.destination as? MapsViewController {
            mapController.datasource = self.selectedSchedule
        }
    }
 

}

extension FlightScheduleListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kFlightScheduleListCell, for: indexPath) as? FlightScheduleListTableViewCell else {
            fatalError("The dequeued cell is not an instance of ListViewTableViewCell.")
        }
        cell.refreshCell(scheduleModel: self.datasource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.kkAirportSearchResultCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedSchedule = self.datasource[indexPath.row]
        self.performSegue(withIdentifier: Constants.kShowMapPageSegue, sender: nil)
    }
    
}
