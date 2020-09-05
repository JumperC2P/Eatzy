//
//  RecipeResponse.swift
//  Eatzy
//
//  Created by HankLee on 1/9/20.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import Foundation

struct RecipeResponse: Codable {
    
    var main: Recipe;
    var others_recommendations: [Recipe]
    
}
