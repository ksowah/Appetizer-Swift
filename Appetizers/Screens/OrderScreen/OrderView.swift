//
//  OrderView.swift
//  Appetizers
//
//  Created by macbook on 05/01/2024.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack{
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerComponent(appetizer: appetizer)
                        }
                        .onDelete(perform: {
                            indexSet in
                            order.items.remove(atOffsets: indexSet)
                        })
                    }
                    .listStyle(PlainListStyle())
                     
                    Button {
                        print("Order Placed")
                    } label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 30)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no item in your order.\nPlease add an appetizer.")
                }
            }
            .navigationTitle("🧾 Order")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
