//
//  TabBarMenu.swift
//  platziExam
//
//  Created by Diego Palomares on 18/06/24.
//

import SwiftUI

struct TabBarMenu: View {
    var body: some View {
        TabView {
            AppRouter.buildStarWarsCharacterstView()
                .tabItem {
                    Label("Lista", systemImage: "list.dash")
                }
            
            FavoriteCharacterRouter.build()
                .tabItem {
                    Label("Favoritos", systemImage: "star.fill")
                }
        }.background(.backGroundApp)
    }
}

#Preview {
    TabBarMenu()
}
