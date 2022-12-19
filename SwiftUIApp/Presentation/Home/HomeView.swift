//
//  HomeView.swift
//  SwiftUIApp
//
//  Created by Venkata  naraharisetty on 12/1/22.
//

import SwiftUI
import Combine
import Kingfisher

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel(service: ItunesApiService())
    @State private var search: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                albumsView
                    .isHidden(viewModel.isViewLoading)
                ProgressView().isHidden(!viewModel.isViewLoading)
            }
            .onAppear(perform: viewModel.getAlbums)
            .background(.white)
            .navigationTitle("Welcome Venkat")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action:{
                print("Profile action tapped")
            }) {
                Image(systemName: "person.circle.fill")
                    .imageScale(.large)
                    .frame(width: 50, height: 50, alignment: .trailing)
            })
        }
    }
    
    private var albumsView: some View {
        var body: some View {
            VStack {
                if viewModel.albumsList.isEmpty {
                    Text("No Items to show")
                } else if let albums = viewModel.albumsList {
                    SearchView(search: $search)
                    Spacer()
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 30) {
                            ForEach(albums) { album in
                                NavigationLink(destination: AlbumDetailView(album: album)) {
                                    AlbumView(album: album)
                                }
                            }
                        }
                        
                    }
                }
            }
        }
        return body
    }
}

public struct AlbumView: View {
    
    var album: Album
    
    init(album: Album) {
        self.album = album
    }
    
    public var body: some View {
            VStack {
                KFImage(URL(string: album.artworkUrl100))
                    .resizable()
                    .frame(minWidth: 70, maxWidth: .infinity, minHeight: 150, maxHeight: .infinity)
                    .cornerRadius(10)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 5, trailing: 0))
                Text(album.collectionName)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 15, trailing: 0))
                    .lineLimit(2)
                Spacer()

            }
            .frame(height: 200)
            .padding()
            .background(.gray.opacity(0.2))
            .cornerRadius(20)
        }
}

struct SearchView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                Image(uiImage: UIImage(systemName: "magnifyingglass")!)
                TextField("Search Furniture", text: $search)
            }
            .padding(.all, 15)
            .background(.gray.opacity(0.2))
            .cornerRadius(10.0)
            .padding(.trailing, 8)
            
            Button(action: {}) {
                Image(uiImage: UIImage(systemName: "barcode.viewfinder")!)
                    .padding()
                    .background(.gray)
                    .cornerRadius(10.0)
            }
        } .padding(.horizontal)
    }
}
