//
//  ImageEffectView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct ImageEffectView: View {
    
    @Namespace var animation
    @State private var ani: Bool = false
    
    let imageName: String
    let duration: CGFloat
    var baseOpacity: CGFloat = 0.1
    
    var body: some View {
        imageView()
            .opacity(baseOpacity)
            .overlay(
                imageView()
                    .mask {
                        ZStack {
                            if ani {
                                LinearGradient(colors: [Color.black, Color.clear, Color.clear], startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .matchedGeometryEffect(id: "mask", in: animation)
                            } else {
                                LinearGradient(colors: [Color.clear, Color.clear, Color.black], startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .matchedGeometryEffect(id: "mask", in: animation)
                            }
                        }
                    }
            )
            .onAppear {
                startAnimation()
            }
    }
    
    func startAnimation() {
        withAnimation(.easeInOut(duration: duration).repeatForever(autoreverses: true)) {
            ani.toggle()
        }
    }
    
    private func imageView() -> some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
    }
}

struct ImageEffectView_Previews: PreviewProvider {
    static var previews: some View {
        ImageEffectView(imageName: "N", duration: 3)
    }
}
