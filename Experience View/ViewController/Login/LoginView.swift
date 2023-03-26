//
//  LoginView.swift
//  Experience View
//
//  Created by Italo Rossy on 13/03/23.
//

import UIKit

class LoginView: UIView {


    // MARK: Clousers
    
    var onRegisterTap:(() -> Void)?
    var onLoginTap:((_ email:String,_ password:String) -> Void)?
    
    
    // MARK: Properts
    

    
    lazy var nameAppLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ExperienceView"
        label.font = UIFont(name: "Pacifico", size: 58)
        label.textColor = .black
        return label
    }()

    
    
    lazy var loginTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white/* #343434 */
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.resignFirstResponder()
        tf.attributedPlaceholder = NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black.withAlphaComponent(0.4)])
        tf.textColor = .black
        tf.clipsToBounds = true
        tf.autocapitalizationType = .none
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.addDoneButtonOnKeyboard()
        tf.text = "crzlulu24@gmail.com"
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white /* #343434 */
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.autocapitalizationType = .none
        tf.resignFirstResponder()
        tf.isSecureTextEntry = true
        tf.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black.withAlphaComponent(0.4)])
        tf.textColor = .black
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.addDoneButtonOnKeyboard()
        tf.text = "123456"
        return tf
    }()
    
    lazy var recoverPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Recuperar Senha?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(tappedRecoverPasswordButton), for: .touchUpInside)
        return button
    }()
    
    lazy var subLoginImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "gradient3")
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        button.backgroundColor = UIColor(named: "tabBarColor")
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastre-se", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        button.backgroundColor = UIColor(named: "tabBarColor")
        return button
    }()
    
    lazy var lineView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    @objc func tappedLoginButton(_ sender: UIButton) {
        if let email = loginTextField.text,
           let password = passwordTextField.text {
             self.onLoginTap?(email, password)
        } else {
            
        }
        
    }
    
    @objc func tappedRecoverPasswordButton(_ sender: UIButton) {
        print(#function)
    }
    
    @objc func tappedRegisterButton(_ sender: UIButton) {
        self.onRegisterTap?()
    }
    

 
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
       // addSubview(subImageView)
        addSubview(nameAppLabel)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(recoverPasswordButton)
        addSubview(subLoginImageView)
        addSubview(loginButton)
        addSubview(lineView)
        addSubview(registerButton)
        
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
//            subImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            subImageView.topAnchor.constraint(equalTo: topAnchor),
//            subImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            subImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            nameAppLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 75),
            nameAppLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            
            loginTextField.topAnchor.constraint(equalTo: nameAppLabel.bottomAnchor, constant: 32),
            loginTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            loginTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            loginTextField.heightAnchor.constraint(equalToConstant: 39),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 11),
            passwordTextField.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: loginTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: loginTextField.heightAnchor),
            
            recoverPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 9),
            recoverPasswordButton.trailingAnchor.constraint(equalTo: loginTextField.trailingAnchor),
            recoverPasswordButton.heightAnchor.constraint(equalToConstant: 16),
            
            subLoginImageView.topAnchor.constraint(equalTo: recoverPasswordButton.bottomAnchor, constant: 36),
            subLoginImageView.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor),
            subLoginImageView.trailingAnchor.constraint(equalTo: loginTextField.trailingAnchor),
            subLoginImageView.heightAnchor.constraint(equalToConstant: 43),
            
            loginButton.topAnchor.constraint(equalTo: subLoginImageView.topAnchor),
            loginButton.leadingAnchor.constraint(equalTo: subLoginImageView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: subLoginImageView.trailingAnchor),
            loginButton.bottomAnchor.constraint(equalTo: subLoginImageView.bottomAnchor),
            
            lineView.topAnchor.constraint(equalTo: subLoginImageView.bottomAnchor, constant: 48),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            registerButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 48),
            registerButton.leadingAnchor.constraint(equalTo: subLoginImageView.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: subLoginImageView.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 41),
            
            
          
            
        ])
    }
    
    
    
}

