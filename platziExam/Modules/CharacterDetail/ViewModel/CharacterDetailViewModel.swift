//
//  CharacterDetailViewModel.swift
//  platziExam
//
//  Created by Diego Palomares on 16/06/24.
//

import Foundation

protocol CharacterDetailViewModelProtocol {
    var character: Character { get }
}

@Observable
final class CharacterDetailViewModel {
    var character: Character
    
    init(character: Character) {
        self.character = character
    }
}

extension CharacterDetailViewModel: CharacterDetailViewModelProtocol { }
