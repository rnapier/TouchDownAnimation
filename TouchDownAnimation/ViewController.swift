//
//  ViewController.swift
//  TouchDownAnimation
//
//  Created by Rob Napier on 6/21/16.
//  Copyright © 2016 Rob Napier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customButton: CustomDownButton!
    @IBOutlet weak var normalButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        customButton.customAnimator = CustomAnimator()
        normalButton.addGestureRecognizer(CustomAnimatorGestureRecognizer(customAnimator: CustomAnimator()))
    }

    @IBAction func pressed(_ sender: AnyObject) {
        print("pressed")
    }

}

