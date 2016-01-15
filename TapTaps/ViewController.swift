//
//  ViewController.swift
//  TapTaps
//
//  Created by Xiao Lu on 1/13/16.
//  Copyright © 2016 Xiao Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var singleLabel: UILabel!
    @IBOutlet var doubleLabel: UILabel!
    @IBOutlet var tripleLabel: UILabel!
    @IBOutlet var quadupleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        func createTapRecognizer(numOfTaps: Int, methodName: Selector, failCondition: UIGestureRecognizer?) -> UIGestureRecognizer? {
            let someTap = UITapGestureRecognizer(target: self, action: methodName)
            someTap.numberOfTapsRequired = numOfTaps
            someTap.numberOfTouchesRequired = 1
            view.addGestureRecognizer(someTap)
            
            if failCondition != nil {
                someTap.requireGestureRecognizerToFail(failCondition!)
            }
            
            return someTap
        }
        
        let quadrupleTap = createTapRecognizer(4, methodName: "quadrupleTap", failCondition: nil)
        let tripleTap = createTapRecognizer(3, methodName: "tripleTap", failCondition: quadrupleTap)
        let doubleTap = createTapRecognizer(2, methodName: "doubleTap", failCondition: tripleTap)
        createTapRecognizer(1, methodName: "singleTap", failCondition: doubleTap)
    }
    
    func showAndDismissMessage(label: UILabel, message: String) {
        label.text = message
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), {
            label.text = ""
        })
    }
    
    func singleTap() {
        showAndDismissMessage(singleLabel, message: "Single Tap Detected")
    }
    
    func doubleTap() {
        showAndDismissMessage(doubleLabel, message: "Double Tap Detected")
    }
    
    func tripleTap() {
        showAndDismissMessage(tripleLabel, message: "Triple Tap Detected")
    }
    
    func quadrupleTap() {
        showAndDismissMessage(quadupleLabel, message: "Quadruple Tap Detected")
    }

}

