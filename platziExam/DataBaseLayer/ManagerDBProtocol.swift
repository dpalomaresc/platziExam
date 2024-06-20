//
//  ManagerDBProtocol.swift
//  platziExam
//
//  Created by Diego Palomares on 17/06/24.
//
import RealmSwift
import Foundation

public protocol Storable { }

extension Object: Storable {
    
}

public struct Sorted {
    var key: String
    var ascending: Bool = true
}

protocol ManagerDBProtocol {
    func create<T: Storable>(_ model: T.Type, completion: @escaping ((T) -> Void)) throws
    func save(object: Storable) async throws
    func update(object: Storable) throws
    func delete(object: Storable) async throws
    func deleteAll<T: Storable>(_ model: T.Type) throws
    func fetch<T: Storable>(_ model: T.Type, predicate: NSPredicate?, sorted: Sorted?) async -> [T]
}
