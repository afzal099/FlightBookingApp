//
//  Arrival.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 22/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation
import MapKit

struct Arrival : Codable {
    
    var airportCode: String?
    var scheduledTime: ScheduledTimeLocal?
    private enum CodingKeys: String, CodingKey {
        case airportCode = "AirportCode"
        case scheduledTime = "ScheduledTimeLocal"
    }
    func airportCoordinates() -> CLLocation? {
        let airport = AirportDataManager.shared.filteredAirportWithIATA(airportCode: self.airportCode)
        guard let latitude = airport?.latitude else {
            return nil
        }
        guard let longitude = airport?.longitude else {
            return nil
        }
        return CLLocation(latitude: latitude, longitude: longitude)
    }
}
