//
//  FlightScheduleViewModel.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 22/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation

protocol FlightScheduleViewModel {
    var departureTime: Date? { get }
    var arrivalTime: Date? { get }
    var numberOfStopsString: String? { get }
}
