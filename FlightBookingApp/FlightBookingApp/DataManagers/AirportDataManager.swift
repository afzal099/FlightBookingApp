//
//  AirportDataManager.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 21/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation

class AirportDataManager {
    
    static let shared = AirportDataManager()
    var airports: [Airport]?
    
    func configure() -> FBError? {
        guard let URL = Bundle.main.url(forResource: Constants.kAirportsDataFileName, withExtension: nil) else {
            return FBError.InvalidData
        }
        do {
            let savedAirportsData = try Data.init(contentsOf:  URL)
            self.airports = try JSONDecoder().decode([Airport].self, from: savedAirportsData)
        }
        catch {
            return FBError.InvalidData
        }
        return nil
    }
}
