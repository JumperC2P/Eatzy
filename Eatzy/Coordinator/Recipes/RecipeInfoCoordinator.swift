//
//  RecipeInfoCoordinator.swift
//  Eatzy
//
//  Created by HankLee on 5/9/20.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import UIKit

class RecipeInfoCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var rootViewController: UIViewController {
        return navigationController
    }
    var recipe: Recipe?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let recipeDetailViewController = RecipeDetailController.instantiate(storyboardName: "RecipeInfo")
        recipeDetailViewController.recipe = recipe!
        navigationController.pushViewController(recipeDetailViewController, animated: true)
    }
}
