//
//  RecipeDetailsController.swift
//  Eatzy
//
//  Created by HankLee on 31/8/20.
//  Copyright © 2020 Michael Yue. All rights reserved.
//

import UIKit

class RecipeDetailController: UIViewController{
    
    var isFavorited : Bool = false;
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // isFavorited = false;
        favoriteButton.tintColor = UIColor.black;
    }
    
    @IBAction func tapOnFavorite(_ sender: UIBarButtonItem) {
        
        if isFavorited {
           favoriteButton.image = UIImage(named: "favorite")
           favoriteButton.tintColor = UIColor.black;
        }else{
           favoriteButton.image = UIImage(named: "favorite-fill")
           favoriteButton.tintColor = UIColor.red;
        }

        isFavorited = !isFavorited;
               
    }
}
