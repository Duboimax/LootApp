//
//  LootGames.swift
//  LootApp
//
//  Created by Maxence DUBOIS on 1/23/24.
//

import SwiftUI

struct LootGames: View {
    var body: some View {
        ScrollView {
            HStack(spacing: 10) {
                
                ForEach(availableGames) { oneGame in
                    if let coverName = oneGame.coverName
                    {
                        VStack{
                            Image(coverName)                  .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 100)
                            Text(oneGame.name)
                        }
                        
                        
                    } else {
                        VStack {
                            Image(systemName: "rectangle.slash") .resizable()
                                .frame(width: 30, height: 58)
                                .opacity(0.4)
                                .aspectRatio(contentMode: .fit)
                                .background(Color.gray)
                                .cornerRadius(4.0)
                            Text(oneGame.name)
                            
                        }
                    }
                    
                }
                
            }
        }
    }
}

#Preview {
    LootGames()
}
