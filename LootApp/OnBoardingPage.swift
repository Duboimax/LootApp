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
    @Binding var step: Int
    @AppStorage("isOnboardingDone") var isOnboardingDone: Bool?
    
    var body: some View {
        ZStack{
            VStack(spacing: 20){
                Spacer()
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
                Spacer()
                Button(step == allPage.count ? "Continuer" : "Commencer") {
                    if step == allPage.count {
                        isOnboardingDone = true
                    } else {
                        step += 1
                    }
                }
                .foregroundColor(.white)
                .padding(10)
                .frame(width: 200)
                .background(page.color)
                .cornerRadius(20)
                
                Spacer()
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
}
