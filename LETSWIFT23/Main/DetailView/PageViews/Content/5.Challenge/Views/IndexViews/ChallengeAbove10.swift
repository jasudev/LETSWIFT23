//
//  ChallengeAbove10.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/08.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct ChallengeAbove10: View {
    
    let delayTime: CGFloat = 0.6
    @State private var step1: Bool = false
    
    var body: some View {
        HStack(spacing: 30) {
            Image("iPadFlash")
                .resizable()
                .scaledToFit()
            
            if step1 {
                VStack(alignment: .center, spacing: 0) {
                    Image("Jobsflash")
                        .resizable()
                        .scaledToFit()
                        .padding(16)
                        .transition(.opacity)
                    LinkTextView("https://www.youtube.com/watch?v=MzkslSXOD0g", path: "https://www.youtube.com/watch?v=MzkslSXOD0g")
                        .setFont(sizeType: .caption1, weight: .regular)
                }
            }
        }
        .transition(.opacity)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) {
                withAnimation(ANIMATION_CONTENT_LEVEL3) {
                    step1 = true
                }
            }
        }
        .onDisappear {
            step1 = false
        }
    }
}

struct ChallengeAbove10_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeAbove10()
    }
}
