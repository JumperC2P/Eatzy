//
//  Storyboarded.swift
//  Eatzy
//
//  Created by Michael Macbook Pro on 4/9/20.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import UIKit

// a protocol that allows us instantiate view controllers from Main storyboard.
protocol Storyboarded {}

extension Storyboarded where Self: UIViewController {
    static func instantiate(storyboardName: String) -> Self {
        let storyboardId = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)

        return storyboard.instantiateViewController(withIdentifier: storyboardId) as! Self
    }
}
