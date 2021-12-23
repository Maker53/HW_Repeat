//
//  TabBarViewController.swift
//  HW_2.7
//
//  Created by Станислав on 23.12.2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllers()
    }
    
    private func setupViewControllers() {
        guard let personsListVC = viewControllers?.first as? PersonsListViewController else { return }
        guard let personsDetailListVC = viewControllers?.last as? PersonsDetailListViewController else { return }
        
        let person = Person.getPerson()
        personsListVC.persons = person
        personsDetailListVC.persons = person
    }
}
