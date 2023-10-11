//
//  ChallengeAbove8.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/08.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct ChallengeAbove8: View {
    
    let delayTime: CGFloat = 0.6
    @State private var step1: Bool = false
    @State private var step2: Bool = false
    
    var body: some View {
        HStack(spacing: 60) {
            FoldedShapeTextView(text: "2005년 웹에 연결된 컴퓨터의 98% 이상이\nFlash Player를 설치", highlighting: "98% 이상", size: CGSize(width: 200, height: 230))
                .transition(.move(edge: .trailing).combined(with: .opacity))
            if step1 {
                FoldedShapeTextView(text: "100개 이상의 제조업체에서\nFlash가 내장된 제품을 제작", highlighting: "100개 이상", size: CGSize(width: 200, height: 230))
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            }
            if step2 {
                FoldedShapeTextView(text: "Adobe는 Macromedia를 34억 달러에 인수", highlighting: "34억 달러", size: CGSize(width: 200, height: 230))
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
        .setFont(sizeType: .description2, weight: .semibold)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .transition(.opacity)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) {
                withAnimation(ANIMATION_CONTENT_LEVEL3) {
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

struct ChallengeAbove8_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeAbove8()
    }
}
