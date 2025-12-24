//
//  OrderView.swift
//  MenuMate
//
//  Created by Alex Senu
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("€\(item.price)")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink("order_place") {
                        CheckoutView()
                        #imageLiteral(resourceName: "simulator_screenshot_B7D0A55F-B162-49FD-B4F4-C0DDC4AA77C7.png")                    }
                }
                .disabled(order.items.isEmpty)
            }
            .navigationBarTitle("nav_order")
            .toolbar {
                EditButton()
            }
        }
    }
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
        .environment(MenuStore())
}
