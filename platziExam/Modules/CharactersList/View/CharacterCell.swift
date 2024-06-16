//
//  CharacterCell.swift
//  platziExam
//
//  Created by Diego Palomares on 16/06/24.
//

import SwiftUI

struct CharacterCell: View {
    var character: Character

    // MARK: - Body View -
    var body: some View {
        HStack {
            CacheAsyncImage(url: character.imageUrl) { image in
                image
                    .image?
                    .resizable()
            }
            .scaledToFit()
            .frame(width: 80, height: 80)
            .clipShape(UnevenRoundedRectangle(topLeadingRadius: 16, bottomTrailingRadius: 16))

            
            Text(character.name)
                .padding(.leading, 24)
                .textCase(.uppercase)
                .font(.headline)
        }
    }
}

#Preview {
    CharacterCell(character: Character(name: "",
                                       height: "",
                                       mass: "",
                                       hairColor: "",
                                       skinColor: "",
                                       eyeColor: "",
                                       birthYear: "",
                                       gender: .male,
                                       homeworld: "",
                                       films: [],
                                       species: [],
                                       vehicles: [],
                                       starships: [],
                                       created: "",
                                       edited: "",
                                       url: "",
                                       imageUrl: nil))
}
