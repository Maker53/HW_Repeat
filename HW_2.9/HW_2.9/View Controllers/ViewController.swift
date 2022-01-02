//
//  ViewController.swift
//  HW_2.9
//
//  Created by Станислав on 02.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var animationView: UIView!
    @IBOutlet var animationLabel: UILabel!
    
    let animation = Animation.getAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationLabel.text = """
Preset: \(animation.animation)
Curve: \(animation.curve)
Force: \(toString(animation.force))
Duration: \(toString(animation.duration))
Delay: \(toString(animation.delay))
"""
    }

    @IBAction func runAnimation(_ sender: UIButton) {
    }
}

extension ViewController {
    private func toString(_ double: Double) -> String {
        String(format: "%.2f", double)
    }
}
