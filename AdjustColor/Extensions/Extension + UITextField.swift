//
//  Extension + UITextField.swift
//  AdjustColor
//
//  Created by Dmitrii Galatskii on 19.05.2023.
//

import UIKit

extension UITextField {
    func addDoneButtonTo(textField: UITextField)  {
        let keyboardToolbar: UIToolbar = UIToolbar()
        
        keyboardToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
                            target: self,
                            action: nil),
            UIBarButtonItem(title: "Done",
                            style: UIBarButtonItem.Style.done,
                            target: textField,
                            action: #selector(UITextField.resignFirstResponder))
        ]
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
    }
}
