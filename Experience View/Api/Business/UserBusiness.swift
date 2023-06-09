//
//  UserBusiness.swift
//  Experience View
//
//  Created by Italo Rossy on 13/03/23.
//

import Foundation


protocol UserBusinessProtocol {
    func login(email:String, password:String, completionHandler: @escaping(Result<UserModel,Error>) ->Void)
    func register(email:String, password:String, completionHandler: @escaping(Result<UserModel,Error>) ->Void)
}


class UserBusiness : UserBusinessProtocol {
    let provider: UserProvider = UserProvider()
    func login(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        let userModel = UserModel(email: email, password: password)
        let params:[AnyHashable:Any] = [Constants.ParametersKeys.body: [Constants.ParametersKeys.userModel:userModel]]
        provider.login(parameters: params) { result in
            switch result {
                
            case .success(let userModel):
                completionHandler(.success(userModel))
            case .failure(let error):
                completionHandler(.failure(error))
            }
            
        }
        
    }
    
    func register(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        let userModel = UserModel(email: email, password: password)
        let params:[AnyHashable:Any] = [Constants.ParametersKeys.body: [Constants.ParametersKeys.userModel:userModel]]
        provider.register(parameters: params) { result in
            switch result {
                
            case .success(let userModel):
                completionHandler(.success(userModel))
            case .failure(let error):
                completionHandler(.failure(error))
            }
            
        }
    }
    
    
    
}

