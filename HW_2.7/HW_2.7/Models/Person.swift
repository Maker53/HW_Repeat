//
//  Person.swift
//  HW_2.7
//
//  Created by Станислав on 22.12.2021.
//

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
        
        let names = DataManager.shared.names.shuffled()
        let surnames = DataManager.shared.surnames.shuffled()
        let phoneNumbers = DataManager.shared.phoneNumbers.shuffled()
        let emails = DataManager.shared.emails.shuffled()
        
        let iterationCount = min(names.count, surnames.count, phoneNumbers.count, emails.count)
        
        for index in 0..<iterationCount {
            let person = Person(
                name: names[index],
                surname: surnames[index],
                phoneNumber: phoneNumbers[index],
                email: emails[index]
            )
            persons.append(person)
        }
        
        return persons
    }
}
