//
//  IngredientTableViewCell.swift
//  Eatzy
//
//  Created by HankLee on 1/9/20.
//  Copyright © 2020 Michael Yue. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {


    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var unit: UILabel!
    var ingredient: Ingredient = Ingredient();
    

    func setIngredient(ingredient ig: Ingredient){
        ingredient = ig;
        name.text = ig.name;
        amount.text = String(ig.amount);
        unit.text = ig.unit;
        
    }
    
}
