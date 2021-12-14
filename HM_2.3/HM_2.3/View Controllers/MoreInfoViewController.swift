//
//  MoreInfoViewController.swift
//  HM_2.3
//
//  Created by Станислав on 14.12.2021.
//

import UIKit

class MoreInfoViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    var imageName: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = UIImage(named: imageName.person.image)
    }
}
