//
//  PGChallenge1.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct PGChallenge1: View {
    
    @Namespace var animation
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .pagingOnKeyboardInput(index: index, maxIndex: 13)
    }
    
    private func content() -> some View {
        VStack {
            if indexValue <= 4 {
                ChallengeAbove0(indexValue: indexValue, animation: animation)
            }
            
            if indexValue >= 5 {
                AppleFlashHistory(animation: animation, index: index, startIndex: 5)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                aboveIndex5_12()
                Spacer()
            }
        }
        .setFont(sizeType: .description1, weight: .semibold)
        .animation(indexValue == 5 ? ANIMATION_CONTENT_LEVEL2 : ANIMATION_CONTENT_LEVEL3, value: indexValue)
    }
    
    private func aboveIndex5_12() -> some View {
        VStack {
            switch indexValue {
            case 5: ChallengeAbove5()
            case 6: ChallengeAbove6()
            case 7: ChallengeAbove7()
            case 8: ChallengeAbove8()
            case 9: ChallengeAbove9()
            case 10: ChallengeAbove10()
            case 11: aboveIndex11()
            case 12, 13:
                HStack(spacing: 60) {
                    aboveIndex12()
                    if indexValue >= 13 {
                        aboveIndex13()
                    }
                }
                .transition(.opacity)
            default: Spacer()
            }
        }
        .foregroundColor(Color.primaryLevel1)
        .transition(.move(edge: .bottom).combined(with: .opacity))
        .padding()
    }
    
    private func aboveIndex11() -> some View {
        AFThoughtsOnFlashView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .transition(.opacity)
    }
    
    private func aboveIndex12() -> some View {
        Image("FlashRIP")
            .resizable()
            .scaledToFit()
    }
    
    private func aboveIndex13() -> some View {
        Image("AnimateKeyFrame")
            .resizable()
            .scaledToFit()
            .transition(.move(edge: .trailing).combined(with: .opacity))
    }
}

struct PGChallenge1_Previews: PreviewProvider {
    static var previews: some View {
        PGChallenge1()
            .modifier(PreviewModifier())
    }
}
