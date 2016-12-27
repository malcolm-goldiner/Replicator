//
//  FSClient+Comparison.swift
//  Replicator
//
//  Created by Malcolm Goldiner on 12/26/16.
//  Copyright © 2016 Malcolm Goldiner. All rights reserved.
//

import FatSecretKit
import FoodComparer

protocol FoodSearchClientDelegate
{
    func didGetResultsForSearch(areComprable: Bool)
}

class FoodSearchClient: FSClient
{
    let firstSearchNotificationName = "FirstFoodSearchCompletedNotification"
    let secondSerchSelectorStrign = "getSecondFood"
    var delegate: FoodSearchClientDelegate?
    private var foodOneString: String = ""
    private var foodTwoString: String = ""
    private var foodOne: FSFood?
    private var foodTwo: FSFood?
    
    func setup()
    {
        NotificationCenter.default.addObserver(self, selector: Selector(("getSecondFood:=")), name: NSNotification.Name(rawValue: firstSearchNotificationName), object: nil)
    }
    
    
    func getFoods(foodOne: String, foodTwo: String)
    {
        self.foodOneString = foodOne
        self.foodTwoString = foodTwo
        self.searchFoods(foodOne) {
            foods, maxResults, totalResulsts, pageNumber  -> Void in
            self.getFood((foods?[0] as? FSFood)!.identifier, completion: { (food: FSFood) -> Void in
                self.foodOne  = food
                NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: firstSearchNotificationName)))
            })
        }
    }
    
    func getSecondFood()
    {
        self.searchFoods(foodTwo) {
            foods, maxResults, totalResulsts, pageNumber  -> Void in
            self.getFood((foods?[0] as? FSFood)!.identifier, completion: { (food: FSFood) -> Void in
                foodTwo = food
                self.delegate?.didGetResultsForSearch(foodOne?.isComparableToFood(otherFood: food))
            })
        }

    }
}
