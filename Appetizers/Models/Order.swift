//
//  Order.swift
//  Appetizers
//
//  Created by macbook on 09/01/2024.
//

import SwiftUI


final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) {
            $0 + $1.price
        }
    }
}



