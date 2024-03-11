//
//  ForgotPasswordViewController.swift
//  Login Page Using Sqlite
//
//  Created by R95 on 06/03/24.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    let myColor = UIColor.gray
    var arr = [UserData]()
    var password = ""
    
    @IBOutlet weak var backButtonAction: UIButton!
    @IBOutlet weak var emailTextFieldOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
        DBHelper.getData()
        arr = DBHelper.userArray
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func createNewPassword(_ sender: Any) {
        
        var userFound = false
        for i in arr {
        
            if emailTextFieldOutlet.text == i.email {
                userFound = true
                password = i.password
                print("true")
                break
            }
        }
        
        if userFound == true {
            navigate()
        } else {
            alert(title: "Error!", message: "Email is not Found!")
        }
    }
    
    func alert(title: String, message: String) {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        a.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        present(a, animated: true)
    }
    
    func navigate() {
        let navigate = storyboard?.instantiateViewController(identifier: "NewPasswordViewController") as! NewPasswordViewController
        navigate.password = password
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    @IBAction func loginBackButtonAction(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(identifier: "LoginPageViewController") as! LoginPageViewController
        
        navigationController?.popViewController(animated: true)
    }
    
    
 
    func design() {
        backButtonAction.layer.borderWidth = 1
        backButtonAction.layer.borderColor = UIColor.gray.cgColor
        backButtonAction.layer.cornerRadius = 12
        
        emailTextFieldOutlet.layer.borderWidth = 1
        emailTextFieldOutlet.layer.cornerRadius = 8
        emailTextFieldOutlet.layer.borderColor = myColor.cgColor
        
    }
    
}
