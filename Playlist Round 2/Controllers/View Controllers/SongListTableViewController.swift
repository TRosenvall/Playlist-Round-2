//
//  SongListTableViewController.swift
//  Playlist Round 2
//
//  Created by Timothy Rosenvall on 6/19/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class SongListTableViewController: UITableViewController {

    @IBOutlet weak var songNameLabel: UITextField!
    @IBOutlet weak var artistNameLabel: UITextField!
    
    var playlistLandingPad: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = playlistLandingPad?.name
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        guard let title = songNameLabel.text, title != "",
            let artist = artistNameLabel.text, artist != "" else {return}
        guard let playlist = playlistLandingPad else {return}
        SongController.sharedInstance.createSong(title: title, artist: artist, playlist: playlist)
        songNameLabel.text = ""
        artistNameLabel.text = ""
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlistLandingPad?.songs?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)

        guard let song = playlistLandingPad?.songs?[indexPath.row] as? Song else {return UITableViewCell() }
        
        cell.textLabel?.text = song.title
        cell.detailTextLabel?.text = song.artist
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let song = playlistLandingPad?.songs?[indexPath.row] as? Song else {return}
            SongController.sharedInstance.deleteSong(song: song)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
