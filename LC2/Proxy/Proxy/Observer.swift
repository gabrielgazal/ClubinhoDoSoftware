//
//  Singleton.swift
//  Observer
//
//  Created by Gabriel Taques on 03/02/20.
//  Copyright © 2020 Gabriel Taques. All rights reserved.
//

import Foundation

protocol DataObserver {
    func notify()
}


class Usuario {
    
    var nome: String
    var idade: Int
    
    init(nome: String, idade: Int) {
        self.nome = nome
        self.idade = idade
    }
}

class Singleton {
    
    var dataObservers = [DataObserver]()
    
    var listaDeUsuarios: [Usuario] = [] {
        didSet {
            self.dataObservers.forEach({ $0.notify() })
        }
    }
}

class AlgumaViewController: DataObserver {
    
    //Se tivessemos uma TableView a qual está ligada a um array de usuarios da singleton
    // toda vez que adicionarmos a essa lista, a função notify será executada
    func notify() {
        //tableView.reloadData()
    }
    
    
}

