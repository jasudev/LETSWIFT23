//
//  RoundedLineModifier.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct RoundedLineModifier: ViewModifier {
    
    let showLine: Bool
    let padding: CGFloat
    let color: Color
    let lineWidth: CGFloat
    var isDot: Bool = false
    
    func body(content: Content) -> some View {
        content
            .padding(padding)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, dash: isDot ? [5] : []))
                    .fill(showLine ? color : .clear)
            }
            .padding(lineWidth / 2)
    }
}

extension View {
    func roundedLine(showLine: Bool = true, padding: CGFloat = 36, color: Color = Color.primaryLevel5, lineWidth: CGFloat = 2, isDot: Bool = false) -> some View {
        modifier(RoundedLineModifier(showLine: showLine, padding: padding, color: color, lineWidth: lineWidth, isDot: isDot))
    }
}

struct RoundedLineModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello\nWorld!")
            .roundedLine()
            .padding()
    }
}
