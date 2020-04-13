//
//  LoadingViewController.swift
//  LoaderUIButton
//
//  Created by Sabari on 12/04/20.
//  Copyright © 2020 Sabari. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet weak var activityIndicatorBtn: LoadingButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func activityIndicatorBtnActn(_ sender: LoadingButton) {
        
        sender.showLoading(2,2) // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {

            sleep(3) // 3: Do your networking task or background work here.

            DispatchQueue.main.async(execute: { () -> Void in
                // 4: Stop the animation, here you have three options for the `animationStyle` property:
                // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                // .shake: when you want to reflect to the user that the task did not complete successfly
                // .normal
                sender.hideLoading()
            })
        })
    }

}
