//
//  TestScore.swift
//  RTT
//
//  Created by Wu Peirong on 6/5/18.
//  Copyright © 2018 Wu Peirong. All rights reserved.
//

import UIKit

class TestScore: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet weak var resultsTableView: UITableView!
    
    var score: Int = 0
    let defaults = UserDefaults.standard
    let questions = QuestionBank().questions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        navigationItem.title = "Score: \(score)/3"
        resultsTableView.register(UINib(nibName: "customResultCell", bundle: nil), forCellReuseIdentifier: "resultCell")
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultsTableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! ResultCell
        cell.qLabel.text = questions[indexPath.row].questionTitle
        cell.qNumber.text = "\(indexPath.row + 1)"
        let pages = defaults.object(forKey: "question\(indexPath.row + 1)") as! Question
        let wrongRight = pages.wrongOrRight
        
        if wrongRight == true {
            cell.backgroundColor = UIColor.green
        } else {
            cell.backgroundColor = UIColor.red
        }
        
        return cell
    }
    
}
