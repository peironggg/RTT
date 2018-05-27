//
//  AppDelegate.swift
//  RTT
//
//  Created by Wu Peirong on 1/4/18.
//  Copyright © 2018 Wu Peirong. All rights reserved.
//

import UIKit
import CoreData
import CSVParser

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func removeData () {
        // Remove the existing items
            let context = self.persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<Questions> = Questions.fetchRequest()
        do {
        let items = try context.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as! [Questions]
            for item in items {
                context.delete(item)
            }
        } catch {
            print("Unable to fetch request")
        }


    }

    func preloadData () {
        // Retrieve data from the source file
        if let path = Bundle.main.path(forResource: "rttquestions", ofType: "csv") {

            // Remove all the menu items before preloading
            removeData()
            do {
                let csv = try CSVParser(filePath: path)
                for item in csv {
                    
                    let question = Questions(context: persistentContainer.viewContext)
                    question.questionTitle = item[0]
                    question.correctAnswer = item[1]
                    question.answerOne = item[2]
                    question.answerTwo = item[3]
                    question.answerThree = item[4]
                    question.wrongOrRight = item[5]
                    try persistentContainer.viewContext.save()
                }
            } catch {
                print("Unable to parse file, \(error)")
            }
            
            
            
        }
    }
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let defaults = UserDefaults.standard
        var score = defaults.integer(forKey: "score")
        score = 0
        defaults.set(score, forKey: "score")
        let isPreloaded = defaults.bool(forKey: "isPreloaded")
        if !isPreloaded {
            preloadData()
            defaults.set(true, forKey: "isPreloaded")
        }
        return true
    }

    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveQuestions () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

