//
//  AppRouter.swift
//  platziExam
//
//  Created by Diego Palomares on 16/06/24.
//

import SwiftUI

enum AppRouter {
    
    static func buildStarWarsCharacterstView() -> some View {
        let useCaseRepository = FetchCharactersListUseCase(CharacterListRepository(), CharacterListDataBaseUseCase(CharacterListDataSourceDB()))
        let useCaseDataBase = CharacterListDataBaseUseCase(CharacterListDataSourceDB())
        let viewModel = CharactersListViewModel(fetchCharactersListUseCase: useCaseRepository, characterListDBUseCase: useCaseDataBase)
        let view = StarWarsCharactersListView(viewModel: viewModel)
        return view
    }
    
}
