//
//  FontViewModifier.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

enum FontSizeType: CGFloat {
    case title = 70
    case subtitle = 50
    case subtitle2 = 40
    case description1 = 36
    case description2 = 28
    case description3 = 24
    case caption1 = 20
    case caption2 = 18
    case caption3 = 16
}

struct FontViewModifier: ViewModifier {
    
    let sizeType: FontSizeType
    let weight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: sizeType.rawValue, weight: weight))
            .lineSpacing(5)
            .offset(y: -2)
    }
}

extension View {
    func setFont(sizeType: FontSizeType, weight: Font.Weight) -> some View {
        return self.modifier(FontViewModifier(sizeType: sizeType, weight: weight))
    }
}

struct FontViewModifier_Previews: PreviewProvider {
    static let text: String = "Q&A / 현재와 미래를 엿보다"
    static var previews: some View {
        VStack {
            Text(text)
                .setFont(sizeType: .title, weight: .bold)
            Text(text)
                .setFont(sizeType: .title, weight: .semibold)
            Text(text)
                .setFont(sizeType: .title, weight: .regular)
        }
        .modifier(PreviewModifier())
    }
}
