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
    
    // MARK: - Public Properties
    var delegate: SettingsViewControllerDelegate!
    var viewColor: UIColor!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        colorView.backgroundColor = viewColor
        
        setSliders()
        
        setValue(for: redTextField, greenTextField, blueTextField)
        setValue(for: redLabel, greenLabel, blueLabel)
    }
    
    // MARK: - IB Actions
    @IBAction func slidersActions(_ sender: UISlider) {
        switch sender {
        case redSlider:
            setValue(for: redTextField)
            setValue(for: redLabel)
        case greenSlider:
            setValue(for: greenTextField)
            setValue(for: greenLabel)
        default:
            setValue(for: blueTextField)
            setValue(for: blueLabel)
        }
        setColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.getColor(color: colorView.backgroundColor ?? .red)
        dismiss(animated: true)
    }
}


// MARK: - Private Methods
extension SettingsViewController {
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField: redTextField.text = string(from: redSlider)
            case greenTextField: greenTextField.text = string(from: greenSlider)
            default: blueTextField.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel: redLabel.text = string(from: redSlider)
            case greenLabel: greenLabel.text = string(from: greenSlider)
            default: blueLabel.text = string(from: blueSlider)
            }
        }
    }
    
    private func setSliders() {
        let ciColor = CIColor(color: viewColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if let value = Float(text) {
            switch textField {
            case redTextField:
                redSlider.setValue(value, animated: true)
                setValue(for: redLabel)
            case greenTextField:
                greenSlider.setValue(value, animated: true)
                setValue(for: greenLabel)
            default:
                blueSlider.setValue(value, animated: true)
                setValue(for: blueLabel)
            }
            setColor()
            return
        }
        
        showAlert(title: "Wrong format!", message: "Please, enter the correct value")
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
