//
//  GroceryListViewController.swift
//  Eatzy
//
//  Created by Yunying Ma on 2020/8/16.
//  Copyright © 2020 Michael Yue. All rights reserved.
//

import UIKit
import Foundation

class GroceryListViewController: UIViewController {

    var selectArr = [String]()
    var editIndex: Int?
    @IBOutlet weak var AddItemTextField: UITextField!
    @IBOutlet weak var GroceryListView: UITableView!
    

    @IBOutlet weak var newName: UITextField!
    @IBOutlet weak var newAmount: UITextField!
    
//    @IBOutlet weak var GroceryCell: UITableViewCell!
    
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
    

//    var items:[Grocery] = [
//        Grocery(name: "Ground Beef", amount: "1 lb"),
//        Grocery(name: "Crushed Tomatoes", amount: "1 can")
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GroceryListView.dataSource = self
        GroceryListView.delegate = self
        
        // style table view
        GroceryListView.tableFooterView = UIView.init(frame: .zero)
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.4235294118, green: 0.4823529412, blue: 0.5843137255, alpha: 1)

        // load data
        GroceryViewModel.loadGroceryItems()
        
        // allow multiple selection in table
        self.GroceryListView.allowsSelection = true;
        self.GroceryListView.allowsMultipleSelection = false;
//        self.GroceryListView.allowsMultipleSelectionDuringEditing = true
    }
    
    // segue for editing items, pass essential information
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditItemSegue"{
            let popup = segue.destination as! EditItemViewController
            popup.editIndex = self.editIndex
            popup.doneSaving = {[weak self] in
                self?.GroceryListView.reloadData()
            }
        }
    }
    

    
    // ??????????
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete{
//            self.items.remove(at: indexPath.row)
//
//        }
//    }

    
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
        cell.textLabel?.text = current.name
        cell.detailTextLabel?.text = current.amount
//        cell.selectedBackgroundView = UIView()
//        cell.selectedBackgroundView?.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
//        cell.textLabel?.highlightedTextColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        if(cell.isSelected){
//            let attrStr = NSMutableAttributedString.init(string: current.name)
//            attrStr.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSNumber.init(value: 1), range: NSRange.init(location:0, length: current.name.count))
//            cell.textLabel?.attributedText = attrStr
//        }
        
        if(current.complete){
            print("item completed")
//            cell.selectedBackgroundView = UIView()
//            cell.selectedBackgroundView?.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
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

    // get the item selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath){
//        self.selectDeselectCell(tableView: GroceryListView, indexPath: indexPath)
//        GroceryViewModel.changeItemStatus(byIndex: indexPath.row)
//        print("select + \(GroceryListView.cellForRow(at: indexPath)?.isSelected)")
//        self.GroceryListView.reloadData()
    }
    
    // get the item deselected
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        self.selectDeselectCell(tableView: GroceryListView, indexPath: indexPath)
//        var currentItem = GroceryViewModel.getGroceryItem(byIndex: indexPath.row)
//        currentItem.complete = false
//        print("deselect + \(GroceryListView.cellForRow(at: indexPath)?.isSelected)")
//        GroceryViewModel.updateCompleteStatus(byIndex: indexPath.row, complete: false)
//        self.GroceryListView.reloadData()
    }
    
    
    func selectDeselectCell(tableView:UITableView, indexPath:IndexPath){
        self.selectArr.removeAll()
        if let arr = GroceryListView.indexPathForSelectedRow{
            print(arr)
        }
    }
    
    // swipe from right hand side
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = editAction(at: indexPath)
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete,edit])
    }
    
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
    
    func completeAction(at indexPath: IndexPath) -> UIContextualAction {
        
        if(GroceryViewModel.getStatus(byIndex: indexPath.row)){
            let action = UIContextualAction(style: .normal, title:"Undo"){
                (action,view,completion) in
                GroceryViewModel.changeItemStatus(byIndex: indexPath.row)
                //            self.GroceryListView.reloadData()
                self.GroceryListView.reloadRows(at: [indexPath], with: .automatic)
                completion(true)
            }
            
            action.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.6392156863, blue: 0.1019607843, alpha: 1)
            return action
        }
        else{
            let action = UIContextualAction(style: .normal, title:"Complete"){
                (action,view,completion) in
                GroceryViewModel.changeItemStatus(byIndex: indexPath.row)
                //            self.GroceryListView.reloadData()
                self.GroceryListView.reloadRows(at: [indexPath], with: .automatic)
                completion(true)
            }
            
            action.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            return action
        }

    }
    
}
