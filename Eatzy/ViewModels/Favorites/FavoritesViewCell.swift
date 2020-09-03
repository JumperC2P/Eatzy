//
//  FavoritesViewCell.swift
//  Eatzy
//
//  Created by HankLee on 3/9/20.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import UIKit

class FavoritesViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellServings: UILabel!
    @IBOutlet weak var cellTime: UILabel!
    
    func setRecipe(recipe: Recipe) {
        FetchURLImages.setImageToImageView(imageUrl: recipe.image, imageView: cellImage)
        cellTitle.text = recipe.title;
        cellServings.text = String(recipe.servings);
        cellTime.text = String(recipe.readyInMinutes)+" mins";
    }
}
