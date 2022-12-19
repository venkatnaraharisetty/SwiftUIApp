//
//  AlbumDetailView.swift
//  SwiftUIApp
//
//  Created by Venkata  naraharisetty on 12/18/22.
//

import Foundation
import SwiftUI
import Kingfisher

struct AlbumDetailView: View {
    
    let album: Album
    
    var body: some View {
        VStack {
            KFImage(URL(string: album.artworkUrl100))
                .resizable()
                .frame(minWidth: 120, maxWidth: .infinity, minHeight: 120, maxHeight: .infinity)
                .cornerRadius(10)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 5, trailing: 20))
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .top) {
                    Text("Album Name:")
                    Text(album.collectionName)
                }
                HStack(alignment: .top) {
                    Text("Atrist Name:")
                    Text(album.artistName)
                }
                HStack(alignment: .top) {
                    Text("Release Date:")
                    Text(album.releaseDate)
                }
                HStack(alignment: .top) {
                    Text("Is Explicit:")
                    Text(album.collectionExplicitness)
                }
            }
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 5, trailing: 20))
           
        }
    }
}
