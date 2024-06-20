//
//  CharacterListDataBaseUseCase.swift
//  platziExam
//
//  Created by Diego Palomares on 17/06/24.
//

import Foundation
protocol CharacterListDataBaseUseCaseProtocol {
    func executeSave(_ character: Character) async throws
    func executeFetch() async -> [CharacterObject]
    func executeDelete(character: Character) async throws
}

final class CharacterListDataBaseUseCase: CharacterListDataBaseUseCaseProtocol {
    private let dataSource: CharacterRepositoryDBProtocol
    
    init(_ dataSource: CharacterRepositoryDBProtocol) {
        self.dataSource = dataSource
    }
    
    func executeSave(_ character: Character) async throws {
        try await dataSource.saveCharacter(user: character)
    }
    
    func executeFetch() async -> [CharacterObject] {
        await dataSource.fetchCharacter()
    }
    
    func executeDelete(character: Character) async throws {
        try await dataSource.deleteCharacter(character: character)
    }
}
