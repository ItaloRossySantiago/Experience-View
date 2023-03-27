//
//  HomeView.swift
//  Experience View
//
//  Created by Italo Rossy on 15/03/23.
//

import UIKit

class HomeView: UIView {
    var onTappedButtonLogoff:(() -> Void)?
    var ontappedButtonPost:(() -> Void)?
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        //TO DO: REGISTER
        cv.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        cv.backgroundColor = .clear
        return cv
    }()
    
    
    
    public func configProtocolsCollectionView(delegate:UICollectionViewDelegate, dataSource:UICollectionViewDataSource){
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    public func reloadCollectionView(){
        collectionView.reloadData()
    }
    
    lazy var labelAppName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ExperienceView"
        label.font = UIFont(name: "Pacifico", size: 22)
        label.textColor = .black
        return label
    }()
    
    
    lazy var buttonLogoff : UIButton = {
       
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "logoffIcon"), for: .normal)
        button.addTarget(self, action: #selector(tappedButtonLogoff), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonPost : UIButton = {
       
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named:"cameraIcon"), for: .normal)
        button.addTarget(self, action: #selector(tappedButtonPost), for: .touchUpInside)
        return button
    }()

    @objc func tappedButtonLogoff () {
        self.onTappedButtonLogoff?()
    }
    
    @objc func tappedButtonPost () {
        self.ontappedButtonPost?()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(buttonLogoff)
        addSubview(buttonPost)
        addSubview(labelAppName)
        addSubview(collectionView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            
            labelAppName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            labelAppName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            buttonLogoff.centerYAnchor.constraint(equalTo: labelAppName.centerYAnchor),
            buttonLogoff.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            buttonLogoff.widthAnchor.constraint(equalToConstant: 40),
            buttonLogoff.heightAnchor.constraint(equalToConstant: 40),
            
            buttonPost.centerYAnchor.constraint(equalTo: buttonLogoff.centerYAnchor),
            buttonPost.trailingAnchor.constraint(equalTo: buttonLogoff.leadingAnchor,constant: -10),
            buttonPost.widthAnchor.constraint(equalToConstant: 30),
            buttonPost.heightAnchor.constraint(equalToConstant: 30),
            
            collectionView.topAnchor.constraint(equalTo: labelAppName.bottomAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0) ,
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
           
            
        
        ])
        
    }
    
}
