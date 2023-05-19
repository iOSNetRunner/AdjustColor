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
    @IBOutlet var blueValueLabel: UILabel!
    
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
    
    //MARK: - IBActions
    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()
        
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        
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
    
    private func setColor() {
        
        selectedColorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
}
