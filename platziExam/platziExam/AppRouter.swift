//
//  AppRouter.swift
//  platziExam
//
//  Created by Diego Palomares on 16/06/24.
//

import SwiftUI

enum AppRouter {
    
    static func makeStarWarsCharacterstView() -> some View {
        let viewModel = CharactersListViewModel()
        let view = StarWarsCharactersList(viewModel: viewModel)
        return view
    }
    
}
