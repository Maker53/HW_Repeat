//
//  NetworkRandomDogManager.swift
//  HW_2.10
//
//  Created by Станислав on 05.01.2022.
//

import Foundation

struct NetworkRandomDogManager {
    
    private let link = "https://dog.ceo/api/breeds/image/random"
    
    func fetchImage(completionHandler: @escaping (String) -> Void) {
        guard let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            if let randomDogData = parseJSON(withData: data) {
                DispatchQueue.main.async {
                    completionHandler(randomDogData.message)
                }
            }
        }.resume()
    }
}

extension NetworkRandomDogManager {
    private func parseJSON(withData data: Data) -> RandomDogData? {
        do {
            let randomDogData = try JSONDecoder().decode(RandomDogData.self, from: data)
            return randomDogData
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}


