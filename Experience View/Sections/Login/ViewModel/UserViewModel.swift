//
//  UserViewModel.swift
//  Experience View
//
//  Created by Italo Rossy on 13/03/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

enum ErrorFields: Error {
    case invalidFields
    case errorToCreate
}

class UserViewModel {
    private let model: UserModel
    private let auth: Auth
    private let firestore: Firestore
    private let manager: UserManager
    
    init(model: UserModel) {
        self.model = model
        auth = Auth.auth()
        firestore = Firestore.firestore()
        manager = UserManager(business: UserBusiness())
    }
    
    var email : String {
        model.email
    }
    
    
    func getUSerFromApi (_ email :String,_ password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        manager.login(email: email, password: password) { userModel in
            completion(.success(userModel))
        } failureHandler: { error in
            completion(.failure(error))
            
        }
    }
    
    func registerNewUser(_ nome: String, _ email : String,_ password: String, completion: @escaping (NSDictionary) -> Void) {
        var resultReturn:NSDictionary = [:]
        guard nome != "" && email != "" && password != "" else {
            completion(["result":"error", "message_error":"invalidFields"])
            return
        }
        
        auth.createUser(withEmail: email, password: password) { (result, error) in
            
            if error == nil {
                if let idResultado = result?.user.uid {
                    self.firestore.collection("usuarios").document(idResultado).setData(["nome": nome, "email": email])
                }
                resultReturn = ["result":"success", "message_error":""]
                do {
                    try self.auth.signOut() }
                catch {
                    print("erro ao deslogar usuario")
                    
                }
                
            } else {
                resultReturn = ["result":"error", "message_error": error?.localizedDescription ?? "Erro ao cadastrar usuario"]
                
            }
            completion(resultReturn)
        }
    }
 
}

