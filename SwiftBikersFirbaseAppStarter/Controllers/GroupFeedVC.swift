//
//  GroupFeedVC.swift
//  SwiftBikersFirbaseAppStarter
//
//  Created by MacBook on 1/31/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import UIKit
import Firebase

class GroupFeedVC: UIViewController {

    var groupPassed : Group?
    var groupMessages = [Post]()
    
    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var memberNameLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButtonView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        sendButtonView.bindToKeyboard()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupTitleLabel.text = groupPassed?.groupTitle
        guard let _group = groupPassed else{return}
        DataService.instance.getEmailsFor(group: _group) { (returnedEmail) in
            self.memberNameLabel.text = returnedEmail.joined(separator: ", ")
        }
        
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllMessagesFor(desiredGroup: _group, handler: { (returnedGroupMessages) in
                self.groupMessages = returnedGroupMessages
                self.tableView.reloadData()
                
                if self.groupMessages.count > 0 {
                    self.tableView.scrollToRow(at: IndexPath(row: self.groupMessages.count - 1, section: 0), at: .none, animated: true)
                }
            })
        }
    }
    
    func initData(group : Group){
        groupPassed = group
       
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        if messageTextField.text != "" {
            messageTextField.isEnabled = false
            sendButton.isEnabled = false
            
            DataService.instance.uploadPost(withPostMsg: messageTextField.text!, forUID: Auth.auth().currentUser!.uid, withGroupKey: groupPassed?.key, postComplete: { (complete) in
                if complete {
                    self.messageTextField.text = ""
                    self.messageTextField.isEnabled = true
                    self.sendButton.isEnabled = true
                }
            })
        }
    }
}

extension GroupFeedVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupFeedCell", for: indexPath) as? GroupFeedCell else{return UITableViewCell()}
        let img = #imageLiteral(resourceName: "defaultProfileImage")
        let msg = groupMessages[indexPath.row]
        
        DataService.instance.getUserName(forUID: msg.senderId) { (returnedEmail) in
            cell.configureCell(profileImage: img, email: returnedEmail, content: msg.content)
        }
       
        return cell
    }
    
    
}
