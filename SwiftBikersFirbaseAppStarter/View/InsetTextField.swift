//
//  InsetTextField.swift
//  SwiftBikersFirbaseAppStarter
//
//  Created by MacBook on 1/29/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import UIKit


class InsetTextField: UITextField {
        
    private let padding = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 5)
    
    override func awakeFromNib() {
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)])
        self.attributedPlaceholder = placeholder
        super.awakeFromNib()
    }
    
    //Returns the drawing rectangle for the text field’s text.
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    //Returns the rectangle in which editable text can be displayed.
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: padding)
    }
    
    //Returns the drawing rectangle for the text field’s placeholder text
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: padding)
    }

    
    
}
