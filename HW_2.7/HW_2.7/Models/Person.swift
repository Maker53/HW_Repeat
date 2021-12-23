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
        
        var names = Set(shared.names)
        var surnames = Set(shared.surnames)
        var phoneNumbers = Set(shared.phoneNumbers)
        var emails = Set(shared.emails)
        
        let iterationCount = min(names.count, surnames.count, phoneNumbers.count, emails.count)
        
        for _ in 0..<iterationCount {
            let person = Person(
                name: names.removeFirst(),
                surname: surnames.removeFirst(),
                phoneNumber: phoneNumbers.removeFirst(),
                email: emails.removeFirst()
            )
            persons.append(person)
        }
        
        return persons
    }
}
