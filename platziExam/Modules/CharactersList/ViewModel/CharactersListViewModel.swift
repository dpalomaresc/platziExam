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
    private var page: Int = 1
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
                let list = try await fetchCharactersListUseCase.execute(page)
                page += 1
                await MainActor.run {
                    isLoading = false
                    for character in list {
                        characters.append(character)
                    }
                }
            } catch {
                isLoading = false
            }
        }
    }
    
    func shouldLoadData(id: Int) -> Bool {
        return id == characters.last?.hashValue
    }
}
