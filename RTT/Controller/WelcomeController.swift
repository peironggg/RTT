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

    @IBOutlet weak var launchIcon: UIImageView!
    @IBOutlet weak var beginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        beginButton.layer.cornerRadius = 10
        beginButton.translatesAutoresizingMaskIntoConstraints = false
        let border = CALayer()
        let width = CGFloat(6.0)
        border.borderColor = FlatBlack().cgColor
        border.frame = CGRect(x: 0, y: 0, width: beginButton.frame.size.width, height: beginButton.frame.size.height)
        border.borderWidth = width
        beginButton.layer.addSublayer(border)
        beginButton.layer.masksToBounds = true
        beginButton.backgroundColor = UIColor(hexString: "e74c3c")
//        view.addSubview(beginButton)
//        beginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        beginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: (view.frame.height)/1.5).isActive = true
//        beginButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        beginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        view.addSubview(launchIcon)
//        launchIcon.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        launchIcon.heightAnchor.constraint(equalToConstant: 150).isActive = true
//        launchIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        launchIcon.topAnchor.constraintEqualToSystemSpacingBelow(view.topAnchor, multiplier: (view.frame.height)/2.5).isActive = true
        

    }

   

}

