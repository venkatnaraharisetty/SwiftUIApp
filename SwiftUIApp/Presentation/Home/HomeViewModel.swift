//
//  HomeViewModel.swift
//  SwiftUIApp
//
//  Created by Venkata  naraharisetty on 11/11/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    private let service: ItunesApiService
    private var cancellables = Set<AnyCancellable>()
    private var cancellable: AnyCancellable?
    
    @Published private(set) var isViewLoading: Bool = false
    @Published private(set) var albumsList: [Album] = []
    
    init(service: ItunesApiService) {
        self.service = service
    }
    
    func getAlbums() {
        isViewLoading = true
        self.cancellable = URLSession.shared.dataTaskPublisher(for: URL(string: "https://itunes.apple.com/search?term=music&media=music&entity=album")!).map {$0.data}
            .decode(type: AlbumResponse.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .replaceError(with: AlbumResponse(results: []))
            .eraseToAnyPublisher()
            .sink(receiveValue: { albums in
                sleep(3)
                self.isViewLoading = false
                self.albumsList = albums.results
            })
    }
}
