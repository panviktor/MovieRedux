//
//  RootView.swift
//  MovieRedux
//
//  Created by Viktor on 12.12.2020.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var store: Store<AppState>
    @State private var search = ""
    
    struct Props {
        let movies: [Movie]
        let onSearch: (String) -> Void
    }
    
    private func map(state: MoviesState) -> Props {
        Props(movies: state.movies, onSearch: { keyword in
            store.dispatch(action: FetchMovies(search: keyword))
        })
    }
    
    var body: some View {
        let props = map(state: store.state.movies)
        
        VStack {
            TextField("Search...", text: $search, onEditingChanged: { _ in },
                      onCommit: {
                        props.onSearch(search)
                      })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            List(props.movies, id: \.imdbId) { movie in
                NavigationLink(
                    destination: MovieDetailsView(movie: movie),
                    label: {
                        MovieCell(movie: movie)
                    })
            }.listStyle(PlainListStyle())
        }
        .navigationTitle("Movies")
        .embedInNavigationView()        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let store = Store(reducer: appReducer, state: AppState(), middlewares: [moviesMiddleware()])
        return RootView().environmentObject(store)
    }
}
