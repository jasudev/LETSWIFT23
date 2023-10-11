//
//  VLineShape.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/04.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct VLineShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        return path
    }
}

struct VLineShape_Previews: PreviewProvider {
    static var previews: some View {
        VLineShape()
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
            .frame(width: 1)
            .padding()
    }
}
