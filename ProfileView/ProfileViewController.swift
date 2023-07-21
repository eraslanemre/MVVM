//
//  ProfileViewController.swift
//  MVVM
//
//  Created by Emre Eraslan on 20.07.2023.
//

import UIKit

class ProfileViewController: UIViewController {

  
    @IBOutlet weak var nameLbl: UILabel!
    private let viewModel = ProfileViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        // Do any additional setup after loading the view.
        setInitViews()
       
        setupBindes()
    }
    private func setInitViews(){
        
    }

   
    private func setupBindes(){
        viewModel.welcomeMessage.bind { [weak self ] message in self?.nameLbl.text = message as? String
            
        }
    }
}
