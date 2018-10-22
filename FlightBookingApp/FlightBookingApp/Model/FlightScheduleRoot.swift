//
//  FlightScheduleRoot.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 22/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation

struct FlightScheduleRoot : Codable {
    var scheduleResource: FlightScheduleResponse?
    private enum CodingKeys: String, CodingKey {
        case scheduleResource = "ScheduleResource"
    }
}
