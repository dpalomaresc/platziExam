//
//  TabBarRouter.swift
//  platziExam
//
//  Created by Diego Palomares on 18/06/24.
//

import SwiftUI

enum TabBarRouter {
    static func build() -> some View {
        let view = TabBarMenu()
        return view
    }
}
