//
//  GenerateRecipeCoordinator.swift
//  Eatzy
//
//  Created by Michael Macbook Pro on 4/9/20.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import UIKit

class GenerateRecipeCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var rootViewController: UIViewController {
        return navigationController
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let generateViewController = GenerateRecipeViewController.instantiate(storyboardName: "GenerateRecipe")
        generateViewController.tabBarItem = UITabBarItem(title: "Generate", image: UIImage(named: "kitchen"), tag: 0)
        generateViewController.coordinator = self
        generateViewController.tabBarController?.navigationItem.title = "Generate Recipe"
        navigationController.pushViewController(generateViewController, animated: true)
    }
    
    // find child coordinator in the array
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        if navigationController.viewControllers.contains(fromViewController){
            return
        }
    }
}
