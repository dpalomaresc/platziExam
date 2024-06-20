//
//  CharacterListDataSourceDB.swift
//  platziExam
//
//  Created by Diego Palomares on 17/06/24.
//
import Foundation

final class CharacterListDataSourceDB {
    
    private let apiDB: ManagerDBProtocol
    
    init(apiDB: ManagerDBProtocol = RealmDataManager(RealmProvider.default)) {
        
        self.apiDB = apiDB
    }
}

extension CharacterListDataSourceDB: CharacterRepositoryDBProtocol {
    func saveCharacter(user: Character) async throws {
        try await apiDB.save(object: user.managedObject())
    }
    
    func fetchCharacter() async -> [CharacterObject] {
        await apiDB.fetch(CharacterObject.self, predicate: nil, sorted: nil)
    }
    
    func deleteCharacter(character: Character) async throws {
        try await apiDB.delete(object: character.managedObject())
    }
}
