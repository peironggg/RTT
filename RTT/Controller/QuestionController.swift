//
//  QuestionPage.swift
//  RTT
//
//  Created by Wu Peirong on 4/4/18.
//  Copyright © 2018 Wu Peirong. All rights reserved.
//

import UIKit

class QuestionController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var collectionView1: UICollectionView!
    
    var allQuestions = QuestionBank()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView1.dataSource = self
        collectionView1.delegate = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allQuestions.questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "prototypeCell", for: indexPath) as! QuestionCell
        let pages = allQuestions.questions[indexPath.row]
        cell.pages = pages
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }

    
  



}
