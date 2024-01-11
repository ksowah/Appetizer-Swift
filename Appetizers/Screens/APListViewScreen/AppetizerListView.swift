//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by macbook on 05/01/2024.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    @State private var isShowDetail = false
    @State private var selectedAppetizer: Appetizer?
    
    var body: some View {
        
        ZStack {
            NavigationStack {
                List(viewModel.appetizers){
                    appetizer in
                    AppetizerComponent(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            selectedAppetizer = appetizer
                            isShowDetail = true
                        }
                }
                    .navigationTitle("🍟 Appetizer")
                    .listStyle(.plain)
                    .disabled(isShowDetail)
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            .blur(radius: isShowDetail ? 20 : 0)
            
            
            if isShowDetail {
                AppetizerDetailView(appetizer: selectedAppetizer!,
                                    isShowDetail: $isShowDetail)
            }
            
//           the loader is outside the NavigationStack in the ZStack so that it stays on top
            if viewModel.isLoading {
                LoaderComponent()
            }
            
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        
    }
    
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
