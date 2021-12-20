//
//  SettingsViewController.swift
//  HM_2.2
//
//  Created by Станислав on 08.12.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        setColor(for: colorView)
        
        setValue(from: redSlider)
        setValue(from: greenSlider)
        setValue(from: blueSlider)
    }
    
    // MARK: - IB Actions
    @IBAction func slidersActions(_ sender: UISlider) {
        switch sender {
        case redSlider:
            setValue(from: sender)
        case greenSlider:
            setValue(from: sender)
        default:
            setValue(from: sender)
        }
        setColor(for: colorView)
    }
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case redTextField:
            setValue(for: redSlider)
            redLabel.text = string(from: redSlider)
        case greenTextField:
            setValue(for: greenSlider)
            greenLabel.text = string(from: greenSlider)
        default:
            setValue(for: blueSlider)
            blueLabel.text = string(from: blueSlider)
        }
        setColor(for: colorView)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keybordToolbar = UIToolbar()
        keybordToolbar.sizeToFit()
        textField.inputAccessoryView = keybordToolbar
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        keybordToolbar.items = [flexBarButton, doneButton]
    }
}

// MARK: - Private Methods
extension SettingsViewController {
    private func setColor(for view: UIView) {
        view.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
    }
    
    private func setValue(for slider: UISlider) {
        switch slider {
        case redSlider:
            guard let value = Float(redTextField.text!) else { return }
            redSlider.value = value
        case greenSlider:
            guard let value = Float(greenTextField.text!) else { return }
            greenSlider.value = value
        default:
            guard let value = Float(blueTextField.text!) else { return }
            blueSlider.value = value
        }
    }
    
    private func setValue(from slider: UISlider) {
        switch slider {
        case redSlider:
            redTextField.text = string(from: slider)
            redLabel.text = string(from: slider)
        case greenSlider:
            greenTextField.text = string(from: slider)
            greenLabel.text = string(from: slider)
        default:
            blueTextField.text = string(from: slider)
            blueLabel.text = string(from: slider)
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
}
