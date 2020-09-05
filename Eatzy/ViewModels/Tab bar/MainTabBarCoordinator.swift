//
//  MainTabBarCoordinator.swift
//  Eatzy
//
//  Created by Michael Macbook Pro on 5/9/20.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import UIKit

class MainTabBarCoordinator: NSObject, Coordinator, UITabBarControllerDelegate {
    
    var mainTabBarController: UITabBarController
    var childCoordinators = [Coordinator]()
    
    var rootViewController: UIViewController {
        return mainTabBarController
    }
    
    var controllers: [UIViewController] = []
    var generateRecipeCoordinator: GenerateRecipeCoordinator?
    var groceryListCoordinator: GroceryListCoordinator?
    var favoriteCoordinator: FavoritesCoordinator?
    var profileCoordinator: ProfileCoordinator?
    
    init(mainTabBarController: UITabBarController){
        self.mainTabBarController = mainTabBarController
    }
    
    func start(){
        
        generateRecipeCoordinator = GenerateRecipeCoordinator(navigationController: UINavigationController())
        groceryListCoordinator = GroceryListCoordinator(navigationController: UINavigationController())
        favoriteCoordinator = FavoritesCoordinator(navigationController: UINavigationController())
        profileCoordinator = ProfileCoordinator(navigationController: UINavigationController())
        
        generateRecipeCoordinator?.start()
        groceryListCoordinator?.start()
        favoriteCoordinator?.start()
        profileCoordinator?.start()
        
        controllers.append(generateRecipeCoordinator!.navigationController)
        controllers.append(groceryListCoordinator!.navigationController)
        controllers.append(favoriteCoordinator!.navigationController)
        controllers.append(profileCoordinator!.navigationController)
        
        mainTabBarController.viewControllers = controllers
        mainTabBarController.tabBar.isTranslucent = false
        mainTabBarController.delegate = self
        
//        mainTabBarController.selectedViewController = GenerateRecipeViewController
        
    }
}
