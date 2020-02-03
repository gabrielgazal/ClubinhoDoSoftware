//
//  DatabaseManager.swift
//  Proxy
//
//  Created by Bruno Pastre on 03/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation


protocol BancoManager {
    func deposita()
}

class BancoProxy: BancoManager {
    func deposita() {
        self.instance.deposita()
    }
    
    var instance: BancoLogic = BancoLogic()
    
    func deposita(quem eh: CLiente) {
//        eh.
        self.instance.deposita()
    }
}

class BancoLogic: BancoManager {
    func deposita() {
        // deposita + 10 na conta
    }
}

class CLiente {
    var manager: BancoManager! = BancoProxy()
    
    func depositaDeizao() {
        
    }
}
