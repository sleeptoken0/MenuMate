//
//  MenuStore.swift
//  MenuMate
//
//  Created by Alex Senu
//

import SwiftUI
import Observation

@Observable
final class MenuStore {
    // exposed data
    private(set) var menu: [MenuSection] = []

    // single source of truth key
    static let languageKey = "menuLanguage"

    // cached last loaded to avoid unnecessary reloads
    private var lastLoadedLanguage: MenuLanguage?
    
    var language: MenuLanguage {
        currentLanguage()
    }

    init() {
        reloadIfNeeded()
    }

    /// Reads the user's preference and reloads only if it changed.
    func reloadIfNeeded() {
        let language = currentLanguage()

        guard language != lastLoadedLanguage else { return }
        lastLoadedLanguage = language

        menu = Bundle.main.decode([MenuSection].self, from: language.fileName)
    }

    /// Explicit setter used by SettingsView.
    func setLanguage(_ language: MenuLanguage) {
        UserDefaults.standard.set(language.rawValue, forKey: Self.languageKey)
        reloadIfNeeded()
    }

    func currentLanguage() -> MenuLanguage {
        let raw = UserDefaults.standard.string(forKey: Self.languageKey)
        return MenuLanguage(rawValue: raw ?? "") ?? .greek
    }
}
