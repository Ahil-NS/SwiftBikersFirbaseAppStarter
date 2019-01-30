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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func closeButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func DoneButtonTapped(_ sender: Any) {
        
    }
}


extension CreateGroupVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell else{return UITableViewCell()}
        let img = #imageLiteral(resourceName: "defaultProfileImage")
        cell.configureCell(profileImage: img, userName: "aaaa@gmail.com", isChecked: true)
        return cell
    }
    
    
}
