//
//  PostCardCollectionView.swift
//  Experience View
//
//  Created by Italo Rossy on 19/03/23.
//

import UIKit
import FirebaseStorageUI
class PostCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "PostCollectionViewCell"
    private var screen: PostCollectionViewCellScreen = PostCollectionViewCellScreen()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)
        screen.pin(to: contentView)
    }
    
    public func setupCell(_ data: NSDictionary) {

        screen.profileImageView.image = UIImage(named: "usersIcon")
        screen.userNameLabel.text = data["userName"] as! String
        screen.postImageView.sd_setImage(with: URL(string: data["url"] as! String), completed: nil)
        screen.descriptionLabel.text = data["description"] as! String
    }
}
