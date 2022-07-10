//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by k2 tam on 08/07/2022.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Featured recipes")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.leading)
                .padding(.top, 30)
            
            GeometryReader{ geo in
                TabView{
                    ForEach (0..<model.recipes.count) { index in
                        if model.recipes[index].featured == true {
                            
                            Button {
                                self.isDetailViewShowing = true
                            } label: {
                                //Recipe card
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                       
                                    
                                    VStack(spacing: 0){
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .clipped()
                                            .aspectRatio(contentMode: .fill)
                                        Text(model.recipes[index].name)
                                            .padding(10)
                                    }
                                }
                            }
                            .sheet(isPresented: $isDetailViewShowing, content: {
                                RecipeDetailView(recipe: model.recipes[index])
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width-40, height: geo.size.height-100)
                            .cornerRadius(15)
                            .shadow(radius: 20)

                        }
                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10){
                Text("Preperation time")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy")
            }.padding([.leading, .bottom])
        }
        
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
