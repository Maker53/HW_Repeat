//
//  ViewController.swift
//  HM_2.2
//
//  Created by Станислав on 08.12.2021.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setColor(for: colorView)
    }
    
    // MARK: - IB Actions
    @IBAction func slidersActions(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redLabel.text = string(from: sender)
        case greenSlider:
            greenLabel.text = string(from: sender)
        default:
            blueLabel.text = string(from: sender)
        }
        setColor(for: colorView)
    }
}

// MARK: - Private Methods
extension ViewController {
    private func setColor(for view: UIView) {
        view.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
