//
//  NewsFeedVC.swift
//  SwiftBikersFirbaseAppStarter
//
//  Created by MacBook on 1/29/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import UIKit

class NewsFeedVC: UIViewController {

    var MainPost: [Post] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        DataService.instance.getAllPosts { (posts) in
            self.MainPost = posts.reversed()
            self.tableView.reloadData()
            
        }
    }

}


extension NewsFeedVC : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? FeedCell else {return UITableViewCell()}
        let img = #imageLiteral(resourceName: "feed-tabIcon")
        let post = MainPost[indexPath.row]
        
        DataService.instance.getUserName(forUID: post.senderId) { (returnedUserName) in
            cell.configureCell(profileImage: img, email: returnedUserName, content: post.content)
        }
      
        
        return cell
    }
    
    
}
