//
//  QuestionCell2.swift
//  RTT
//
//  Created by Wu Peirong on 12/8/18.
//  Copyright © 2018 Wu Peirong. All rights reserved.
//


import UIKit
import CoreData
import ChameleonFramework
import QuartzCore

class QuestionCell2: UICollectionViewCell {
    
    @IBOutlet weak var questionLabel2: UILabel!
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    
    @IBAction func answerButton(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            chosenAnswer = "1"
            pages?.chosenAnswer = "1"
            updateUI()
            checkAnswer(sender: sender as! UIButton)
            
            
            
        } else if sender.tag == 2 {
            chosenAnswer = "2"
            pages?.chosenAnswer = "2"
            updateUI()
            checkAnswer(sender: sender as! UIButton)
            
        } else if sender.tag == 3 {
            chosenAnswer = "3"
            pages?.chosenAnswer = "3"
            updateUI()
            checkAnswer(sender: sender as! UIButton)
        }
    }
        let defaults = UserDefaults.standard
    var score: Int = 0
    var chosenAnswer: String = ""
    var questionNumber: Int = 0
    var allQuestions = CoreDataMethods.loadQuestions()

    
    var pages: Questions? {
        
        didSet {
            
            updateUI()
            nextQuestion()
            
        }
    }
    
    
    func checkAnswer(sender: UIButton) {
        
        if chosenAnswer == pages?.correctAnswer {
            score = defaults.integer(forKey: "score")
            score += 1
            pages?.wrongOrRight = "true"
            defaults.set(score, forKey: "score")
            
        } else if chosenAnswer != pages?.correctAnswer {
            pages?.wrongOrRight = "false"
        }
    }
    
    func updateUI() {
        
        
        answerOneButton.backgroundColor = UIColor(hexString: "e67e22")
        answerTwoButton.backgroundColor = UIColor(hexString: "e67e22")
        answerThreeButton.backgroundColor = UIColor(hexString: "e67e22")
        
        answerOneButton.titleLabel?.minimumScaleFactor = 0.5
        answerOneButton.titleLabel?.numberOfLines = 2
        answerOneButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        answerTwoButton.titleLabel?.minimumScaleFactor = 0.5
        answerTwoButton.titleLabel?.numberOfLines = 2
        answerTwoButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        answerThreeButton.titleLabel?.minimumScaleFactor = 0.5
        answerThreeButton.titleLabel?.numberOfLines = 2
        answerThreeButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        if pages?.chosenAnswer == "1" {
            answerOneButton.backgroundColor = FlatGray()
            
        } else if pages?.chosenAnswer == "2" {
            answerTwoButton.backgroundColor = FlatGray()
            
        } else if pages?.chosenAnswer == "3" {
            answerThreeButton.backgroundColor = FlatGray()
            
        }
            
        else {
            self.backgroundColor = UIColor(hexString: "34495e")
            
            answerOneButton.layer.borderWidth = 2.0
            answerOneButton.layer.borderColor = FlatBlack().cgColor
            answerTwoButton.layer.borderWidth = 2.0
            answerTwoButton.layer.borderColor = FlatBlack().cgColor
            answerThreeButton.layer.borderWidth = 2.0
            answerThreeButton.layer.borderColor = FlatBlack().cgColor
        }
    }
    
    func nextQuestion() {
        
        questionNumber += 1
        
        if let pages = pages {
            
            questionLabel2.text = "\(pages.questionTitle!)"
            answerOneButton.setTitle("\(pages.answerOne!)", for: .normal)
            answerTwoButton.setTitle("\(pages.answerTwo!)", for: .normal)
            answerThreeButton.setTitle("\(pages.answerThree!)", for: .normal)
            
        }
        

    }
    
}
