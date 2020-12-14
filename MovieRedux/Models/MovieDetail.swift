//
//  MovieDetail.swift
//  MovieRedux
//
//  Created by Viktor on 13.12.2020.
//

import Foundation

struct MovieDetail: Decodable {
    let title: String
    let plot: String
    let imdbRating: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case plot = "Plot"
        case imdbRating = "imdbRating"
        case poster = "Poster"
    }
}
