//
//  NetworkManager.swift
//  HW_2.10
//
//  Created by Станислав on 05.01.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}
    
    func fetchData(from url: String, with completion: @escaping(Result<RandomDog, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let randomDog = try JSONDecoder().decode(RandomDog.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(randomDog))
                }
            } catch {
                completion(.failure(.decodingError))
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
