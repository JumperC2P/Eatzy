//
//  ProfileViewController.swift
//  Eatzy
//
//  Created by Michael Macbook Pro on 4/9/20.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, Storyboarded {
    weak var coordinator: ProfileCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

}
