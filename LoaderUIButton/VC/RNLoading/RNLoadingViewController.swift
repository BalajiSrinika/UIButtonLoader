//
//  RNLoadingViewController.swift
//  LoaderUIButton
//
//  Created by Sabari on 11/04/20.
//  Copyright © 2020 Sabari. All rights reserved.
//

import UIKit

class RNLoadingViewController: UIViewController {
    
    @IBOutlet var btn1:RNLoadingButton!
    @IBOutlet var btn2:RNLoadingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        // Configure State
        let disabledColor = UIColor(white: 0.673, alpha: 1.0)
        
        btn1.hideTextWhenLoading = false
        btn1.isLoading = false
        btn1.activityIndicatorAlignment = RNActivityIndicatorAlignment.right
        btn1.activityIndicatorEdgeInsets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 10)
        btn1.setTitleColor(disabledColor, for: .disabled)
        
        // create the attributed string
        let attributedString = NSMutableAttributedString(
            string: "connecting",
            attributes: [
                NSAttributedString.Key.foregroundColor : disabledColor,
            ]
        )
        btn1.setAttributedTitle(attributedString, for: .disabled)
//        btn1.activityIndicatorColor = .blue
        
        
        btn2.hideTextWhenLoading = false
        btn2.isLoading = false
        btn2.activityIndicatorAlignment = RNActivityIndicatorAlignment.left
        btn2.activityIndicatorViewStyle = UIActivityIndicatorView.Style.gray
        btn2.activityIndicatorEdgeInsets = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 0)
        btn2.setTitle("Loading", for: UIControl.State.disabled)

    }

    
    func randomAttributes(button:RNLoadingButton) {
        
        buttonTapAction(button)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            // your function here
            self.randomAttributes(button: button)
        }
    }
    
    @IBAction func buttonTapAction(_ button:RNLoadingButton) {
        
        button.isLoading = !button.isLoading
        button.activityIndicatorAlignment = RNActivityIndicatorAlignment.center
        button.hideImageWhenLoading = true
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
//               button.isEnabled = true
//               button.isLoading = false
//        }
        
    }
    
    
    @IBAction func doTap(_ sender: RNLoadingButton) {
        
        sender.isEnabled = false
        sender.isLoading = true;
        
        if sender.tag == 3 {
            sender.hideImageWhenLoading = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            sender.isEnabled = true
            sender.isLoading = false
            
            if sender.tag == 3 {
                sender.isSelected = !sender.isSelected
            }
        }
        
    }


}
