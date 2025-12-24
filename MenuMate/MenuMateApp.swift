//
//  MenuMate.swift
//  MenuMate
//
//  Created by Alex Senu
//

import SwiftUI

@main
struct MenuMateApp: App {
    @StateObject var order = Order()
    @State private var menuStore = MenuStore()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
                .environment(menuStore)          
        }
    }
}
