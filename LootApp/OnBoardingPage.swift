//
//  OnBoardingPage.swift
//  LootApp
//
//  Created by Maxence DUBOIS on 1/24/24.
//

import SwiftUI

struct OnBoardingPage: View {
    var page: Page
    @State private var isAnimating: Bool = false
    @AppStorage("isOnboardingDone") var isOnboardingDone: Bool?
    
    var body: some View {
        ZStack{
            VStack(spacing: 20){
                Text(page.title)
                    .font(.custom("Verdana", fixedSize: 36))
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Image(systemName: page.image)
                    .padding(50)
                    .foregroundColor(.white)
                    .background(page.color)
                    .font(.system(size: 85))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(height: 200, alignment: .center)
                
                
                Text(page.description).multilineTextAlignment(.center)
                
                Button(action: {
                    if page.buttonText == "Commencer" {
                        isOnboardingDone = true
                    }
                    else {
                        print("la boutade")
                    }
                }) {
                    HStack(spacing: 8) {
                        Text(page.buttonText)
                        
                        Image(systemName: "arrow.right.circle")
                            .imageScale(.large)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(
                        page.color
                    )
                } //: BUTTONÒ
                .accentColor(Color.white)
                .cornerRadius(20)
            }
            
        }.onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}


#Preview {
    OnBoardingPage(page: Page(title: "En un coup d'oeil", description: "Ajoutez facilement vos trouvailles et vos achats à votre collection personnelle", image: "gym.bag", color: Color.orange, buttonText: "Continuer"))
}
