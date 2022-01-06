//
//  ViewController.swift
//  HW_2.10
//
//  Created by Станислав on 05.01.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var dogImage: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private var randomDog: RandomDog!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData(from: Link.randomDogApi.rawValue)
    }
    
    @IBAction func getDogButton(sender: UIButton) {
        sender.setTitle("", for: .normal)
        
        activityIndicator.isHidden.toggle()
        activityIndicator.startAnimating()

        DispatchQueue.global().async {
            guard let imageData = ImageManager.shared.fetchImage(from: self.randomDog.message) else { return }
            DispatchQueue.main.async {
                self.dogImage.image = UIImage(data: imageData)
                self.activityIndicator.stopAnimating()
            }
        }
        fetchData(from: Link.randomDogApi.rawValue)
    }
}

extension MainViewController {
    private func fetchData(from url: String) {
        NetworkManager.shared.fetchData(from: url) { result in
            switch result {
            case .success(let randomDog):
                self.randomDog = randomDog
            case .failure(let error):
                print(error)
            }
        }
    }
}

