//
//  FrameModifier.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct FrameModifier: ViewModifier {
    
    @Binding var rect: CGRect
    
    init(_ rect: Binding<CGRect>) {
        _rect = rect
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geo in
                    Color.clear
                        .disabled(true)
                        .preference(key: FramePreferenceKey.self, value: geo.frame(in: .global))
                }
            )
            .onPreferenceChange(FramePreferenceKey.self) { preference in
                DispatchQueue.main.async {
                    self.rect = preference
                }
            }
    }
}

struct FramePreferenceKey: PreferenceKey {
    typealias Value = CGRect
    static var defaultValue: Value = .zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

extension View {
    public func takeFrame(_ rect: Binding<CGRect>) -> some View {
        self.modifier(FrameModifier(rect))
    }
    
    public func takeFrame(onChange: @escaping (CGRect) -> Void) -> some View {
        overlay(
            GeometryReader { geo in
                Color.clear
                    .disabled(true)
                    .preference(key: FramePreferenceKey.self, value: geo.frame(in: .global))
            }
        )
        .onPreferenceChange(FramePreferenceKey.self) { preference in
            DispatchQueue.main.async {
                onChange(preference)
            }
        }
    }
}
