//
//  GroupVC.swift
//  SwiftBikersFirbaseAppStarter
//
//  Created by MacBook on 1/29/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import UIKit

class GroupVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var groupArray = [Group]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllGroups { (returnedGroup) in
                self.groupArray = returnedGroup
                self.tableView.reloadData()
            }
        }
    }
    
}

extension GroupVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell else{return UITableViewCell()}
        let group = groupArray[indexPath.row]
        cell.configure(title: group.groupTitle, description: group.groupDesc, memberCount: "\(group.memberCount)")
        return cell
    }
}
