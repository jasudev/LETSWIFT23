//
//  HSpaceLineView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/04.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct HSpaceLineView: View {
    
    let height: CGFloat
    var showLeftArrow: Bool = true
    var showRightArrow: Bool = true
    var lineWidth: CGFloat = 1.0
    var dash: [CGFloat] = [2.0]
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                HLineShape()
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, dash: dash))
                    .frame(width: geo.size.width - geo.size.height * 2, height: 1)
                HStack {
                    if showLeftArrow {
                        TriangleShape()
                            .frame(width: geo.size.height * 0.8)
                            .offset(y: -0.5)
                    }
                    Spacer()
                    if showRightArrow {
                        TriangleShape()
                            .frame(width: geo.size.height * 0.8)
                            .rotationEffect(.degrees(180))
                            .offset(y: -0.5)
                    }
                }
            }
        }
        .frame(height: height)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct HSpaceLineView_Previews: PreviewProvider {
    static var previews: some View {
        HSpaceLineView(height: 10)
            .frame(width: 400)
            .padding()
    }
}
