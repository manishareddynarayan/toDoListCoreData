//
//  Works+CoreDataProperties.swift
//  toDoCoreData
//
//  Created by N Manisha Reddy on 2/13/18.
//  Copyright © 2018 N Manisha Reddy. All rights reserved.
//

import Foundation
import CoreData


extension Works {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Works> {
        return NSFetchRequest<Works>(entityName: "Works")
    }

    @NSManaged public var name: String?
    @NSManaged public var isImportant: Bool

}
