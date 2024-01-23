//
//  LootDetailsContent.swift
//  LootApp
//
//  Created by Maxence DUBOIS on 1/23/24.
//

import SwiftUI

struct LootDetailsContent: View {
    
    let item: LootItem
    var body: some View {
        List {
            Section {
                HStack {
                    if let coverName = item.game.coverName
                    {
                        Image(coverName)                  .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 100)
                        
                    } else {
                        Image(systemName: "rectangle.slash") .resizable()
                            .frame(width: 30, height: 58)
                            .opacity(0.4)
                            .aspectRatio(contentMode: .fit)
                            .background(Color.gray)
                            .cornerRadius(4.0)
                        
                        
                    }
                    Text(item.game.name)
                }
                HStack{
                    Text("In-game :  \(item.name)")
                }
                HStack{
                    Text("Puissance (ATQ) : \(item.attackStrength ?? 0)")
                }
                HStack{
                    Text("Possédé(s) : \(item.quantity)")
                }
                HStack{
                    Text("Rareté : \(item.rarity.rawValue)")
                }
            } header: {
                Text("Information").textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
            }
            
        }
    }
}

#Preview {
    LootDetailsContent(item: lootItems[0])
}
