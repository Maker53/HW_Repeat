//
//  AlertController.swift
//  HW_2.13
//
//  Created by Станислав on 23.01.2022.
//

import UIKit

extension UIAlertController {
    static func createAlertController(with title: String) -> UIAlertController {
        UIAlertController(title: title, message: "What do you want to do?", preferredStyle: .alert)
    }
    
    func action(task: Task?, completion: @escaping(String) -> Void) {
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let task = self.textFields?.first?.text, !task.isEmpty else { return }
            completion(task)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        addAction(saveAction)
        addAction(cancelAction)
        addTextField { textField in
            textField.placeholder = "New task"
            textField.text = task?.title
        }
    }
}
