//
//  LoaderManager.swift
//  Appetizers
//
//  Created by macbook on 06/01/2024.
//

import SwiftUI

struct LoaderComponent: View {
    var body: some View {
        
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            ProgressView()
                .tint(Color("brandPrimary"))
                .controlSize(.large)
            }
        
        }
        
    }

struct LoaderManager_Previews: PreviewProvider {
    static var previews: some View {
        LoaderComponent()
            
    }
}
