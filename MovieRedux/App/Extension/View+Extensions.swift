//
//  View+Extensions.swift
//  MovieRedux
//
//  Created by Viktor on 12.12.2020.
//

import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}

