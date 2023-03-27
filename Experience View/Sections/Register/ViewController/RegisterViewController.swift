//
//  RegisterViewController.swift
//  Experience View
//
//  Created by Italo Rossy on 13/03/23.
//

import UIKit

class RegisterViewController: UIViewController {
    var registerView: RegisterView?
    var onSignupFailed:(() -> Void)?
    var onRegisterSuccess:(() -> Void)?
    var onBackTap:(() -> Void)?
    
    override func loadView() {
        registerView = RegisterView()
        registerView?.onSignupTap = {[weak self] nome,email, password in
            self?.onSignupTap(nome,email, password)
        }
        
        registerView?.onSignupFailed = { [weak self] title, message in
            self?.onSignupFailed(title, message)
            
        }
        
        view = registerView
        
        registerView?.backgroundColor = .white
        registerView?.onBackTap = {
            self.onBackTap?()
        }
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        hideKeyBoardWhenTappedAround()
    }
    
    
    private func onSignupTap(_ name:String, _ email:String, _ senha:String){
        let model = UserModel(email: email,password: senha)
        let userViewModel = UserViewModel(model: model)
        DispatchQueue.main.async {
            userViewModel.registerNewUser(name, email, senha) { data in
                if let result:String = data["result"] as? String,
                   let messageError:String = data["message_error"] as? String {
                    if result == "error" {
                        self.showMessage("Erro", messageError)
                    } else if result == "success" {
                        self.onRegisterSuccess?()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            self.showMessageOnTimer("Sucesso", "Usuario Cadastrado.")
                        }
                        
                    }
                }
            }
            
        }
      
    }
    
    private func onSignupFailed(_ title:String, _ message:String){
        self.showMessage(title, message)
    }
    
}
