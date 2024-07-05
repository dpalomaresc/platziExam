//
//  CharacterListDataSource.swift
//  platziExam
//
//  Created by Diego Palomares on 15/06/24.
//

final class CharacterListDataSource {
    
    private let apiClient: AsyncRepositoryType
    
    init(apiClient: AsyncRepository = AsyncRepository()) {
        
        self.apiClient = apiClient
    }
    
    func fetchCharacters(page: Int) async throws -> CharactersList {
        let request = StarWarsListRequest.init(calls: .getCharacters(page: page))
        return try await apiClient.request(apiRequest: request,
                                           responseType: CharactersList.self)
    }
}
