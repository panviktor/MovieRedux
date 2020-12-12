//
//  Webservice.swift
//  MovieRedux
//
//  Created by Viktor on 12.12.2020.
//

import Foundation

enum NetworkError: Error {
    case badeURL
    case decodingError
    case noData
}

class Webservice {
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
        guard let moviesURL = URL(string: Constants.Urls.urlBySearch(search: search)) else {
            completion(.failure(.badeURL))
            return
        }
        URLSession.shared.dataTask(with: moviesURL) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
           let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
            if let movieResponse = movieResponse {
                completion(.success(movieResponse.movies))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
