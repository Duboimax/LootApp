//
//  AddItemView.swift
//  LootApp
//
//  Created by Maxence DUBOIS on 1/19/24.
//

import SwiftUI


struct AddItemView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var inventory: Inventory
    
    @State var name: String = ""
    @State var rarity: Rarity = Rarity.common
    @State var game: Game = Game.emptyGame
    @State var someType: ItemType = ItemType.unowned
    @State var attackStrength: Int = 1
    @State var quantity: Int = 1
    
    @State var isCheck: Bool = false
    
    @Binding var showAddItemView: Bool
    
    func addItem() {
        let newItem = LootItem(quantity: quantity, name: name, type: someType, rarity: rarity, game: game)
        inventory.addItem(item: newItem)
        dismiss()
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Nom de l'objet", text: $name)
                Picker("Rarete", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            
            Section {
                Picker("Jeu", selection: $game) {
                    ForEach(availableGames) { oneGame in
                        Text(oneGame.name)
                    }
                }
                Stepper("Combien: \(quantity)", value: $quantity)
            }
            
            Section {
                HStack{
                    Text("Types: ")
                    Spacer()
                    Text(someType.rawValue)
                }
                Picker("Type: \(someType.rawValue)", selection: $someType) {
                    ForEach(ItemType.allCases, id: \.self) { type in
                        Text(String(describing: type.rawValue).capitalized)
                    }
                }
                
                .pickerStyle(PalettePickerStyle())
            }
            
            Section {
                HStack {
                    Text("Item d'attaque ? ")
                    Spacer()
                    Toggle(isOn: $isCheck){
                        
                    }
                }
                if isCheck {
                    Stepper("Force d'attaque: \(attackStrength)", value: $attackStrength)
                }
            }
            
            Button(action: {
                addItem()
            }, label: {
                Text("Ajouter")
            })
        }
    }
}
#Preview {
    AddItemView(showAddItemView: .constant(true))
}
