//
//  PersonsListViewController.swift
//  HW_2.7
//
//  Created by Станислав on 22.12.2021.
//

import UIKit

class PersonsListViewController: UITableViewController {

    // MARK: - Public Properties
    let person = Person.getPerson()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        person.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = person[indexPath.row].fullName
        cell.contentConfiguration = content

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let personInfoVC = segue.destination as? PersonInfoViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        personInfoVC.person = person[indexPath.row]
    }
}
