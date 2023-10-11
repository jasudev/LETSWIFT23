//
//  DottedRectangleModifier.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/04.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

enum ShowStatusType: CGFloat {
    case selected = 1.0
    case normal = 0.4
    case hidden = 0.0
}

struct DottedRectangleModifier: ViewModifier {
    
    let dotted: ShowStatusType
    let visible: ShowStatusType
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .opacity(visible.rawValue)
            .overlay {
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: dotted == .selected ? 2 : 1, dash: [dotted == .selected ? 3 : 2]))
                    .fill(dotted == .selected ? Color.pointYellow : color)
                    .opacity(dotted.rawValue)
            }
    }
}

extension View {
    func setDottedVisible(dotted: ShowStatusType = .selected,
                          visible: ShowStatusType = .selected,
                          color: Color = Color.primaryLevel1) -> some View {
        self.modifier(DottedRectangleModifier(dotted: dotted, visible: visible, color: color))
    }
}

struct DottedRectangleModifier_Previews: PreviewProvider {
    static var previews: some View {
        Rectangle()
            .fill(Color.clear)
            .frame(width: 300, height: 100)
            .setDottedVisible()
            .padding()
    }
}
