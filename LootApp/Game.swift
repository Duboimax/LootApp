//
//  Game.swift
//  LootApp
//
//  Created by Maxence DUBOIS on 1/19/24.
//

import Foundation

enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

// Hesitez pas mettre vos propres jeux dans la liste
let availableGames = [
    Game(name: "Elden Ring", genre: .rpg, coverName: "4"),
    Game(name: "Skyrim", genre: .rpg, coverName: nil),
    Game(name: "WoW", genre: .mmorpg, coverName: "1"),
    Game(name: "CS:GO", genre: .fps, coverName: "5"),
    Game(name: "Diablo IV", genre: .looter, coverName: "2")
]
