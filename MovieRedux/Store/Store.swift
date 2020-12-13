//
//  Store.swift
//  MovieRedux
//
//  Created by Viktor on 12.12.2020.
//

import Foundation

protocol ReduxState {}
protocol Action {}

typealias Dispatcher = (Action) -> Void
typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State
typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> Void

struct AppState: ReduxState {
   var movies = MoviesState()
}

struct MoviesState: ReduxState {
    var movies = [Movie]()
}

struct FetchMovies: Action {
    let search: String
}

struct SetMovies: Action {
    let movies: [Movie]
}

class Store<StoreState: ReduxState>: ObservableObject {
    var reducer: Reducer<StoreState>
    @Published var state: StoreState
    var middlewares: [Middleware<StoreState>]
    
    init(reducer: @escaping Reducer<StoreState>, state: StoreState,
         middlewares: [Middleware<StoreState>] = []) {
        self.reducer = reducer
        self.state = state
        self.middlewares = middlewares
    }
    
    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
        
        middlewares.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}
