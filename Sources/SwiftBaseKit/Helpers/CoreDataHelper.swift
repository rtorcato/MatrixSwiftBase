//
//  CoredataManager.swift
//  AppleCore
//
//  Created by Richard Torcato on 2022-08-26.
//

import Foundation
import CoreData

class CoreDataHelper {
    
    private let persistentContainer: NSPersistentContainer
    static let instance = CoreDataHelper()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "RemindersModel")
        let description = persistentContainer.persistentStoreDescriptions.first
        // This allows a 'non-iCloud' syncing
        // container to keep track of changes
        // as if it was an iCloud syncing container

        description?.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }
}
