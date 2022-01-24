//
//  TasksViewController.swift
//  HW_2.14
//
//  Created by Станислав on 24.01.2022.
//

import UIKit

class TasksViewController: UITableViewController {
    
    var taskList: TaskList!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 0
    }
}
