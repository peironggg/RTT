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
            
        } else if sender.tag == 2 {
            
        } else if sender.tag == 3 {
            
        }
    }
    
    
    
    func updateUI() {
        
        questionNumberLabel.text = "\(questionNumber+1)/\(allQuestions.questions.count)"
        scoreLabel.text = "\(score)"
    }
    
    func nextQuestion() {
        let question = allQuestions.questions[questionNumber]
        
        questionLabel.text = "\(question.questionTitle)"
        answerOneButton.setTitle("\(question.answerOne)", for: .normal)
        answerTwoButton.setTitle("\(question.answerTwo)", for: .normal)
        answerThreeButton.setTitle("\(question.answerThree)", for: .normal)
    
    }
}
