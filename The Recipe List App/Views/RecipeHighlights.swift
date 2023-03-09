//
//  RecipeHighlights.swift
//  The Recipe List App
//
//  Created by Leonardo Caracho on 09/03/23.
//

import SwiftUI

struct RecipeHighlights: View {
    var allHighlights = ""
    
    init(highlights:[String]) {
        allHighlights = highlights.joined(separator: ", ")
    }
    
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["a", "b"])
            .font(Font.custom("Avenir Heavy", size: 15))
    }
}
