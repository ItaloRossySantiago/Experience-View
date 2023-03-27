//
//  HomeCoordinator.swift
//  Experience View
//
//  Created by Italo Rossy on 15/03/23.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    func start() {
        let viewController  = TabBarViewController()
        self.navigationController.pushViewController(viewController, animated: true)
        viewController.onTappedButtonPost  = {
            let coordinator = PostCoordinator(navigationController: self.navigationController)
            coordinator.start()
        }
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
}
