//
//  TextRandomHighlightedEffect.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/10/06.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import AnimateText

public struct TextRandomHighlightedEffect: ATTextAnimateEffect {
    
    public var data: ATElementData
    public var userInfo: Any?
    private var highlightedTextArr = [String]()
    
    public init(_ data: ATElementData, _ userInfo: Any?) {
        self.data = data
        self.userInfo = userInfo
        if let highlightedText = userInfo as? String {
            self.highlightedTextArr = highlightedText.map { String($0) }
        }
    }

    public func body(content: Content) -> some View {
        if highlightedTextArr.contains(data.element) {
            view(content)
                .foregroundColor(Color.pointYellow)
        } else {
            view(content)
        }
    }
    
    private func view(_ content: Content) -> some View {
        content
            .modifier(ATRandomTypoAnimationCustom(data, randomTextColor: Color.primaryLevel2.opacity(0.6)))
            .offset(x: 4 * data.invValue, y: 0)
            .overlay {
                Rectangle()
                    .stroke()
                    .fill(data.invValue == 0 ? Color.clear : .primaryLevel2.opacity(0.6))
            }
            .animation(.spring(response: 0.33, dampingFraction: 0.7, blendDuration: 0.5).delay(Double(data.index) * 0.025), value: data.value)
    }
}

struct TextRandomHighlightedEffect_Previews: PreviewProvider {
    static var previews: some View {
        ATAnimateTextPreview<TextRandomHighlightedEffect>()
            .modifier(PreviewModifier())
    }
}
