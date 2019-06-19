//
//  SongController.swift
//  Playlist Round 2
//
//  Created by Timothy Rosenvall on 6/19/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import Foundation
import CoreData

class SongController {
    
    // Singleton
    // Shared Instance
    static let sharedInstance = SongController()
    
    // CRUD Functions
    // Create
    func createSong(title: String, artist: String, playlist: Playlist) {
        Song(title: title, artist: artist, playlist: playlist)
        PlaylistController.sharedInstance.saveToPersistantStore()
    }
    
    // Delete
    func deleteSong(song: Song) {
        if let moc = song.managedObjectContext {
            moc.delete(song)
        }
        PlaylistController.sharedInstance.saveToPersistantStore()
    }
}
