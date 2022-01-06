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
    
    var networkRandomDogManager = NetworkRandomDogManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        networkRandomDogManager.fetchImage { stringURL in
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            self.dogImage.image = UIImage(data: imageData)
            self.activityIndicator.stopAnimating()
        }
    }
    
    @IBAction func getDogButton() {
        activityIndicator.startAnimating()
        networkRandomDogManager.fetchImage { stringURL in
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            self.dogImage.image = UIImage(data: imageData)
            self.activityIndicator.stopAnimating()
        }
    }
}

