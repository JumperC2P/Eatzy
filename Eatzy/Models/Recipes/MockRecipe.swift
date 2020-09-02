//
//  MockRecipe.swift
//  Eatzy
//
//  Created by Pui Ling Chan on 3/9/20.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import Foundation

struct MockRecipe {
    let recipeName: String
    let servingSize: Int
    let cookingTime: Int
    let ingredients: [Grocery]
    let steps: [String]
    let imageName: String
}
