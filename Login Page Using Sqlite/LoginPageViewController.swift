//
//  LoginPageViewController.swift
//  Login Page Using Sqlite
//
//  Created by R95 on 04/03/24.
//

import UIKit

class LoginPageViewController: UIViewController {
    
    var arr = [UserData]()
    let myColor = UIColor.gray
    
    @IBOutlet weak var emailTextFieldOutlet: UITextField!
    @IBOutlet weak var passwordTextFieldOutlet: UITextField!
    @IBOutlet weak var backButtonOutlet: UIButton!
    @IBOutlet weak var fstLabelOutlet: UIImageView!
    @IBOutlet weak var secLabelOutlet: UIImageView!
    @IBOutlet weak var thdLabelOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        design()
        DBHelper.getData()
        arr = DBHelper.userArray
        print(arr)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        DBHelper.getData()
        arr = DBHelper.userArray
        var userFound = false
        for i in arr {
        
            if emailTextFieldOutlet.text == i.email && passwordTextFieldOutlet.text == i.password {
                userFound = true
                print("true")
                break
            }
        }
        
        if userFound == true {
            navigate()
        } else {
            registrationalert(title: "Error!", message: "your Email is Not Found.\n Please Registration your Acount")
        }
    }
    
    @IBAction func forgotFasswordButtonAction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(identifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    func navigate() {
        let navigate = storyboard?.instantiateViewController(identifier: "SuccessViewController") as! SuccessViewController
        
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    func alert(title: String, message: String) {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(a, animated: true)
    }
    
    func registrationalert(title: String, message: String) {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        a.addAction(UIAlertAction(title: "Ok", style: .cancel,handler: { _ in
            let navigate = self.storyboard?.instantiateViewController(identifier: "RegistraionPageViewController") as! RegistraionPageViewController
            
            self.navigationController?.pushViewController(navigate, animated: true)
        }))
        
        present(a, animated: true)
    }
    
    
    @IBAction func registrationButtonAction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(identifier: "RegistraionPageViewController") as! RegistraionPageViewController
        
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        navigationController?.popViewController(animated: true)
        
    }
    
    func design(){
        emailTextFieldOutlet.layer.borderWidth = 2
        emailTextFieldOutlet.layer.cornerRadius = 8
        emailTextFieldOutlet.layer.borderColor = myColor.cgColor
        
        passwordTextFieldOutlet.layer.borderWidth = 1
        passwordTextFieldOutlet.layer.cornerRadius = 8
        passwordTextFieldOutlet.layer.borderColor = myColor.cgColor
        
        backButtonOutlet.layer.cornerRadius = 12
        backButtonOutlet.layer.borderWidth = 1
        backButtonOutlet.layer.borderColor = myColor.cgColor
        
        fstLabelOutlet.layer.borderWidth = 1
        fstLabelOutlet.layer.cornerRadius = 8
        fstLabelOutlet.layer.borderColor = myColor.cgColor
        
        secLabelOutlet.layer.borderWidth = 1
        secLabelOutlet.layer.cornerRadius = 8
        secLabelOutlet.layer.borderColor = myColor.cgColor
        
        thdLabelOutlet.layer.borderWidth = 1
        thdLabelOutlet.layer.cornerRadius = 8
        thdLabelOutlet.layer.borderColor = myColor.cgColor
    }
}
