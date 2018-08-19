//
//  AppDelegate.swift
//  RTT
//
//  Created by Wu Peirong on 1/4/18.
//  Copyright © 2018 Wu Peirong. All rights reserved.
//

import UIKit
import CoreData
import GoogleMobileAds

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
let fileURL = Bundle.main.url(forResource: "rttquestions", withExtension: "csv")
    
    func parseCSV(fileURL: URL) {
    
        removeData()
        do {
            let content = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)
            let parsedCSV = content.components(separatedBy: "\n").map{ $0.components(separatedBy: ",")}
            print(parsedCSV)
            for item in parsedCSV {
                
                if item != [""] {
                let question = Questions(context: persistentContainer.viewContext)
                question.questionTitle = item[0]
                question.correctAnswer = item[1]
                question.answerOne = item[2]
                question.answerTwo = item[3]
                question.answerThree = item[4]
                question.wrongOrRight = item[5]
                question.chosenAnswer = item[6]
                question.questionNumber = item[7]
                try persistentContainer.viewContext.save()
                }
            }
            print(parsedCSV)
        } catch {
            print("\(error)")
        }
    }
    
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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GADMobileAds.configure(withApplicationID: "ca-app-pub-2874449241829817~8379495234")
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        let defaults = UserDefaults.standard
        var score = defaults.integer(forKey: "score")
        score = 0
        defaults.set(score, forKey: "score")
        defaults.set(false, forKey: "isPreloaded")
        let isPreloaded = defaults.bool(forKey: "isPreloaded")
        if !isPreloaded {
            parseCSV(fileURL: fileURL!)
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


