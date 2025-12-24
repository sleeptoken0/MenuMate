//
//  CheckoutView.swift
//  MenuMate
//
//  Created by Alex Senu
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    @Environment(MenuStore.self) private var menuStore
    
    let paymentTypes = ["Cash", "Credit card", "MenuMate Points"]
    @State private var paymentType = "Cash"
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipAmount = 15
    
    @State private var showingPaymentAlert = false
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "EUR"))
        }
    
    
    var totalTitle: String {
        String(format: NSLocalizedString("checkout_total", comment: ""), totalPrice)
        }

    var alertMessage: String {
        String(format: NSLocalizedString("checkout_alert_message", comment: ""), totalPrice)
    }
    
    var body: some View {
        Form {
            Section {
                Picker("checkout_payment_method", selection: $paymentType){
                    ForEach(paymentTypes, id: \.self){ type in
                        Text(type)
                    }
                }
                
                Toggle("checkout_add_loyalty", isOn: $addLoyaltyDetails)
                
                if addLoyaltyDetails {
                    TextField("checkout_enter_id", text: $loyaltyNumber.animation())
                }
            }
            Section("checkout_add_tip") {
                Picker("checkout_tip_amount", selection: $tipAmount){
                    ForEach(tipAmounts, id: \.self){ amount in
                        Text("\(amount)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section(totalTitle) {
                Button("checkout_confirm") {
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("nav_payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("checkout_alert_title", isPresented : $showingPaymentAlert){
            //add buttons here
        }
        message: {
            Text(alertMessage)
        }
    }
}



#Preview {
    CheckoutView()
        .environmentObject(Order())
        .environment(MenuStore())
}
