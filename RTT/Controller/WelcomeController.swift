//
//  ViewController.swift
//  RTT
//
//  Created by Wu Peirong on 1/4/18.
//  Copyright © 2018 Wu Peirong. All rights reserved.
//

import UIKit
import QuartzCore
import ChameleonFramework
import StoreKit

class WelcomeController: UIViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    var list = [SKProduct]()
    var p = SKProduct()
    let defaults = UserDefaults.standard
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print("requesting product")
        let myProduct = response.products
        for product in myProduct {
            print(product.productIdentifier)
            print(product.localizedTitle)
            print(product.localizedDescription)
            print(product.price)
            
            
            list.append(product)
        }
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
                print("transaction restored")
        
        for transaction in queue.transactions {
            let t: SKPaymentTransaction = transaction
            let productID = t.payment.productIdentifier as String
            
            switch productID {
            case "peirong.rtt.extraquestions" :
                print("all questions enabled")
                allQuestions.isEnabled = true
                
            default: print("IAP not found")
            }
        }
    }

    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        print("add payment")
        
        for transaction: AnyObject in transactions {
            let trans = transaction as! SKPaymentTransaction
//            print(trans.error!)
            
            switch trans.transactionState {
            case .purchased:
                print("buy ok, unlock IAP HERE")
                print(p.productIdentifier)
                
                let prodID = p.productIdentifier
                switch prodID {
                case "peirong.rtt.extraquestions":
                    print("extra questions unlocked")
                    defaults.set(true, forKey: "peirong.rtt.extraquestions")
                    performSegue(withIdentifier: "goToQuestionController2", sender: self)
                    
                default:
                    print("IAP not found")
                }
                queue.finishTransaction(trans)
            case .failed:
                print("buy error")
                queue.finishTransaction(trans)
                break
            default:
                print("Default")
                break
            }
        }
    }

    @IBOutlet weak var freeTrial: UIButton!
    @IBOutlet weak var allQuestions: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("no problemo")
        freeTrial.layer.borderWidth = 6.0
        freeTrial.layer.borderColor = FlatBlack().cgColor
        freeTrial.backgroundColor = UIColor(hexString: "e74c3c")

        allQuestions.layer.borderWidth = 6.0
        allQuestions.layer.borderColor = FlatBlack().cgColor
        
        if(SKPaymentQueue.canMakePayments()) {
            print("IAP is enabled, loading")
            let productID: NSSet = NSSet(objects: "peirong.rtt.extraquestions")
            let request: SKProductsRequest = SKProductsRequest(productIdentifiers: productID as! Set<String>)
            request.delegate = self
            request.start()
        } else {
            print("please enable IAPS")
        }


    }

    @IBAction func restoreButtonPressed(_ sender: UIBarButtonItem) {
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    
    @IBAction func allQuestionsButtonPressed(_ sender: UIButton) {
        if defaults.bool(forKey: "peirong.rtt.extraquestions") == true {
            performSegue(withIdentifier: "goToQuestionController2", sender: self)
        } else {

            print("adding extra questions")
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "peirong.rtt.extraquestions") {
                    p = product
                    buyProduct()
                }
            }
        }
    }
    
    func buyProduct() {
        print("buy " + p.productIdentifier)
        let pay = SKPayment(product: p)
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(pay as SKPayment)
    }
    

}

