//
//  ViewController.swift
//  FireBaseTeste
//
//  Created by Andre Linces on 19/09/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    //Criando referência com o banco de dados do firebase.
    
    
    @IBOutlet weak var textoLabel: UILabel!
    
    let firebase = Database.database().reference()
     
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Método para logar o usuário login e senha.
        Auth.auth().signIn(withEmail: "andre@gmail.com", password: "and1234") { usuario, erro in
            
            if erro == nil {//Sucesso
                
                print("Sucesso ao cadastrar o usuário!! \(erro?.localizedDescription)  ")
                
            }else{//Erro
                
                print("Erro ao cadastrar o usuário \(erro?.localizedDescription)  ")
            }
            
            
        }
        
        //Método para deslogar o usuário
        do {
            try Auth.auth().signOut()
        } catch  {
            print("Erro ao deslogar usuário")
        }
        
        Auth.auth().addStateDidChangeListener { Auth, usuario in
         
            if let usuarioLogado = usuario {
                
                print("Usuário logado, email: " + String(describing: usuarioLogado.email) )
            }else{
                
                print("Usuário não está logado !")
            }
        
        }
         
        //let pontuacao = firebase.child("pontuacao").child("valor")
        
        //pontuacao.removeValue()
        
        //pontuacao.child("valor").setValue("100")
        
        /*
        //Criando usuário no firebase com autenticação de login e senha.
        Auth.auth().createUser(withEmail: "andre@gmail.com", password: "and1234") { usuario, erro in
            
            if erro == nil {//Sucesso
                
                print("Sucesso ao cadastrar o usuário!! \(erro?.localizedDescription)  ")
                
            }else{//Erro
                
                print("Erro ao cadastrar o usuário \(erro?.localizedDescription)  ")
            }
            
            
        }
        */
        /*
        //recuperar dados do firebase
        pontuacao.observe(DataEventType.value) { dados in
            //print para testar se o observe está atualizando.
            //print( dados )
            
            let ponto = dados.value as! String
            self.textoLabel.text = ponto
            
        }
         */
    }
    

}

