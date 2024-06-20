//
//  FavoriteCharacterViewModel.swift
//  platziExam
//
//  Created by Diego Palomares on 18/06/24.
//
import SwiftUI
import Network

@Observable
final class FavoriteCharacterViewModel {
    var isLoading: Bool = false
    var isFavorite: Bool = false
    var characters: [Character] = []
    private var characterListDBUseCase = CharacterListDataBaseUseCase(CharacterListDataSourceDB())
    var networkStatus: Bool = false
}
 
extension FavoriteCharacterViewModel: CharactersListViewModelProtocol {
    func fetchCharactersList() {
        isLoading = true
        Task { @MainActor in
            isLoading = false
            let data = await characterListDBUseCase.executeFetch().compactMap({Character(managedObject: $0)})
            characters = data
        }
    }
    
    func shouldLoadData(id: Int) -> Bool {
        false
    }
    
    func saveData(character: Character) {
        
    }
    
    func isContaintFavorite(character: Character) {
        
    }
}
