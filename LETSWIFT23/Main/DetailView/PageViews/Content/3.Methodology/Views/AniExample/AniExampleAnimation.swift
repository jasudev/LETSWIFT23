//
//  AniExampleAnimation.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/06.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct AniExampleAnimation: View {
    
    @State private var angle = 0.0
    
    var body: some View {
        VStack(spacing: 90) {
            Image("SwiftUI")
                .resizable()
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(angle))
            
            Button("Press here") {
                angle += 45
            }
        }
        .animation(.easeInOut(duration: 0.5), value: angle)
    }
}

struct AniExampleAnimation_Previews: PreviewProvider {
    static var previews: some View {
        AniExampleAnimation()
    }
}
