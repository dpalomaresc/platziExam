//
//  CharacterCell.swift
//  platziExam
//
//  Created by Diego Palomares on 16/06/24.
//

import SwiftUI

struct CharacterCell<Model>: View where Model: CharactersListViewModelProtocol {
    @State var viewModel: Model
    var character: Character
    var body: some View {
        HStack {
            CacheAsyncImage(url: character.imageUrl) { image in
                image
                    .image?
                    .resizable()
            }
            .frame(width: 130, height: 180)
            .cornerRadius(20)
            .shadow(radius: 30)
            
            Text(character.name)
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
            VStack(alignment: .trailing) {
                Button(action: {
                    viewModel.saveData(character: character)
                }) {
                    Image(systemName: viewModel.isContaintFavorite(character: character) ? "heart.fill" : "heart")
                        .resizable()
                    .frame(width: 35, height: 35)
                    .padding(.top, 10)
                    .padding(.trailing, -20)
                    .foregroundColor(.red)
                }
                .buttonStyle(BorderlessButtonStyle())
                .opacity(viewModel.isFavorite ? 1 : 0)
                
                Spacer()
            }
        }
    }
}

//#Preview {
//    CharacterCell(character: Character(name: "Luke Skywalker",
//                                       height: "",
//                                       mass: "",
//                                       hairColor: "",
//                                       skinColor: "",
//                                       eyeColor: "",
//                                       birthYear: "",
//                                       gender: .male,
//                                       homeworld: "",
//                                       films: [],
//                                       species: [],
//                                       vehicles: [],
//                                       starships: [],
//                                       created: "",
//                                       edited: "",
//                                       url: "",
//                                       imageUrl: URL(string: "https://vieraboschkova.github.io/swapi-gallery/static/assets/img/people/1.jpg")))
//}
