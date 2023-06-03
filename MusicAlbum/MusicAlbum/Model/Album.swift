//
//  Album.swift
//  MusicAlbum
//
//  Created by admin on 12/5/23.
//

import SwiftUI

// MARK: Sample data and model

struct Album: Identifiable {
    var id: String = UUID().uuidString
    var albumName: String
    var albumImage: String
    var rating: Int
    var showDisk: Bool = false
    var diskOffset: CGFloat = 0
}

var sampleAlbums: [Album] = [
    Album(albumName: "Posistions", albumImage: "ariana_grande_1", rating: 4),
    Album(albumName: "The Best", albumImage: "ariana_grande_2", rating: 5),
    Album(albumName: "My Everything", albumImage: "ariana_grande_3", rating: 3),
    Album(albumName: "Yours Truly", albumImage: "ariana_grande_4", rating: 5),
    Album(albumName: "Sweetener", albumImage: "ariana_grande_5", rating: 2),
    Album(albumName: "Rain On Me", albumImage: "ariana_grande_1", rating: 1)
]

var sampleText = "\"Focus\" was originally intended to be the lead single from Grande's third studio album, Dangerous Woman (2016), but was later cut from the tracklist, only appearing as a bonus track on the Japanese edition of the album"
