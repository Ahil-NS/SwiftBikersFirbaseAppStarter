//
//  PostVC.swift
//  SwiftBikersFirbaseAppStarter
//
//  Created by MacBook on 1/30/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var postButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postTextView.delegate = self
        postButton.bindToKeyboard()
    }
    
    @IBAction func postButtonTapped(_ sender: Any) {
        guard let uidC = Auth.auth().currentUser?.uid else{return}
        
        if(postTextView.text != nil && postTextView.text != "What is on your Mind....."){
            postButton.isEnabled = false
            DataService.instance.uploadPost(withPostMsg: postTextView.text, forUID: uidC, withGroupKey: nil) { (isComplete) in
                if(isComplete){
                    self.postButton.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                }
                else{
                    self.postButton.isEnabled = true
                }
            }
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension CreatePostVC : UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
