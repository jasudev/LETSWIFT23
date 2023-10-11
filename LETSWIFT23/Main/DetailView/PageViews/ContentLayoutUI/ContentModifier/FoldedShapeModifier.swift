//
//  FoldedShapeModifier.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/30.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct FoldedShapeModifier: ViewModifier {
    
    let padding: CGFloat
    let color: Color
    let outlineColor: Color
    var lineWidth: CGFloat = 2
    
    func body(content: Content) -> some View {
        content
            .padding(padding)
            .background {
                ZStack {
                    FoldedShape()
                        .fill(color)
                    FoldedShape()
                        .stroke(lineWidth: lineWidth)
                        .fill(outlineColor)
                }
            }
    }
}

extension View {
    func foldedShape(padding: CGFloat = 36,
                     color: Color = Color.primaryLevel5,
                     outlineColor: Color = Color.black,
                     lineWidth: CGFloat = 2) -> some View {
        modifier(FoldedShapeModifier(padding: padding, color: color, outlineColor: outlineColor, lineWidth: lineWidth))
    }
}

struct FoldedShapeModifier_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Text("Hello\nWorld!")
                .multilineTextAlignment(.center)
                .foldedShape(color: Color.primaryLevel5)
            Text("Hello\nWorld!")
                .foldedShape(color: Color.primaryLevel6)
        }
    }
}
