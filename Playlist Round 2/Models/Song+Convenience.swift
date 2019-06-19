//
//  Song+Convenience.swift
//  Playlist Round 2
//
//  Created by Timothy Rosenvall on 6/19/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import Foundation
import CoreData

extension Song {
    convenience init(title: String, artist: String, playlist: Playlist, context: NSManagedObjectContext = CoreDataStack.managedObjectContext) {
        self.init(context: context)
        self.title = title
        self.artist = artist
        self.playlist = playlist
    }
}
