//
//  ShadowView.swift
//  SwiftBikersFirbaseAppStarter
//
//  Created by MacBook on 1/29/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        super.awakeFromNib()
    }    
}
