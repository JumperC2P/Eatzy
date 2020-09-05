//
//  CoordinatorUtils.swift
//  Eatzy
//
//  Created by HankLee on 5/9/20.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import UIKit

class CoordinatorUtils {
    // find child coordinator in the array
    static func childDidFinish(childCoordinator: inout [Coordinator], child: Coordinator?) {
        for (index, coordinator) in childCoordinator.enumerated() {
            if coordinator === child {
                childCoordinator.remove(at: index)
                break
            }
        }
    }
}
