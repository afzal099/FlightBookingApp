//
//  Constants.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 21/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation
import UIKit


enum FBError {
    case InvalidData
    case NoInternet
    case PersistenceError
}

class Constants {
    static let kAirportsDataFileName = "Airports"
    static let kAirportSearchResultCell = "AirportSearchResultCell"
    
    static let kLoadingViewWidth: CGFloat = 100.0
    static let kLoadingViewHeight: CGFloat = 100.0
    
    static let kkAirportSearchResultCellHeight: CGFloat = 51

    
    static let kOkButtonTitle = "Ok"
    static let kNoInternetAlertTitle = "No Internet"
    static let kNoInternetAlertBody = "Please check your Internet connection and try again"
    static let kGenericErrorAlertTitle = "Some Error Occured"
    static let kGenericErrorAlertBody = "Some error occured! Please check back again later"
    static let kPersistenceErrorAlertTitle = "Error loading data"
    static let kPersistenceErrorAlertBody = "Corrupted data detected"
}
