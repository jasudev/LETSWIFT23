//
//  RoundedTitleLineModifier.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct RoundedTitleLineModifier: ViewModifier {
    
    let title: String
    let showLine: Bool
    let padding: CGFloat
    let color: Color
    let lineWidth: CGFloat
    
    func body(content: Content) -> some View {
        ZStack(alignment: .topLeading) {
            content
                .roundedLine(showLine: showLine, padding: showLine ? padding : 36, color: color)
                .padding(.leading, showLine ? 0 : -36)
            Text(title)
                .foregroundColor(Color.level2)
                .setFont(sizeType: .description1, weight: .semibold)
                .padding(7)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                        .fill(color)
                )
                .padding(.leading, showLine ? 24 : 0)
                .offset(y: -23)
        }
    }
}

extension View {
    func roundedTitleLine(_ title: String, showLine: Bool = true, padding: CGFloat = 36, color: Color = Color.primaryLevel5, lineWidth: CGFloat = 1) -> some View {
        modifier(RoundedTitleLineModifier(title: title, showLine: showLine, padding: padding, color: color, lineWidth: lineWidth))
    }
}

struct RoundedTitleLineModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("한글을 입력합니다.")
            .lineLimit(nil)
            .roundedTitleLine("한글", showLine: true)
            .padding()
    }
}
