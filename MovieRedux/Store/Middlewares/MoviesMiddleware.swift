//
//  MoviesMiddleware.swift
//  MovieRedux
//
//  Created by Viktor on 13.12.2020.
//

import Foundation

func moviesMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        switch action {
            case let action as FetchMovies:
                Webservice().getMoviesBy(search: action.search.urlEncode()) { result in
                    switch result {
                        case .success(let movies):
                            if let movies = movies {
                                // set movies to the state
                                dispatch(SetMovies(movies: movies))
                            }
                        case .failure(let error):
                            print(error.localizedDescription)
                    }
                }
        case let action as FetchMovieDetails:
            Webservice().getMoviewDetailBy(imdbId: action.imdbId, completion: { result in
                switch result {
                case .success(let details):
                    if let details = details {
                        dispatch(SetMovieDetails(details: details))
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
        
            default:
                break
            }
    }
}
