//
//  RandomDog.swift
//  HW_2.10
//
//  Created by Станислав on 05.01.2022.
//

struct RandomDog {
    var pictureURL: String
    
    init?(randomDogData: RandomDogData) {
        pictureURL = randomDogData.message
    }
}
