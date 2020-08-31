//
//  RecipeResponse.swift
//  Eatzy
//
//  Created by HankLee on 1/9/20.
//  Copyright © 2020 Michael Yue. All rights reserved.
//

import Foundation

struct RecipeResponse: Codable {
    
    var main: Recipe;
    var others_recommendations: [Recipe]
    
}
