//
//  PersonInfoViewController.swift
//  HW_2.7
//
//  Created by Станислав on 22.12.2021.
//

import UIKit

class PersonInfoViewController: UIViewController {

    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = person.fullName
        phoneNumberLabel.text = "Phone number: \(person.phoneNumber)"
        emailLabel.text = "Email: \(person.email)"
    }
}
