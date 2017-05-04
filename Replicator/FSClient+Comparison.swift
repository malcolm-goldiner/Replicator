//
//  FSClient+Comparison.swift
//  Replicator
//
//  Created by Malcolm Goldiner on 12/26/16.
//  Copyright © 2016 Malcolm Goldiner. All rights reserved.
//

import FatSecretKit

protocol FoodSearchClientDelegate
{
    func didGetResultsForSearch(result: String)
}

class FoodSearchClient: FSClient
{
    static let sharedInstance = FoodSearchClient()
    let firstSearchNotificationName = "FirstFoodSearchCompletedNotification"
    let secondSerchSelectorString = "getSecondFood"
    var delegate: FoodSearchClientDelegate?
    private var foodOneString: String = ""
    private var foodTwoString: String = ""
    private var foodOne: FSFood?
    private var foodTwo: FSFood?
    private var sharedSearchClient: FoodSearchClient?
    var sharedFSClient: FSClient?
    
    func setup()
    {
        NotificationCenter.default.addObserver(self, selector: Selector((secondSerchSelectorString)), name: NSNotification.Name(rawValue: firstSearchNotificationName), object: nil)
    }
    
    
    func getFoods(foodOne: String, foodTwo: String)
    {
        self.foodOneString = foodOne
        self.foodTwoString = foodTwo
        sharedFSClient!.searchFoods(foodOneString) {
            foods, maxResults, totalResults, pageNumber  -> Void in
            if totalResults > 0
            {
                let castedFood = (foods?[0]) as! FSFood
                
                self.sharedFSClient!.getFood(castedFood.identifier, completion: {
                    food -> Void in
                        self.foodOne = food
                    NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: self.firstSearchNotificationName)))
                    
                })
                
            }
            else
            {
                     self.delegate?.didGetResultsForSearch(result: "not found")
            }
        }
    }
    
    func getSecondFood()
    {
        sharedFSClient!.searchFoods(foodTwoString) {
            foods, maxResults, totalResults, pageNumber  -> Void in
            
            if totalResults > 0
            {
                let castedFood = foods?[0] as! FSFood
                self.sharedFSClient!.getFood(castedFood.identifier, completion: {
                    food -> Void in
                    self.foodTwo = food
                    self.delegate?.didGetResultsForSearch(result: String((self.foodOne?.isComparableToFood(otherFood: self.foodTwo!))!))
                    
                })

            }
            else
            {
                  self.delegate?.didGetResultsForSearch(result: "not found")
            }
        
        }
    }
}
