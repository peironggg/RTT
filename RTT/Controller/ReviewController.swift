//
//  ReviewController.swift
//  RTT
//
//  Created by Wu Peirong on 28/5/18.
//  Copyright © 2018 Wu Peirong. All rights reserved.
//

import UIKit
import CoreData
import GoogleMobileAds

class ReviewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView2: UICollectionView!
    var questionBank = CoreDataMethods.loadQuestions()
    var indexNumber: Int = 0
    var bannerView: GADBannerView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reviewCell", for: indexPath) as! ReviewCell
        let pages = questionBank[indexNumber]
        cell.pages = pages
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width, height: view.safeAreaLayoutGuide.layoutFrame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView2.delegate = self
        collectionView2.dataSource = self
        print(indexNumber)
        
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-2874449241829817/9437551689"
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

}
