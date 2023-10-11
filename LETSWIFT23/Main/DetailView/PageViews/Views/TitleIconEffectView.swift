//
//  TitleIconEffectView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct TitleIconEffectView: View {
    
    @State private var titleAni1: Bool = false
    @State private var titleAni2: Bool = false
    
    let imageName: String
    let logoPosGapY: CGFloat = 30
    
    var body: some View {
        ZStack {
            ImageEffectView(imageName: imageName, duration: 3)
                .opacity(0.2)
                .offset(y: titleAni1 ? -logoPosGapY : logoPosGapY)
            ImageEffectView(imageName: imageName, duration: 5)
                .opacity(0.2)
                .offset(y: 40 + (titleAni2 ? -logoPosGapY : logoPosGapY))
        }
        .onAppear {
            startAnimation()
        }
    }
    
    func startAnimation() {
        withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
            titleAni1 = true
        }
        withAnimation(.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
            titleAni2 = true
        }
    }
}

struct TitleIconEffectView_Previews: PreviewProvider {
    static var previews: some View {
        TitleIconEffectView(imageName: "N")
    }
}
