//
//  AsyncRepositoryType.swift
//  platziExam
//
//  Created by Diego Palomares on 15/06/24.
//

protocol AsyncRepositoryType: AnyObject {
    
    func request<Response: Decodable>(apiRequest: APIRequest,
                                      responseType: Response.Type) async throws -> Response
}
