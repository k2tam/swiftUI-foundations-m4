//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by k2 tam on 05/07/2022.
//

import Foundation

class RecipeModel : ObservableObject{
    @Published var recipes = [Recipe]()
    
    init(){
        self.recipes = DataService.getLocalData()
    }
    
    static func getPortion(ingredient :Ingredient, recipeServings: Int, targetServings: Int) -> String{
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortion = 0
        
        if ingredient.num != nil{
            //Get a single serving size by multyplying denominator by the recipe servings
            denominator *= recipeServings
            
            //Get target portion by multypling mumenator by target servings
            numerator *= targetServings
            
            //Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            //Get the whole portion if numerator > denominator
            if numerator >= denominator{
                wholePortion = numerator/denominator
                numerator %= denominator
                
                portion += String(wholePortion)
            }
            
            //Express the remainder as fraction
            
            if numerator > 0{
                portion += wholePortion > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        
        if let unit = ingredient.unit{
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + " " + unit
        }
        
        return portion
    }
    
}
