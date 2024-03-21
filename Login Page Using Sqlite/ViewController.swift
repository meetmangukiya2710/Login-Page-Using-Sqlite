//
//  ViewController.swift
//  Login Page Using Sqlite
//
//  Created by R95 on 04/03/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var registrionButtonOutlet: UIButton!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
        DBHelper.createFile()
        DBHelper.getData()
        navigationItem.hidesBackButton = true
    }
    
    func design() {
        let myColor : UIColor = .gray
        
        registrionButtonOutlet.layer.borderWidth = 2
        registrionButtonOutlet.layer.borderColor = myColor.cgColor
        registrionButtonOutlet.layer.cornerRadius = 5
    }
    
    
    @IBAction func registrationButtonAction(_ sender: Any) {
        audio()
        let naviget = storyboard?.instantiateViewController(identifier: "RegistraionPageViewController") as! RegistraionPageViewController
        navigationController?.pushViewController(naviget, animated: true)
    }
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        audio()
        let navigate = storyboard?.instantiateViewController(identifier: "LoginPageViewController") as! LoginPageViewController
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    func audio() {
        let url = Bundle.main.url(forResource: "ButtonTap", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
    }
    
}
