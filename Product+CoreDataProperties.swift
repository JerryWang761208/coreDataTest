//
//  Product+CoreDataProperties.swift
//  product
//
//  Created by 彥勝 王 on 4/11/16.
//  Copyright © 2016 Jerry. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Product {

    @NSManaged var name: String?
    @NSManaged var price: NSNumber?

}
