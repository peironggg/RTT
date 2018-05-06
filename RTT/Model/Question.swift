//
//  Question.swift
//  RTT
//
//  Created by Wu Peirong on 1/4/18.
//  Copyright © 2018 Wu Peirong. All rights reserved.
//

import UIKit

class Question {
    
    var questionTitle: String = ""
    var questionAnswer: Int = 0
    var answerOne: String = ""
    var answerTwo: String = ""
    var answerThree: String = ""
    var wrongOrRight: Bool = false
    
    init(title: String, answer: Int, firstAnswer: String, secondAnswer: String, thirdAnswer: String) {
        
        questionTitle = title
        questionAnswer = answer
        answerOne = firstAnswer
        answerTwo = secondAnswer
        answerThree = thirdAnswer
        
    }

}
