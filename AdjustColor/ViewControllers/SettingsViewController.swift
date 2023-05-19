//
//  SettingsViewController.swift
//  AdjustColor
//
//  Created by Dmitrii Galatskii on 19.05.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - Public properties
    @IBOutlet var selectedColorView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueLabelLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var color: UIColor!
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDoneButtonForTextFields()
        setViewSettings()
    }

    // MARK: - Private methods
    private func setupDoneButtonForTextFields() {
        redTextField.addDoneButtonTo(textField: redTextField)
        greenTextField.addDoneButtonTo(textField: greenTextField)
        blueTextField.addDoneButtonTo(textField: blueTextField)
    }
    
    private func setViewSettings() {
        selectedColorView.layer.cornerRadius = 15
        selectedColorView.backgroundColor = color
    }
    
    
    
}
