//
//  DataManager.swift
//  HW_2.7
//
//  Created by Станислав on 22.12.2021.
//

class DataManager {
    static let shared = DataManager()
    
    let names = [
        "John", "Albert", "Dave", "Paul", "Mark",
        "Kris", "Alice", "March", "Dana", "Diana"
    ]
    
    let surnames = [
        "Ford", "Margiela", "Smith", "Johnson", "Williams",
        "Jones", "Brown", "Davis", "Miller", "Wilson"
    ]
    
    let phoneNumbers = [
        "aaa@gmail.com", "bbb@gmail.com", "ccc@gmail.com", "ddd@gmail.com",
        "eee@gmail.com", "fff@gmail.com", "ggg@gmail.com",
        "lll@gmail.com", "www@gmail.com", "qqq@gmail.com"
    ]
    
    let emails = [
        "111111", "222222", "333333", "444444", "555555",
        "666666", "777777", "888888", "999999", "000000"
    ]
    
    private init() {}
}
