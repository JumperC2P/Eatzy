//
//  GroceryListCoordinator.swift
//  Eatzy
//
//  Created by Michael Macbook Pro on 4/9/20.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import UIKit

class GroceryListCoordinator: Coordinator {
    
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
        let groceryViewController = GroceryListViewController.instantiate(storyboardName: "GroceryList")
        groceryViewController.tabBarItem = UITabBarItem(title: "Grocery", image: UIImage(named: "checklist"), tag: 1)
        groceryViewController.coordinator = self
        navigationController.pushViewController(groceryViewController, animated: true)
    }
}
