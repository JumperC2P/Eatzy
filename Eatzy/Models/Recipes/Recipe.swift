//
//  RecipesData.swift
//  Eatzy
//
//  Created by HankLee on 31/8/20.
//  Copyright © 2020 Michael Yue. All rights reserved.
//

import Foundation

struct Recipe: Codable  {
    
    init() {
        self.id = 0
        self.readyInMinutes = 0
        self.servings = 0
        self.image=""
        self.title=""
        self.steps=[Step]()
        self.ingredients=[Ingredient]()
        
    }
    
    let id: Int
    let readyInMinutes: Int
    let servings: Int
    let image: String
    let title: String
    let steps: [Step]
    let ingredients: [Ingredient]
}

struct Step: Codable  {
    
    init(){
        self.number = 0
        self.description = ""
    }
    
    let number: Int
    let description: String
}

struct Ingredient: Codable  {
    
    init(){
        self.name = ""
        self.amount = 0
        self.unit = ""
    }
    
    let name: String
    let amount: Double
    let unit: String
}

