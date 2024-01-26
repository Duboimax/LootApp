//
//  LootDetailView.swift
//  LootApp
//
//  Created by Maxence DUBOIS on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {
    
    @ObservedObject var inventory = Inventory()
    @State var showAddItemView = false
    
    var item: LootItem
    var body: some View {
        NavigationStack {
            VStack {
                LootDetailHeader(item: item)
                LootDetailsContent(item: item)
            }
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView(itemId: item.id, name: item.name, rarity: item.rarity, game: item.game, someType: item.type, attackStrength: item.attackStrength ?? 1, quantity: item.quantity, isCheck: (item.attackStrength ?? 0 > 1), isEditing: true, showAddItemView: $showAddItemView)
                    .environmentObject(inventory)
            })
            .toolbar(content: { // La barre d'outil de notre page
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    Button(action: {
                        showAddItemView.toggle()
                    }, label: {
                        Text("Edit")
                        Image(systemName: "pencil")
                    })
                }
            })
            
        }
    }
}

#Preview {
    LootDetailView(item: lootItems[0])
}
