//
//  CustomTransitionViewController.swift
//  TransitionButton
//


import UIKit

open class CustomTransitionViewController: UIViewController, UIViewControllerTransitioningDelegate {

    open override func viewDidLoad() {
        super.viewDidLoad()
        self.transitioningDelegate = self
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadeTransition(transitionDuration: 0.5, startingAlpha: 0.8)
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadeTransition(transitionDuration: 0.5, startingAlpha: 0.8)
    }
}
