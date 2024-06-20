//
//  RealProvider.swift
//  platziExam
//
//  Created by Diego Palomares on 17/06/24.
//

import RealmSwift
import Foundation

struct RealmProvider {
    
    let configuration: Realm.Configuration
    
    internal init(config: Realm.Configuration) {
        configuration = config
    }

    private var realm: Realm? {
        do {
            return try Realm(configuration: configuration)
        }catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private static let defaultConfig = Realm.Configuration(schemaVersion: 1)

    
    public static var `default`: Realm? = {
        return RealmProvider(config: RealmProvider.defaultConfig).realm
    }()
    
    @MainActor
    func openFlexibleSyncRealm() async throws -> Realm {
        // Pass object types to the Flexible Sync configuration
        // as a temporary workaround for not being able to add complete schema
        // for a Flexible Sync app
        let realm = try await Realm(configuration: Realm.Configuration(schemaVersion: 1), downloadBeforeOpen: .always)
        return realm
    }
}

actor RealmWithActor {
    // An implicitly-unwrapped optional is used here to let us pass `self` to
    // `Realm(actor:)` within `init`
    var realm: Realm!
    init() async throws {
        realm = try await Realm(actor: self)
    }
}
