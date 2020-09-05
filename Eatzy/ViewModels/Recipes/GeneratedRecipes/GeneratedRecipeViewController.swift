//
//  RecipesViewController.swift
//  Eatzy
//
//  Created by HankLee on 31/8/20.
//  Copyright © 2020 Michael Yue. All rights reserved.
//

import UIKit

class GeneratedRecipeViewController: UIViewController, Storyboarded {

    @IBOutlet weak var topRecipeImage: UIImageView!
    @IBOutlet weak var topRecipeTitle: UILabel!
    @IBOutlet weak var topRecipeServings: UILabel!
    @IBOutlet weak var topRecipeTime: UILabel!
    @IBOutlet weak var otherRecipeTableView: UITableView!
    @IBOutlet weak var topRecipeView: UIView!
    @IBOutlet weak var generateButton: UIButton!
    
    var topRecipe: Recipe = Recipe();
    var selectRecipe: Recipe = Recipe();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTopRecipe();
        otherRecipeTableView.delegate = self;
        otherRecipeTableView.dataSource = self;
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.tapTopRecipeView))
        self.topRecipeView.addGestureRecognizer(gesture)
        
    }
    
    @objc func tapTopRecipeView(sender : UITapGestureRecognizer) {
        selectRecipe = topRecipe;
        performSegue(withIdentifier: "RecipeInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecipeInfo" {
            let recipesController = segue.destination as! RecipeDetailController;
            recipesController.recipe = selectRecipe;
        }
    }
    @IBAction func regenerateRecipes(_ sender: Any) {
        
        // create the alert
        let alert = UIAlertController(title: "Next Plan", message: "The button will be used to connect with REST API to refetch recipes", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func loadTopRecipe() {
        
        topRecipe = RecipesData.topRecipe;
        
        FetchURLImages.setImageToImageView(imageUrl: topRecipe.image, imageView: topRecipeImage)
        topRecipeTitle.text = topRecipe.title;
        topRecipeServings.text = String(topRecipe.servings);
        topRecipeTime.text = String(topRecipe.readyInMinutes)+" mins";
        
    }
    
    
}

extension GeneratedRecipeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecipesData.otherRecipes.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = RecipesData.otherRecipes[indexPath.row];
        let cell = tableView.dequeueReusableCell(withIdentifier: "OtherRecipes") as! RecipeViewCell;
        cell.setRecipe(recipe: recipe)
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectRecipe = RecipesData.otherRecipes[indexPath.row];
        performSegue(withIdentifier: "RecipeInfo", sender: self)
    }
}

