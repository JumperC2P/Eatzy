//
//  RecipeViewCell.swift
//  Eatzy
//
//  Created by HankLee on 1/9/20.
//  Copyright © 2020 Michael Yue. All rights reserved.
//

import UIKit

class RecipeViewCell: UITableViewCell {

    @IBOutlet weak var otherImageView: UIImageView!
    @IBOutlet weak var otherRecipeTitle: UILabel!
    @IBOutlet weak var otherRecipeServings: UILabel!
    @IBOutlet weak var otherRecipeTime: UILabel!
    
    func setRecipe(recipe: Recipe) {
        print(recipe.image);
        FetchImages.setImageToImageView(imageUrl: recipe.image, imageView: otherImageView)
        otherRecipeTitle.text = recipe.title;
        otherRecipeServings.text = String(recipe.servings);
        otherRecipeTime.text = String(recipe.readyInMinutes)+" mins";
    }
    
}
