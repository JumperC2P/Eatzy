//
//  AddItemViewController.swift
//  Eatzy
//
//  Created by Yunying Ma on 2020/8/22.
//  Copyright © 2020 RMIT-2020IPSE-G12. All rights reserved.
//

import UIKit

class EditItemViewController: UIViewController {
    
    // elements
    @IBOutlet weak var popOverView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputAmount: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    // attributes required from source controller
    var editIndex: Int?
    var doneSaving: (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // style the pop over window
        self.popOverView.layer.shadowOpacity = 1
        popOverView.layer.shadowOffset = CGSize.zero
        popOverView.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        popOverView.layer.cornerRadius = 10
        popOverView.backgroundColor = #colorLiteral(red: 0.9835441126, green: 0.9644835272, blue: 0.9227579653, alpha: 1)
        
        // style the cancel button
        cancelButton.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        cancelButton.layer.cornerRadius = cancelButton.frame.height/2
        cancelButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        // style the save button
        saveButton.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        saveButton.layer.cornerRadius = cancelButton.frame.height/2
        saveButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        // get data and display
        if let index = editIndex {
            let item = GroceryViewModel.getGroceryItem(byIndex: index)
            inputName.text = item.name
            inputAmount.text = item.amount
        }
        
    }
    
    // cancel
    @IBAction func cancelAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // save changes into model when name is not empty
    @IBAction func saveAction(_ sender: UIButton) {
        if let name = inputName.text, !name.isEmpty{
            let new = Grocery(name: name, amount: inputAmount.text!)
            GroceryViewModel.updateGroceryItem(byIndex: editIndex!, newItem: new)
            // reload data
            if let doneSaving = doneSaving{
                doneSaving()
            }
            dismiss(animated: true)
        }
    }
}
