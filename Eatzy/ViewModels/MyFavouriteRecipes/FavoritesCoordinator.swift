//
//  FavouriteCoordinator.swift
//  Eatzy
//
//  Created by Michael Macbook Pro on 4/9/20.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import UIKit

class FavoritesCoordinator: Coordinator {

    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var splitViewController: UISplitViewController
    var rootViewController: UIViewController {
        return splitViewController
    }
    var mainTabBarController: UITabBarController?
    
    init(splitViewController: UISplitViewController) {
        self.splitViewController = splitViewController
    }
    
    func start() {
        let favoriteViewController = FavoritesTableViewController.instantiate(storyboardName: "Favorites")
        favoriteViewController.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(named: "favorite"), tag: 2)
        favoriteViewController.coordinator = self
        
    }
}
