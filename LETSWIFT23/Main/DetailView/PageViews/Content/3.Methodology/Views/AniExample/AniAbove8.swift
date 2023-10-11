//
//  AniAbove8.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/06.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct AniAbove8: View {
    
    let indexValue: Int
    @Namespace var animation
    @EnvironmentObject private var store: PContentStore
    
    var localIndex: Int {
        min(indexValue - 8, 3)
    }
    
    var body: some View {
        codeImageView()
            .overlay(alignment: .topTrailing) {
                ZStack {
                    Rectangle()
                        .fill(Color.background)
                    ZStack {
                        switch localIndex {
                        case 0: AniExampleWithAnimation()
                        case 1: AniExampleAnimation()
                        case 2: AniExampleTransition()
                        default: AniExampleMatchedGeometryEffect()
                        }
                    }
                    .padding(16)
                }
                .frame(width: 360, height: 360)
                .roundedLine(padding: 0, color: Color.primaryLevel5)
                .padding(36)
            }
            .padding(16)
    }
    
    @ViewBuilder
    private func codeImageView() -> some View {
        let imageName = "Animation\(localIndex + 1)"
        ZStack(alignment: .topLeading) {
            Color.codeBackground
            if !imageName.isEmpty {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: store.contentSize.height * 0.8)
                    .frame(height: store.contentSize.height * 0.6, alignment: .topLeading)
                    .padding(.top, 36)
            } else {
                EmptyView()
            }
        }
        .roundedTitleLine(title(localIndex), padding: 0)
    }
    
    private func title(_ idx: Int) -> String {
        var title: String = ""
        switch idx {
        case 0: title = "Explicit(명시적) 애니메이션"
        case 1: title = "Implicit(암시적) 애니메이션"
        case 2: title = "Auxiliary(보조효과) - transition"
        case 3: title = "Auxiliary(보조효과) - matchedGeometryEffect"
        default: title = ""
        }
        return title
    }
}

struct AniAbove8_Previews: PreviewProvider {
    static var previews: some View {
        AniAbove8(indexValue: 8)
    }
}
