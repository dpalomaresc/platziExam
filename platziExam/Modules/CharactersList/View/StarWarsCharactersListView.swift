//
//  StarWarsCharactersList.swift
//  platziExam
//
//  Created by Diego Palomares on 14/06/24.
//

import SwiftUI

struct StarWarsCharactersListView<Model>: View where Model: CharactersListViewModelProtocol {
    @State private var viewModel: Model
    init(viewModel: Model) {
        self.viewModel = viewModel
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.characters, id: \.self) { character in
                        NavigationLink(destination: CharactersListRouter.buildCharacterDetailsView(with: character)) {
                            CharacterCell(character: character)
                                .onAppear{
                                    if viewModel.shouldLoadData(id: character.hashValue) {
                                        viewModel.fetchCharactersList()
                                    }
                                }
                        }
                    }.listRowBackground(Color.backGroundComponent)
                }.navigationTitle("Star Wars Characters")
                
                .scrollContentBackground(.hidden)
                    .background(.backGroundApp)
            }
        }
    }
}

#Preview {
    StarWarsCharactersListView(viewModel: CharactersListViewModel())
}
