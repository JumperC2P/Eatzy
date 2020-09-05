//
//  MainTabBarController.swift
//  Eatzy
//
//  Created by Michael Macbook Pro on 4/9/20.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let main = MainTabBarCoordinator(mainTabBarController: UITabBarController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        main.start()
        viewControllers = main.controllers
    }
}
