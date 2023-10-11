//
//  ATRandomTypoAnimationCustom.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import AnimateText

public struct ATRandomTypoAnimationCustom: ATTextAnimatable {
    
    private var length: Int
    private var base: String
    
    public var data: ATElementData
    public var randomTextColor: Color
    public var animatableData: Double {
        get { data.value }
        set {
            data.value = newValue
        }
    }
    
    /// initialize `ATRandomTypoAnimation`
    ///
    /// - Parameters:
    ///   - data: Informational data required for each element animation.
    ///   - length: Maximum number of characters to be displayed at random.
    ///   - base: Characters to be displayed at random.
    ///
    public init(_ data: ATElementData, randomTextColor: Color, length: Int = 2, base: String? = nil) {
        self.data = data
        self.randomTextColor = randomTextColor
        self.length = data.element.count + length
        self.base = base ?? "!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~개발언어의히스토리개념및관계명령형방식과선언형방식대폭개선된설계개발워크플로우단점프로젝트를통한학습워크플로우프로젝트를통해얻은것컴포넌트설계효율적인개발구조디자인시스템을활용한통합되는생태계모바일을넘어끝없는추구" + "------------------------------------------------------------------------------------------------------------------------"
    }
    
    public func body(content: Content) -> some View {
        narrowerText(data.value)
            .fixedSize()
    }
    
    /// A method of randomly processing text with animation.
    ///
    /// - Parameters:
    ///   - value: A value used in animation, between 0 and 1.
    ///
    private func narrowerText(_ value: Double) -> some View {
        let firstText = value >= 0.5 ? Text(data.element) : Text("")
        let random = randomText(Int((1.0 - value) * Double(CGFloat(length) * 0.70)))
        return firstText + Text(random).foregroundColor(randomTextColor)
    }
    
    /// A method that randomly returns text.
    ///
    /// - Parameters:
    ///   - length: The number of letters to be returned randomly. The default value is 2
    ///
    private func randomText(_ length: Int = 2) -> String {
        var newValue: String = ""
        for _ in 0..<length {
            let random = Int.random(in: 0..<base.count)
            newValue += "\(base[base.index(base.startIndex, offsetBy: random)])"
        }
        return newValue
    }
}
