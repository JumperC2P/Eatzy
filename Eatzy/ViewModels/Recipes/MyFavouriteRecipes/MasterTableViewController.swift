//
//  MasterTableViewController.swift
//  Eatzy
//
//  Created by Pui Ling Chan on 2/9/20.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    @IBOutlet var tView: UITableView!{
        didSet{
            tView.tableFooterView = UIView(frame: .zero)
        }
    }
    
    private var viewModel = FavouriteRecipeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FRCell", for: indexPath)

        let imageView = cell.viewWithTag(1000) as? UIImageView
        
        let recipeName = cell.viewWithTag(1001) as? UILabel
        
        let servingSize = cell.viewWithTag(1003) as? UILabel
        
        let cookingTime = cell.viewWithTag(1002) as? UILabel
        
        if let imageView = imageView, let recipeName = recipeName, let servingSize = servingSize, let cookingTime = cookingTime{
            
            let currentRecipe = viewModel.getFaveRecipe(byIndex: indexPath.row)
            
            imageView.image = currentRecipe.image
            recipeName.text = currentRecipe.recipeName
            servingSize.text = String(currentRecipe.servingSize)
            cookingTime.text = String(currentRecipe.cookingTime)
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            viewModel.deleteRecipe(index: indexPath.row)
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 
        return true
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
