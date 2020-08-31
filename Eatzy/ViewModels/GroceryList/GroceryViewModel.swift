//
//  GroceryViewModel.swift
//  Eatzy
//
//  Created by Yunying Ma on 2020/8/24.
//  Copyright © 2020 Michael Yue. All rights reserved.
//

import Foundation

// store functions used to modify the data of grocery items
class GroceryViewModel {
    // add initial mockup data
    static func loadGroceryItems(){
        groceryData.groceryModel.append(Grocery(name: "Ground Beef", amount: "1 lb"))
        groceryData.groceryModel.append(Grocery(name: "Crushed Tomatoes", amount: "1 can"))
        groceryData.groceryModel.append(Grocery(name: "Red pepper", amount: "1/2 tsp."))
        groceryData.groceryModel.append(Grocery(name: "Oion", amount: "1 lb."))
        groceryData.groceryModel.append(Grocery(name: "Extra olive oil", amount: "1 bottle"))
        groceryData.groceryModel.append(Grocery(name: "Butter", amount: "1 bottle"))
    }
    
    // update item with index and new instance
    static func updateGroceryItem(byIndex index: Int, newItem item:Grocery) {
        groceryData.groceryModel[index] = item
    }
    
    // update item with new status
    static func updateCompleteStatus(byIndex index:Int, complete:Bool){
        groceryData.groceryModel[index].complete = complete
    }
    
    // delete item by index
    static func deleteGroceryItem(byIndex index: Int) {
        print("current length is + \(groceryData.groceryModel.count)")
        groceryData.groceryModel.remove(at: index)
    }
    
    // add item in target position
    static func addGroceryItem(byIndex index:Int, newItem item:Grocery) {
        groceryData.groceryModel.insert(item, at: index)
    }
    
    // get item from index
    static func getGroceryItem(byIndex index:Int) -> Grocery{
        return groceryData.groceryModel[index]
    }
    
    // reverse current status
    static func changeItemStatus(byIndex index:Int){
        groceryData.groceryModel[index].complete = !groceryData.groceryModel[index].complete
    }
    
    // get status by index
    static func getStatus(byIndex index:Int) -> Bool{
        return groceryData.groceryModel[index].complete
    }
}
