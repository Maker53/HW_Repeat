//
//  Animations.swift
//  HW_2.9
//
//  Created by Станислав on 02.01.2022.
//

class DataManager {
    static let shared = DataManager()
    
    let animation = [
        "shake", "pop", "morph", "squeeze",
        "wobble", "swing", "flipX", "flipY",
    ]
    let curve = ["spring", "linear", "easeIn", "easeOut"]
    let force = 0.1...2.0
    let duration = 0.5...1.5
    let delay = 0.1...0.3
    
    private init() {}
}
