//
//  ProfileViewController.swift
//  HM_2.3
//
//  Created by Станислав on 14.12.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    var user: User!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moreInfoVC = segue.destination as? MoreInfoViewController else { return }
        moreInfoVC.imageName = user
    }
}
