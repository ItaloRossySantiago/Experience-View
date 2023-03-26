//
//  ViewController.swift
//  Experience View
//
//  Created by Italo Rossy on 13/13/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginView: LoginView?
    
    //MARK: Clouseres
    
    var onRegisterTap:(() -> Void)?
    var onLoginSuccess:(() -> Void)?
    
    // MARK: Properts
    
    override func loadView() {
        loginView = LoginView()
        loginView?.onRegisterTap = {[weak self] in
            self?.onRegisterTap?()
        }
        
        loginView?.onLoginTap = {[weak self] email, password in
            self?.openTap(email, password)
        }
    
        view = loginView
        
        loginView?.backgroundColor = .white

        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyBoardWhenTappedAround()
       
    }
    
    private func openTap(_ email:String, _ password:String){
        
        let userViewModel = UserViewModel()
        
        userViewModel.getUSerFromApi(email, password) {[weak self] result in
            switch result {
                
                
            case .success(_):
                self?.onLoginSuccess?()
                    
                
            case .failure(let error):
                if error.localizedDescription.contains("Access to this account has") == true {
                    self?.showMessage("Atençao !", "O acesso a conta foi temporariamente bloqueado devido a diversas tentativas com senha incorreta. Para acesso imediato reset sua senha, ou tente novamente mais tarde.")
                } else if error.localizedDescription == "The password is invalid or the user does not have a password." {
                    self?.showMessage("Atençao !", "Senha invalida, verifique!")
                } else {
                    self?.showMessage("Erro", error.localizedDescription)
                }
            }
        }

    }
    
    


}

