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
import GoogleMobileAds

class TestScoreController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet weak var resultsTableView: UITableView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var score: Int = 0
    var questionBank:[Questions] = CoreDataMethods.loadQuestions()
    let defaults = UserDefaults.standard
    var indexNumber: Int = 0
    var bannerView: GADBannerView!
//    var interstitial: GADInterstitial!
    
//    override func viewDidAppear(_ animated: Bool) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
//            if self.interstitial.isReady {
//                self.interstitial.present(fromRootViewController: self)
//                self.interstitial = self.createAd()
//            } else {
//                print("Ad wasn't ready")
//            }
//        }
//        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        interstitial = GADInterstitial(adUnitID: "ca-app-pub-2874449241829817/6749174202")
//        let request = GADRequest()
//        request.testDevices = [kGADSimulatorID]
//        interstitial.load(request)
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        score = defaults.integer(forKey: "score")
        navigationItem.title = "Score: \(score)/14"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(barButtonTapped))
        resultsTableView.register(UINib(nibName: "customResultCell", bundle: nil), forCellReuseIdentifier: "resultCell")
        configureTableView()
        self.navigationItem.hidesBackButton = true
        
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-2874449241829817/1942205041"
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
    
    @objc func barButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let destinationVC = segue.destination as? ReviewController
        destinationVC?.indexNumber = indexNumber
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       indexNumber = indexPath.row
        performSegue(withIdentifier: "goToReview", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return questionBank.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultsTableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! ResultCell
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
        resultsTableView.rowHeight = UITableViewAutomaticDimension
        resultsTableView.estimatedRowHeight = 120
    }
//
//    func createAd() -> GADInterstitial {
//        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
//        let request = GADRequest()
//        request.testDevices = [kGADSimulatorID]
//        interstitial.load(request)
//        return interstitial
//    }
}
