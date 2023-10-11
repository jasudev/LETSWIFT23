//
//  PageIndicatorView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PageIndicatorView: View {
    
    @Namespace var animation
    
    @Binding var index: Int
    let maxIndex: Int
    
    var body: some View {
        if maxIndex != 0 {
            ZStack(alignment: .trailing) {
                HStack(spacing: 0) {
                    ForEach(0...maxIndex, id: \.self) { index in
                        ZStack {
                            if index == self.index {
                                Text("●")
                                    .matchedGeometryEffect(id: "selected", in: animation)
                                    .foregroundColor(Color.primaryLevel1)
                                    .opacity(1.0)
                            } else {
                                Text("○")
                                    .foregroundColor(Color.level3)
                                    .opacity(0.6)
                                    .transition(.scale.combined(with: .opacity))
                                    .onTapGesture {
                                        self.index = index
                                    }
                            }
                        }
                        .font(Font.system(size: 16, weight: .ultraLight))
                        .frame(width: 26, height: 26)
                    }
                }
            }
            .fixedSize()
        } else {
            EmptyView()
        }
    }
}

struct PageIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        PageIndicatorView(index: .constant(1), maxIndex: 2)
            .modifier(PreviewModifier())
    }
}
