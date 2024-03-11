//
//  PasswordChangedViewController.swift
//  Login Page Using Sqlite
//
//  Created by R95 on 07/03/24.
//

import UIKit

class PasswordChangedViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
  
    @IBAction func LoginBackButtonAction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(identifier: "LoginPageViewController") as! LoginPageViewController
        
        navigationController?.pushViewController(navigate, animated: true)
    }
}
