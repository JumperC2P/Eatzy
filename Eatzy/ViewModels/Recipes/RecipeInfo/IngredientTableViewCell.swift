//
//  IngredientTableViewCell.swift
//  Eatzy
//
//  Created by HankLee on 1/9/20.
//  Copyright © 2020 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {


    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var unit: UILabel!
    @IBOutlet weak var addItemButton: UIButton!
    
    var ingredient: Ingredient = Ingredient();

    func setIngredient(ingredient ig: Ingredient){
        ingredient = ig;
        name.text = ig.name;
        amount.text = String(ig.amount);
        unit.text = ig.unit;
        
        self.checkGroceryList();
    }
    
    @IBAction func addItemToGroceryList(_ sender: UIButton) {
        
        if addItemButton.imageView?.image==UIImage(named: "circle") {
            addItemButton.setImage(UIImage(named: "check-in"), for: .normal)
            GroceryViewModel.addGroceryItem(grocery: Grocery(name: name.text!, amount: "\(amount.text!) \(unit.text!)"))
        }else{
            addItemButton.setImage(UIImage(named: "circle"), for: .normal)
            GroceryViewModel.deleteGroceryItem(name: name.text!, amount: "\(amount.text!) \(unit.text!)")
        }
    }
    
    func checkGroceryList() {
        
        if GroceryViewModel.isExistInGroceryList(name: name.text!, amount: "\(amount.text!) \(unit.text!)") {
            addItemButton.setImage(UIImage(named: "check-in"), for: .normal)
        }else{
            addItemButton.setImage(UIImage(named: "circle"), for: .normal)
        }
        
    }
}
