//
//  DataService.swift
//  Recipe List App
//
//  Created by k2 tam on 05/07/2022.
//

import Foundation

class DataService{
    
    static func getLocalData() -> [Recipe] {
       //Parse local json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //Check if pathString is not nil, otherwise...
        guard pathString != nil else{
            return [Recipe]()
        }
        
        //Get url to the local JSON file
        let url = URL(fileURLWithPath: pathString!)
        
        
        do{
            //Create data object by the contents of url
            let data = try Data(contentsOf: url)
            
            //Decode the data by JSON decoder
            let decoder = JSONDecoder()
            
            do{
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //Add unique IDs
                for r in recipeData{
                    r.id = UUID()
                }
                
                //Return recipes
                return recipeData
                             

            }catch{
                print(error)
            }
            
        }catch{
            print(error)
        }
        
        return [Recipe]()
    }
}
