//
//  FavouriteRecipeModelView.swift
//  Eatzy
//
//  Created by Pui Ling Chan on 2/9/20.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import UIKit

struct FavouriteRecipeViewModel{
    
    private (set) var faveRecipes:[MockRecipe] = []
    
    var count: Int{
        return faveRecipes.count
    }
    
    init(){
        loadData()
    }
    
    private mutating func loadData(){
        faveRecipes.append(MockRecipe(recipeName: "Spaghetti Bolognese", servingSize: 3, cookingTime: 30, ingredients:[Grocery(name: "Spaghetti", amount: "200g"), Grocery(name: "Tomato Sauce", amount: "1 can")] , steps: ["Boil the spaghetti until cooked.", "Drain the spaghetti.", "Add tomato sauce"], imageName: "spag"))
        faveRecipes.append(MockRecipe(recipeName: "Fish and Chips", servingSize: 3, cookingTime: 50, ingredients: [Grocery(name: "Fish", amount: "2 fillets"), Grocery(name: "Chips", amount: "1 bag")], steps: ["Fry the fish until golden brown.", "Bake the chips in the oven.", "Put them on a plate and serve with aioli."], imageName: "fishchips"))
    }
    
    func getFaveRecipe(byIndex index: Int) -> (recipeName: String, servingSize: Int, image: UIImage?, cookingTime: Int){
        
        let recipeName = faveRecipes[index].recipeName
        let servingSize = faveRecipes[index].servingSize
        let image = UIImage(named: faveRecipes[index].imageName)
        let cookingTime = faveRecipes[index].cookingTime

        return (recipeName, servingSize, image, cookingTime)
    }
    
    mutating func deleteRecipe(index: Int){
        faveRecipes.remove(at: index)
    }
}
