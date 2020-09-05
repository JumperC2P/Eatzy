//
//  Coordinator.swift
//  Eatzy
//
//  Created by Michael Macbook Pro on 5/9/20.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import Foundation
import UIKit

/// Used to dictate the basics of all coordinators in the app.
protocol Coordinator: AnyObject {
    var rootViewController: UIViewController { get }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}
