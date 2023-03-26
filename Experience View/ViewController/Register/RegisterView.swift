//
//  RegisterView.swift
//  Experience View
//
//  Created by Italo Rossy on 13/03/23.
//

import UIKit

class RegisterView: UIView {
    
    // MARK: Clousers
    
    
    var onSignupTap:((_ nome: String, _ email:String,_ password:String) -> Void)?
    var onSignupFailed:((_ title:String,_ message:String) -> Void)?
    var onBackTap:(() -> Void)?
  
    lazy var nameAppLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ExperienceView"
        label.font = UIFont(name: "Pacifico", size: 58)
        label.textColor = .black
        return label
    }()
    
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.text = "Digite abaixo os seus dados de login"
        return label
    }()
    
    lazy var userNameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.resignFirstResponder()
        tf.attributedPlaceholder = NSAttributedString(string: "Nome", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black.withAlphaComponent(0.4)])
        tf.textColor = .black
        tf.clipsToBounds = true
        tf.autocapitalizationType = .none
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.black.cgColor
        tf.text = ""
        return tf
    }()
    
    lazy var registerTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.resignFirstResponder()
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black.withAlphaComponent(0.4)])
        tf.textColor = .black
        tf.clipsToBounds = true
        tf.autocapitalizationType = .none
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.black.cgColor
        tf.text = ""
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
        tf.layer.borderColor = UIColor.black.cgColor
        tf.text = ""
        return tf
    }()
    
    lazy var passwordConfTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white /* #343434 */
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.autocapitalizationType = .none
        tf.resignFirstResponder()
        tf.isSecureTextEntry = true
        tf.attributedPlaceholder = NSAttributedString(string: "Confirme a Senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black.withAlphaComponent(0.4)])
        tf.textColor = .black
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.black.cgColor
        tf.text = ""
        return tf
    }()
    
    
    lazy var SignupButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(tappedSignupButton), for: .touchUpInside)
        button.backgroundColor = UIColor(named: "tabBarColor")
        return button
    }()
    
    lazy var lineView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Voltar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(tappedbackButton), for: .touchUpInside)
        button.backgroundColor = UIColor(named: "tabBarColor")
        return button
    }()
    
    @objc func tappedSignupButton(_ sender: UIButton) {
        if let email = registerTextField.text,
           let password = passwordTextField.text,
           let passwordConf = passwordConfTextField.text,
           let nome = userNameTextField.text
           {
            if password == passwordConf {
                self.onSignupTap?(nome,email, password)
            } else {
                self.onSignupFailed?("Erro","A senha de confirmaçao deve ser identica a senha, verifique.")
            }
            
        } else {
            self.onSignupFailed?("error","Dados obrigatorios náo preenchidos, verifique.")
        }
        
    }
    
    @objc func tappedbackButton(_ sender: UIButton) {
        self.onBackTap?()
    }
    
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addElements() {
        addSubview(backButton)
        addSubview(nameAppLabel)
        addSubview(userNameTextField)
        addSubview(registerTextField)
        addSubview(descriptionLabel)
        addSubview(passwordTextField)
        addSubview(passwordConfTextField)
        addSubview(SignupButton)
        addSubview(lineView)
    }
    
    private func configConstraints (){
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            backButton.widthAnchor.constraint(equalToConstant: 65),
           
            nameAppLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 75),
            nameAppLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameAppLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
           
            userNameTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            userNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            userNameTextField.heightAnchor.constraint(equalToConstant: 39),
            
            registerTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 11),
            registerTextField.leadingAnchor.constraint(equalTo: userNameTextField.leadingAnchor),
            registerTextField.trailingAnchor.constraint(equalTo: userNameTextField.trailingAnchor),
            registerTextField.heightAnchor.constraint(equalTo: userNameTextField.heightAnchor),

            passwordTextField.topAnchor.constraint(equalTo: registerTextField.bottomAnchor, constant: 11),
            passwordTextField.leadingAnchor.constraint(equalTo: registerTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: registerTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: registerTextField.heightAnchor),

            passwordConfTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 11),
            passwordConfTextField.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            passwordConfTextField.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            passwordConfTextField.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor),


            SignupButton.topAnchor.constraint(equalTo: passwordConfTextField.bottomAnchor, constant: 15),
            SignupButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            SignupButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            SignupButton.heightAnchor.constraint(equalToConstant: 41),


            lineView.topAnchor.constraint(equalTo: SignupButton.bottomAnchor, constant: 48),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
        ])
    }
}
