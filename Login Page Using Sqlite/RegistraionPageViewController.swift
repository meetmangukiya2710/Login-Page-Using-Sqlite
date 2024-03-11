//
//  RegistraionPageViewController.swift
//  Login Page Using Sqlite
//
//  Created by R95 on 04/03/24.
//

import UIKit

class RegistraionPageViewController: UIViewController {
    
    let myColor : UIColor = .gray

    @IBOutlet weak var userNameTextFieldOutlet: UITextField!
    @IBOutlet weak var emailTextFieldOutlet: UITextField!
    @IBOutlet weak var passwordTextFieldOutlet: UITextField!
    @IBOutlet weak var conformPAsswordTextFieldOutlet: UITextField!
    @IBOutlet weak var backButtonOutlet: UIButton!
    @IBOutlet weak var fstLabelOutlet: UIImageView!
    @IBOutlet weak var secLabelOutlet: UIImageView!
    @IBOutlet weak var thdLabelOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        design()
    }
    
    
    @IBAction func registrationButtonAction(_ sender: Any) {
        if emailTextFieldOutlet.text == "" && passwordTextFieldOutlet.text == "" && userNameTextFieldOutlet.text == "" && conformPAsswordTextFieldOutlet.text == "" {
            alert(title: "Error!", msg: "Enter the Detail")
        }
        else if emailTextFieldOutlet.text == "" {
            alert(title: "Error!", msg: "Enter the E-mail")
        }
        else if passwordTextFieldOutlet.text == "" {
            alert(title: "Error!", msg: "Enter the Password")
        }
        else if userNameTextFieldOutlet.text == ""{
            alert(title: "Error!", msg: "Enter the User Name")
        }
        else if conformPAsswordTextFieldOutlet.text == "" {
            alert(title: "Error!", msg: "Enter the Confrom Password")
        }
        else if passwordTextFieldOutlet.text != conformPAsswordTextFieldOutlet.text {
            alert(title: "Error!", msg: "Either Password any one is wrong")
        }
        else {
            DBHelper.addData(email: emailTextFieldOutlet.text ?? "", password: conformPAsswordTextFieldOutlet.text ?? "")
            navigationController?.popViewController(animated: true)
        }
    }
    
    func alert(title: String,msg: String) {
        let a = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Ok", style: .default))
        a.addAction(UIAlertAction(title: "Cancel", style: .destructive))

        present(a, animated: true)
    }

    @IBAction func backButtonAction(_ sender: Any) {
        let navi = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        navigationController?.popViewController(animated: true)
    }
    
    func design(){
        emailTextFieldOutlet.layer.borderWidth = 1
        emailTextFieldOutlet.layer.cornerRadius = 8
        emailTextFieldOutlet.layer.borderColor = myColor.cgColor
        
        passwordTextFieldOutlet.layer.borderWidth = 1
        passwordTextFieldOutlet.layer.cornerRadius = 8
        passwordTextFieldOutlet.layer.borderColor = myColor.cgColor
        
        userNameTextFieldOutlet.layer.borderWidth = 1
        userNameTextFieldOutlet.layer.cornerRadius = 8
        userNameTextFieldOutlet.layer.borderColor = myColor.cgColor
        
        conformPAsswordTextFieldOutlet.layer.borderWidth = 1
        conformPAsswordTextFieldOutlet.layer.cornerRadius = 8
        conformPAsswordTextFieldOutlet.layer.borderColor = myColor.cgColor
        
        fstLabelOutlet.layer.borderWidth = 1
        fstLabelOutlet.layer.cornerRadius = 8
        fstLabelOutlet.layer.borderColor = myColor.cgColor
        
        secLabelOutlet.layer.borderWidth = 1
        secLabelOutlet.layer.cornerRadius = 8
        secLabelOutlet.layer.borderColor = myColor.cgColor
        
        thdLabelOutlet.layer.borderWidth = 1
        thdLabelOutlet.layer.cornerRadius = 8
        thdLabelOutlet.layer.borderColor = myColor.cgColor
        
        backButtonOutlet.layer.cornerRadius = 12
        backButtonOutlet.layer.borderWidth = 1
        backButtonOutlet.layer.borderColor = myColor.cgColor
    }
    
}
