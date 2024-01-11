//
//  User.swift
//  Appetizers
//
//  Created by macbook on 09/01/2024.
//

import Foundation


struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var dateOfBirth = Date()
    var extraNapkins = false
    var frequentRefills = false
}
