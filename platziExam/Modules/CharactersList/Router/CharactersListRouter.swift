//
//  CharactersListRouter.swift
//  platziExam
//
//  Created by Diego Palomares on 16/06/24.
//

import SwiftUI

enum CharactersListRouter {
    static func buildCharacterDetailsView(with character: Character) -> some View {
        let viewModel = CharacterDetailViewModel(character: character)
        let view = CharacterDetailView(viewModel: viewModel)
        return view
    }
}
