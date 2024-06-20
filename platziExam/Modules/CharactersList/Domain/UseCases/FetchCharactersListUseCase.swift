//
//  FetchCharactersListUseCase.swift
//  platziExam
//
//  Created by Diego Palomares on 15/06/24.
//

import Foundation
import Combine
import Network

protocol FetchCharactersListUseCaseProtocol {
    func execute(_ page: Int) async throws -> [Character]
}

final class FetchCharactersListUseCase: FetchCharactersListUseCaseProtocol {
    private let repository: CharacterRepositoryProtocol
    private let localRepository: CharacterListDataBaseUseCaseProtocol
    
    
    init(_ repository: CharacterRepositoryProtocol, _ localRepository: CharacterListDataBaseUseCaseProtocol) {
        self.repository = repository
        self.localRepository = localRepository
    }
    
    func execute(_ page: Int = 1) async throws -> [Character] {
        return try await repository.fetchCharacters(page: page)
    }
}
