//
//  FlightScheduleResponse.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 22/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation

struct FlightScheduleResponse : Codable {
    var schedule: [Schedule]?
    private enum CodingKeys: String, CodingKey {
        case schedule = "Schedule"
    }
}
