//
//  RegisterCoordinator.swift
//  Experience View
//
//  Created by Italo Rossy on 13/03/23.
//

import Foundation
import UIKit

class RegisterCoordinator: Coordinator {
    
    
    var navigationController: UINavigationController
    
    
    func start() {
        let viewController = RegisterViewController()
        self.navigationController.pushViewController(viewController, animated: true)
        viewController.onBackTap = {
            let coordinator = LoginCordinator(navigationController: self.navigationController)
            coordinator.start()
        }
        viewController.onRegisterSuccess = {
            
        }
    }
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}
