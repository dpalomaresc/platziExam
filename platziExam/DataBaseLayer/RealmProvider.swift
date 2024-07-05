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
}
