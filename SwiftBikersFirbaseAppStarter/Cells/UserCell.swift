//
//  UserCell.swift
//  SwiftBikersFirbaseAppStarter
//
//  Created by MacBook on 1/30/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    
    var showing = false
    
    func configureCell(profileImage image: UIImage, userName: String, isChecked: Bool){
        userImageView.image = image
        emailLabel.text = userName
        
        if(isChecked){
            checkImageView.isHidden = false
        }
        else{
            checkImageView.isHidden = true
        }
    }
    //Sets the selected state of the cell, optionally animating the transition between states.
    override func setSelected(_ selected: Bool, animated: Bool) {
        if(selected){
            if(showing == false){
                checkImageView.isHidden = false
                showing = true
            }
            else{
                checkImageView.isHidden = true
                showing = false
            }
        }
      
    }

}
