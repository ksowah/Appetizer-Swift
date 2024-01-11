//
//  Components.swift
//  Appetizers
//
//  Created by macbook on 05/01/2024.
//

import SwiftUI

struct AppetizerComponent: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack () {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("₵\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }.padding(.leading)
        }
    }
}

struct Components_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerComponent(appetizer: MockData.sampleAppetizer)
    }
}
