//
//  TestScoreController2.swift
//  RTT
//
//  Created by Wu Peirong on 13/8/18.
//  Copyright © 2018 Wu Peirong. All rights reserved.
//

import UIKit
import CoreData
import ChameleonFramework

class TestScoreController2: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var resultsTableView2: UITableView!
    var score: Int = 0
    var questionBank:[Questions] = CoreDataMethods.loadQuestions()
    let defaults = UserDefaults.standard
    var indexNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsTableView2.delegate = self
        resultsTableView2.dataSource = self
        score = defaults.integer(forKey: "score")
        navigationItem.title = "Score: \(score)/14"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(barButtonTapped))
        resultsTableView2.register(UINib(nibName: "customResultCell", bundle: nil), forCellReuseIdentifier: "resultCell")
        configureTableView()
        self.navigationItem.hidesBackButton = true
    }
    
    @objc func barButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? ReviewController2
        destinationVC?.indexNumber = indexNumber
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexNumber = indexPath.row
        performSegue(withIdentifier: "goToReview2", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionBank.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultsTableView2.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! ResultCell
        let question = questionBank[indexPath.row]
        print("number: \(question.questionNumber)")
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
    
    
    func configureTableView() {
        resultsTableView2.rowHeight = UITableViewAutomaticDimension
        resultsTableView2.estimatedRowHeight = 120
    }
}
