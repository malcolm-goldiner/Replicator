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

class MealPlan: UIView
{
    static let mealCircleRadius: CGFloat = 5.0
    var creatorName: String?
    var creatorThumbnailImage: UIImage?
    var meals: [Meal]?
    let mapStartingPoint = CGPoint(x: 15, y: 50)
    let mealCircleStartingAngle = 0
    let mealCircleColor = UIColor.green
    let lineColor = UIColor.black
    let mealCircleToMealLabelHorizontalSpacing: CGFloat = 10
    let mealCircleLineWidth: CGFloat = 3.0
    let mealCircleEndingAngle = Double.pi * 2
    let lineLength: CGFloat = 200
    var currentCircleEndingPosition: CGPoint?
    let mealLabelFontSize: CGFloat = 9.0
    var mealCircleCircumference: CGFloat  {
        get {
            return MealPlan.mealCircleRadius * 2
        }
    }
    
    func addTestMeals() {
        let testBreakfast = Meal()
        testBreakfast.mealName = "Bacon, Egg, And Cheese Sandiwch"
        
        let testLunch = Meal()
        testLunch.mealName = "Turkey, Provolone, Tomoato, and Avocado Sandwich"
        
        let testDinner = Meal()
        testDinner.mealName = "Pork Chops, Mashed Potatoes, and Green Beans"
        
        meals = [testBreakfast, testLunch, testDinner]
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        addTestMeals()
       
        for meal in meals! {
            if (currentCircleEndingPosition != nil) {
                drawLineToNextMeal()
            }

            if (meal.mealName != nil) {
                drawMealCircleForMeal(meal.mealName!)
            }
        }
    }
    
    func drawLineToNextMeal() {
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x:self.currentCircleEndingPosition!.x, y: currentCircleEndingPosition!.y))
        linePath.addLine(to: CGPoint(x: self.currentCircleEndingPosition!.x, y: self.currentCircleEndingPosition!.y + self.lineLength))
        linePath.close()
        lineColor.set()
        linePath.stroke()
        linePath.fill()
    }
    
    func drawMealCircleForMeal(_ foodString: String) {
        
        var circlePath: UIBezierPath
        if (currentCircleEndingPosition == nil)
        {
            circlePath = UIBezierPath(arcCenter: CGPoint(x: mapStartingPoint.x,y: mapStartingPoint.y), radius: MealPlan.mealCircleRadius, startAngle: CGFloat(mealCircleStartingAngle), endAngle:CGFloat(mealCircleEndingAngle), clockwise: true)
            
            currentCircleEndingPosition = CGPoint(x: mapStartingPoint.x, y: mapStartingPoint.y + MealPlan.mealCircleRadius)
        } else {
             circlePath = UIBezierPath(arcCenter: CGPoint(x: currentCircleEndingPosition!.x, y: currentCircleEndingPosition!.y + lineLength), radius: CGFloat(MealPlan.mealCircleRadius), startAngle: CGFloat(mealCircleStartingAngle), endAngle:CGFloat(mealCircleEndingAngle), clockwise: true)
            
                currentCircleEndingPosition = CGPoint(x: mapStartingPoint.x, y: currentCircleEndingPosition!.y + lineLength + MealPlan.mealCircleRadius)
        }
       
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        shapeLayer.fillColor = mealCircleColor.cgColor
        shapeLayer.strokeColor = mealCircleColor.cgColor
        shapeLayer.lineWidth = mealCircleLineWidth
        
        self.layer.addSublayer(shapeLayer)
        
        let mealLabel = UILabel()
        mealLabel.text = foodString
        mealLabel.font = UIFont.systemFont(ofSize: mealLabelFontSize)
        mealLabel.sizeToFit()
        mealLabel.frame = CGRect(x: mapStartingPoint.x + mealCircleCircumference + mealCircleToMealLabelHorizontalSpacing, y: currentCircleEndingPosition!.y  - MealPlan.mealCircleRadius - (mealLabel.frame.size.height / 2), width: mealLabel.frame.size.width, height: mealLabel.frame.size.height)
        addSubview(mealLabel)
    }
    
}
