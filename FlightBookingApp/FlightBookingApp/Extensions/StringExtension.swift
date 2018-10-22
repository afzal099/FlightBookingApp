//
//  StringExtension.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 22/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation

extension String {
    
    func scheduleTime() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.kScheduleDateTimeFormat
        let date = dateFormatter.date(from: self)
        return date
    }
    
}
