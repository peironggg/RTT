//
//  ViewController.swift
//  RTT
//
//  Created by Wu Peirong on 1/4/18.
//  Copyright © 2018 Wu Peirong. All rights reserved.
//

import UIKit
import QuartzCore
import ChameleonFramework

class WelcomeController: UIViewController {

    @IBOutlet weak var freeTrial: UIButton!
    @IBOutlet weak var allQuestions: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        freeTrial.translatesAutoresizingMaskIntoConstraints = false
        let border = CALayer()
        let width = CGFloat(6.0)
        border.borderColor = FlatBlack().cgColor
        border.frame = CGRect(x: 0, y: 0, width: freeTrial.frame.size.width, height: freeTrial.frame.size.height)
        border.borderWidth = width
        freeTrial.layer.addSublayer(border)
        freeTrial.layer.masksToBounds = true
        freeTrial.backgroundColor = UIColor(hexString: "e74c3c")
        
        allQuestions.translatesAutoresizingMaskIntoConstraints = false
        let AQborder = CALayer()
        AQborder.borderColor = FlatBlack().cgColor
        AQborder.frame = CGRect(x: 0, y: 0, width: allQuestions.frame.size.width, height: allQuestions.frame.size.height)
        AQborder.borderWidth = width
        allQuestions.layer.addSublayer(AQborder)
        allQuestions.layer.masksToBounds = true


    }

   

}

