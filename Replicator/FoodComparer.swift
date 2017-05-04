//
//  FoodComparer.swift
//  Pods
//
//  Created by Malcolm Goldiner on 12/26/16.
//
//

import Foundation
import FatSecretKit


extension FSFood
{
    func isComparableToFood(otherFood: FSFood) -> Bool
    {
        var result = false
        
        if servings.count > 0 && otherFood.servings.count > 0
        {
            let servingA = self.servings[0] as! FSServing
            let servingB = otherFood.servings[0] as! FSServing
            
          
            
            let resultsArr =  [ isNoMoreThanTen(x: Double(servingA.caloriesValue()), y: Double(servingB.caloriesValue())), isNoMoreThanTen(x: Double(servingA.carbohydrateValue()), y: Double(servingB.carbohydrateValue())), isWithinTen(x: Double(servingA.proteinValue()), y: Double(servingB.proteinValue()), nutrient:"protein"), isNoMoreThanTen(x: Double(servingA.fatValue()), y: Double(servingB.fatValue())), isNoMoreThanTen(x: Double(servingA.saturatedFatValue()), y: Double(servingB.saturatedFatValue())), isWithinTen(x: Double(servingA.polyunsaturatedFatValue()), y: Double(servingB.polyunsaturatedFatValue()), nutrient:"polyunsatured fat"), isWithinTen(x: Double(servingA.monounsaturatedFatValue()), y: Double(servingB.monounsaturatedFatValue()), nutrient: "monounsatured fat"), isNoMoreThanTen(x: Double(servingA.transFatValue()), y: Double(servingB.transFatValue())), isNoMoreThanTen(x: Double(servingA.cholesterolValue()), y: Double(servingB.cholesterolValue())), isWithinTen(x: Double(servingA.sodiumValue()), y: Double(servingB.sodiumValue()), nutrient: "sodium"), isWithinTen(x: Double(servingA.potassiumValue()), y: Double(servingB.potassiumValue()), nutrient: "potassium"), isWithinTen(x: Double(servingA.fiberValue()), y: Double(servingB.fiberValue()), nutrient: "fiber"), isWithinTen(x: Double(servingA.sugarValue()), y: Double(servingB.sugarValue()), nutrient: "sugar"), isWithinTen(x: Double(servingA.vitaminAValue()), y: Double(servingB.vitaminAValue()), nutrient: "vitamin a"), isWithinTen(x: Double(servingA.vitaminCValue()), y: Double(servingB.vitaminCValue()), nutrient: "vitamin c"), isWithinTen(x: Double(servingA.calciumValue()), y: Double(servingB.calciumValue()), nutrient: "calcium"), isWithinTen(x: Double(servingA.ironValue()), y: Double(servingB.ironValue()), nutrient: "iron")]
            
            if resultsArr.count > 0
            {
                var falseCount = 0
                for res in resultsArr
                {
                    if !res
                    {
                        falseCount = falseCount + 1
                    }
                }
                
                result = (Double(falseCount) <= Double(resultsArr.count) * 0.5)
            }
        }
        
        return result
    }
    
    func isWithinTen(x: Double, y: Double, nutrient: String) -> Bool
    {
        var margin = 0.0
        
        margin = recommendedDailyAllowanceForNutrient(nutrient: nutrient)
        
        print("\(x) vs \(y)\n")
       
        return abs(x - y) <= margin
    }
    
    func isNoMoreThanTen(x: Double, y:Double) -> Bool
    {
        var margin = 0.0
        
        margin = recommendedDailyAllowanceForNutrient(nutrient: nutrient)
        
        print("\(x) vs \(y)\n")
        
        return x > y || (y - x) <= margin
    }
    
    // Values for men 18 - 50 in 2000 calorie diet
    func recommendedDailyAllowanceForNutrient(nutrient: String) -> Double
    {
        switch(nutrient)
        {
            case "calories":
                return 0.1 * 2000
            case "carbohydrates":
                return 0.1 * 130
            case "protein":
                return 0.1 * 56
            case "fat":
                return 0.1 * 2
            case "saturated fat":
                return 0.1 * 24
            case "polyunsaturated fat":
                return 0.1 * 700
            case "monounsaturated fat":
                return 0.1 * 55
            case "trans fat":
                return 0.1 * 2
            case "cholestrol":
                return 0.1 * 0.3
            case "sodium":
                return 0.1 * 2.3
            case "potassium":
                return 0.1 * 4.7
            case "fiber":
                return 0.1 * 38
            case "sugar":
                return 0.1 * 37.5
            case "vitamin c":
                return 0.1 * 0.06
            case "vitamin a":
                return 0.1 * 0.009
            case "calcium":
                return 0.1 * 1
            case "iron":
                return 0.1 * 0.019
            default:
                return 10
        }
    }
}
