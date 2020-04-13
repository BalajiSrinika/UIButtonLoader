//
//  LoadingButton.swift
//  UIButtonActivityIndicator
//
//  Created by Sabari on 08/04/20.
//  Copyright © 2020 Sabari. All rights reserved.
//

import Foundation
import UIKit


class LoadingButton: UIButton {
    
    var originalButtonText: String?
    var activityIndicator: UIActivityIndicatorView!
    
    func showLoading(_ X:CGFloat?,_ Y:CGFloat?) {
        originalButtonText = self.titleLabel?.text
        self.setTitle("", for: UIControl.State.normal)
        
        if (activityIndicator == nil) {
            activityIndicator = createActivityIndicator()
        }
        let transfrom = CGAffineTransform.init(scaleX: X ?? 1, y: Y ?? 1)
        activityIndicator.transform = transfrom
        showSpinning()
    }
    
    func hideLoading() {
        self.setTitle(originalButtonText, for: UIControl.State.normal)
        activityIndicator.stopAnimating()
    }
    
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.white
        return activityIndicator
    }
    
    private func showSpinning() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activityIndicator)
        centerActivityIndicatorInButton()
        activityIndicator.startAnimating()
    }
    
    private func centerActivityIndicatorInButton() {
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        self.addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
        
    }
    
    func changeIndicatorSize(X:CGFloat,Y:CGFloat){
        let transfrom = CGAffineTransform.init(scaleX: X, y: Y)
        activityIndicator?.transform = transfrom
    }
    
}
