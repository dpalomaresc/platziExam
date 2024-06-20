//
//  RealDataManager.swift
//  platziExam
//
//  Created by Diego Palomares on 17/06/24.
//

import Foundation
import RealmSwift

enum RealmError: Error {
    case eitherRealmIsNilOrNotRealmSpecificModel
}

extension RealmError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .eitherRealmIsNilOrNotRealmSpecificModel:
            return NSLocalizedString("eitherRealmIsNilOrNotRealmSpecificModel", comment: "eitherRealmIsNilOrNotRealmSpecificModel")
        }
    }
}

class RealmDataManager {
    private var realm: Realm?
    
    init(_ realm: Realm?) {
        self.realm = realm
    }
}

extension RealmDataManager: ManagerDBProtocol {
    
    func create<T>(_ model: T.Type, completion: @escaping ((T) -> Void)) throws where T : Storable {
        guard let realm = realm, let model = model as? Object.Type else { throw RealmError.eitherRealmIsNilOrNotRealmSpecificModel }
        try realm.write  {
            let newObject = realm.create(model, value: [], update: .all) as! T
            completion(newObject)
        }
    }
    
    func save(object: Storable) async throws {
        guard let realm = realm, let object = object as? Object else { throw RealmError.eitherRealmIsNilOrNotRealmSpecificModel }
        try await realm.asyncWrite {
            realm.add(object)
        }
    }
    
    func update(object: Storable) throws {
        guard let realm = realm, let object = object as? Object else {
            throw RealmError.eitherRealmIsNilOrNotRealmSpecificModel
        }
        try realm.write {
            realm.add(object,update: .all)
        }
    }
    
    func delete(object: Storable) async throws {
        guard let realm = realm, let object = object as? Object else { throw RealmError.eitherRealmIsNilOrNotRealmSpecificModel }
        try await realm.asyncWrite {
            let predicate = NSPredicate(format: "name == %@", (object as? CharacterObject)?.name ?? "" )
            let objectsToDelete = realm.objects(CharacterObject.self).filter("name == %@", (object as? CharacterObject)?.name ?? "")
            realm.delete(objectsToDelete)
            }
        }
    
    func deleteAll<T>(_ model: T.Type) throws where T : Storable {
        guard let realm = realm, let model = model as? Object.Type else { throw RealmError.eitherRealmIsNilOrNotRealmSpecificModel }
        try realm.write {
            let objects = realm.objects(model)
            for object in objects {
                realm.delete(object)
            }
        }
    }

   @MainActor
    func fetch<T: Storable>(_ model: T.Type, predicate: NSPredicate?, sorted: Sorted?) async -> [T] {
        guard let realm = realm, let model = model as? Object.Type else { return [] }
        var objects = realm.objects(model)
        if let predicate = predicate {
            objects = objects.filter(predicate)
        }
        if let sorted = sorted {
            objects = objects.sorted(byKeyPath: sorted.key, ascending: sorted.ascending)
        }
        return objects.compactMap { $0 as? T }
    }
}
