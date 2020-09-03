//
//  FavoriteRecipesData.swift
//  Eatzy
//
//  Created by HankLee on 3/9/20.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import Foundation

class FavoriteRecipesData {
    
    static var favoriteRecipes = [Recipe]();
    
    static func addFavoriteRecipes(recipe: Recipe){
        favoriteRecipes.append(recipe);
    }
    
    static func removeRecipe(recipe: Recipe){
        for i in 0...favoriteRecipes.count-1 {
            if favoriteRecipes[i].id == recipe.id {
                favoriteRecipes.remove(at: i);
                break;
            }
        }
    }
    
    static func isExistInFavorites(recipe: Recipe) -> Bool{
        if favoriteRecipes.count > 0 {
            for i in 0...favoriteRecipes.count-1 {
                if favoriteRecipes[i].id == recipe.id {
                    return true;
                }
            }
        }
        return false;
    }
    
    static func removeRecipe(byIndex: Int){
        favoriteRecipes.remove(at: byIndex);
    }
}
