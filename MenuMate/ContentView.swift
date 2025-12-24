//
//  ContentView.swift
//  MenuMate
//
//  Created by Alex Senu
//

import SwiftUI

struct ContentView: View {
    @Environment(MenuStore.self) private var menuStore
    @State private var showRestrictionsInfo = false
    
    private let restrictionOrder = ["D", "G", "N", "S", "V"]
    private let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    private let labelKeys: [String: String] = [
        "D": "restriction_d",
        "G": "restriction_g",
        "N": "restriction_n",
        "S": "restriction_s",
        "V": "restriction_v"
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(menuStore.menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            NavigationLink(value: item) {
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: MenuItem.self) { item in
                ItemDetail(item: item)
            }
            .navigationTitle("nav_menu")
            .listStyle(.grouped)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showRestrictionsInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                    }
                    .accessibilityLabel("restrictions_info_title")
                }
            }
            .popover(isPresented: $showRestrictionsInfo) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("restrictions_info_title")
                        .font(.headline)

                    ForEach(restrictionOrder, id: \.self) { code in
                        HStack(spacing: 10) {
                            Text(code)
                                .font(.caption)
                                .fontWeight(.black)
                                .padding(6)
                                .background(colors[code, default: .black])
                                .clipShape(Circle())
                                .foregroundStyle(.white)

                            Text(LocalizedStringKey(labelKeys[code] ?? code))
                                .font(.body)
                        }
                    }
                }
                .padding()
                .frame(minWidth: 240)
            }

        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Order())
        .environment(MenuStore())
}
