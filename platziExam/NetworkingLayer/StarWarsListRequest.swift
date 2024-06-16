//
//  StarWarsListRequest.swift
//  platziExam
//
//  Created by Diego Palomares on 15/06/24.
//

import Foundation

enum StarWarsListRequest {
    case getCharacters(page: Int)
}

struct TopMovieRequest: APIRequest {
    let topMovieCall: StarWarsListRequest
    var headers: [String : String]?
    var parameters: [String : Any]?
}

extension TopMovieRequest {
    
    var host: String {
        "https://swapi.dev/api"
    }
    
    var path: String {
        "/people/"
    }
    
    var method: HTTPRequestMethod {
        .get
    }
}
