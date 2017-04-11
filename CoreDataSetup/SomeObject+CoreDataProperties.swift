//
//  SomeObject+CoreDataProperties.swift
//  CoreDataSetup
//
//  Created by Keith Hunter on 4/11/17.
//  Copyright © 2017 Keith Hunter. All rights reserved.
//

import Foundation
import CoreData

extension SomeObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SomeObject> {
        return NSFetchRequest<SomeObject>(entityName: "SomeObject")
    }

    @NSManaged public var attribute: String?

}

