//
//  TextHangHighlightedEffect.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/10/06.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import AnimateText

public struct TextHangHighlightedEffect: ATTextAnimateEffect {

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
            .opacity(data.value)
            .animation(.easeIn.delay(Double(data.index) * 0.2), value: data.value)
            .rotation3DEffect(Angle(degrees: 180 * data.invValue), axis: (x: 0, y: 1, z: 1), anchor: .top)
            .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.8).delay(Double(data.index) * 0.10), value: data.value)
    }
}

struct ATHangEffect_Previews: PreviewProvider {
    static var previews: some View {
        ATAnimateTextPreview<ATHangEffect>()
    }
}
