//
//  Flight.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 22/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation

struct Flight : Codable {
    
    var departure: Departure?
    var arrival: Arrival?
    private enum CodingKeys: String, CodingKey {
        case departure = "Departure"
        case arrival = "Arrival"
    }
    
}
