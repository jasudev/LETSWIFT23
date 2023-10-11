//
//  PTopView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/24.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import AnimateText

struct PTopView: View {
    
    let data: PModel
    
    private let logoPosGapX: CGFloat = 6
    @State private var text: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(data.parent?.title ?? "")
                    .setFont(sizeType: .caption1, weight: .regular)
                    .foregroundColor(.primaryLevel3)
                Spacer()
                if data.depth == .subsection {
                    PNavigationTitleView()
                }
            }
            .frame(height: 30)
            .padding(.top, 5)
            HStack(alignment: .bottom) {
                AnimateText<TextRandomHighlightedEffect>($text, type: .letters)
                    .setFont(sizeType: .description2, weight: .semibold)
                Spacer()
            }
            .foregroundColor(.level1)
            .frame(height: 46)
            .onAppear {
                DispatchQueue.main.async {
                    text = data.title
                }
            }
            .id(UUID())
        }
        .padding(.vertical, 10)
        .padding(.horizontal, PADDING_HORIZONTAL)
        .background {
            Color.primaryLevel5
        }
    }
}

struct PTopView_Previews: PreviewProvider {
    static var previews: some View {
        PTopView(data: .dummy())
    }
}
