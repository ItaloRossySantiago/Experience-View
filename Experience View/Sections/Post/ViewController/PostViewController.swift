//
//  PostViewController.swift
//  Experience View
//
//  Created by Italo Rossy on 15/03/23.
//

import UIKit
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth

class PostViewController: UIViewController {
    var onPostSucess:(() -> Void)?
    let  postView = PostView()
    var storage: Storage!
    var auth: Auth!
    var firestore: Firestore!
    override func viewDidLoad() {
        super.viewDidLoad()
        storage = Storage.storage()
        auth = Auth.auth()
        firestore = Firestore.firestore()
    }
    
    
    
    override func loadView() {
        
        view = postView
        view.backgroundColor = .white
        postView.ontappedSelectImage = {
            self.selectImage()
        }
        
        postView.onSendTap = { [weak self] description, img in
            self?.sendPost(description,img)
        }
        
        postView.onError = { [weak self] title, msg_error in
            self?.showMessage(title, msg_error)
        }
    }
    
    
    private func sendPost(_ description: String, _ imgSend: UIImage) {
        let imagens = self.storage.reference().child("Imagens")
        let imagemSelecionada = imgSend //postView.imagePost.image
        if let imagemSend = imagemSelecionada.jpegData(compressionQuality: 0.3) {
            let idImg = UUID().uuidString
            let imgPostRef = imagens.child("Posts").child("\(idImg).jpg")
            imgPostRef.putData(imagemSend, metadata: nil) { storageMetadata, error in
                if error == nil {
                    imgPostRef.downloadURL { url, erro in
                        if erro == nil {
                            if let urlImage = url?.absoluteString {
                                if description != "" {
                                    if let user = self.auth.currentUser {
                                        let userId = user.uid
                                        self.firestore.collection("postagens").document(userId).collection("postagens_usuario")
                                            .addDocument(data: [
                                                "descricao": description,
                                                "url": urlImage
                                            ]) { error in
                                                if error == nil {
                                                    self.showMessageOnTimer("Sucesso", "Post criado com sucesso")
                                                   
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
                                                       self.onPostSucess?()
                                                    }
                                                } else {
                                                    print(error?.localizedDescription ?? "Erro na inserção dos dados")
                                                }
                                            }
                                    }
                                }
                            }
                        } else {
                            print(erro?.localizedDescription ?? "Erro na obtenção da URL da imagem")
                        }
                    }
                } else {
                    print(error?.localizedDescription ?? "Erro no upload da imagem")
                }
            }
        }
    }
    
   

}

