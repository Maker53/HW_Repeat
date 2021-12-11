//
//  GrettingsViewController.swift
//  HM_2.3
//
//  Created by Станислав on 11.12.2021.
//

import UIKit

class GrettingsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var welcomeLabel: UILabel!
    
    // MARK: - Public Properties
    var userName: String = ""
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(userName)!"
    }
    
    // MARK: - IB Actions
    @IBAction func logoutButtonPressed() {
        dismiss(animated: true)
    }
}
