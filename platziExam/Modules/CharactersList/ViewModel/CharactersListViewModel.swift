//
//  ViewModel.swift
//  platziExam
//
//  Created by Diego Palomares on 15/06/24.
//

import SwiftUI

@Observable
final class CharactersListViewModel {
    var isLoading: Bool = false
    var characters: [Character]
    private var fetchCharactersListUseCase = FetchCharactersListUseCase(CharacterListRepository())
    
    init() {
        characters = []
        fetchCharactersList()
    }
}
 
extension CharactersListViewModel: CharactersListViewModelProtocol {
    func fetchCharactersList() {
        isLoading = true
        Task {
            do {
                let list = try await fetchCharactersListUseCase.execute()
                await MainActor.run {
                    isLoading = false
                    characters = list
                }
            } catch {
                isLoading = false
            }
        }
    }
}
