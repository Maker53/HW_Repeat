//
//  StorageManager.swift
//  HW_2.13
//
//  Created by Станислав on 23.01.2022.
//

import CoreData



// MARK: - Core Data stack
private var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "HW_2_13")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    })
    return container
}()

// MARK: - Core Data Saving support
func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
