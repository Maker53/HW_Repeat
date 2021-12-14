//
//  User.swift
//  HM_2.3
//
//  Created by Станислав on 14.12.2021.
//

struct User {
    let name: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(name: "User", password: "123", person: Person.getPerson())
    }
}

struct Person {
    let image: String
    
    static func getPerson() -> Person {
        Person(image: "singletone")
    }
}
