//
//  Piece.swift
//  Xadrez
//
//  Created by Bruno Pastre on 27/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation

enum Direction {
    case horizontal
    case vertical
}

protocol Moveable {
    
    func getMovingPattern() -> [Movement]
    func move(to position: Position)
    
}

protocol Drawable: Equatable {
    
    func getPosition() -> Position
    func getChar() -> String
    func getColor() -> String

}

class Piece: Moveable, Drawable {
    static func == (lhs: Piece, rhs: Piece) -> Bool {
        return lhs.position == rhs.position
    }
    
    
    internal init(movingPattern: [Movement], char: String, color: String, position: Position) {
        self.movingPattern = movingPattern
        self.char = char
        self.color = color
        self.position = position
    }
    
    
    private var movingPattern: [Movement]
    private var char: String
    private var color: String
    private var position: Position
    
    
    func getMovingPattern() -> [Movement] {
        return self.movingPattern
    }
    
    func move(to position: Position) {
        self.position = position
    }
    
    func getChar() -> String {
        return self.char
    }
    
    func getColor() -> String {
        return self.color
    }
    
    func getPosition() -> Position {
        return self.position
    }
    
    
}

class Tile: Drawable {
    var isWhite: Bool
    var position: Position!
    
    init(isWhite: Bool, position: Position) {
        self.isWhite = isWhite
        self.position = position
    }
    
    func getChar() -> String {
        return isWhite ? "W" : "B"
    }
    
    func getColor() -> String {
        return isWhite ? "white" : "black"
    }
    
    func getPosition() -> Position {
        return self.position
    }
    
}

class Position {
    internal init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    static func zero() -> Position {
        return Position(x: 0, y: 0)
    }
    
    func offsetBy(dx: Int = 0, dy: Int = 0) -> Position{
        return Position(x: self.x + dx, y: self.y + dy)
    }
    
    var x, y: Int
}

class PieceFactory {
    
    static func tower(_ color: String, at position: Position) -> Piece {
        return Piece(movingPattern: [
            Movement(direction: .vertical, count: 8),
            Movement(direction: .horizontal, count: 8),
        ], char: "T", color: color, position: position)
    }
    
    static func pawn(_ color: String, at position: Position) -> Piece {
        return Piece(movingPattern: [
            Movement(direction: .vertical, count: 1),
        ], char: "p", color: color, position: position)
    }
}

class Player {
    var pieces: [Piece] = []
    var color: String
    
    init(color: String) {
        self.color = color
        
        self.pieces = [
            PieceFactory.tower(self.color, at: .zero()),
            PieceFactory.pawn(self.color, at: Position.zero().offsetBy(dx: 0, dy: 1))
        ]
    }
}

class Movement {
    
    internal init(direction: Direction, count: Int) {
        self.direction = direction
        self.count = count
    }
    
    var direction: Direction
    var count: Int
    
}

//class Drawer<T> where T: Drawable {
//
//    internal init(drawables: [T]) {
//        self.drawables = drawables
//        self.tabuleiro = Tabuleiro()
//    }
//
//    var drawables: [T]
//    var tabuleiro: Tabuleiro
//
//    func draw(on canvas: String) {
//        for line in self.tabuleiro.tabuleiro {
//
//        }
//    }
//
//
//
//}

class Tabuleiro {
    
    private var tabuleiro: [Drawable] = []
    
    func update(piece: Piece) {
        guard let index = self.tabuleiro.first(where: { (drawable) -> Bool in
            return drawable == piece
        })
        
        self.tabuleiro.remove(at: index)
        
        self.tabuleiro.append(piece)
    }
    
}


class Game {
    var tabuleiro: Tabuleiro
    var whitePlayer: Player
    var blackPlayer: Player
    
    init() {
        self.tabuleiro = Tabuleiro()
        self.whitePlayer = Player(color: "white")
        self.blackPlayer = Player(color: "black")
    }
    
    func getPlayers() -> [Player] {
        return [self.whitePlayer, self.blackPlayer]
    }
    
    func update() {
        self.getPlayers().forEach { (player) in
            for piece in player.pieces {
            
                tabuleiro.update(piece: piece)
            }
        }
    }
}
