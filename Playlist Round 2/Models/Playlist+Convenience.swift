//
//  Playlist+Convenience.swift
//  Playlist Round 2
//
//  Created by Timothy Rosenvall on 6/19/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import Foundation
import CoreData

extension Playlist {
    @discardableResult
    convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.managedObjectContext) {
        self.init(context:context)
        self.name = name
    }
}
