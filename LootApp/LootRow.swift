//
//  LootRow.swift
//  LootApp
//
//  Created by Maxence DUBOIS on 1/23/24.
//

import SwiftUI

struct LootRow: View {
    
    let item: LootItem
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Circle()
                        .fill(item.rarity.rarityColor())
                        .frame(width: 10, height: 10)
                    Text(item.name).font(.headline)
                    Spacer()
                    Text(item.type.rawValue)
                }
                
                Text("Quantity: \(item.quantity)")
                
            }
        }
    }
}

#Preview {
    LootRow(item: lootItems[0])
}
