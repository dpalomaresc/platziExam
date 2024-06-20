//
//  CharacterDetailView.swift
//  platziExam
//
//  Created by Diego Palomares on 16/06/24.
//

import SwiftUI
import AVKit

struct CharacterDetailView<Model>: View where Model: CharacterDetailViewModelProtocol {
    @State private var viewModel: Model
    @State private var player = AVPlayer()

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
                .cornerRadius(20)
                .containerRelativeFrame(.horizontal)
                Text(viewModel.character.name)
                    .textCase(.uppercase)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Spacer()
                contentDescription(title: "Genero:", desc: viewModel.character.gender.rawValue)
                contentDescription(title: "Hair color:", desc: viewModel.character.hairColor)
                contentDescription(title: "Mass:", desc: viewModel.character.mass)
                contentDescription(title: "Skin Color:", desc: viewModel.character.skinColor)
                VideoPlayerView().frame(maxWidth: .infinity)
            }
        }.background(.backGroundApp)
    }
    
    private func contentDescription(title: String, desc: String) -> some View {
        VStack {
            HStack {
                Text(title)
                    .font(.title2).bold()
                    .foregroundColor(.white)
                Text(desc)
                    .font(.title3)
                    .foregroundColor(.white)
                Spacer()
            }.padding(.leading, 30)
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
