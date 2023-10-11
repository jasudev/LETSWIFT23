//
//  FoldedShape.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/30.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct FoldedShape: InsettableShape {
    
    var foldedSize: CGFloat = 30
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.size.width, y: 0))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height - foldedSize))
        path.addLine(to: CGPoint(x: rect.size.width - foldedSize, y: rect.size.height))
        path.addLine(to: CGPoint(x: 0, y: rect.size.height))
        path.closeSubpath()
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var rectangle = self
        rectangle.foldedSize += amount
        return rectangle
    }
}

struct FoldedShape_Previews: PreviewProvider {
    static var previews: some View {
        FoldedShape()
            .frame(width: 250, height: 300)
    }
}
