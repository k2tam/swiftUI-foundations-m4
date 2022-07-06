//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by k2 tam on 05/07/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                
                //MARK: Recipe Image
                Image(recipe.image).resizable().scaledToFill()
                
                //MARK: Recipe Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.title)
                        .padding(.bottom, 4.0)
                    
                    ForEach(recipe.ingredients, id: \.self){ingredient in
                        
                        Text("•" + ingredient)
                            .padding(.bottom, 2.0)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                //MARK: Recipe Directions
                VStack(alignment: .leading, spacing: 15.0){
                    Text("Directions")
                        .font(.title)
                        .padding(.bottom, 4.0)
                    
                    ForEach(0..<recipe.directions.count, id: \.self){index in
                        
                        HStack(spacing: 20.0){
                            Text("Step "+String(index+1))
                                .font(.headline)
                                .padding(0.0)
                            Text(recipe.directions[index] )
                        }
                        
                    }
                }
                .padding(.horizontal)
                
            }
            .padding()
            .navigationBarTitle(recipe.name)
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
 
