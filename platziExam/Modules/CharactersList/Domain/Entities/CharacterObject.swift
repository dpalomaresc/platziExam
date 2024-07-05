//
//  CharacterDBEntity.swift
//  platziExam
//
//  Created by Diego Palomares on 17/06/24.
//

import RealmSwift
import Foundation

class CharacterObject: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var height: String
    @Persisted var mass: String
    @Persisted var hairColor: String
    @Persisted var skinColor: String
    @Persisted var eyeColor: String
    @Persisted var birthYear: String
    @Persisted var gender: Gender.RawValue
    @Persisted var homeworld: String
    @Persisted var films: List<String>
    @Persisted var species: List<String>
    @Persisted var vehicles: List<String>
    @Persisted var starships: List<String>
    @Persisted var created: String
    @Persisted var edited: String
    @Persisted var url: String
    @Persisted var imageUrl: String
}
