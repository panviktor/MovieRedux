//
//  Movie.swift
//  MovieRedux
//
//  Created by Viktor on 12.12.2020.
//

import Foundation

struct Movie: Decodable {
    let title: String
    let poster: String
    let imdbId: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case poster = "Poster"
        case imdbId = "imdbID"
    }
}
