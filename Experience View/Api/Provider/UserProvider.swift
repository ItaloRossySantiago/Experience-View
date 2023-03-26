//
//  UserProvider.swift
//  Experience View
//
//  Created by Italo Rossy on 13/03/23.
//

import Foundation
import UIKit
import FirebaseAuth

protocol UserProviderProtocol {
    func login(parameters: [AnyHashable:Any], completionHandler:
               @escaping(Result<UserModel,Error>) -> Void)
    
    func register(parameters: [AnyHashable:Any], completionHandler:
            @escaping(Result<UserModel,Error>) -> Void)
}


class UserProvider : UserProviderProtocol {
    lazy var auth = Auth.auth()
    
    func login(parameters: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        let body: NSDictionary = parameters[Constants.ParametersKeys.body] as! NSDictionary
        let userModel = body[Constants.ParametersKeys.userModel] as! UserModel

        self.auth.signIn(withEmail: userModel.email, password: userModel.password) { (result,error) in
            if let error = error {
                completionHandler(.failure(error as! Error))
                
            } else {
                completionHandler(.success(userModel))
            }
            
        }
    
    }
    
    func register(parameters: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        let body: NSDictionary = parameters[Constants.ParametersKeys.body] as! NSDictionary
        let userModel = body[Constants.ParametersKeys.userModel] as! UserModel
        
        self.auth.createUser(withEmail: userModel.email, password: userModel.password) { (result,error) in
            if let error = error {
                completionHandler(.failure(error as! Error))
            } else {
                completionHandler(.success(userModel))
            }
            
        }
    }
    
    
}