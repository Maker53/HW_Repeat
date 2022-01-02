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
    
    private var animation = Animation.getAnimation()
    private var firstAnimation = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationLabel.text = animation.description
    }

    @IBAction func runAnimation(_ sender: UIButton) {
        animationLabel.text = animation.description
        
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
