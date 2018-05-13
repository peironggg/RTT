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

//    func parseCSV (contentsOfURL: URL, encoding: String.Encoding, error: NSErrorPointer) -> [(questionTitle:String, correctAnswer:String, answerOne:String, answerTwo:String, answerThree:String, wrongOrRight:String)]? {
//        // Load the CSV file and parse it
//        let delimiter = ","
//        var items:[(questionTitle:String, correctAnswer:String, answerOne:String, answerTwo:String, answerThree:String, wrongOrRight:String)]?
//
//        let content = String(describing: parseCSV(contentsOfURL: contentsOfURL, encoding: encoding, error: error))
//        items = []
//        let lines:[String] = content.components(separatedBy: NSCharacterSet.newlines) as [String]
//
//        for line in lines {
//            var values:[String] = []
//            if line != "" {
//                // For a line with double quotes
//                // we use NSScanner to perform the parsing
//                if line.range(of: "\"") != nil {
//                    var textToScan:String = line
//                    var value:NSString?
//                    var textScanner:Scanner = Scanner(string: textToScan)
//                    while textScanner.string != "" {
//
//                        if (textScanner.string as NSString).substring(to: 1) == "\"" {
//                            textScanner.scanLocation += 1
//                            textScanner.scanUpTo("\"", into: &value)
//                            textScanner.scanLocation += 1
//                        } else {
//                            textScanner.scanUpTo(delimiter, into: &value)
//                        }
//
//                        // Store the value into the values array
//                        values.append(value! as String)
//
//                        // Retrieve the unscanned remainder of the string
//                        if textScanner.scanLocation < textScanner.string.count {
//                            textToScan = (textScanner.string as NSString).substring(from: textScanner.scanLocation + 1)
//                        } else {
//                            textToScan = ""
//                        }
//                        textScanner = Scanner(string: textToScan)
//                    }
//
//                    // For a line without double quotes, we can simply separate the string
//                    // by using the delimiter (e.g. comma)
//                } else  {
//                    values = line.components(separatedBy:delimiter)
//                }
//
//                // Put the values into the tuple and add it to the items array
//                let item = (questionTitle: values[0], questionAnswer: values[1], answerOne: values[2], answerTwo: values[3], answerThree: values[4], wrongOrRight: values[5])
//                items?.append(item as! (questionTitle: String, correctAnswer: String, answerOne: String, answerTwo: String, answerThree: String, wrongOrRight: String))
//            }
//
//        }
//
//        return items
//    }
    
    
   
    
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
                    print(item)
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
    
    func saveContext () {
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

