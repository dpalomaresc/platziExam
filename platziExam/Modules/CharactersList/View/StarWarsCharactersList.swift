//
//  StarWarsCharactersList.swift
//  platziExam
//
//  Created by Diego Palomares on 14/06/24.
//

import SwiftUI

struct StarWarsCharactersList<Model>: View where Model: CharactersListViewModelProtocol {
    @State private var viewModel: Model
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.characters, id: \.self) { character in
                    CharacterCell(character: character)
                }
            }
        }
    }
}

#Preview {
    StarWarsCharactersList(viewModel: CharactersListViewModel())
}
