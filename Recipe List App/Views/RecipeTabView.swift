//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by k2 tam on 07/07/2022.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView{
            RecipeFeaturedView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Featured")
                }
            
            RecipeListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("All recipes")
                }

        }.environmentObject(RecipeModel())
            
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
