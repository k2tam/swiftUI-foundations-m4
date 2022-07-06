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
    
}
