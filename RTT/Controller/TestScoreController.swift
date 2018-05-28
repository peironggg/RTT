//
//  TestScore.swift
//  RTT
//
//  Created by Wu Peirong on 6/5/18.
//  Copyright © 2018 Wu Peirong. All rights reserved.
//

import UIKit
import CoreData
import ChameleonFramework

class TestScoreController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet weak var resultsTableView: UITableView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var score: Int = 0
    var questionBank:[Questions] = []
    let defaults = UserDefaults.standard
    var indexNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        score = defaults.integer(forKey: "score")
        navigationItem.title = "Score: \(score)/3"
        resultsTableView.register(UINib(nibName: "customResultCell", bundle: nil), forCellReuseIdentifier: "resultCell")
        loadQuestions()
        configureTableView()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let destinationVC = segue.destination as? ReviewController
        destinationVC?.indexNumber = indexNumber
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       indexNumber = indexPath.row
        performSegue(withIdentifier: "goToReview", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return questionBank.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultsTableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! ResultCell
        let question = questionBank[indexPath.row]
        cell.qLabel.text = question.questionTitle
        cell.qNumber.text = String(indexPath.row + 1)
        let wrongRight = question.wrongOrRight
        
        if wrongRight == "true" {
            cell.backgroundColor = FlatGreen()
        } else {
            cell.backgroundColor = FlatRed()
        }
        
        return cell
    }
    func loadQuestions() {
        let request: NSFetchRequest<Questions> = Questions.fetchRequest()
        do {
            questionBank = try context.fetch(request)
        } catch {
            print("Unable to fetch request, \(error)")
        }
    }
    func configureTableView() {
        resultsTableView.rowHeight = UITableViewAutomaticDimension
        resultsTableView.estimatedRowHeight = 120
    }
}
