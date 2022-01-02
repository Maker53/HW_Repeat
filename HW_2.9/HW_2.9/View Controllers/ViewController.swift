//
//  ViewController.swift
//  HW_2.9
//
//  Created by Станислав on 02.01.2022.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet var animationView: SpringView!
    @IBOutlet var animationLabel: UILabel!
    
    var animation = Animation.getAnimation()
    
    private var firstAnimation = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setTitle(for: animationLabel)
    }

    @IBAction func runAnimation(_ sender: UIButton) {
        if !firstAnimation {
            setTitle(for: animationLabel)
        } else {
            firstAnimation.toggle()
        }
        
        animationView.animation = animation.animation
        animationView.curve = animation.curve
        animationView.force = animation.force
        animationView.duration = animation.duration
        animationView.delay = animation.delay
        animationView.animate()
        
        animation = Animation.getAnimation()
        sender.setTitle("Run \(animation.animation)", for: .normal)
    }
}

extension ViewController {
    private func toString(_ double: Double) -> String {
        String(format: "%.2f", double)
    }
    
    private func setTitle(for label: UILabel) {
        label.text = """
Preset: \(animation.animation)
Curve: \(animation.curve)
Force: \(toString(animation.force))
Duration: \(toString(animation.duration))
Delay: \(toString(animation.delay))
"""
    }
}
