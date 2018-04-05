//
//  QuestionBank.swift
//  RTT
//
//  Created by Wu Peirong on 4/4/18.
//  Copyright © 2018 Wu Peirong. All rights reserved.
//

import UIKit

class QuestionBank {
    
var questions = [Question]()
    
    init() {
        
        questions.append(Question(title: "How many demerit points can you get during probation?", answer: 1, firstAnswer: "12", secondAnswer: "24", thirdAnswer: "14"))
        questions.append(Question(title: "What is the default speed limit on roads?", answer: 2, firstAnswer: "60", secondAnswer: "50", thirdAnswer: "70"))
        questions.append(Question(title: "What is the free play zone for clutch?", answer: 3, firstAnswer: "15-20mm", secondAnswer: "20-30mm", thirdAnswer: "10-20mm"))
        
    }
    

    
}
