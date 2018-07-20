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
    let sort = NSSortDescriptor(key: "questionNumber", ascending: true, selector: #selector(NSString.localizedStandardCompare(_:)))
    var questionBank: [Questions] = []
    let request: NSFetchRequest<Questions> = Questions.fetchRequest()
    request.sortDescriptors = [sort]
    do {
        questionBank = try context.fetch(request)
        
        
    } catch {
        print("Unable to fetch request, \(error)")

    }
    return questionBank
    
}
    

}
