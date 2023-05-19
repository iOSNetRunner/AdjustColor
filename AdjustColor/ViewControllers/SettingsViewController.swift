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
        setDoneButtonForNumPad()
        setViewSettings()
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
        receiveColor()
        
        
        
    }
    
    //MARK: - IBActions
    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()
        
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
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
