//
//  ChallengeAbove0.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/08.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ChallengeAbove0: View {
    
    @EnvironmentObject private var store: PContentStore
    let indexValue: Int
    let animation: Namespace.ID
    
    var body: some View {
        VStack(spacing: 50) {
            Image("Flashplayer1")
                .resizable()
                .matchedGeometryEffect(id: "Flashplayer1", in: animation)
                .scaledToFit()
                .frame(height: indexValue == 0 || indexValue == 4 ? store.contentSize.height * 0.36 : store.contentSize.height * 0.26)
                .transition(.opacity)
            
            if indexValue >= 1 && indexValue <= 4 {
                if indexValue != 4 {
                    HStack(spacing: 50) {
                        if indexValue >= 1 {
                            AnimatedImage(name: "Mashimaro.gif", isAnimating: .constant(true))
                                .resizable()
                                .scaledToFit()
                                .background {
                                    Color.white
                                }
                                .zIndex(3)
                                .transition(.identity)
                        }
                        if indexValue >= 2 {
                            AnimatedImage(name: "Stickman.gif", isAnimating: .constant(true))
                                .resizable()
                                .scaledToFit()
                                .background {
                                    Color.white
                                }
                                .zIndex(2)
                                .transition(.identity)
                        }
                        if indexValue >= 3 {
                            Image("Anipang")
                                .resizable()
                                .scaledToFit()
                                .zIndex(1)
                                .transition(.identity)
                        }
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .frame(height: store.contentSize.height * 0.4)
                    .clipped()
                }
            }
        }
    }
}

struct ChallengeAbove0_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        ChallengeAbove0(indexValue: 0, animation: animation)
    }
}
