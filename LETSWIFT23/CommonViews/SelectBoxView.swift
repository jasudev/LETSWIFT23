//
//  SelectBoxView.swift
//  LETSWIFT23
//
//  Created by jasu on 10/01/23.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct SelectBoxView: View {
    
    @Binding var rect: CGRect
    @State private var dashPhase: CGFloat = 0.0
    
    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .blendMode(.saturation)
            .blendMode(.screen)
            .overlay {
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: 4))
                    .fill(Color.black)
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [6, 6], dashPhase: dashPhase))
                    .fill(Color.white)
            }
            .offset(x: rect.origin.x, y: rect.origin.y)
            .frame(width: rect.size.width, height: rect.size.height)
            .onAppear {
                withAnimation(Animation.linear(duration: 0.8).repeatForever(autoreverses: false)) {
                    dashPhase -= 24
                }
            }
    }
}

struct SelectBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .topLeading) {
            Image("Radio")
                .resizable()
                .scaledToFit()
            SelectBoxView(rect: .constant(CGRect(x: 0, y: 0, width: 300, height: 500)))
        }
    }
}
