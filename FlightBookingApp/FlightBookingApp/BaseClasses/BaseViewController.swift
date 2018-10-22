//
//  BaseViewController.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 21/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import UIKit
import Lottie


class BaseViewController: UIViewController {

    var loadingView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLoadingView()
    }
    
    private func configureLoadingView() {
        self.loadingView.frame = CGRect(x: UIScreen.main.bounds.size.width/2 - Constants.kLoadingViewWidth/2, y: UIScreen.main.bounds.size.height/2 - Constants.kLoadingViewHeight/2, width: Constants.kLoadingViewWidth, height: Constants.kLoadingViewHeight)
        self.loadingView.layer.borderWidth = 0.5
        self.loadingView.layer.borderColor = UIColor.black.cgColor
        let animationView = LOTAnimationView(name: "Plane")
        self.loadingView.addSubview(animationView)
        animationView.autoReverseAnimation = false
        animationView.loopAnimation = true
        animationView.play()
        animationView.frame = CGRect(x: 0, y: 0, width: Constants.kLoadingViewWidth, height: Constants.kLoadingViewHeight)
        self.loadingView.backgroundColor = UIColor.white
        self.loadingView.layer.cornerRadius = 20.0
        self.view.addSubview(loadingView)
        self.hideLoadingIndicator()
    }
    
    func showLoadingIndicator() {
        DispatchQueue.main.async {
            self.loadingView.isHidden = false
        }
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.async {
            self.loadingView.isHidden = true
        }
    }
    
    func displayErrorAlert(error: FBError) {
        DispatchQueue.main.async {
            var alertTitle = ""
            var alertBody = ""
            switch error {
            case .NoInternet:
                alertTitle = Constants.kNoInternetAlertTitle
                alertBody = Constants.kNoInternetAlertBody
            case .ConfigError:
                alertTitle = Constants.kConfigErrorAlertTitle
                alertBody = Constants.kConfigErrorAlertBody
            default:
                alertTitle = Constants.kGenericErrorAlertTitle
                alertBody = Constants.kGenericErrorAlertBody
            }
            
            self.displayAlert(title: alertTitle, body: alertBody)
        }
    }
    
    func displayAlert(title: String, body: String) {
        let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.kOkButtonTitle, style: .default, handler: nil))
        self.present(alert, animated: true)
    }

}
