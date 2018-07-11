//
//  ReviewCell.swift
//  RTT
//
//  Created by Wu Peirong on 28/5/18.
//  Copyright © 2018 Wu Peirong. All rights reserved.
//

import UIKit
import ChameleonFramework

class ReviewCell: UICollectionViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    
    
    var pages: Questions? {
        didSet{
            updateUI()
            nextQuestion()
            print(pages?.answerOne)
        }
    }
    func updateUI() {
        self.backgroundColor = UIColor(hexString: "34495e")
        answerOneButton.layer.borderWidth = 2.0
        answerOneButton.layer.borderColor = FlatBlack().cgColor
        answerTwoButton.layer.borderWidth = 2.0
        answerTwoButton.layer.borderColor = FlatBlack().cgColor
        answerThreeButton.layer.borderWidth = 2.0
        answerThreeButton.layer.borderColor = FlatBlack().cgColor
        
        answerOneButton.titleLabel?.minimumScaleFactor = 0.5
        answerOneButton.titleLabel?.numberOfLines = 2
        answerOneButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        answerTwoButton.titleLabel?.minimumScaleFactor = 0.5
        answerTwoButton.titleLabel?.numberOfLines = 2
        answerTwoButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        answerThreeButton.titleLabel?.minimumScaleFactor = 0.5
        answerThreeButton.titleLabel?.numberOfLines = 2
        answerThreeButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        answerOneButton.backgroundColor = UIColor(hexString: "e67e22")
        answerTwoButton.backgroundColor = UIColor(hexString: "e67e22")
        answerThreeButton.backgroundColor = UIColor(hexString: "e67e22")
        
        displayCorrectButtonColor()
        
         if pages?.wrongOrRight == "false" {
            if pages?.chosenAnswer == "1"{
                answerOneButton.backgroundColor = FlatRed()
            } else if pages?.chosenAnswer == "2" {
                answerTwoButton.backgroundColor = FlatRed()
            } else if pages?.chosenAnswer == "3" {
                answerThreeButton.backgroundColor = FlatRed()
            }
        }
    }
    
    func displayCorrectButtonColor() {
        if pages?.correctAnswer == "1" {
            answerOneButton.backgroundColor = FlatGreen()
        } else if pages?.correctAnswer == "2" {
            answerTwoButton.backgroundColor = FlatGreen()
        } else if pages?.correctAnswer == "3" {
            answerThreeButton.backgroundColor = FlatGreen()
        }
    }
    
    func nextQuestion() {
        
        if let pages = pages {
            
            questionLabel.text = "\(pages.questionTitle!)"
            answerOneButton.setTitle("\(pages.answerOne!)", for: .normal)
            answerTwoButton.setTitle("\(pages.answerTwo!)", for: .normal)
            answerThreeButton.setTitle("\(pages.answerThree!)", for: .normal)
            
        }
        
        
    }
}
