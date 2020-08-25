//
//  GroceryViewModel.swift
//  Eatzy
//
//  Created by Yunying Ma on 2020/8/24.
//  Copyright © 2020 Michael Yue. All rights reserved.
//

import Foundation

// used to modify the data of grocery items
class GroceryViewModel {

    static func loadGroceryItems(){
        groceryData.groceryModel.append(Grocery(name: "Ground Beef", amount: "1 lb"))
        groceryData.groceryModel.append(Grocery(name: "Crushed Tomatoes", amount: "1 can"))
        groceryData.groceryModel.append(Grocery(name: "Red pepper", amount: "1/2 tsp."))
        groceryData.groceryModel.append(Grocery(name: "Oion", amount: "1 lb."))
        groceryData.groceryModel.append(Grocery(name: "Extra olive oil", amount: "1 bottle"))
        groceryData.groceryModel.append(Grocery(name: "Butter", amount: "1 bottle"))
    }
    
    static func updateGroceryItem(byIndex index: Int, newItem item:Grocery) {
        groceryData.groceryModel[index] = item
    }
    
    static func deleteGroceryItem(byIndex index: Int) {
        print("current length is + \(groceryData.groceryModel.count)")
        groceryData.groceryModel.remove(at: index)
    }
    
    static func addGroceryItem(byIndex index:Int, newItem item:Grocery) {
        groceryData.groceryModel.insert(item, at: index)
    }
    
    static func getGroceryItem(byIndex index:Int) -> Grocery{
        return groceryData.groceryModel[index]
    }
}
