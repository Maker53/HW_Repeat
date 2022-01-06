//
//  RandomDog.swift
//  HW_2.10
//
//  Created by Станислав on 05.01.2022.
//

struct RandomDog: Decodable {
    let message: String
}

enum Link: String {
    case randomDogApi = "https://dog.ceo/api/breeds/image/random"
}
