//
//  ItemDetail.swift
//  MenuMate
//
//  Created by Alex Senu
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                
                Text(String(format: NSLocalizedString("item_photo", comment: ""), item.photoCredit))
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            
            Button("item_order") {
                order.add(item: item)
            }

            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ItemDetail(item: MenuItem.example)
        .environmentObject(Order())
        .environment(MenuStore())
}
