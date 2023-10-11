//
//  HLineShape.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/04.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct HLineShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct HLineShape_Previews: PreviewProvider {
    static var previews: some View {
        HLineShape()
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
            .frame(height: 1)
            .padding()
    }
}
