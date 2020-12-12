//
//  Constants.swift
//  MovieRedux
//
//  Created by Viktor on 12.12.2020.
//

import Foundation

struct Constants {
    struct ApiKeys {
        static let omdbIdKey = "34977a5"
    }
    
    struct Urls {
        static func urlBySearch(search: String) -> String {
            "http://www.omdbapi.com/?s=\(search)&page=1&apikey=\(ApiKeys.omdbIdKey)"
        }
        
        static func urlForMovieDetailsByImdbId(imdbId: String) -> String {
            "http://www.omdbapi.com/?i=\(imdbId)&apikey=\(ApiKeys.omdbIdKey)"
        }
    }
}
