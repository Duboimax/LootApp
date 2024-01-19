//
//  LootItem.swift
//  LootApp
//
//  Created by Maxence DUBOIS on 1/19/24.
//

import Foundation
import SwiftUI

struct LootItem: Identifiable {
    var id = UUID()
    var quantity: Int
    var name: String
    var type: ItemType
    var rarity: Rarity
    var attackStrength: Int?
    var game: Game
    
}

enum ItemType: String, CaseIterable {
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case wind = "💨"
    case posion = "☠️"
    case thnuder = "⚡️"
    case dagger = "🗡️"
    case shield = "⛨"
    case bow = "🏹"
    case ring = "💍"
    case unowned = "🎲"
}

enum Rarity: String, CaseIterable {
    case common
    case rare
    case epic
    case legendary
    case unique
    
    func rarityColor() -> Color {
        switch self {
        case .common:
            return Color.gray
        case .rare:
            return Color.green
        case .epic:
            return Color.blue
        case .legendary:
            return Color.yellow
        case .unique:
            return Color.red
        }
    }
}

let lootItems: [LootItem] = [
    LootItem(quantity: 1, name: "Flaming Sword", type: .fire, rarity: .unique, attackStrength: 50, game: availableGames[1]), // Skyrim
    LootItem(quantity: 2, name: "Ice Wand", type: .ice, rarity: .rare, attackStrength: 30, game: availableGames[2]), // WoW
    LootItem(quantity: 1, name: "Poisonous Dagger", type: .posion, rarity: .legendary, attackStrength: 70, game: availableGames[4]), // Diablo IV
    LootItem(quantity: 3, name: "Wind Cloak", type: .wind, rarity: .common, attackStrength: nil, game: availableGames[0]), // Elden Ring
    LootItem(quantity: 1, name: "Thunder Amulet", type: .thnuder, rarity: .unique, attackStrength: nil, game: availableGames[3]), // CS:GO
    LootItem(quantity: 2, name: "Magic Ring", type: .magic, rarity: .common, attackStrength: nil, game: availableGames[4]), // Diablo IV
    LootItem(quantity: 1, name: "Shield of Ages", type: .shield, rarity: .epic, attackStrength: 40, game: availableGames[2]), // WoW
    LootItem(quantity: 1, name: "Bow of Silence", type: .bow, rarity: .rare, attackStrength: 35, game: availableGames[1]), // Skyrim
    LootItem(quantity: 1, name: "Dagger of Destiny", type: .dagger, rarity: .legendary, attackStrength: 60, game: availableGames[0]), // Elden Ring
    LootItem(quantity: 2, name: "Mystery Box", type: .unowned, rarity: .common, attackStrength: nil, game: Game.emptyGame)
]
