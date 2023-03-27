//
//  HomeViewModel.swift
//  Experience View
//
//  Created by Italo Rossy on 15/03/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore



class HomeViewModel {
    var onReloadPosts:(() -> Void)?
    private let auth = Auth.auth()
    private var countPosts : Int?
    private let firestore = Firestore.firestore()
    private var postagens: [Dictionary<String, Any>] = []
    
    
    public func logoffUser() {
        do {
            try auth.signOut() }
        catch {
            print("erro ao deslogar usuario")
            
        }
    }
    
    public var getListPost: [Dictionary<String, Any>] {
        return self.postagens
    }
    
    
    
    
    public func reloadPost() {
        if let idUser = auth.currentUser?.uid {
            self.postagens.removeAll()
            firestore.collection("postagens").document(idUser).collection("postagens_usuario").getDocuments { result, error in
                if let posts = result {
                    for document in posts.documents {
                        let data = document.data()
                        self.postagens.append(data)
                        
                    }
                    self.onReloadPosts?()
                }
            }
        }
        
    }
    
    public var numberOfItems: Int {
        self.postagens.count
        
    }
    
    public func sizeForItem(indexPath: IndexPath, frame: CGRect) -> CGSize {
        if indexPath.row == 0 {
            return  CGSize(width: 120, height: frame.height)
        } else {
            return CGSize(width: frame.width - 120 , height: frame.height)
        }
        
    }
    
    public func getUserName( completion : @escaping (String?) -> Void){
        if let idUser = auth.currentUser?.uid {
            // Obter uma referência à coleção "usuarios"
            let usuariosRef = Firestore.firestore().collection("usuarios")

            // Obter um documento na coleção "usuarios" com um determinado ID
            let usuarioDocRef = usuariosRef.document(idUser)

            // Obter os dados do documento como um dicionário
            usuarioDocRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let data = document.data()
                    
                    // Acessar as chaves "nome" e "email" do dicionário
                    if let nome = data?["nome"] as? String {
                        completion(nome)
                    }
                } else {
                    print("Documento não existe")
                    completion(nil)
                }
            }
        }

    }
}
