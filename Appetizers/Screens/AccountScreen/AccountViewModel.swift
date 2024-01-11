//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by macbook on 08/01/2024.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    @AppStorage("user") private var userData: Data?
    
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
         
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    
    func retrieveUser() {
        
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
        
    }
    
}
