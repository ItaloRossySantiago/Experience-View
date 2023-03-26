//
//  LoginCoordinator.swift
//  Experience View
//
//  Created by Italo Rossy on 13/03/23.
//

import Foundation
import UIKit
import FirebaseAuth
class LoginCordinator : Coordinator {
    var navigationController: UINavigationController
    var auth: Auth!
    
    func start() {
        auth = Auth.auth()
        auth.addStateDidChangeListener { auth, user in
            if user != nil {
                let  coordinator = HomeCoordinator(navigationController: self.navigationController)
                coordinator.start()
            } else {
                let viewController = LoginViewController()
                self.navigationController.pushViewController(viewController, animated: true)
                viewController.onRegisterTap = {
                    let coordinator = RegisterCoordinator(navigationController: self.navigationController)
                    coordinator.start()
                }
            }
                
        }
        
        if auth.currentUser?.uid == nil {
            let viewController = LoginViewController()
            self.navigationController.pushViewController(viewController, animated: true)
            viewController.onRegisterTap = {
                let coordinator = RegisterCoordinator(navigationController: self.navigationController)
                coordinator.start()
            }
            
        }
        
        
        
    }
    
    required init(navigationController:UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }
}

