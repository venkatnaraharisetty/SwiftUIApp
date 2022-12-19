//
//  ItunesAPIService.swift
//  SwiftUIApp
//
//  Created by Venkata  naraharisetty on 11/11/22.
//

import Foundation
import Combine

protocol ItunesApiServiceProtocol {
    func fetchAlbums(from endPoint: AppAPIService) -> AnyPublisher<[Album], Error>
}

struct ItunesApiService: ItunesApiServiceProtocol {
    func fetchAlbums(from endPoint: AppAPIService) -> AnyPublisher<[Album], Error> {
        let request = endPoint.urlRequest
//        let responsePublisher = AnyPublisher<T: Decodable, Error> = NetworkManager.execute()
//        return responsePublisher.map { response in
//            response
//        } .eraseToAnyPublisher()
        //return AnyPublisher.map(nil, nil)
        return Empty(completeImmediately: false).eraseToAnyPublisher()
    }
    
    
}
