//
//  CharactesListRepository.swift
//  platziExam
//
//  Created by Diego Palomares on 15/06/24.
//

import Foundation

final class CharacterListRepository: CharacterRepositoryProtocol {
    private let dataSource = CharacterListDataSource()

    func fetchCharacters(page: Int) async throws -> [Character] {
        let charactersResponse = try await dataSource.fetchCharacters(page: page)
        
        let characters = charactersResponse.results.compactMap { character in
            return Character(with: character)
        }
        print(characters)
        return characters
    }
}
