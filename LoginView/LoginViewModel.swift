//
//  LoginViewModel.swift
//  MVVM
//
//  Created by Emre Eraslan on 20.07.2023.
//

import Foundation

final class LoginViewModel {
    
    var error: ObservableObject<String?> = ObservableObject(nil)
    
    func login(username: String, password: String) {
        NetworkService.shared.login(username: username, password: password) {[weak self] succes in self?.error.value = succes ? nil: "Invalid Credentials"
            
        }
    }
}
