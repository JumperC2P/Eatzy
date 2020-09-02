//
//  RecipeDetailsController.swift
//  Eatzy
//
//  Created by HankLee on 31/8/20.
//  Copyright © 2020 Michael Yue. All rights reserved.
//

import UIKit

class RecipeDetailController: UIViewController{
    
    var isFavorited : Bool = false;
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeServings: UILabel!
    @IBOutlet weak var recipeTime: UILabel!
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var stepTableView: UITableView!
    var recipe: Recipe = Recipe();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        favoriteButton.tintColor = UIColor.black;
        loadInfo();
    }
       
    func loadInfo(){
        FetchURLImages.setImageToImageView(imageUrl: recipe.image, imageView: recipeImage)
        recipeTitle.text = recipe.title;
        recipeServings.text = String(recipe.servings);
        recipeTime.text = String(recipe.readyInMinutes)+" mins";
        ingredientTableView.dataSource = self;
        ingredientTableView.delegate = self;
        stepTableView.dataSource = self;
        stepTableView.delegate = self;
        
    }
    
    @IBAction func tapOnFavorite(_ sender: UIBarButtonItem) {
        
        if isFavorited {
           favoriteButton.image = UIImage(named: "favorite")
           favoriteButton.tintColor = UIColor.black;
        }else{
           favoriteButton.image = UIImage(named: "favorite-fill")
           favoriteButton.tintColor = UIColor.red;
        }

        isFavorited = !isFavorited;
        print("Is favorited: \(isFavorited)")
               
    }
    @IBAction func tapOnAddAllItems(_ sender: Any) {
    
        // create the alert
        let alert = UIAlertController(title: "Successful", message: "All items have been added to grocery list.", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}

extension RecipeDetailController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == ingredientTableView {
            let ingredient = recipe.ingredients[indexPath.row];
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientTableCell") as! IngredientTableViewCell;
            cell.setIngredient(ingredient: ingredient)
            return cell;
        } else {
            let step = recipe.steps[indexPath.row];
            let cell = tableView.dequeueReusableCell(withIdentifier: "StepTableCell") as! StepCell;
            cell.setStep(s: step)
            return cell;
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == ingredientTableView {
            return recipe.ingredients.count;
        } else {
            return recipe.steps.count;
        }
    
    }
    

}
