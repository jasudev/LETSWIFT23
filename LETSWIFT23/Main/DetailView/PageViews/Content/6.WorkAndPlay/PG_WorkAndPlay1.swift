//
//  PGWorkAndPlay1.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PGWorkAndPlay1: View {
    
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
            .pagingOnKeyboardInput(index: index, maxIndex: 8)
    }
    
    @ViewBuilder
    private func content() -> some View {
        if indexValue == 0 {
            fabulaImage()
        }
        
        if indexValue >= 1 {
            VStack(alignment: .leading) {
                HStack {
                    if indexValue >= 2 {
                        description()
                    }
                    fabulaImage()
                }
                if indexValue >= 3 {
                    HStack {
                        why()
                        Spacer()
                    }
                    .padding(.bottom, 60)
                    
                }
            }
            .transition(.asymmetric(insertion: .scale.combined(with: .opacity), removal: .opacity))
        }
    }
    
    private func why() -> some View {
        NumberedFocusableTextView(index: index, startIndex: 4, titles: [
            "SwiftUI의 기술적 한계는 어디까지일까?",
            "어떻게 하면 러닝 커브를 최소화 할 수 있을까?",
            "생산성 측면에서 기존 방식보다 효율이 정말 좋을까?",
            "기존의 라이브러리 및 컴포넌트를 모두 SwiftUI로 대체 가능할까?",
            "멀티 플랫폼의 기술적 한계와 범위는 어디까지일까?"
        ])
        .fixedSize(horizontal: false, vertical: true)
        .frame(height: store.contentSize.height * 0.3)
        .roundedTitleLine("시작하게 된 동기")
    }
    
    private func description() -> some View {
        HStack(spacing: 16) {
            Image("FabulaIcon")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            Text("SwiftUI 개발자들이 본인의 작품을 PR(Pull Request)하고 앱을 통해서 사용자와 소통할 수 있는 놀이터")
                .setFont(sizeType: .description1, weight: .regular)
                .foregroundColor(.level2)
        }
        .padding(.top, 16)
        .roundedTitleLine("Fabula 프로젝트", showLine: indexValue <= 2)
    }
    
    private func fabulaImage() -> some View {
        Image(indexValue >= 1 ? "FabulaScreen" : "FabulaAppstore")
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

struct PGWorkAndPlay1_Previews: PreviewProvider {
    static var previews: some View {
        PGWorkAndPlay1()
            .modifier(PreviewModifier())
    }
}
