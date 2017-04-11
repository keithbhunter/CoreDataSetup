//
//  AppDelegate.swift
//  CoreDataSetup
//
//  Created by Keith Hunter on 4/11/17.
//  Copyright © 2017 Keith Hunter. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Create, edit, and save a new entity
        let someObject = NSEntityDescription.insertNewObject(forEntityName: "SomeObject", into: CoreDataStack.shared.mainContext) as! SomeObject
        someObject.attribute = "something"
        try! CoreDataStack.shared.mainContext.save()
        
        return true
    }

}

