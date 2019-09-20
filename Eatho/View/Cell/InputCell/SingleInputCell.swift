//
//  SingleInputCell.swift
//  Eatho
//
//  Created by Серафима Зыкова on 11/09/2019.
//  Copyright © 2019 Серафима Зыкова. All rights reserved.
//

import UIKit

typealias StringHandler = ((_: String) -> ())
typealias NumberHandler = ((_: Double) -> ())

class SingleInputCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    var inputChangedHandle: StringHandler?
    var inputFinishedHandle: StringHandler?
    var inputChangedDecimalHandler: NumberHandler?
    var inpuFinishedDecimalHandler: NumberHandler?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    /** also clears all optional values */
    func setupView(title: String, additionalDesc desc: String, placeholder: String?, text: String?) {
        self.leftLabel.text = title
        self.rightLabel.text = desc
        self.textField.placeholder = placeholder
        self.textField.text = text
        
        self.inputFinishedHandle = nil
        self.inputChangedHandle = nil
        self.inpuFinishedDecimalHandler = nil
        self.inputChangedDecimalHandler = nil
    }
}


extension SingleInputCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if let inputDoneHandle = inputFinishedHandle {
            inputDoneHandle(text)
            return
        }
        
        guard let val = Double(text) else { return }
        if let inpuFinishedDecimalHandler = inpuFinishedDecimalHandler {
            inpuFinishedDecimalHandler(val)
            return
        }
    }

    
    @objc func textFieldDidChange(_ textField: UITextView) {
        guard let text = textField.text else { return }
        if let inputChangedHandle = inputChangedHandle {
            inputChangedHandle(text)
            return
        }
        
        guard let val = Double(text) else { return }
        if let inputChangedDecimalHandler = inputChangedDecimalHandler {
            inputChangedDecimalHandler(val)
            return
        }
    }
}