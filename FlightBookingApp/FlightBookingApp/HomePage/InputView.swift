//
//  InputView.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 21/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import UIKit

protocol InputViewDelegate {
    func didSelectInputType(type: InputViewType)
}

class InputView: UIView {

    @IBOutlet weak var inputTextField: UITextField!
    var type = InputViewType.None
    var delegate: InputViewDelegate?
    
    @IBAction func inputButtonAction(_ sender: UIButton) {
        self.delegate?.didSelectInputType(type: self.type)
    }
    
    var airport: Airport? {
        didSet {
            self.inputTextField.text = airport?.IATA
        }
    }

    
}
