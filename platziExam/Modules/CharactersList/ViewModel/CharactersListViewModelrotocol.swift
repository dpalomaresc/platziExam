//
//  CharactersListViewModelrotocol.swift
//  platziExam
//
//  Created by Diego Palomares on 15/06/24.
//

import Foundation

protocol CharactersListViewModelProtocol {
    var isLoading: Bool { get set }
    var characters: [Character] { get set }
    func fetchCharactersList()
    func shouldLoadData(id: Int) -> Bool
}
