//
//  VSpaceLineView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/04.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct VSpaceLineView: View {
    
    let width: CGFloat
    var lineWidth: CGFloat = 1.0
    var showTopArrow: Bool = true
    var showBottomArrow: Bool = true
    var dash: [CGFloat] = [2.0]
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VLineShape()
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, dash: dash))
                    .frame(width: 1, height: geo.size.height - geo.size.width * 2)
                VStack {
                    if showTopArrow {
                        TriangleShape()
                            .frame(width: geo.size.width * 0.8, height: geo.size.width * 0.8)
                            .rotationEffect(.degrees(90))
                            .offset(x: -0.5)
                    }
                    Spacer()
                    if showBottomArrow {
                        TriangleShape()
                            .frame(width: geo.size.width * 0.8, height: geo.size.width * 0.8)
                            .rotationEffect(.degrees(-90))
                            .offset(y: -0.5)
                    }
                }
            }
        }
        .frame(width: width)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct VSpaceLineView_Previews: PreviewProvider {
    static var previews: some View {
        VSpaceLineView(width: 10)
            .frame(height: 400)
            .padding()
    }
}
