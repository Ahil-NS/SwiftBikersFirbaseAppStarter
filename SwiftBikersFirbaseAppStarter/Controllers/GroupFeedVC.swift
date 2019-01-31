//
//  GroupFeedVC.swift
//  SwiftBikersFirbaseAppStarter
//
//  Created by MacBook on 1/31/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import UIKit

class GroupFeedVC: UIViewController {

    var groupPassed : Group?
    
    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var memberNameLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButtonView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    }
    
    func initData(group : Group){
        groupPassed = group
       
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        
    }
}

extension GroupFeedVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupFeedCell", for: indexPath) as? GroupFeedCell else{return UITableViewCell()}
        let img = #imageLiteral(resourceName: "defaultProfileImage")
        cell.configureCell(profileImage: img, email: (groupPassed?.groupTitle)!, content: (groupPassed?.groupDesc)!)
        return cell
    }
    
    
}
