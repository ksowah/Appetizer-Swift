//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by macbook on 07/01/2024.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    @Binding var isShowDetail: Bool
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    Nutrients(title: "Calories", value: "\(appetizer.calories)")
                    Nutrients(title: "Carbs", value: "\(appetizer.carbs)")
                    Nutrients(title: "Protein", value: "\(appetizer.protein)")
                }
                
            }
            
            Spacer()
            
            Button {
                order.items.append(appetizer)
                isShowDetail = false
            } label: {
//                APButton(title: "₵\(appetizer.price, specifier: "%.2f") - Add to Order" )
                Text("₵\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .buttonStyle(.bordered)
            .tint(Color("brandPrimary"))
            .controlSize(.large)
            .padding(.bottom, 30)
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowDetail: .constant(true))
    }
}



struct Nutrients: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            Text(value)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
