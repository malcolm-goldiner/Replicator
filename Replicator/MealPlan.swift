//
//  MealPlan.swift
//  Replicator
//
//  Created by Malcolm Goldiner on 1/1/17.
//  Copyright © 2017 Malcolm Goldiner. All rights reserved.
//

import UIKit

class Meal
{
    var mealName: String?
    var mealComponenets: [String]?
    var mealThumbnailImage: UIImage?
}

class MealPlan
{
    var creatorName: String?
    var creatorThumbnailImage: UIImage?
    var meals: [Meal]?
}
