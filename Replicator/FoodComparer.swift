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
        let servingA = self.servings[0] as? FSServing
        let servingB = otherFood.servings[0] as? FSServing

        var result = false
        if (servingA != nil) && (servingB != nil)
        {
            result = abs((servingA?.calories.floatValue)! - (servingB?.calories.floatValue)!) <= 10
            && abs((servingA?.carbohydrateValue())! - (servingB?.carbohydrateValue())!) <= 10
            && abs((servingA?.proteinValue())! - (servingB?.proteinValue())!) <= 10
            && abs((servingA?.fatValue())! - (servingB?.fatValue())!) <= 10
            && abs((servingA?.saturatedFatValue())! - (servingB?.saturatedFatValue())!) <= 10
            && abs((servingA?.polyunsaturatedFatValue())! - (servingB?.polyunsaturatedFatValue())!) <= 10
            && abs((servingA?.monounsaturatedFatValue())! - (servingB?.monounsaturatedFatValue())!) <= 10
            && abs((servingA?.transFatValue())! - (servingB?.transFatValue())!) <= 10
            && abs((servingA?.cholesterolValue())! - (servingB?.cholesterolValue())!) <= 10
            && abs((servingA?.sodiumValue())! - (servingB?.sodiumValue())!) <= 10
            && abs((servingA?.potassiumValue())! - (servingB?.potassiumValue())!) <= 10
            && abs((servingA?.fiberValue())! - (servingB?.fiberValue())!) <= 10
            && abs((servingA?.sugarValue())! - (servingB?.sugarValue())!) <= 10
            && abs((servingA?.vitaminAValue())! - (servingB?.vitaminAValue())!) <= 10
            && abs((servingA?.vitaminCValue())! - (servingB?.vitaminCValue())!) <= 10
            && abs((servingA?.calciumValue())! - (servingB?.calciumValue())!) <= 10
            && abs((servingA?.ironValue())! - (servingB?.ironValue())!) <= 10
        }
        
        return result
    }
}
