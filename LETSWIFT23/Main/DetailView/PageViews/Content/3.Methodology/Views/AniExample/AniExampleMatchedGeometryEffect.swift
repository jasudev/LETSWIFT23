//
//  AniExampleMatchedGeometryEffect.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/06.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct AniExampleMatchedGeometryEffect: View {
    @Namespace var animation
    @State private var isPositionChanged: Bool = false
    var body: some View {
        VStack(spacing: 90) {
            HStack {
                if isPositionChanged {
                    Spacer()
                    Rectangle().fill(Color.red).frame(width: 100, height: 100)
                        .matchedGeometryEffect(id: "shape", in: animation)
                } else {
                    Circle().fill(Color.blue).frame(width: 100, height: 100)
                        .matchedGeometryEffect(id: "shape", in: animation)
                    Spacer()
                }
            }
            Button("Press here") {
                isPositionChanged.toggle()
            }
        }
        .animation(.easeInOut(duration: 0.5), value: isPositionChanged)
    }
}

struct AniExampleMatchedGeometryEffect_Previews: PreviewProvider {
    static var previews: some View {
        AniExampleMatchedGeometryEffect()
    }
}
