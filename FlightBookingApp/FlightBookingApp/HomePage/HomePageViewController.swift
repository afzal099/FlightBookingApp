//
//  HomePageViewController.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 21/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import UIKit

class HomePageViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Search Flight"
        configureData()
    }
    
    @IBAction func searchFlightsAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ShowAirportSearchPage", sender: nil)
    }
    
    private func configureData() {
        self.showLoadingIndicator()
        DispatchQueue.global(qos: .background).async {
            if let error = AirportDataManager.shared.configure() {
                self.displayErrorAlert(error: error)
            }
            DispatchQueue.main.async {
                self.hideLoadingIndicator()
            }
        }
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
