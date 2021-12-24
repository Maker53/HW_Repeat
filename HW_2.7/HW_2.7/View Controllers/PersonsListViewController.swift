//
//  PersonsListViewController.swift
//  HW_2.7
//
//  Created by Станислав on 22.12.2021.
//

import UIKit

class PersonsListViewController: UITableViewController {

    // MARK: - Public Properties
    var persons: [Person]!

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = persons[indexPath.row].fullName
        cell.contentConfiguration = content

        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let personInfoVC = segue.destination as? PersonInfoViewController else { return }
            personInfoVC.person = persons[indexPath.row]
        }
    }
}
