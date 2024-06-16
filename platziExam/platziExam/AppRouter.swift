//
//  AppRouter.swift
//  platziExam
//
//  Created by Diego Palomares on 16/06/24.
//

import SwiftUI

enum AppRouter {
    
    static func buildStarWarsCharacterstView() -> some View {
        let viewModel = CharactersListViewModel()
        let view = StarWarsCharactersListView(viewModel: viewModel)
        return view
    }
    
}
