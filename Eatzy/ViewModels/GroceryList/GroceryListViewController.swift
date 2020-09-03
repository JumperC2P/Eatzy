//
//  GroceryListViewController.swift
//  Eatzy
//
//  Created by Yunying Ma on 2020/8/16.
//  Copyright © 2020 Michael Yue. All rights reserved.
//

import UIKit
import Foundation

class GroceryListViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    var selectArr = [String]()
    var editIndex: Int?
    @IBOutlet weak var AddItemTextField: UITextField!
    @IBOutlet weak var GroceryListView: UITableView!
    @IBOutlet weak var newName: UITextField!
    @IBOutlet weak var newAmount: UITextField!
 
    // add new items from user
    @IBAction func AddItemButtonPressed(_ sender: UIButton) {
        let amount = newAmount.text
        if let name = newName.text, !name.isEmpty{
            // add into array
            GroceryViewModel.addGroceryItem(byIndex: 0, newItem: Grocery(name:name, amount: amount!))
            
            // update table view with animation
            GroceryListView.beginUpdates()
            GroceryListView.insertRows(at: [IndexPath(row:0,section: 0)], with: .automatic)
            GroceryListView.endUpdates()
            
            // reset text field
            newAmount.text = nil
            newName.text = nil
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GroceryListView.dataSource = self
        GroceryListView.delegate = self
        
        // style table view: cancel the separators for empty cells
        GroceryListView.tableFooterView = UIView.init(frame: .zero)
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.4235294118, green: 0.4823529412, blue: 0.5843137255, alpha: 1)

        // load initial data (mock-up)
        GroceryViewModel.loadGroceryItems()
        
        // only allow single selection in table view
        self.GroceryListView.allowsSelection = true;
        self.GroceryListView.allowsMultipleSelection = false;
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        GroceryListView.reloadData();
    }
    
    // segue for editing items, pass essential information and functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditItemSegue"{
            segue.destination.popoverPresentationController?.delegate = self
            let popup = segue.destination as! EditItemViewController
            popup.editIndex = self.editIndex
            popup.doneSaving = {[weak self] in
                self?.GroceryListView.reloadData()
            }
        }
    }
    
    // show popover in iphone
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }


    
}

//fill the cell with provided data
extension GroceryListViewController:UITableViewDataSource{
    // number of rows in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceryData.groceryModel.count
    }
    
    // content in each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroceryCell", for: indexPath)
        let current = GroceryViewModel.getGroceryItem(byIndex: indexPath.row)
        cell.detailTextLabel?.text = current.amount

        // if current record is completed, then render it with strikethrough and grey background
        // otherwise, render with normal text
        if(current.complete){
            print("item completed")
            let attrStr = NSMutableAttributedString.init(string: current.name)
            attrStr.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSNumber.init(value: 1), range: NSRange.init(location:0, length: current.name.count))
            cell.textLabel?.attributedText = attrStr
            cell.contentView.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8274509804, blue: 0.8039215686, alpha: 1)
        }
        else{
            let attrStr = NSMutableAttributedString.init(string: current.name)
            cell.textLabel?.attributedText = attrStr
            cell.contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        return cell
    }
}


extension GroceryListViewController: UITableViewDelegate{
    
    // swipe from right hand side: edit and delete
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = editAction(at: indexPath)
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete,edit])
    }
    
    // swipe from left hand side: compelete or undo
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let complete = completeAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [complete])
        
    }
    
    // edit button
    func editAction(at indexPath: IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .normal, title:"Edit"){
            (action,view,completion) in
            // set current edit index and perform segue
            self.editIndex = indexPath.row
            self.performSegue(withIdentifier: "EditItemSegue", sender: nil)
            completion(true)
        }
        action.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.6666666667, blue: 0.6588235294, alpha: 1)
        return action
    }
    
    // delete button
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .destructive, title:"Delete"){
            (action,view,completion) in
            GroceryViewModel.deleteGroceryItem(byIndex: indexPath.row)
            self.GroceryListView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.1725490196, blue: 0, alpha: 1)
        return action
    }
    
    // complete/undo button
    func completeAction(at indexPath: IndexPath) -> UIContextualAction {
        // if current cell is completed, render undo button
        if(GroceryViewModel.getStatus(byIndex: indexPath.row)){
            let action = UIContextualAction(style: .normal, title:"Undo"){
                (action,view,completion) in
                GroceryViewModel.changeItemStatus(byIndex: indexPath.row)
                self.GroceryListView.reloadRows(at: [indexPath], with: .automatic)
                completion(true)
            }
            action.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.6392156863, blue: 0.1019607843, alpha: 1)
            return action
        }
        // otherwise, render complete button
        else{
            let action = UIContextualAction(style: .normal, title:"Complete"){
                (action,view,completion) in
                GroceryViewModel.changeItemStatus(byIndex: indexPath.row)
                self.GroceryListView.reloadRows(at: [indexPath], with: .automatic)
                completion(true)
            }
            action.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            return action
        }

    }
    
}

//extension GroceryListViewController:UIPopoverPresentationControllerDelegate{
//    override func prepare(for segue:){
//
//    }
//}
