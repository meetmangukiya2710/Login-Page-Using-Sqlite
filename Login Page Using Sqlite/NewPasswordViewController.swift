//
//  NewPasswordViewController.swift
//  Login Page Using Sqlite
//
//  Created by R95 on 06/03/24.
//

import UIKit

class NewPasswordViewController: UIViewController {
    
    var arr = [UserData]()
    var password = ""
    let myColor = UIColor.gray
    @IBOutlet weak var backButtonAction: UIButton!
    @IBOutlet weak var oldPasswordOutlet: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var conformNewPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arr = DBHelper.userArray
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func createNewPasswordButtonAction(_ sender: UIButton) {
        print(password)
            if oldPasswordOutlet.text == password {
                if newPassword.text != conformNewPassword.text {
                    alert(title: "Error!", message: "Either Password any one is wrong")
                }
                else {
                    DBHelper.updateData(password: password, newPassword: conformNewPassword.text ?? "")
                    DBHelper.getData()
                    successAlert(title: "Password Changed", message: "Successfully Password Changed!")
                }
            } else {
                alert(title: "Error!", message: "Your Old Password is Encorrect!")
            }
    }
    
    func alert(title: String, message: String) {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        a.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        present(a, animated: true)
    }
    
    func successAlert(title: String, message: String) {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        a.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
            let navigate = self.storyboard?.instantiateViewController(identifier: "PasswordChangedViewController") as! PasswordChangedViewController
            self.navigationController?.pushViewController(navigate, animated: true)
        }))
        present(a, animated: true)
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    func navigate() {
        let navigate = storyboard?.instantiateViewController(identifier: "SuccessViewController") as! SuccessViewController
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    func design() {
        backButtonAction.layer.borderWidth = 1
        backButtonAction.layer.borderColor = UIColor.gray.cgColor
        backButtonAction.layer.cornerRadius = 12
        
        oldPasswordOutlet.layer.borderWidth = 1
        oldPasswordOutlet.layer.cornerRadius = 8
        oldPasswordOutlet.layer.borderColor = myColor.cgColor
    }
    
}
