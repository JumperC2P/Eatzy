//
//  Grocery.swift
//  Eatzy
//
//  Created by Yunying Ma on 2020/8/16.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import Foundation

// set up the structure of grocery items
struct Grocery {
    let name:String
    let amount:String
    var complete:Bool
    
    init(name:String, amount:String) {
        self.name = name
        self.amount = amount
        self.complete = false
    }

}


