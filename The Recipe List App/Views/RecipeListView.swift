//
//  ContentView.swift
//  The Recipe List App
//
//  Created by Leonardo Caracho on 05/03/23.
//

import SwiftUI

struct RecipeListView: View {
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        NavigationView {
            List(model.recipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe), label: {
                    HStack(spacing: 20.0) {
                        Image(recipe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .cornerRadius(5)
                        Text(recipe.name)
                    }
                })
            }
            .navigationBarTitle("All recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
