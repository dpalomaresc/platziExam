//
//  CharacterDetailView.swift
//  platziExam
//
//  Created by Diego Palomares on 16/06/24.
//

import SwiftUI

struct CharacterDetailView<Model>: View where Model: CharacterDetailViewModelProtocol {
    @State private var viewModel: Model
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack {
                CacheAsyncImage(url: viewModel.character.imageUrl) { image in
                    image
                        .image?
                        .resizable()
                }
                .scaledToFit()
                .frame(height: 300)
                .containerRelativeFrame(.horizontal)
                
                HStack {
                    Text(viewModel.character.name)
                        .textCase(.uppercase)
                        .font(.subheadline)
                    
                    Spacer()
                    Divider()
                    Spacer()
                    
                    Text(viewModel.character.name)
                        .font(.headline)
                }
                .padding(12)
            }
        }
    }
}

#Preview {
    CharacterDetailView(viewModel: CharacterDetailViewModel(
        character: Character(name: "",
                             height: "",
                             mass: "",
                             hairColor: "",
                             skinColor: "",
                             eyeColor: "",
                             birthYear: "",
                             gender: .female,
                             homeworld: "",
                             films: [],
                             species: [],
                             vehicles: [],
                             starships: [],
                             created: "",
                             edited: "",
                             url: "",
                             imageUrl: nil)))
}
