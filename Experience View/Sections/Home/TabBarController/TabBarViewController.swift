//
//  TabBarViewController.swift
//  Experience View
//
//  Created by Italo Rossy on 15/03/23.
//

import UIKit

class TabBarViewController: UITabBarController {
    var onTappedButtonPost: (()-> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupTabBarItems()
        
    }
    
    private func setupTabBar() {
        let homeViewController = HomeViewController()
        let usersViewController = UsersViewController()
        let home = UINavigationController(rootViewController: homeViewController)
        let users = UINavigationController(rootViewController: usersViewController)
        home.navigationBar.isHidden = true
        users.navigationBar.isHidden = true
        setViewControllers([home,users], animated: true)
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        tabBar.layer.borderColor = CGColor(red: 1, green: 0.8941176471, blue: 0.8941176471, alpha: 1)
        tabBar.backgroundColor = .white
        homeViewController.onTappedButtonPost = {
            self.onTappedButtonPost?()
        }
    
        
      
        
    }
    
    private func setupTabBarItems() {
        guard let items = tabBar.items else {return}
        
        items[0].image = UIImage(named: "homeIcon")
        items[0].title = "Home"
        items[1].image = UIImage(named: "usersIcon")
        items[1].title = "Usuarios"
    }
}
