//
//  PickerViewController.swift
//  Eatzy
//
//  Created by Michael Macbook Pro on 27/8/20.
//  Copyright © 2020 Michael Yue. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerCuisine: UIPickerView!
    @IBOutlet weak var pickerDiet: UIPickerView!
    @IBOutlet weak var pickerMealType: UIPickerView!
    
    
    var pickerData: [String] = [String]()
    var pickerData2: [String] = [String]()
    var pickerData3: [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Connect data:
        pickerCuisine.delegate = self
        pickerCuisine.dataSource = self
        pickerCuisine.tag = 1
        
        pickerDiet.delegate = self
        pickerDiet.dataSource = self
        pickerDiet.tag = 2
        
        pickerMealType.delegate = self
        pickerMealType.dataSource = self
        pickerMealType.tag = 3
        
        // Do any additional setup after loading the view.
        
        pickerData = ["Italian", "African", "British", "Chinese", "European", "French"]
        pickerData2 = ["Gluten Free", "Ketogenic", "Vegetarian", "Lacto-Vegetarian", "Pescetarian", "Primal"]
        pickerData3 = ["main course", "side dish", "dessert", "appetizer", "salad", "bread"]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return pickerData.count
        case 2:
            return pickerData2.count
        case 3:
            return pickerData3.count
        default:
            return -1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return pickerData[row]
        case 2:
            return pickerData2[row]
        case 3:
            return pickerData3[row]
        default:
            return ""
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
