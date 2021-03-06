//
//  ContentView.swift
//  Recipe List App
//
//  Created by k2 tam on 05/07/2022.
//

import SwiftUI

struct RecipeListView: View {
    //Reference model
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading){
                Text("All recipes")
                    .font(Font.custom("Avenir Heavy", size: 30))
                    .fontWeight(.bold)
                    .padding(.top, 30)
                
                ScrollView{
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes){ r in
                            NavigationLink {
                                RecipeDetailView(recipe: r)
                            } label: {
                                //MARK: Row Item
                                HStack(spacing: 20.0){
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    
                                    VStack(alignment: .leading){
                                        Text(r.name)
                                            .foregroundColor(.black)
                                            .fontWeight(.bold)
                                        
                                        RecipeHighlights(hightlights: r.highlights)
                                            .foregroundColor(.black)
                                    }
                                  
                                }
                            }
                        }.navigationBarHidden(true)
                    }
                    
                }
                
            }.padding(.leading)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
