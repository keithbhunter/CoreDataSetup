//
//  CoreDataStack.swift
//  CoreDataSetup
//
//  Created by Keith Hunter on 4/11/17.
//  Copyright © 2017 Keith Hunter. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    /// The main context for the app. Reads/writes to this context will happen on the main thread.
    lazy var mainContext: NSManagedObjectContext = {
        var main = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        main.persistentStoreCoordinator = self.persistentStoreCoordinator
        return main
    }()
    
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documentsDirectory.appendingPathComponent("WhateverNameYouWant.sqlite")
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        
        do {
            let options = [NSMigratePersistentStoresAutomaticallyOption: true, NSInferMappingModelAutomaticallyOption: true]
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: options)
        } catch {
            fatalError("Unresolved error while creating persistent store coordinator: \(error)")
        }
        
        return coordinator
    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: "Model", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
}

