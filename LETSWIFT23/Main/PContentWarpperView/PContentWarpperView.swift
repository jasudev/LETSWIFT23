//
//  PContentWarpperView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import AnimateText

struct PContentWarpperView<Content: View>: View {
    
    var alignment: Alignment = .center
    var data: PModel
    var content: () -> Content
    
    @State private var currentSize: CGSize = .zero
    
    var body: some View {
        VStack(spacing: 0) {
            if data.depth == .subsection {
                PTopView(data: data)
            }
            
            ZStack(alignment: alignment) {
                Color.clear
                content()
            }
            .padding(.bottom, data.depth == .subsection ? 36 : 0)
            .clipped()
        }
        .overlay(alignment: .bottomLeading) {
            if data.depth == .subsection {
                PBottomView()
            }
        }
    }
}

struct CPContainerView_Previews: PreviewProvider {
    static var previews: some View {
        PContentWarpperView(data: PModel.dummy()) {
            Text("Content")
        }
        .modifier(PreviewModifier())
    }
}
