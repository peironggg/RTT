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

    @IBOutlet weak var beginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        beginButton.layer.cornerRadius = 10
        let border = CALayer()
        let width = CGFloat(6.0)
        border.borderColor = FlatBlack().cgColor
        border.frame = CGRect(x: 0, y: 0, width: beginButton.frame.size.width, height: beginButton.frame.size.height)
        border.borderWidth = width
        beginButton.layer.addSublayer(border)
        beginButton.layer.masksToBounds = true
        beginButton.backgroundColor = UIColor(hexString: "e74c3c")

    }

   

}

