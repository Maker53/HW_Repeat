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
    
    var description: String {
        """
        Preset: \(animation)
        Curve: \(curve)
        Force: \(String(format: "%.2f", force))
        Duration: \(String(format: "%.2f", duration))
        Delay: \(String(format: "%.2f", delay))
        """
    }
}

extension Animation {
    static func getAnimation() -> Animation {
         Animation(
            animation: DataManager.shared.animation.randomElement() ?? "None",
            curve: DataManager.shared.curve.randomElement() ?? "None",
            force: Double.random(in: 0.1...2.0),
            duration: Double.random(in: 0.5...1.5),
            delay: Double.random(in: 0.1...0.3)
         )
    }
}
