//
//  PostCoordinator.swift
//  Experience View
//
//  Created by Italo Rossy on 15/03/23.
//

import UIKit

class PostCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    func start() {
        let postViewController = PostViewController()
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(postViewController, animated: true)
        
        postViewController.onPostSucess = {
            let coordinator = HomeCoordinator(navigationController: self.navigationController)
            coordinator.start()
        }
        
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    

}
