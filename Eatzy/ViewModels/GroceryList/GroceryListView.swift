//
//  GroceryListView.swift
//  Eatzy
//
//  Created by mary ma on 2020/8/17.
//  Copyright © 2020 Michael Yue. All rights reserved.
//

import UIKit

class GroceryListView: UITableView{
//    var items:[Grocery] = [
//        Grocery(name: "Ground Beef", amount: "1 lb"),
//        Grocery(name: "Crushed Tomatoes", amount: "1 can")
//    ]
    
    var selectArr = [String]()
    
    func selectDeselectCell(tableView:UITableView, indexPath:IndexPath){
        self.selectArr.removeAll()
        if let arr = self.indexPathForSelectedRow{
            print(arr)
        }
    }
    
}

extension GroceryListView: UITableViewDelegate{

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath){
        self.selectDeselectCell(tableView: self, indexPath: indexPath)
        print("select")
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.selectDeselectCell(tableView: self, indexPath: indexPath)
        print("deselect")
    }
}
