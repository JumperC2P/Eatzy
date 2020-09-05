//
//  RecipeResultCoordinator.swift
//  Eatzy
//
//  Created by HankLee on 5/9/20.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import UIKit

class RecipeResultCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var rootViewController: UIViewController {
        return navigationController
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showRecipeInfo (recipe: Recipe){
        let recipeInfoCoordinator = RecipeInfoCoordinator(navigationController: navigationController)
        recipeInfoCoordinator.parentCoordinator = self
        recipeInfoCoordinator.recipe = recipe
        childCoordinators.append(recipeInfoCoordinator)
        recipeInfoCoordinator.start()
    }
    
    func start() {
        let recipeResultViewController = GeneratedRecipeViewController.instantiate(storyboardName: "Recipes")
        recipeResultViewController.coordinator = self
        navigationController.pushViewController(recipeResultViewController, animated: true)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        if navigationController.viewControllers.contains(fromViewController){
            return
        }
        if let recipeInfoViewController = fromViewController as? RecipeDetailController {
            CoordinatorUtils.childDidFinish(childCoordinator: &childCoordinators, child: recipeInfoViewController.coordinator)
        }
    }
    
}
