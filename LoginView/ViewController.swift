//
//  ViewController.swift
//  MVVM
//
//  Created by Emre Eraslan on 20.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    
    private let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
      super.viewDidLoad()
        // Do any additional setup after loading the view.
        setInitViews()
        setuoBinders()
      
    }
    private func setInitViews(){
        usernameField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
    }
     
    @objc private func validateFields(){
        loginBtn.isEnabled = usernameField.text != "" && passwordField.text != ""
    }
    
    
    @IBAction func loginBtnClicked(_ sender: Any) {
        guard let username = usernameField.text, let password = passwordField.text else {
            print("Please enter username and password")
            return
        }
        viewModel.login(username: username, password: password)
    }
    private func setuoBinders() {
        viewModel.error.bind { [weak self] error in
            if let error = error {
                print(error)
            }else{
                self?.goToProfilePage()
            }
        }
    }
    
    
    private func goToProfilePage(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileViewController
        present(vc,animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

