//
//  CharacterRepositoryDB.swift
//  platziExam
//
//  Created by Diego Palomares on 17/06/24.
//

protocol CharacterRepositoryDBProtocol {
    func saveCharacter(user: Character) async throws
    func fetchCharacter() async -> [CharacterObject]
    func deleteCharacter(character: Character) async throws
}
