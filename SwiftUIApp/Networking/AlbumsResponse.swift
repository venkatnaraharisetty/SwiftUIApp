//
//  HomeResponse.swift
//  SwiftUIApp
//
//  Created by Venkata  naraharisetty on 11/11/22.
//

import Foundation

struct AlbumResponse: Codable {
    let results: [Album]
}

struct Album: Codable, Identifiable {
    let id = UUID()
    let artistId: Double
    let artistName: String
    let collectionId: Double
    let collectionName: String
    let artworkUrl100: String
    let releaseDate: String
    let collectionExplicitness: String
}
