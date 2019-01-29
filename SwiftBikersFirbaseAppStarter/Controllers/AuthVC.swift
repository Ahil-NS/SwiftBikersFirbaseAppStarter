//
//  AuthVC.swift
//  SwiftBikersFirbaseAppStarter
//
//  Created by MacBook on 1/29/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func emailLoginTapped(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
        
    }
    

}
