//
//  LoginVC.swift
//  SwiftBikersFirbaseAppStarter
//
//  Created by MacBook on 1/29/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: InsetTextField!
    @IBOutlet weak var passswordTextField: InsetTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        if emailTextField.text != nil && passswordTextField.text != nil {

            AuthService.instance.loginUser(withEmail: emailTextField.text!, andPassword: passswordTextField.text!) { (success, error) in
                if(success){
                    self.dismiss(animated: true, completion: nil)
                }
                else{
                    print("failed",String(describing: error?.localizedDescription))
                }
                
                
                AuthService.instance.registerUser(withEmail: self.emailTextField.text!, andPassword: self.passswordTextField.text!, userCreationComplete: { (success, error) in
                    if(success){
                        self.dismiss(animated: true, completion: nil)
                        print("user registered")
                    }
                    else{
                        print("failed",String(describing: error?.localizedDescription))
                    }
                })
            }
        }
        
    }
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
