//
//  MainViewController.swift
//  HM_2.2
//
//  Created by Станислав on 20.12.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func getColor(color: UIColor)
}

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func getColor(color: UIColor) {
        view.backgroundColor = color
    }
}
