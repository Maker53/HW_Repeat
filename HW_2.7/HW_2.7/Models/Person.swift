//
//  Person.swift
//  HW_2.7
//
//  Created by Станислав on 22.12.2021.
//

private let shared = DataManager.shared

struct Person {
    let name: String
    let surname: String
    let phoneNumber: String
    let email: String
    
    var fullName: String {
       "\(name) \(surname)"
    }
}

extension Person {
    static func getPerson() -> [Person] {
        var persons: [Person] = []
        
        let iterationCount = min(
            shared.emails.count, shared.names.count,
            shared.phoneNumbers.count, shared.surnames.count
        )
        
        for _ in 0..<iterationCount {
            let person = Person(
                name: shared.names.randomElement() ?? "Error",
                surname: shared.surnames.randomElement() ?? "Error",
                phoneNumber: shared.phoneNumbers.randomElement() ?? "Error",
                email: shared.emails.randomElement() ?? "Error"
            )
            persons.append(person)
        }
        
        return persons
    }
}
