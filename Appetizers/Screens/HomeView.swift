//
//  ContentView.swift
//  Appetizers
//
//  Created by macbook on 05/01/2024.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        
        TabView {
           AppetizerListView()
                .tabItem { Label("Home", systemImage: "house") }
            
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
            
            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(order.items.count)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


