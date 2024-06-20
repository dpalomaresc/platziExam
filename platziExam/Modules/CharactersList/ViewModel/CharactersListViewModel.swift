//
//  ViewModel.swift
//  platziExam
//
//  Created by Diego Palomares on 15/06/24.
//

import SwiftUI
import Combine
import Network

@Observable
final class CharactersListViewModel {
    var isLoading: Bool = false
    var isFavorite: Bool = true
    var characters: [Character] = []
    var charactersLocal: [Character] = []
    private var page: Int = 1
    private var fetchCharactersListUseCase: FetchCharactersListUseCaseProtocol
    private var characterListDBUseCase: CharacterListDataBaseUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    private let monitorQueue = DispatchQueue(label: "monitor")
    var networkStatus: Bool = false
    
    init(fetchCharactersListUseCase: FetchCharactersListUseCaseProtocol, characterListDBUseCase: CharacterListDataBaseUseCaseProtocol) {
        self.characterListDBUseCase = characterListDBUseCase
        self.fetchCharactersListUseCase = fetchCharactersListUseCase
        networkReceive()
    }
    private func networkReceive() {
        NWPathMonitor()
            .publisher(queue: monitorQueue)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] status in
                self?.networkStatus = status != .satisfied
            }
            .store(in: &cancellables)
    }
    
    private func fetchOfflineItems() {
        Task { @MainActor in
            isLoading = false
            charactersLocal = await characterListDBUseCase.executeFetch().compactMap({Character(managedObject: $0)})
        }
    }
    
    private func deleteCharacter(_ character: Character) {
        if let characterObject = charactersLocal.first(where: {$0.name == character.name}) {
            Task {
                do {
                    try await characterListDBUseCase.executeDelete(character: characterObject)
                    isLoading = false
                } catch {
                    print("implement error to delete character")
                }
            }
        }
        charactersLocal.removeAll(where: {$0.name == character.name})
    }
    
    private func addCharacter(_ character: Character) {
        Task {
            do {
                try await characterListDBUseCase.executeSave(character)
                isLoading = false
            } catch {
                print(error)
            }
        }
        charactersLocal.append(character)
    }
}
 
extension CharactersListViewModel: CharactersListViewModelProtocol {
    
    func fetchCharactersList() {
        isLoading = true
        Task {
            do {
                let list = try await fetchCharactersListUseCase.execute(page)
                fetchOfflineItems()
                page += 1
                isLoading = false
                for character in list {
                    characters.append(character)
                }
            } catch {
                print(error)
                isLoading = false
            }
        }
    }
    
    func shouldLoadData(id: Int) -> Bool {
        return id == characters.last?.hashValue
    }
    
    func isContaintFavorite(character: Character) -> Bool{
        return charactersLocal.contains(where: {$0.name == character.name})
    }
    
    func saveData(character: Character) {
        isLoading = true
        if isContaintFavorite(character: character) {
            deleteCharacter(character)
        } else {
            addCharacter(character)
        }
    }
}
