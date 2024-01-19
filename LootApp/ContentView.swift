import SwiftUI

class Inventory: ObservableObject {
    @Published var loot: [LootItem] = lootItems
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
}


    
    struct ContentView: View {
        @ObservedObject var inventory = Inventory()
        
        @State var showAddItemView = false
        
        var body: some View {
            NavigationStack {
                List {
                    ForEach(inventory.loot) { item in
                        NavigationLink {
                            LootDetailView(item: item) // On passe directement l'item à la vue
                        } label: {
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
                }
                
                
            }
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView(showAddItemView: $showAddItemView)
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
    
    
    
    #Preview {
        ContentView()
    }

