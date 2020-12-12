//
//  MovieResponse.swift
//  MovieRedux
//
//  Created by Viktor on 12.12.2020.
//

import Foundation

struct MovieResponse: Decodable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}
