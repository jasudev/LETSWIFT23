//
//  Drag3DModifier.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/08.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct Drag3DModifier: ViewModifier {
    
    @State private var dragAmount = CGSize.zero
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                withAnimation(.easeOut(duration: 0.12)) {
                    dragAmount = value.translation
                }
            }
            .onEnded { _ in
                withAnimation(.spring()) {
                    dragAmount = .zero
                }
            }
    }
    
    func body(content: Content) -> some View {
        content
            .rotation3DEffect(.degrees(-Double(dragAmount.width) / 8), axis: (x: 0, y: 1, z: 0))
            .rotation3DEffect(.degrees(Double(dragAmount.height / 8)), axis: (x: 1, y: 0, z: 0))
            .offset(dragAmount)
            .gesture(drag)
    }
}

struct Drag3DModifier_Previews: PreviewProvider {
    static var previews: some View {
        Rectangle()
            .size(width: 500, height: 500)
            .modifier(Drag3DModifier())
    }
}
