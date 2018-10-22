//
//  AirportDataManager.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 21/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation

class AirportDataManager: BaseDataManager {
    
    static let shared = AirportDataManager()
    var airports: [Airport]?
    
    // Loads the saved data from archive
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
    
    func filteredAirports(searchKey: String) -> [Airport]? {
        let filteredAirports = self.airports?.filter(){ airport in
            return airport.searchTags().lowercased().contains(searchKey.lowercased())
        }
        return filteredAirports
    }
    
    func filteredAirportWithIATA(airportCode: String?) -> Airport? {
        guard let code = airportCode  else {
            return nil
        }
        let filteredAirports = self.airports?.filter(){ airport in
            return airport.IATA?.lowercased().contains(code.lowercased()) ?? false
        }
        guard let airports = filteredAirports else {
            return nil
        }
        if airports.count > 0 {
            return airports[0]
        }
        return nil
    }
    
}
