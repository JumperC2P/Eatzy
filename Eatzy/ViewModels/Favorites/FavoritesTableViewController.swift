//
//  FavoritesTableViewController.swift
//  Eatzy
//
//  Created by HankLee on 3/9/20.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//
import UIKit

class FavoritesTableViewController: UITableViewController, UISplitViewControllerDelegate, Storyboarded {
    weak var coordinator: FavoritesCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        self.splitViewController?.preferredDisplayMode = .allVisible;
        self.splitViewController?.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Favorites"
        self.tableView.reloadData();
    }
    
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController) -> Bool {
        // Return true to prevent UIKit from applying its default behavior
        return true
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return FavoriteRecipesData.favoriteRecipes.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesViewCell", for: indexPath) as! FavoritesViewCell;
        
        cell.setRecipe(recipe: FavoriteRecipesData.favoriteRecipes[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.showRecipe(recipe: FavoriteRecipesData.favoriteRecipes[indexPath.row], from: "Favorites")

    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    // delete button
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .destructive, title:"Delete"){
            (action,view,completion) in
            FavoriteRecipesData.removeRecipe(byIndex: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.1725490196, blue: 0, alpha: 1)
        return action
    }
    
}
