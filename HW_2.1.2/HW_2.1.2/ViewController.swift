//
//  ViewController.swift
//  HW_2.1.2
//
//  Created by Станислав on 05.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let signalOn: CGFloat = 1.0
    private let signalOff: CGFloat = 0.3
    private var currentSignal = SignalColors.red
    
    @IBOutlet var redSignal: UIView!
    @IBOutlet var orangeSignal: UIView!
    @IBOutlet var greenSignal: UIView!
    
    // MARK: - Override Methods
    override func viewWillLayoutSubviews() {
        redSignal.layer.cornerRadius = redSignal.frame.height / 2
        orangeSignal.layer.cornerRadius = orangeSignal.frame.height / 2
        greenSignal.layer.cornerRadius = greenSignal.frame.height / 2
    }

    @IBAction func changeColorButton(_ sender: UIButton) {
        if sender.currentTitle == "START" {
            sender.setTitle("NEXT", for: .normal)
        }
        
        switch currentSignal {
        case .red:
            greenSignal.alpha = signalOff
            redSignal.alpha = signalOn
            currentSignal = .orange
        case .orange:
            redSignal.alpha = signalOff
            orangeSignal.alpha = signalOn
            currentSignal = .green
        case .green:
            orangeSignal.alpha = signalOff
            greenSignal.alpha = signalOn
            currentSignal = .red
        }
    }
}

extension ViewController {
    private enum SignalColors {
        case red
        case orange
        case green
    }
}
