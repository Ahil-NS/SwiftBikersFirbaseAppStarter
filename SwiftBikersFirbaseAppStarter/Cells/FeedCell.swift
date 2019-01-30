//
//  FeedCell.swift
//  SwiftBikersFirbaseAppStarter
//
//  Created by MacBook on 1/30/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    func configureCell(profileImage: UIImage, email: String, content: String){
        profileImgView.image = profileImage
        emailLabel.text = email
        messageLabel.text = content
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
