//
//  QuestionController2.swift
//  RTT
//
//  Created by Wu Peirong on 12/8/18.
//  Copyright © 2018 Wu Peirong. All rights reserved.
//

import UIKit
import CoreData
import ChameleonFramework

class QuestionController2:  UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView2: UICollectionView!
    var testScore: Int = 0
    let defaults = UserDefaults.standard
    var questionBank = CoreDataMethods.loadQuestions()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationVC = segue.destination as! TestScoreController
        
        testScore = defaults.integer(forKey: "score")
        print(testScore)
//        destinationVC.score = testScore
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView2.delegate = self
        collectionView2.dataSource = self
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionBank.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "prototypeCell2", for: indexPath) as! QuestionCell2
        let pages = questionBank[indexPath.row]
        cell.pages = pages
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width, height: view.safeAreaLayoutGuide.layoutFrame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }
    
    @IBAction func submitButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Submit", message: "Have you finished all questions?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: { (action) in
            self.performSegue(withIdentifier: "toTestScore2", sender: sender)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
        }))
        present(alert, animated: true, completion: nil)
    }
    
}
