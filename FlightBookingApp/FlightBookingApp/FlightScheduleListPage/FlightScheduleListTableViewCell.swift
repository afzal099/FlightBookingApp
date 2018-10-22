//
//  FlightScheduleListTableViewCell.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 22/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import UIKit

class FlightScheduleListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var departureTimeLabel: UILabel!
    @IBOutlet weak var arrivalTimeLabel: UILabel!
    @IBOutlet weak var stopsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func refreshCell(scheduleModel: FlightScheduleViewModel) {
        departureTimeLabel.text = scheduleModel.departureTime?.timeRepresentaion()
        arrivalTimeLabel.text = scheduleModel.arrivalTime?.timeRepresentaion()
        stopsLabel.text = scheduleModel.numberOfStopsString
    }
    
    

}
