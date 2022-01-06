//
//  NetworkManager.swift
//  HW_2.10
//
//  Created by Станислав on 05.01.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}
    
    func fetchData(from url: String, with completion: @escaping(RandomDog) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let randomDog = try JSONDecoder().decode(RandomDog.self, from: data)
                DispatchQueue.main.async {
                    completion(randomDog)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: String) -> Data? {
        guard let url = URL(string: url) else { return nil }
        return try? Data(contentsOf: url)
    }
}
