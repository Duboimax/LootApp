//
//  LootDetailView.swift
//  LootApp
//
//  Created by Maxence DUBOIS on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {
    
    var item: LootItem
    
    var body: some View {
        VStack {
            VStack{
                Text(item.type.rawValue)
                    .padding()
                    .background(item.rarity.rarityColor())
                    .cornerRadius(30)
                    .frame(height: 150, alignment: .bottom)
                    .font(.system(size: 80))
                    .shadow(color: item.rarity.rarityColor(), radius: 100)
                
                Text(item.name).foregroundColor(item.rarity.rarityColor())
                    .padding(10)
                    .frame(height: 100, alignment: .top)
                    .font(.system(size: 20))
                    .fontWeight(.black)
                
                if item.rarity == .unique {
                    Text("Item Unique 🏆")
                        .frame(width: 350)
                        .fontWeight(.bold)
                        .padding(10)
                        .background(item.rarity.rarityColor())
                        .foregroundColor(.white)
                        
                        .cornerRadius(10)
                        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        
                }
            }
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
}

#Preview {
    LootDetailView(item: lootItems[0])
}
