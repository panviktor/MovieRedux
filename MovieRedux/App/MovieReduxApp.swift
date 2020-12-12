//
//  MovieReduxApp.swift
//  MovieRedux
//
//  Created by Viktor on 12.12.2020.
//

import SwiftUI

@main
struct MovieReduxApp: App {
    var body: some Scene {
        let store = Store(reducer: appReducer, state: AppState())
        WindowGroup {
            RootView()
                .environmentObject(store)
        }
    }
}
