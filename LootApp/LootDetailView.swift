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
                LootDetailHeader(item: item)
                LootDetailsContent(item: item)
            }
            
        }
    }
    
    #Preview {
        LootDetailView(item: lootItems[0])
    }
