//
//  APIRequest.swift
//  platziExam
//
//  Created by Diego Palomares on 15/06/24.
//

protocol APIRequest {
    var host: String { get }
    var path: String { get }
    var method: HTTPRequestMethod { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}
