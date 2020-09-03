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
    @IBOutlet weak var addAllButton: UIButton!
    var recipe: Recipe = Recipe();
    var from: String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if from == "Favorites" {
//            favoriteButton.isEnabled = false;
//            favoriteButton.image = UIImage(named: "favorite-fill")
            self.navigationItem.rightBarButtonItem = nil;
        }else {
            if FavoriteRecipesData.isExistInFavorites(recipe: recipe){
                favoriteButton.image = UIImage(named: "favorite-fill")
                favoriteButton.tintColor = UIColor.red;
                
            }
            addAllButton.isEnabled = false;
            let count = recipe.ingredients.count;
            if count > 0 {
                for i in 0..<count {
                    let cell = recipe.ingredients[i];
                    if !GroceryViewModel.isExistInGroceryList(name: cell.name, amount: "\(cell.amount) \(cell.unit)"){
                        addAllButton.isEnabled = true;
                        break;
                    }
                }
            }
        }
        
        if recipe.title != "" {
            loadInfo();
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ingredientTableView.reloadData();
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
        
        if from != "Favorites" {
            if isFavorited {
                favoriteButton.image = UIImage(named: "favorite")
                favoriteButton.tintColor = UIColor.black;
                
                // Delete recipes from FavoriteRecipe Array
                FavoriteRecipesData.removeRecipe(recipe: recipe);
                
            }else{
                favoriteButton.image = UIImage(named: "favorite-fill")
                favoriteButton.tintColor = UIColor.red;
                
                // add to FavoriteRecipe Array
                FavoriteRecipesData.addFavoriteRecipes(recipe: recipe);
                
            }
            isFavorited = !isFavorited;
        }
    
    }
    @IBAction func tapOnAddAllItems(_ sender: Any) {
        
        let count = recipe.ingredients.count;
        if count > 0 {
            for i in 0..<count {
                let cell = recipe.ingredients[i];
                GroceryViewModel.addGroceryItem(grocery: Grocery(name: cell.name, amount: "\(String(describing: cell.amount)) \(cell.unit)"));
            }
            ingredientTableView.reloadData();
            addAllButton.isEnabled = false;
            // create the alert
            let alert = UIAlertController(title: "Successful", message: "All items have been added to grocery list.", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView == ingredientTableView {
            let ingredient = cell as! IngredientTableViewCell;
            ingredient.checkGroceryList();
        }
    }
    
}
