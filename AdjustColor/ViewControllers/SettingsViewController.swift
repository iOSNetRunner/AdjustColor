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
        view.setBottomColorToGradientBlack()
        setDoneButtonForNumPad()
        setViewSettings()
        receiveColor()
        applyStringFormatToAllValueLabels()
        getValuesForTextFields()
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        
        
        
        
        
    }
    
    //MARK: - IBActions
    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()
        getValuesForTextFields()
        
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: redSlider)
        case greenSlider:
            greenValueLabel.text = string(from: greenSlider)
        default:
            blueValueLabel.text = string(from: blueSlider)
        }
    }

    // MARK: - Private methods
    private func setDoneButtonForNumPad() {
        redTextField.addDoneButtonTo(textField: redTextField)
        greenTextField.addDoneButtonTo(textField: greenTextField)
        blueTextField.addDoneButtonTo(textField: blueTextField)
    }
    
    private func setViewSettings() {
        selectedColorView.layer.cornerRadius = 15
        selectedColorView.backgroundColor = color
        selectedColorView.layer.shadowColor = UIColor.black.cgColor
        selectedColorView.layer.shadowOpacity = 1
        selectedColorView.layer.shadowRadius = 5
        selectedColorView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    private func receiveColor() {
        let receivedColor = color.rgba
        
        redSlider.value = Float(receivedColor.red)
        greenSlider.value = Float(receivedColor.green)
        blueSlider.value = Float(receivedColor.blue)
    }
    
    private func setColor() {
        selectedColorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func getValuesForTextFields() {
        redTextField.text = redValueLabel.text
        greenTextField.text = greenValueLabel.text
        blueTextField.text = blueValueLabel.text
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func applyStringFormatToAllValueLabels() {
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
    }
}

//MARK: - UITextField applying values
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let enteredValue = textField.text else { return }
        guard let numberValue = Float(textField.text ?? "0") else { return }
        
        switch textField {
        case redTextField:
            redValueLabel.text = redTextField.text
            redSlider.value = numberValue
            
        case greenTextField:
            greenValueLabel.text = greenTextField.text
            greenSlider.value = numberValue
        default:
            blueValueLabel.text = blueTextField.text
            blueSlider.value = numberValue
        }
        
        setColor()
    }
}
