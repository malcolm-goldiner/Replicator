//
//  SwipeableMealPlan.swift
//  Replicator
//
//  Created by Malcolm Goldiner on 3/4/18.
//  Copyright © 2018 Malcolm Goldiner. All rights reserved.
//

import UIKit

class SwipeableMealView : UIView
{
    @IBOutlet weak var swipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var whyLabel: UILabel!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    
    public var mealName: String {
        set {
            mealNameLabel.text = newValue
            self.mealName = newValue
        }
        
        get {
            return self.mealName
        }
    }
    
    public var mealImage: UIImage {
        set {
            mealImageView.image = newValue
            self.mealImage = newValue
        }
        
        get {
            return self.mealImage
        }
    }
    
    public var storeImage: UIImage {
        set {
            storeImageView.image = newValue
            self.storeImage = newValue
        }
        
        get {
            return self.storeImage
        }
    }
    
    public var suggestionExplanation: String {
        set {
            explanationLabel.text = newValue
            self.suggestionExplanation = newValue
        }
        
        get {
            return self.suggestionExplanation
        }
    }
    
   
    
}
