//
//  OnBoarding.swift
//  LootApp
//
//  Created by Maxence DUBOIS on 1/24/24.
//

import SwiftUI

struct Page: Identifiable {
  var id = UUID()
  var title: String
  var description: String
  var image: String
  var color: Color
    var buttonText: String
}

let allPage: [Page] = [
    Page(title: "Gerer ces loots", description: "Ajoutez facilement vos trouvailles et vos achats à votre collection personnelle", image: "gym.bag", color: Color.orange, buttonText: "Continuer"),
    Page(title: "Votre wishlist", description: "Créez une liste de souhait pour une trace des articles que vous voulez aquérir", image: "eraser.line.dashed", color: Color.green, buttonText: "Continuer"),
    Page(title: "En un coup d'oeil", description: "les voitus, les voitus", image: "car.side", color: Color.blue, buttonText: "Commencer" )
]


struct OnBoarding: View {
    

    var body: some View {
        TabView(selection: $step{
            ForEach(allPage) { page in
                OnBoardingPage(page: page)
            }
        }.tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

#Preview {
    OnBoarding()
}
