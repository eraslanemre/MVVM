//
//  ProfileViewModel.swift
//  MVVM
//
//  Created by Emre Eraslan on 20.07.2023.
//

import Foundation
final class ProfileViewModel {
    
    var welcomeMessage: ObservableObject<String?> = ObservableObject(nil)
    
    func getLoggedInUser() {
        let user = NetworkService.shared.getUser()
        self.welcomeMessage.value = "Welcome, \(user.name) welcome"
    }
}
