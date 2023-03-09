//
//  ContentView.swift
//  The Recipe List App
//
//  Created by Leonardo Caracho on 05/03/23.
//

import SwiftUI

struct RecipeListView: View {
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .padding(.top, 40)
                    .font(.largeTitle)
                    .bold()
                    .font(Font.custom("Avenir Heavy", size: 24))
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { recipe in
                            NavigationLink(destination: RecipeDetailView(recipe: recipe), label: {
                                HStack(spacing: 20.0) {
                                    Image(recipe.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    
                                    VStack(alignment: .leading) {
                                        Text(recipe.name)
                                            .foregroundColor(.black)
                                            .font(Font.custom("Avenir Heavy", size: 16))
                                        RecipeHighlights(highlights: recipe.highlights)
                                            .foregroundColor(.black)
                                    }
                                }
                            })
                        }
                    }
                }
            }.padding(.leading)
        }
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
