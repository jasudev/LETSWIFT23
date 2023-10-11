//
//  StructureShapeView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/13.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct StructureShapeView: View {
    
    var animation: Namespace.ID
    let item: StructureData
    let fillColors = [Color(hex: 0x016EE7), Color(hex: 0x2DAE4D), Color(hex: 0x8FCA99)]
    let textColors = [Color.white, Color(hex: 0x00006D)]
    var fontType: FontSizeType {
        switch item.type {
        case .section: return .description1
        case .subsection: return .description2
        case .page: return .description3
        }
    }
    
    var textColor: Color {
        switch item.type {
        case .section: return textColors[0]
        case .subsection: return textColors[0]
        case .page: return textColors[1]
        }
    }
    
    var body: some View {
        ZStack {
            switch item.type {
            case .section:
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(fillColors[0])
                    .frame(maxWidth: 180, maxHeight: 70)
            case .subsection:
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(fillColors[1])
                    .frame(maxWidth: 110, maxHeight: 50)
            case .page:
                Circle()
                    .fill(fillColors[2])
                    .frame(maxWidth: 50, maxHeight: 50)
            }
        }
        .shadow(color: Color.black.opacity(0.3), radius: 6)
        .overlay {
            Text(item.title)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .setFont(sizeType: fontType, weight: .semibold)
                .foregroundColor(textColor)
                .padding(8)
        }
        .matchedGeometryEffect(id: item.id, in: animation)
    }
}

struct StructureShapeView_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        StructureShapeView(animation: animation, item: .dummy())
    }
}
