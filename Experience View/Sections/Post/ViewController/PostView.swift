//
//  PostView.swift
//  Experience View
//
//  Created by Italo Rossy on 15/03/23.
//

import UIKit

class PostView: UIView {
    var ontappedSelectImage:(() -> Void)?
    var onSendTap:(( _ description:String, _ img:UIImage) -> Void)?
    var onError:((_ title:String, _ msg:String) -> Void)?
    lazy var imagePost: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var labelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nova Postagem"
        label.font = UIFont.systemFont(ofSize: 22,weight: .bold)
        label.textColor = .black
        return label
    }()
    
    lazy var legendaTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white /* #343434 */
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.resignFirstResponder()
        tf.attributedPlaceholder = NSAttributedString(string: "Escreva uma legenda", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black.withAlphaComponent(0.4)])
        tf.textColor = .black
        tf.contentVerticalAlignment = .top
        tf.addDoneButtonOnKeyboard()
        return tf
    }()
    
    lazy var buttonPost : UIButton = {
       
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named:"cameraIcon"), for: .normal)
       button.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
        return button
    }()
    
    lazy var publishButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Publicar Postagem", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(sendPost), for: .touchUpInside)
        button.backgroundColor = UIColor(named: "tabBarColor")
        return button
    }()
    
    @objc func selectImage() {
        self.ontappedSelectImage?()
    }
    
    @objc func sendPost() {
        if legendaTextField.text != "" {
            if let description = legendaTextField.text {
                if let img = imagePost.image {
                    self.onSendTap?(description, img)
                }
            }
        } else {
            var title = "Erro"
            var msg_error = "Digite uma legenda para a postagem"
            self.onError?(title,msg_error)
        }
        
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
        addSubview(labelView)
        addSubview(imagePost)
        addSubview(buttonPost)
        addSubview(legendaTextField)
        addSubview(publishButton)
    }
    
    public func loadImageSelect(_ image : UIImage) {
        imagePost.image = image
    }
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            labelView.centerYAnchor.constraint(equalTo: buttonPost.centerYAnchor),
            labelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            imagePost.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 55),
            imagePost.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5),
            imagePost.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -5),
            imagePost.heightAnchor.constraint(equalToConstant: 290),
            
            buttonPost.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            buttonPost.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            buttonPost.widthAnchor.constraint(equalToConstant: 40),
            buttonPost.heightAnchor.constraint(equalToConstant: 40),
            
            
            legendaTextField.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 10),
            legendaTextField.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5),
            legendaTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -5),
            legendaTextField.heightAnchor.constraint(equalToConstant: 100),
            
            
            publishButton.topAnchor.constraint(equalTo: legendaTextField.bottomAnchor, constant: 36),
            publishButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            publishButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            publishButton.heightAnchor.constraint(equalToConstant: 43),
        ])
    }

}
