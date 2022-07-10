//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by k2 tam on 10/07/2022.
//

import SwiftUI

struct RecipeHighlights: View {
    var allHighlights = ""
    
    init(hightlights:[String]){
        for index in 0..<hightlights.count {
            //Last item dont add comma
            
            if index == hightlights.count-1 {
                allHighlights += hightlights[index]
            }else{
                allHighlights += hightlights[index] + ", "
            }
            
        }
        
    }
    
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(hightlights: ["item1","item2"])
    }
}
