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
                                    Text(recipe.name)
                                        .foregroundColor(.black)
                                }
                            })
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .padding(.leading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
