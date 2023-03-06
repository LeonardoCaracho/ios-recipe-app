//
//  RecipeModel.swift
//  The Recipe List App
//
//  Created by Leonardo Caracho on 05/03/23.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        recipes = DataService.getLocalData()
    }
}
