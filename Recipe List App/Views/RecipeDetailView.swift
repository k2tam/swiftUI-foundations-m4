//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by k2 tam on 05/07/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    @State var servingSize:Int = 2
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                
                //MARK: Recipe Image
                Image(recipe.image).resizable().scaledToFill()
                
                //MARK: Recipe detail title
                Text(recipe.name)
                    .font(Font.custom("Avenir Heavy", size: 25))
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    .padding(.leading)
                    
            
                //MARK: Recipe serving size picker
                VStack(){
                    Text("Select your serving size")
                    
                    Picker("", selection: $servingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                    
                    
                }.padding(.leading)
                
                
                
                //MARK: Recipe Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy", size: 20))
                        .padding(.bottom, 4.0)
                    
                    ForEach(recipe.ingredients){ingredient in
                        
                        Text("•" + RecipeModel.getPortion(ingredient: ingredient, recipeServings: recipe.servings, targetServings: servingSize) + " " + ingredient.name.lowercased())
                            .padding(.bottom, 2.0)
                        
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                
                //MARK: Recipe Directions
                VStack(alignment: .leading, spacing: 15.0){
                    Text("Directions")
                        .font(Font.custom("Avenir Heavy", size: 20))
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
            
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
 
