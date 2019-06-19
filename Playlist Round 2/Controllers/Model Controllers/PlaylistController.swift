//
//  PlaylistController.swift
//  Playlist Round 2
//
//  Created by Timothy Rosenvall on 6/19/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    // Singleton
    // Shared Instance
    static let sharedInstance = PlaylistController()
    
    // Source of Turth
    var playlists: [Playlist] {
        // Create a NSFetchRequest that specifically references our Playlist model object
        let request: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        // Use that FetchRequest to ask the managedObjectContext for all Playlist model ibjects that exist inside of that MOC.
        return (try? CoreDataStack.managedObjectContext.fetch(request)) ?? []
    }
    
    // CRUD Functions
    // Create
    func createPlaylist (name: String) {
        Playlist(name: name)
        saveToPersistantStore()
    }
    
    // Save
    func saveToPersistantStore() {
        let moc = CoreDataStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Error saving to moc: \(error.localizedDescription)")
        }
    }
    
    // Delete
    func deletePlaylist (playlist: Playlist) {
        if let moc = playlist.managedObjectContext {
            moc.delete(playlist)
            saveToPersistantStore()
        }
    }
}
