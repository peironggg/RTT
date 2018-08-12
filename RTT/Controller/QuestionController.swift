//
//  QuestionPage.swift
//  RTT
//
//  Created by Wu Peirong on 4/4/18.
//  Copyright © 2018 Wu Peirong. All rights reserved.
//

import UIKit
import CoreData
import ChameleonFramework
import GoogleMobileAds

class QuestionController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{


    @IBOutlet weak var collectionView1: UICollectionView!
    var testScore: Int = 0
    let defaults = UserDefaults.standard
    var questionBank = CoreDataMethods.loadQuestions()
    var bannerView: GADBannerView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TestScoreController
        
        testScore = defaults.integer(forKey: "score")
        print(testScore)
        destinationVC.score = testScore
    }

    @IBAction func submitButtonPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Submit", message: "Have you finished all questions?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: { (action) in
            self.performSegue(withIdentifier: "toTestScore", sender: sender)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
        }))
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView1.delegate = self
        collectionView1.dataSource = self
        
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-2874449241829817/4871636627"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
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
