//
//  RecipesData.swift
//  Eatzy
//
//  Created by HankLee on 1/9/20.
//  Copyright © 2020 Michael Yue. All rights reserved.
//

import Foundation

class RecipesData {
    static var topRecipe = Recipe();
    static var otherRecipes = [Recipe]();
    
    static func generateData(){
       
        if let path = Bundle.main.path(forResource: "recipes_data", ofType: "json") {

           do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONDecoder().decode(RecipeResponse.self, from: data)
                
            topRecipe = jsonResult.main;
            otherRecipes = jsonResult.others_recommendations;
            
            FavoriteRecipesData.favoriteRecipes.append(topRecipe);
            
           } catch {
              print(error)
           }
        }else{
            print("WHAT")
        }
    }
}
