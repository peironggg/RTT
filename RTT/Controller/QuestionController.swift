//
//  QuestionPage.swift
//  RTT
//
//  Created by Wu Peirong on 4/4/18.
//  Copyright © 2018 Wu Peirong. All rights reserved.
//

import UIKit
import CoreData

class QuestionController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    var testScore: Int = 0
    let defaults = UserDefaults.standard
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TestScore
        
        testScore = defaults.integer(forKey: "score")
        print(testScore)
        destinationVC.score = testScore
    }

    @IBAction func submitButtonPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Submit", message: "Have you finished all questions?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: { (action) in
            self.performSegue(withIdentifier: "toTestScore", sender: sender)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var collectionView1: UICollectionView!
    
    var questionBank: [Questions] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView1.dataSource = self
        collectionView1.delegate = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionBank.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "prototypeCell", for: indexPath) as! QuestionCell
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

    
  



}
