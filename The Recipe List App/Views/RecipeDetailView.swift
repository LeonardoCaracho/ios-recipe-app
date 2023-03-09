//
//  RecipeDetailView.swift
//  The Recipe List App
//
//  Created by Leonardo Caracho on 05/03/23.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                Text(recipe.name)
                    .padding([.top, .leading], 20)
                    .font(.title)
                    .bold()
                    .font(Font.custom("Avenir Heavy", size: 24))
                
                // MARK: Serving size picker
                VStack(alignment: .leading) {
                    Text("Select your serving size:")
                        .font(.headline)
                        .font(Font.custom("Avenir Heavy", size: 15))
                    
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                        .font(Font.custom("Avenir Heavy", size: 16))
                    
                    ForEach (recipe.ingredients) { ingredient in
                        let portion = RecipeModel.getPortion(
                                ingredient: ingredient,
                                recipeServings: recipe.servings,
                                targetServing: selectedServingSize
                        )
                        
                        Text("• \(portion) \(ingredient.name.lowercased())")
                            .font(Font.custom("Avenir Heavy", size: 15))
                    }
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                        .font(Font.custom("Avenir Heavy", size: 16))
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text("\(index+1). \(recipe.directions[index])")
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[1])
    }
}
