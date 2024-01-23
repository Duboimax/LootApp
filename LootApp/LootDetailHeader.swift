//
//  LootDetailHeader.swift
//  LootApp
//
//  Created by Maxence DUBOIS on 1/23/24.
//

import SwiftUI

struct LootDetailHeader: View {
    
    let item: LootItem
    
    @State private var animationAmout: Double = 0.0
    @State private var shadowRadius: CGFloat = 0
    @State private var scaleUnique = 0.0
    @State private var xOffset = 0.0
    @State private var yOffset = 0.0
    
    var body: some View {
        VStack{
            Text(item.type.rawValue)
                .padding()
                .background(item.rarity.rarityColor())
                .cornerRadius(30)
                .frame(height: 150, alignment: .bottom)
                .font(.system(size: 80))
                .shadow(color: shadowRadius == 100 ? item.rarity.rarityColor() : .clear, radius: shadowRadius)
                .rotation3DEffect(
                    .degrees(animationAmout),
                    axis: (x: 1.0, y: 0.5, z: 0)
                )
                .offset(x: xOffset, y: yOffset)
                .onAppear() {
                    Task {
                        try? await Task.sleep(nanoseconds: 400_000_000)
                        withAnimation(.spring()) {
                            self.animationAmout = 360
                        }
                        try? await Task.sleep(nanoseconds: 200_000_000)
                        withAnimation(.easeInOut(duration: 1.0)) {
                            self.shadowRadius = 100.0
                        }
                        
                    }
                }.onTapGesture {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1)) {
                        self.xOffset = CGFloat.random(in: -150...150)
                        self.yOffset = CGFloat.random(in: -150...150)
                    }
                    Task {
                        try? await Task.sleep(nanoseconds: 500_000_000) // Attente de 0.5 seconde
                        withAnimation(.spring()) {
                            self.xOffset = 0
                            self.yOffset = 0
                        }
                    }
                }
                
            
            Text(item.name).foregroundColor(item.rarity.rarityColor())
                .padding(10)
                .frame(height: 100, alignment: .top)
                .font(.system(size: 20))
                .fontWeight(.black)
            
            
            
        }
        
        if item.rarity == .unique {
            Text("Item Unique 🏆")
                .frame(width: 350)
                .fontWeight(.bold)
                .padding(10)
                .background(item.rarity.rarityColor())
                .foregroundColor(.white)
                .cornerRadius(10)
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .scaleEffect(scaleUnique)
                .onAppear{
                    Task {
                        try? await Task.sleep(nanoseconds: 400_000_000)
                        withAnimation(.easeIn(duration: 0.4)) {
                            self.scaleUnique = 1.0
                        }
                    }
                }
        }
    }
}

#Preview {
    LootDetailHeader(item: lootItems[0])
}
