//
//  ChallengeAbove7.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/08.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct ChallengeAbove7: View {
    
    let delayTime: CGFloat = 0.6
    @State private var step1: Bool = false
    @State private var step2: Bool = false
    
    var body: some View {
        HStack {
            Image("Flash5")
                .resizable()
                .scaledToFit()
            if step1 {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .padding(.leading, 80)
                    .transition(.opacity)
            }
            if step2 {
                Image("Actionscript")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .transition(.scale)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .transition(.opacity)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) {
                withAnimation(.easeInOut(duration: 0.6)) {
                    step1 = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) {
                    withAnimation(ANIMATION_CONTENT_LEVEL3) {
                        step2 = true
                    }
                }
            }
        }
        .onDisappear {
            step1 = false
            step2 = false
        }
    }
}

struct ChallengeAbove7_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeAbove7()
    }
}
