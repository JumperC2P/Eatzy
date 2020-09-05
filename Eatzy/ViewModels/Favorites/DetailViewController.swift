//
//  DetailViewController.swift
//  Eatzy
//
//  Created by HankLee on 3/9/20.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var textt = "TEST"

    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = textt;
        // Do any additional setup after loading the view.
    }

}
