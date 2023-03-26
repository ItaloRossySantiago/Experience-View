//
//  UserModel.swift
//  Experience View
//
//  Created by Italo Rossy on 13/03/23.
//

import Foundation

class UserModel : Codable {
    let email : String
    let password: String
    
    init () {
        self.email = String()
        self.password = String()
    }
    
    init(email:String,password:String){
        self.email = email
        self.password = password
        
    }
}
