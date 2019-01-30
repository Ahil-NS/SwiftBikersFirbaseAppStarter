//
//  CreateGroupVC.swift
//  SwiftBikersFirbaseAppStarter
//
//  Created by MacBook on 1/30/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import UIKit

class CreateGroupVC: UIViewController {

    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var tableView: UITableView!
    
    var emailArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        

    }
    @objc func textFieldChanged(){
        if(emailSearchTextField.text == ""){
            emailArray = []
            tableView.reloadData()
        }
        else{
            DataService.instance.getEmail(forSearchQuery: emailSearchTextField.text!) { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.tableView.reloadData()
            }
        }
    
    }
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func DoneButtonTapped(_ sender: Any) {
        
    }
}


extension CreateGroupVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell else{return UITableViewCell()}
        let img = #imageLiteral(resourceName: "defaultProfileImage")
        cell.configureCell(profileImage: img, userName: emailArray[indexPath.row], isChecked: true)
        return cell
    }
    
    
}

extension CreateGroupVC: UITextFieldDelegate{
    
}
