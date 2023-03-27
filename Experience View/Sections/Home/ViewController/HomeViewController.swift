//
//  HomeViewController.swift
//  Experience View
//
//  Created by Italo Rossy on 15/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    var onTappedButtonPost:(() -> Void)?
    var homeViewModel :HomeViewModel!
    var homeView :HomeView!
    var name = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel = HomeViewModel()
        homeView?.configProtocolsCollectionView(delegate: self, dataSource: self)
        homeViewModel.onReloadPosts = {
            self.homeView?.reloadCollectionView()
        }
        
        DispatchQueue.main.async {
            self.homeViewModel.getUserName { (name) in
                if let name = name {
                    self.name = name
                    self.homeViewModel.reloadPost()
                }
            }
        }
       
        
    }

    
    override func loadView() {
        homeView = HomeView()
        view = homeView
        view.backgroundColor = .white
        homeView.onTappedButtonLogoff = {
            self.homeViewModel.logoffUser()
        }
        
        homeView.ontappedButtonPost = {
            self.onTappedButtonPost?()
        }
        
        
    }
    
}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeViewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell
       
        let indice = indexPath.row
        let post = homeViewModel.getListPost[indice]
        let data = ["description": post["descricao"] , "url" : post["url"], "userName" : self.name ]
        cell?.setupCell(data as NSDictionary)
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 400, height: 500)
    }

    
}
