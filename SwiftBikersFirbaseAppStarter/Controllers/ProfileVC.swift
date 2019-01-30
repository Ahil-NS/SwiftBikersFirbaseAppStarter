//
//  ProfileVC.swift
//  SwiftBikersFirbaseAppStarter
//
//  Created by MacBook on 1/29/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        emailLabel.text = Auth.auth().currentUser?.email
        
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "Logout", message: "Do u want to logout?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Log", style: UIAlertAction.Style.default) { (action) in
            do{
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "") as! AuthVC
                self.present(authVC, animated: true, completion: nil)
            }
            catch{
                print(error)
            }
        }
        alert.addAction(logoutAction)
        present(alert, animated: true, completion: nil)
    }
    
}
