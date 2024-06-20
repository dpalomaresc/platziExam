//
//  CharacterListViewModelTest.swift
//  platziExamTests
//
//  Created by Diego Palomares on 19/06/24.
//

import XCTest
@testable import platziExam

final class CharacterListViewModelTest: XCTestCase {
    fileprivate var respositorySpy: CharacterListUseCaseRepositoryTest!
    fileprivate var useCaseDBSpy: CharacterListUseCaseDBTest!
    
    func testFetchCharacterList() {
        let sut = makeSut()
        let expectation = XCTestExpectation(description: "failed to load List")
        useCaseDBSpy.expec = expectation
        sut.fetchCharactersList()
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(useCaseDBSpy.messages, [.executeFetch])
    }
    
    func testShouldLoadData() async throws {
        let mockCharacter = Character(name: "Darth Vader",
                                      height: "192",
                                      mass: "89",
                                      hairColor: "blue",
                                      skinColor: "brown",
                                      eyeColor: "red",
                                      birthYear: "1990",
                                      gender: .male,
                                      homeworld: "none",
                                      films: [],
                                      species: [],
                                      vehicles: [],
                                      starships: [],
                                      created: "",
                                      edited: "",
                                      url: "",
                                      imageUrl: nil)
        let sut = makeSut(character: mockCharacter)
        
        try await withThrowingTaskGroup(of: Void.self) { group in
            group.addTask {
                sut.fetchCharactersList()
                
            }
            group.addTask {
                try await Task.sleep(for: .seconds(5))
                XCTFail("Timed out")
            }
            group.addTask {
                let shouldData = sut.shouldLoadData(id: mockCharacter.hashValue)
                XCTAssertTrue(shouldData)
            }
            let _ = try await group.next()
            group.cancelAll()
        }
    }
    
    func testSaveData() async throws {
        
        let expectation = XCTestExpectation(description: "timeout")
        let sut = makeSut()
        let task = Task {
            sut.saveData(character: Character(managedObject: CharacterObject()))
            XCTAssertEqual(self.useCaseDBSpy.messages, [.executeSave])
        }
        expectation.fulfill()
        await fulfillment(of: [expectation], timeout: 5)
        task.cancel()
    }
    
    func makeSut(character: Character? = nil) -> CharactersListViewModel  {
        respositorySpy = CharacterListUseCaseRepositoryTest()
        respositorySpy.character = character
        useCaseDBSpy = CharacterListUseCaseDBTest()
        return CharactersListViewModel(fetchCharactersListUseCase: respositorySpy, characterListDBUseCase: useCaseDBSpy)
    }
    
    //MARK: - MOCK CLASES
    fileprivate class CharacterListUseCaseRepositoryTest: FetchCharactersListUseCaseProtocol {
        
        var character: Character?
        var expec: XCTestExpectation?
        func execute(_ page: Int) async throws -> [platziExam.Character] {
            guard let character = character else { return []}
            return [character]
        }
    }
    
    fileprivate class CharacterListUseCaseDBTest: CharacterListDataBaseUseCaseProtocol {
        var messages: [Calls] = []
        var expec: XCTestExpectation?

        enum Calls {
            case executeSave
            case executeFetch
            case executeDelete
        }
        func executeSave(_ character: platziExam.Character) async throws {
            messages.append(.executeSave)
        }
        
        func executeFetch() async -> [platziExam.CharacterObject] {
            messages.append(.executeFetch)
            expec?.fulfill()
            return []
        }
        
        func executeDelete(character: platziExam.Character) async throws {
            messages.append(.executeDelete)
            
        }
    }
}
