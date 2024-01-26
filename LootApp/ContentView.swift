import SwiftUI

class Inventory: ObservableObject {
    @Published var loot: [LootItem] = lootItems
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
    func updateItem(item : LootItem) {
        if let index = loot.firstIndex(where: {$0.id == item.id}) {
            loot[index] = item
        }
    }
    
}

enum LooterFeature {
    case loot
    case wishList
    case profile
}


struct ContentView: View {
    @State private var selectedFeature: LooterFeature = .loot
    
    var body: some View {
        TabView(selection: $selectedFeature) {
            LootView()
                .tabItem {
                    Label("Loot", systemImage: "bag.fill")
                }
                .tag(LooterFeature.loot)
            WishListView()
                .tabItem {
                    Label("Wishlist", systemImage: "heart.fill")
                }
                .tag(LooterFeature.wishList)
            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.fill")
                }
                .tag(LooterFeature.profile)
        }
    }
}



#Preview {
    ContentView()
}

