//
//  platziExamApp.swift
//  platziExam
//
//  Created by Diego Palomares on 14/06/24.
//

import SwiftUI

@main
struct platziExamApp: App {
    var body: some Scene {
        WindowGroup {
            if isProduction {
                TabBarRouter.build()
            }
        }
    }
    
    private var isProduction: Bool {
        NSClassFromString("XCTestCase") == nil
    }
}
