//
//  RecipeFeaturedView.swift
//  The Recipe List App
//
//  Created by Leonardo Caracho on 07/03/23.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        let featuredRecipes = model.getFeaturedRecipes()
        
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured Recipes")
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
                .bold()
                .font(Font.custom("Avenir Heavy", size: 24))
            
            GeometryReader { geo in
                TabView (selection: $tabSelectionIndex) {
                    ForEach (0..<featuredRecipes.count) { index in
                        let recipe = featuredRecipes[index]
                        if recipe.featured {
                            Button(action: {
                                isDetailViewShowing = !isDetailViewShowing
                            }) {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    VStack(spacing: 0) {
                                        Image(recipe.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(recipe.name)
                                            .padding(5)
                                            .font(Font.custom("Avenir Heavy", size: 15))
                                    }
                                }
                            }
                            .tag(index)
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time: ")
                    .font(.headline)
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir Heavy", size: 15))
                Text("Highlights")
                    .font(.headline)
                    .font(Font.custom("Avenir Heavy", size: 15))
                RecipeHighlights(
                    highlights: model.recipes[tabSelectionIndex].highlights
                )
            }
            .padding([.leading, .bottom])
        }
        .sheet(isPresented: $isDetailViewShowing){
            RecipeDetailView(recipe: featuredRecipes[tabSelectionIndex])
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}
