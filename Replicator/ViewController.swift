//
//  ViewController.swift
//  Replicator
//
//  Created by Malcolm Goldiner on 12/22/16.
//  Copyright © 2016 Malcolm Goldiner. All rights reserved.
//

import UIKit
import FatSecretKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultImageView: UIImageView!
    var firstFoodEntered = false
    var secondFoodEntered = false
    var firstFood: String?
    var secondFood: String?
    var foods: [FSFood]?
    
    func setup()
    {
        FSClient.shared().oauthConsumerKey = "9f75a0ffde2c415fb401e3649f2685f6"
        FSClient.shared().oauthConsumerSecret = "806be4a0328941109cb9dffbe0c03118"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    @IBAction func didEnterFirstFood(_ sender: UITextField)
    {
        firstFood = sender.text!
        firstFoodEntered = true
    }

    @IBAction func didEnterSecondFood(_ sender: UITextField)
    {
        secondFood = sender.text!
        secondFoodEntered = true
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressCompare(_ sender: Any)
    {
        if firstFoodEntered && secondFoodEntered
        {
            searchForFood(food: firstFood!, completion: { })
            searchForFood(food: secondFood!, completion: updateUI)
        }
        
    }
    
    func updateUI()
    {
        
        self.resultImageView.image = UIImage(named: "check")
    }
    
    func searchForFood(food: String, completion: @escaping () -> ())
    {
        FSClient.shared().searchFoods(food) { (foodResults : [Any]?, maxResults : NSInteger, totalResults : NSInteger, pageNumber : NSInteger) in
            if let array = foodResults
            {
                 self.foods!.append(array[0] as! FSFood)
                 completion()
            }
        }
    }
    
  

}

