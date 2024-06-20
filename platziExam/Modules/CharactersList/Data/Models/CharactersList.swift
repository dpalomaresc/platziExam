//
//  Characters.swift
//  platziExam
//
//  Created by Diego Palomares on 15/06/24.
//

struct CharactersList: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [CharacterEntity]
}
