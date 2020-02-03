//
//  Decorator.swift
//  Proxy
//
//  Created by Bruno Pastre on 03/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation


protocol Character{
 
    func getHealth() -> Int
    func getName() -> String
}

protocol CharacterType: Character {
    var base: Character { get }
}

class Orc: Character {
    func getName() -> String {
        return "Orc"
    }
    
    func getHealth() -> Int {
        return 10
    }
    
    
}

class Warlord: CharacterType {
    func getHealth() -> Int {
        return self.base.getHealth() + 40
    }
    
    var base: Character
    
    init(base: Character) {
        self.base = base
    }
    
    func getName() -> String {
        return "Super " + self.base.getName()
    }
 }

let orc = Orc()

let boss = Warlord(base: orc)
