//
//  DateExtension.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 22/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation

extension Date {
    
    func scheduleStringRepresentation() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.kAPIInputDateTimeFormat
        return dateFormatter.string(from: self)
    }
    
    func timeRepresentaion() -> String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        let minutes = calendar.component(.minute, from: self)
        return "\(hour < 10 ? "0" : "")\(hour):\(minutes < 10 ? "0" : "")\(minutes)"
    }
    
}
