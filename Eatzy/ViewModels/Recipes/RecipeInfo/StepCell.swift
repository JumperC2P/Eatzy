//
//  StepCell.swift
//  Eatzy
//
//  Created by HankLee on 1/9/20.
//  Copyright © 2020 Michael Yue. All rights reserved.
//

import UIKit

class StepCell: UITableViewCell {

    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    func setStep(s: Step){
        number.text = String(s.number);
        desc.text = s.description;
    }
}

