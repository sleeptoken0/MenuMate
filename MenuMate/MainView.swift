//
//  MainView.swift
//  MenuMate
//
//  Created by Alex Senu
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("tab_menu", systemImage: "list.dash")
                }
            OrderView()
                .tabItem {
                    Label("tab_order", systemImage: "square.and.pencil")
                }
            SettingsView()
                .tabItem {
                    Label("tab_settings", systemImage: "gear") }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(Order())
        .environment(MenuStore())
}
