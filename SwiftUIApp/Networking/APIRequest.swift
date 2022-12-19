//
//  APIRequest.swift
//  SwiftUIApp
//
//  Created by Venkata  naraharisetty on 11/30/22.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest {get}
    var baseURL: URL {get}
    var path: String {get}
    
}

enum AppAPIService {
    case getAlbums
    case getAlbumDetails
}


extension AppAPIService: APIBuilder {
    
    var baseURL: URL {
        return URL(string: "")!
    }
    
    var path: String {
        switch self {
        case .getAlbums:
            return ""
        case .getAlbumDetails:
            return ""
        }
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseURL.appendingPathComponent(self.path))
    }
    
    
}
