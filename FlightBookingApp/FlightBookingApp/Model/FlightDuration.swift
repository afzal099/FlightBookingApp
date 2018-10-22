//
//  FlightDuration.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 22/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation

class FlightDuration : Codable {
    var duration: String?
    private enum CodingKeys: String, CodingKey {
        case duration = "Duration"
    }
}
