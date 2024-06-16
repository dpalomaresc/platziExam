//
//  Character.swift
//  platziExam
//
//  Created by Diego Palomares on 15/06/24.
//

import Foundation

struct Character: Hashable {
    let name, height, mass, hairColor: String
    let skinColor, eyeColor, birthYear: String
    let gender: Gender
    let homeworld: String
    let films, species, vehicles, starships: [String]
    let created, edited: String
    let url: String
    let imageUrl: URL?
    
    init(name: String, height: String, mass: String, hairColor: String, skinColor: String, eyeColor: String, birthYear: String, gender: Gender, homeworld: String, films: [String], species: [String], vehicles: [String], starships: [String], created: String, edited: String, url: String, imageUrl: URL?) {
        self.name = name
        self.height = height
        self.mass = mass
        self.hairColor = hairColor
        self.skinColor = skinColor
        self.eyeColor = eyeColor
        self.birthYear = birthYear
        self.gender = gender
        self.homeworld = homeworld
        self.films = films
        self.species = species
        self.vehicles = vehicles
        self.starships = starships
        self.created = created
        self.edited = edited
        self.url = url
        self.imageUrl = imageUrl
    }
    
    init?(with entity: CharacterEntity) {
        self.name = entity.name
        self.height = entity.height
        self.mass = entity.mass
        self.hairColor = entity.hairColor
        self.skinColor = entity.skinColor
        self.eyeColor = entity.eyeColor
        self.birthYear = entity.birthYear
        self.gender = entity.gender
        self.homeworld = entity.homeworld
        self.films = entity.films
        self.species = entity.species
        self.vehicles = entity.vehicles
        self.starships = entity.starships
        self.created = entity.created
        self.edited = entity.edited
        self.url = entity.url
        self.imageUrl =  URL(string: "https://vieraboschkova.github.io/swapi-gallery/static/assets/img/people/" + String(entity.url.parseToInt()) + ".jpg")
    }
}
