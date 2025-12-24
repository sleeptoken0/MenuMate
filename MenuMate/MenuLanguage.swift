//
//  MenuLanguage.swift
//  MenuMate
//
//  Created by Alex Senu
//

import Foundation

enum MenuLanguage: String, CaseIterable, Identifiable {
    case greek
    case english

    var id: String { rawValue }

    var title: String {
        switch self {
        case .greek:   return "Ελληνικά"
        case .english: return "English"
        }
    }

    var fileName: String {
        switch self {
        case .greek:   return "menu_el.json"
        case .english: return "menu_en.json"
        }
    }
    
    var currencyCode: String {
        switch self {
        case .greek:   return "EUR"
        case .english: return "USD"
        }
    }
    
    var locale: Locale {
        switch self {
        case .greek:   return Locale(identifier: "el_GR")
        case .english: return Locale(identifier: "en_US")
        }
    }
}
