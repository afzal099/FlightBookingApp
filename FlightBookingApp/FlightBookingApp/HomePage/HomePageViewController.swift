//
//  HomePageViewController.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 21/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import UIKit

class HomePageViewController: BaseViewController {
    
    var inputType = InputViewType.None

    @IBOutlet weak var sourceInput: InputView!
    @IBOutlet weak var destinationInput: InputView!
    @IBOutlet weak var dateInput: InputView!
    
    var flightSchedules: [Schedule]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Search Flight"
        configureData()
        configureInputViews()
    }
    
    // MARK: - Actions
    @IBAction func searchFlightsAction(_ sender: UIButton) {
        self.showLoadingIndicator()
        if let source = self.sourceInput.airport {
            if let destination = self.destinationInput.airport {
                FlightScheduleDataManager.shared.loadFlightSchedule(source: source, destination: destination, date: Date()) { possibleSchedules, possibleError in
                        self.hideLoadingIndicator()
                        if let error = possibleError {
                            self.displayErrorAlert(error: error)
                        }
                        else {
                            if let schedules = possibleSchedules {
                                self.flightSchedules = schedules
                                self.performSegue(withIdentifier: Constants.kFlightScheduleSegue, sender: nil)
                            }
                            else {
                                self.displayAlert(title: Constants.kNoScheduleAlertTitle, body: Constants.kNoScheduleAlertBody)
                            }
                        }
                }
            }
        }
        
    }
    
    @IBAction func swapAction(_ sender: Any) {
        let tempAirport = sourceInput.airport
        sourceInput.airport = destinationInput.airport
        destinationInput.airport = tempAirport
    }
    
    // MARK: - Custom methods
    private func configureData() {
        self.showLoadingIndicator()
        FlightScheduleDataManager.shared.configure() { possibleError in
            DispatchQueue.global(qos: .background).async {
                if AirportDataManager.shared.configure() != nil {
                    if possibleError != nil {
                        self.displayErrorAlert(error: FBError.ConfigError)
                    }
                }
                self.hideLoadingIndicator()
                
            }
        }
    }
    
    
    func configureInputViews() {
        self.sourceInput.type = InputViewType.Source
        self.sourceInput.delegate = self
        
        self.destinationInput.type = InputViewType.Destination
        self.destinationInput.delegate = self
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let searchController = segue.destination as? AirportSearchViewController {
            searchController.delegate = self
            searchController.inputType = self.inputType
        } else if let schedulesController = segue.destination as? FlightScheduleListViewController {
            schedulesController.datasource = self.flightSchedules
        }
    }
 

}

extension HomePageViewController: InputViewDelegate {
    func didSelectInputType(type: InputViewType) {
        self.inputType = type
        self.performSegue(withIdentifier: Constants.kAirportSearchSegue, sender: nil)
    }
}


extension HomePageViewController: AirportSearchViewControllerDelegate {
    func didSelectAirport(airport: Airport, type: InputViewType) {
        switch type {
        case .Source:
            self.sourceInput.airport = airport
        case .Destination:
            self.destinationInput.airport = airport
        default:
            print("Do not do anything")
        }
    }
}
