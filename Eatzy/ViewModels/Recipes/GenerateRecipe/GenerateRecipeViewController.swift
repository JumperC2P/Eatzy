//
//  PickerViewController.swift
//  Eatzy
//
//  Created by Michael Macbook Pro on 27/8/20.
//  Copyright © 2020 Michael Yue. All rights reserved.
//

import UIKit

class GenerateRecipeViewController: UIViewController, Storyboarded {
    weak var coordinator: GenerateRecipeCoordinator?

    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var textFieldTwo: UITextField!
    @IBOutlet weak var textFieldThree: UITextField!
    @IBOutlet weak var textFieldFour: UITextField!
    
    
    fileprivate let pickerCuisine = ToolbarPickerView()
    fileprivate let pickerDiet = ToolbarPickerView()
    fileprivate let pickerMealType = ToolbarPickerView()
    fileprivate let pickerIntolerance = ToolbarPickerView()
    
    fileprivate let pickerData1 = [String](arrayLiteral: "Italian", "African", "British", "Chinese", "European", "French");
    fileprivate let pickerData2 = [String](arrayLiteral: "Gluten Free", "Ketogenic", "Vegetarian", "Lacto-Vegetarian", "Pescetarian", "Primal" )
    fileprivate let pickerData3 = [String](arrayLiteral: "main course", "side dish", "dessert", "appetizer", "salad", "bread")
    fileprivate let pickerData4 = [String](arrayLiteral: "dairy", "egg", "gluten", "grain", "peanut", "seafood", "sesame", "shellfish", "soy", "sulfrite", "tree nut", "wheat")
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(coordinator != nil, "You must set a coordinator before presenting this view controller.")
        
        
        
        // pickerCuisine
        pickerCuisine.tag = 1
        self.textFieldOne.inputView = self.pickerCuisine
        self.textFieldOne.inputAccessoryView = self.pickerCuisine.toolbar1
        self.pickerCuisine.dataSource = self
        self.pickerCuisine.delegate = self
        self.pickerCuisine.toolbarDelegate1 = self
        self.pickerCuisine.reloadAllComponents()
        
        // pickerDiet
        pickerDiet.tag = 2
        self.textFieldTwo.inputView = self.pickerDiet
        self.textFieldTwo.inputAccessoryView = self.pickerDiet.toolbar2
        self.pickerDiet.dataSource = self
        self.pickerDiet.delegate = self
        self.pickerDiet.toolbarDelegate2 = self
        self.pickerDiet.reloadAllComponents()
        
        // pickerMealType
        pickerMealType.tag = 3
        self.textFieldThree.inputView = self.pickerMealType
        self.textFieldThree.inputAccessoryView = self.pickerMealType.toolbar3
        self.pickerMealType.dataSource = self
        self.pickerMealType.delegate = self
        self.pickerMealType.toolbarDelegate3 = self
        self.pickerMealType.reloadAllComponents()
        
        // pickerIntolerance
        pickerIntolerance.tag = 4
        self.textFieldFour.inputView = self.pickerIntolerance
        self.textFieldFour.inputAccessoryView = self.pickerIntolerance.toolbar4
        self.pickerIntolerance.dataSource = self
        self.pickerIntolerance.delegate = self
        self.pickerIntolerance.toolbarDelegate4 = self
        self.pickerIntolerance.reloadAllComponents()

        // Do any additional setup after loading the view.
    }
    @IBAction func tapOnGenerateButton(_ sender: Any) {
        coordinator?.showRecipeResult()
    }
}

extension GenerateRecipeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return self.pickerData1.count
        case 2:
            return self.pickerData2.count
        case 3:
            return self.pickerData3.count
        case 4:
            return self.pickerData4.count
        default:
            return -1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return self.pickerData1[row]
        case 2:
            return self.pickerData2[row]
        case 3:
            return self.pickerData3[row]
        case 4:
            return self.pickerData4[row]
        default:
            return ""
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            self.textFieldOne.text = pickerData1[row]
        case 2:
            self.textFieldTwo.text = pickerData2[row]
        case 3:
            self.textFieldThree.text = pickerData3[row]
        case 4:
            self.textFieldFour.text = pickerData4[row]
        default:
            return
        }
    }
    
    
}

extension GenerateRecipeViewController: ToolbarPickerViewDelegate {
    
    func didTapDone1() {
        let row1 = self.pickerCuisine.selectedRow(inComponent: 0)
        self.pickerCuisine.selectRow(row1, inComponent: 0, animated: false)
        self.textFieldOne.text = self.pickerData1[row1]
        self.textFieldOne.resignFirstResponder()
    }
    
    func didTapCancel1() {
        self.textFieldOne.text = nil
        self.textFieldOne.resignFirstResponder()
    }
    
    
    func didTapDone2() {
        let row2 = self.pickerDiet.selectedRow(inComponent: 0)
        self.pickerDiet.selectRow(row2, inComponent: 0, animated: false)
        self.textFieldTwo.text = self.pickerData2[row2]
        self.textFieldTwo.resignFirstResponder()
    }
    
    func didTapCancel2() {
        self.textFieldTwo.text = nil
        self.textFieldTwo.resignFirstResponder()
    }
    
    
    func didTapDone3() {
        let row3 = self.pickerMealType.selectedRow(inComponent: 0)
        self.pickerMealType.selectRow(row3, inComponent: 0, animated: false)
        self.textFieldThree.text = self.pickerData3[row3]
        self.textFieldThree.resignFirstResponder()
    }
    
    func didTapCancel3() {
        self.textFieldThree.text = nil
        self.textFieldThree.resignFirstResponder()
    }
    
    
    func didTapDone4() {
        let row4 = self.pickerIntolerance.selectedRow(inComponent: 0)
        self.pickerIntolerance.selectRow(row4, inComponent: 0, animated: false)
        self.textFieldFour.text = self.pickerData4[row4]
        self.textFieldFour.resignFirstResponder()
    }
    
    func didTapCancel4() {
        self.textFieldFour.text = nil
        self.textFieldFour.resignFirstResponder()
    }
}
