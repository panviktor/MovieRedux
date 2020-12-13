//
//  MovieCell.swift
//  MovieRedux
//
//  Created by Viktor on 13.12.2020.
//

import SwiftUI

struct MovieCell: View {
    let movie: Movie
        
    var body: some View {
        HStack(alignment: .top) {
            URLImage(url: movie.poster)
                .frame(width: 100, height: 125)
                .cornerRadius(10)
            Text(movie.title)
        }
    }
}

