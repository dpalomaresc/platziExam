//
//  CharacterRepositoryProtocol.swift
//  platziExam
//
//  Created by Diego Palomares on 15/06/24.
//

protocol CharacterRepositoryProtocol {
    func fetchCharacters(page: Int) async throws -> [Character]
}
