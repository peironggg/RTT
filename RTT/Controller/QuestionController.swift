//
//  QuestionPage.swift
//  RTT
//
//  Created by Wu Peirong on 4/4/18.
//  Copyright © 2018 Wu Peirong. All rights reserved.
//

import UIKit

class QuestionController: UIViewController {
    
    var questionNumber: Int = 0
    var score: Int = 0
    var chosenAnswer: Int = 0
    var allQuestions = QuestionBank()
    
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.numberOfLines = 0
        updateUI()
        nextQuestion()
    }

    @IBAction func answerTapped(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            chosenAnswer = 1
            checkAnswer(sender: sender as! UIButton)
            
        } else if sender.tag == 2 {
            chosenAnswer = 2
            checkAnswer(sender: sender as! UIButton)
            
        } else if sender.tag == 3 {
            chosenAnswer = 3
            checkAnswer(sender: sender as! UIButton)
            
        }
    }
    
    
    
    func updateUI() {
        
        questionNumberLabel.text = "\(questionNumber+1)/\(allQuestions.questions.count)"
        scoreLabel.text = "\(score)"
        answerOneButton.backgroundColor = UIColor.gray
        answerTwoButton.backgroundColor = UIColor.gray
        answerThreeButton.backgroundColor = UIColor.gray
    }
    
    func nextQuestion() {
        let question = allQuestions.questions[questionNumber]
        
        questionLabel.text = "\(question.questionTitle)"
        answerOneButton.setTitle("\(question.answerOne)", for: .normal)
        answerTwoButton.setTitle("\(question.answerTwo)", for: .normal)
        answerThreeButton.setTitle("\(question.answerThree)", for: .normal)
        
    
    }
    
    func checkAnswer(sender: UIButton) {
        let question = allQuestions.questions[questionNumber]
        
        if chosenAnswer == question.questionAnswer {
          sender.backgroundColor = UIColor.green
        } else if chosenAnswer != question.questionAnswer {
            sender.backgroundColor = UIColor.red
            if question.questionAnswer == 1 {
                answerOneButton.backgroundColor = UIColor.green
            } else if question.questionAnswer == 2 {
                answerTwoButton.backgroundColor = UIColor.green
            } else if question.questionAnswer == 3 {
                answerThreeButton.backgroundColor = UIColor.green
            }
        }
        //questionNumber += 1
    }
}
