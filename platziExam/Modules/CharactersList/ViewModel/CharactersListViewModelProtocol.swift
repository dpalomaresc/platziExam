//
//  CharactersListViewModelrotocol.swift
//  platziExam
//
//  Created by Diego Palomares on 15/06/24.
//

import Foundation
import Network

protocol CharactersListViewModelProtocol {
    var isLoading: Bool { get set }
    var isFavorite: Bool { get set }

    var characters: [Character] { get set }
    func fetchCharactersList()
    func shouldLoadData(id: Int) -> Bool
    func saveData(character: Character)
    var networkStatus: Bool { get set }
    func isContaintFavorite(character: Character) -> Bool
}

extension CharactersListViewModelProtocol {
    func isContaintFavorite(character: Character) -> Bool {
        return false
    }
}
