//
//  GroupFeedCell.swift
//  SwiftBikersFirbaseAppStarter
//
//  Created by MacBook on 1/31/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.profileImageView.image = profileImage
        self.emailLabel.text = email
        self.contentLabel.text = content
    }
}

