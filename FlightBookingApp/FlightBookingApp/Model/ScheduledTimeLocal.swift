//
//  ScheduledTimeLocal.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 22/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation

struct ScheduledTimeLocal : Codable {
    var dateTime: String?
    private enum CodingKeys: String, CodingKey {
        case dateTime = "DateTime"
    }
}
