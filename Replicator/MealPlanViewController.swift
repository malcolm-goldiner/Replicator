//
//  MealPlanViewController.swift
//  Replicator
//
//  Created by Malcolm Goldiner on 3/3/18.
//  Copyright © 2018 Malcolm Goldiner. All rights reserved.
//

import UIKit

class MealPlanViewController : UIViewController
{
    let mealPlanView = MealPlanView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mealPlanView)
        mealPlanView.addTestMeals()
    }
}
