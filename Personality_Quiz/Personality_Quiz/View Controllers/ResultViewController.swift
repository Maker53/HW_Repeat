//
//  ResultViewController.swift
//  Personality_Quiz
//
//  Created by Станислав on 16.12.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answersChosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        getMainAnimalType()
    }
}

extension ResultViewController {
    private func getMainAnimalType() {
        var animalWithPoints: [Animal: Int] = [:]
        let animals = answersChosen.map { $0.animal }
        
        animals.forEach {
            if let animalTypeCount = animalWithPoints[$0] {
                animalWithPoints.updateValue(animalTypeCount + 1, forKey: $0)
            } else {
                animalWithPoints[$0] = 1
            }
        }
        
        let sortedAnimalWithPointsArray = animalWithPoints.sorted { $0.value > $1.value }
        guard let mosyFrequencyAnimal = sortedAnimalWithPointsArray.first?.key else { return }
        
        updateUI(with: mosyFrequencyAnimal)
    }
    
    private func updateUI(with animal: Animal) {
        animalLabel.text = "Вы - \(animal.rawValue)"
        descriptionLabel.text = animal.definition
    }
}
