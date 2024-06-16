//
//  FetchCharactersListUseCase.swift
//  platziExam
//
//  Created by Diego Palomares on 15/06/24.
//

import Foundation

final class FetchCharactersListUseCase {
    private let repository: CharacterRepositoryProtocol
    
    init(_ repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(_ page: Int = 1) async throws -> [Character] {
        return try await repository.fetchCharacters(page: page)
    }
}
