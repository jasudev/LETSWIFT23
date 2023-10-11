//
//  RadioBasic.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct RadioBasic: View {
    
    @Namespace var animation
    @State private var selection: Int? = 0
    @Binding var isLeft: Bool
    
    var body: some View {
        Radio(selection: $selection) {
            VStack(spacing: 0) {
                items()
            }
        } onTapReceive: { _ in
            
        }
        .foregroundColor(.level2)
        .setFont(sizeType: .description2, weight: .regular)
        .animation(ANIMATION_CONTENT_LEVEL3, value: isLeft)
    }
    
    private func items() -> some View {
        ForEach(0..<4) { index in
            HStack {
                if isLeft {
                    RadioItem(tag: index)
                        .matchedGeometryEffect(id: "radio\(index)", in: animation)
                    Spacer()
                    Text("Item \(index)")
                        .matchedGeometryEffect(id: "text\(index)", in: animation)
                        .opacity(selection == index ? 1 : 0.6)
                } else {
                    Text("Item \(index)")
                        .matchedGeometryEffect(id: "text\(index)", in: animation)
                        .opacity(selection == index ? 1 : 0.6)
                    Spacer()
                    RadioItem(tag: index)
                        .matchedGeometryEffect(id: "radio\(index)", in: animation)
                }
            }
            .padding()
            .contentShape(Rectangle())
            .radioTag(index)
        }
    }
}

struct RadioBasic_Previews: PreviewProvider {
    static var previews: some View {
        RadioBasic(isLeft: .constant(true))
    }
}
