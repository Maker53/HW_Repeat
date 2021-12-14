//
//  User.swift
//  HM_2.3
//
//  Created by Станислав on 14.12.2021.
//

struct User {
    let name = "User"
    let password = "123"
    let person: Person
    
    static func getUser() -> User {
        User(person: Person())
    }
}

struct Person {
    let image = "singletone"
}
