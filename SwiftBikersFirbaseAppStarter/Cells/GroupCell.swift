//
//  GroupCell.swift
//  SwiftBikersFirbaseAppStarter
//
//  Created by MacBook on 1/30/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var groupDesLabel: UILabel!
    @IBOutlet weak var groupMemberCountLabel: UILabel!
    
    func configure(title: String, description: String, memberCount: String){
        groupTitleLabel.text = title
        groupDesLabel.text = description
        groupMemberCountLabel.text = "\(memberCount)members"
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
