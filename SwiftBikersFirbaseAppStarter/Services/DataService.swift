//
//  DataService.swift
//  SwiftBikersFirbaseAppStarter
//
//  Created by MacBook on 1/29/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import Foundation
import Firebase

//Gets a FIRDatabaseReference for the root of your Firebase Database.
let DB_BASE = Database.database().reference()

class DataService{
    
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func getUserName(forUID uid: String, handler: @escaping (_ userName : String) -> ()){
        REF_USERS.observeSingleEvent(of: .value) { (UserSnapshot) in
            guard let userSnap = UserSnapshot.children.allObjects as? [DataSnapshot] else{return}
            
            for user in userSnap{
                if(user.key ==  uid){
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
    }
    func uploadPost(withPostMsg message: String, forUID uid: String, withGroupKey groupKey:String?, postComplete : @escaping(_ status: Bool) -> ()){
        if(groupKey != nil){
            //Post in Group
        }
        else{
            //POST PUBLIC
            //childByAutoId generates a new child location using a unique key and returns a FIRDatabaseReference to it
            _REF_FEED.childByAutoId().updateChildValues(["content": message, "senderId": uid])
            postComplete(true)
        }
    }
    
    func getAllPosts(handler: @escaping(_ posts: [Post]) -> ()){
        var postArray = [Post]()
        REF_FEED.observeSingleEvent(of: .value) { (postMessageSnapshot) in
            
            guard let postMessageSnap = postMessageSnapshot.children.allObjects as? [DataSnapshot] else{return}
            
            for singlePost in postMessageSnap{
                let contentMsg = singlePost.childSnapshot(forPath: "content").value as! String
                let senderId = singlePost.childSnapshot(forPath: "senderId").value as! String
                let post = Post(content: contentMsg, senderId: senderId)
                postArray.append(post)
            }
            handler(postArray)
        }
        
    }
}

