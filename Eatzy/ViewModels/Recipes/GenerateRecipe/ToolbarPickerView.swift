//
//  ToolbarPickerView.swift
//  Eatzy
//
//  Created by Michael Macbook Pro on 1/9/20.
//  Copyright © 2020 Michael Yue. All rights reserved.
//

import UIKit
import Foundation

protocol ToolbarPickerViewDelegate: class {
    func didTapDone1()
    func didTapCancel1()
    
    func didTapDone2()
    func didTapCancel2()
    
    func didTapDone3()
    func didTapCancel3()
    
    func didTapDone4()
    func didTapCancel4()
}

class ToolbarPickerView: UIPickerView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    public private(set) var toolbar1: UIToolbar?
    public private(set) var toolbar2: UIToolbar?
    public private(set) var toolbar3: UIToolbar?
    public private(set) var toolbar4: UIToolbar?
    
    public weak var toolbarDelegate1: ToolbarPickerViewDelegate?
    public weak var toolbarDelegate2: ToolbarPickerViewDelegate?
    public weak var toolbarDelegate3: ToolbarPickerViewDelegate?
    public weak var toolbarDelegate4: ToolbarPickerViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        let toolBar1 = UIToolbar()
        toolBar1.tag = 1
        let toolBar2 = UIToolbar()
        toolBar2.tag = 2
        let toolBar3 = UIToolbar()
        toolBar3.tag = 3
        let toolBar4 = UIToolbar()
        toolBar4.tag = 4
        
        let doneButton1 = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneTapped1))
        let spaceButton1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton1 = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelTapped1))
        toolBarSet(toolBar1, doneButton1, spaceButton1, cancelButton1)
        
        
        let doneButton2 = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneTapped2))
        let spaceButton2 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton2 = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelTapped2))
        toolBarSet(toolBar2, doneButton2, spaceButton2, cancelButton2)
        
        
        let doneButton3 = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneTapped3))
        let spaceButton3 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton3 = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelTapped3))
        toolBarSet(toolBar3, doneButton3, spaceButton3, cancelButton3)
        
        
        let doneButton4 = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneTapped4))
        let spaceButton4 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton4 = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelTapped4))
        toolBarSet(toolBar4, doneButton4, spaceButton4, cancelButton4)
    }
    
    private func toolBarSet(_ toolBar: UIToolbar, _ doneButton: UIBarButtonItem, _ spaceButton: UIBarButtonItem, _ cancelButton: UIBarButtonItem) {
        switch toolBar.tag {
        case 1:
            toolBar.barStyle = UIBarStyle.default
            toolBar.isTranslucent = true
            toolBar.tintColor = .blue
            toolBar.sizeToFit()
            
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true
            self.toolbar1 = toolBar
        case 2:
            toolBar.barStyle = UIBarStyle.default
            toolBar.isTranslucent = true
            toolBar.tintColor = .blue
            toolBar.sizeToFit()
            
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true
            self.toolbar2 = toolBar
        case 3:
            toolBar.barStyle = UIBarStyle.default
            toolBar.isTranslucent = true
            toolBar.tintColor = .blue
            toolBar.sizeToFit()
            
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true
            self.toolbar3 = toolBar
        case 4:
            toolBar.barStyle = UIBarStyle.default
            toolBar.isTranslucent = true
            toolBar.tintColor = .blue
            toolBar.sizeToFit()
            
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true
            self.toolbar4 = toolBar
        default:
            return
        }
    }
    
    @objc func doneTapped1() {
        self.toolbarDelegate1?.didTapDone1()
    }
    
    @objc func cancelTapped1() {
        self.toolbarDelegate1?.didTapCancel1()
    }
    
    
    @objc func doneTapped2() {
        self.toolbarDelegate2?.didTapDone2()
    }
    
    @objc func cancelTapped2() {
        self.toolbarDelegate2?.didTapCancel2()
    }
    
    
    @objc func doneTapped3() {
        self.toolbarDelegate3?.didTapDone3()
    }
    
    @objc func cancelTapped3() {
        self.toolbarDelegate3?.didTapCancel3()
    }
    
    
    @objc func doneTapped4() {
        self.toolbarDelegate4?.didTapDone4()
    }
    
    @objc func cancelTapped4() {
        self.toolbarDelegate4?.didTapCancel4()
    }
}
