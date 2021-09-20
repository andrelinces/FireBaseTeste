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
        
        
        let pontuacao = firebase.child("pontuacao").child("valor")
        
        //pontuacao.removeValue()
        
        //pontuacao.child("valor").setValue("100")
        
        //recuperar dados do firebase
        pontuacao.observe(DataEventType.value) { dados in
            //print para testar se o observe está atualizando.
            //print( dados )
            
            let ponto = dados.value as! String
            self.textoLabel.text = ponto
            
        }
        
    }


}

