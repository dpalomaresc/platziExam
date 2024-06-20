//
//  FavoriteCharacterRouter.swift
//  platziExam
//
//  Created by Diego Palomares on 18/06/24.
//

import SwiftUI

enum FavoriteCharacterRouter {
    static func build() -> some View {
        let viewModel = FavoriteCharacterViewModel()
        let view = StarWarsCharactersListView(viewModel: viewModel)
        return view
    }
}
