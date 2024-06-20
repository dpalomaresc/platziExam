//
//  StarWarsListRequest.swift
//  platziExam
//
//  Created by Diego Palomares on 15/06/24.
//

import Foundation

enum StarWarsListCalls {
    case getCharacters(page: Int)
}

struct StarWarsListRequest: APIRequest {
    let calls: StarWarsListCalls
    var headers: [String : String]?
    var parameters: [String : Any]?
}

extension StarWarsListRequest {
    
    var host: String {
        "https://swapi.dev/api"
    }
    
    var path: String {
        if case .getCharacters(let page) = calls {
            return "/people/?page=\(page)"
        } else {
            return "/people/"
        }
    }
    
    var method: HTTPRequestMethod {
        .get
    }
}
