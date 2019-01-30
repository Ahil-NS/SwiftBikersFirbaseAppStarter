//
//  CreateGroupVC.swift
//  SwiftBikersFirbaseAppStarter
//
//  Created by MacBook on 1/30/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import UIKit
import Firebase

class CreateGroupVC: UIViewController {
    
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addPeopleLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    var emailArray = [String]()
    var choosenArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        doneButton.isHidden = true
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
        if(titleTextField.text != "" && descriptionTextField.text != ""){
            DataService.instance.getIds(forUserNames: choosenArray) { (idArray) in
                guard let currentUserId = Auth.auth().currentUser?.uid else{return}
                var arrayWithUser = idArray
                arrayWithUser.append(currentUserId)
                
                guard let titleX = self.titleTextField.text, let desY = self.descriptionTextField.text else{return}
                DataService.instance.createGroup(withTitle: titleX, andDescription: desY, forUserIds: arrayWithUser, handler: { (success) in
                    if(success){
                        self.dismiss(animated: true, completion: nil)
                    }
                    else{
                        print("Some thing went wrong")
                    }
                })
            }
        }
    }
}


extension CreateGroupVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell else{return UITableViewCell()}
        let img = #imageLiteral(resourceName: "defaultProfileImage")
        
        if(choosenArray.contains(emailArray[indexPath.row])){
            cell.configureCell(profileImage: img, userName: emailArray[indexPath.row], isChecked: true)
        }
        else{
            cell.configureCell(profileImage: img, userName: emailArray[indexPath.row], isChecked: false)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else{return}
        guard let addedEmail = cell.emailLabel.text else{return}
        
        if !choosenArray.contains(addedEmail){
            choosenArray.append(addedEmail)
            addPeopleLabel.text = choosenArray.joined(separator: ", ")
            doneButton.isHidden = false
        }else{
            choosenArray = choosenArray.filter({$0 != cell.emailLabel.text})
            if choosenArray.count >= 1 {
                addPeopleLabel.text = choosenArray.joined(separator: ", ")
            } else {
                addPeopleLabel.text = "add people to your group"
                doneButton.isHidden = true
            }
        }
        
    }
}

extension CreateGroupVC: UITextFieldDelegate{
    
}
