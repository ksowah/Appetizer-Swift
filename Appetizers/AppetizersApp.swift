//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by macbook on 05/01/2024.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(order)
        }
    }
}
