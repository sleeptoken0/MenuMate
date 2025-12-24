//
//  SettingsView.swift
//  MenuMate
//
//  Created by Alex Senu
//

import SwiftUI

struct SettingsView: View {
    @AppStorage(MenuStore.languageKey) private var menuLanguageRaw = MenuLanguage.greek.rawValue
    @Environment(MenuStore.self) private var menuStore

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker(selection: $menuLanguageRaw) {
                        ForEach(MenuLanguage.allCases) { lang in
                            Text(lang.title).tag(lang.rawValue)
                        }
                    } label: {
                        Label("settings_language", systemImage: "globe")
                    }
                }
            }
            .navigationTitle("tab_settings")
            .onAppear {
                menuStore.reloadIfNeeded()
            }
            .onChange(of: menuLanguageRaw) { _, newValue in
                let lang = MenuLanguage(rawValue: newValue) ?? .greek
                menuStore.setLanguage(lang)
            }
        }
    }
}

