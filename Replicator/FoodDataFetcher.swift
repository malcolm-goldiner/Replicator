//
//  FoodDataFetcher.swift
//  Replicator
//
//  Created by Malcolm Goldiner on 12/26/16.
//  Copyright © 2016 Malcolm Goldiner. All rights reserved.
//

import Foundation
import FatSecretKit

class FoodDataFetcher
{
    func foodsAreSimilar(foodOne: String, foodTwo: String)
    {
        
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


