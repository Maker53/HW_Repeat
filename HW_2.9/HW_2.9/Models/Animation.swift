//
//  Animation.swift
//  HW_2.9
//
//  Created by Станислав on 02.01.2022.
//

struct Animation {
    let animation: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
}

extension Animation {
    static func getAnimation() -> Animation {
        let preset = DataManager.shared.animation.randomElement() ?? "None"
        let curve = DataManager.shared.curve.randomElement() ?? "None"
        let force = Double.random(in: 0.1...2.0)
        let duration = Double.random(in: 0.5...1.5)
        let delay = Double.random(in: 0.1...0.3)
        
        return Animation(animation: preset, curve: curve, force: force, duration: duration, delay: delay)
    }
}
