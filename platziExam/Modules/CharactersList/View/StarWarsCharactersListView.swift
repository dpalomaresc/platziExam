//
//  StarWarsCharactersList.swift
//  platziExam
//
//  Created by Diego Palomares on 14/06/24.
//

import SwiftUI
import Lottie

struct StarWarsCharactersListView<Model>: View where Model: CharactersListViewModelProtocol {
    @State private var viewModel: Model
    init(viewModel: Model) {
        self.viewModel = viewModel
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(viewModel.characters, id: \.self) { character in
                        NavigationLink(destination: CharactersListRouter.buildCharacterDetailsView(with: character)) {
                            CharacterCell(viewModel: viewModel, character: character)
                                .onAppear{
                                    if viewModel.shouldLoadData(id: character.hashValue) {
                                        viewModel.fetchCharactersList()
                                    }
                                }
                        }
                    }
                    .listRowBackground(Color.backGroundComponent)
                }
                .navigationTitle("Star Wars Characters")
                .scrollContentBackground(.hidden)
                .background(.backGroundApp)
                if viewModel.isLoading {
                    LottieView(animation: .named("r2d2"))
                        .looping()
                        .frame(width: 200, height: 200)
                        .cornerRadius(100)
                }                    
            }
        }.onAppear {
            viewModel.fetchCharactersList()
        }.alert(
            "Network connection seems to be offline.",
            isPresented: $viewModel.networkStatus
        ) {}
    }
}

#Preview {
    StarWarsCharactersListView(viewModel: CharactersListViewModel(fetchCharactersListUseCase: FetchCharactersListUseCase(CharacterListRepository(), CharacterListDataBaseUseCase(CharacterListDataSourceDB())), characterListDBUseCase: CharacterListDataBaseUseCase(CharacterListDataSourceDB())))
}
