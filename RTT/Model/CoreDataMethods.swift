//
//  CoreDataMethods.swift
//  RTT
//
//  Created by Wu Peirong on 13/5/18.
//  Copyright © 2018 Wu Peirong. All rights reserved.
//

import UIKit
import CoreData

class CoreDataMethods {
static func loadQuestions() -> [Questions] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var questionBank: [Questions] = []
    let request: NSFetchRequest<Questions> = Questions.fetchRequest()
    do {
        questionBank = try context.fetch(request)
        
        
    } catch {
        print("Unable to fetch request, \(error)")

    }
    return questionBank
    
}
}
