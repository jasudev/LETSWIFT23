//
//  AniExampleTransition.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/06.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct AniExampleTransition: View {
    
    @State private var isVisible: Bool = false
    
    var body: some View {
        VStack(spacing: 90) {
            ZStack {
                if isVisible {
                    Image("SwiftUI")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .transition(.scale.combined(with: .opacity))
                }
            }.frame(height: 100)
            
            Button("Press here") {
                isVisible.toggle()
            }
        }
        .animation(.easeInOut(duration: 0.5), value: isVisible)
    }
}

struct AniExampleTransition_Previews: PreviewProvider {
    static var previews: some View {
        AniExampleTransition()
    }
}
