//
//  LootView.swift
//  LootApp
//
//  Created by Maxence DUBOIS on 1/26/24.
//

import SwiftUI

struct LootView: View {
    
    @ObservedObject var inventory = Inventory()
    @AppStorage("isOnboardingDone") var isOnboardingDone: Bool?
    @State var showAddItemView = false
    
    var body: some View {
        NavigationStack {
            Button(action: {
                            isOnboardingDone = false
                        }, label: {
                            Image(systemName: "xmark.square.fill")
                        })
            List {
                
                ForEach(inventory.loot) { item in
                    NavigationLink {
                        LootDetailView(item: item)
                    } label: {
                        LootRow(item: item)
                    }
                }.onDelete(perform: { indexSet in
                    inventory.loot.remove(atOffsets: indexSet)
                })
                Section {
                    LootGames()
                } header: {
                    Text("Jeux").textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                }
            }
            
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView(isEditing: false, showAddItemView: $showAddItemView)
                    .environmentObject(inventory)
            })
            .navigationBarTitle("👝 Inventaire") // Notre titre de page, choisissez le titre que vous voulez
            .toolbar(content: { // La barre d'outil de notre page
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    Button(action: {
                        showAddItemView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
            })
            
        }
    }
}

#Preview {
    LootView()
}
