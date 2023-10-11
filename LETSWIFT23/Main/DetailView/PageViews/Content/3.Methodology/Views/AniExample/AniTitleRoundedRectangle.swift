//
//  AniTitleRoundedRectangle.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/08.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct AniTitleRoundedRectangle<Content: View>: View {
    
    let title: String
    let textColor: Color
    let fillColor: Color
    let animation: Namespace.ID
    var content: (() -> Content)?
    
    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .setFont(sizeType: .description1, weight: .semibold)
                .foregroundColor(textColor)
                .frame(height: 90)
                .frame(maxWidth: .infinity)
                .matchedGeometryEffect(id: "title\(title)", in: animation)
            content?()
                .padding([.horizontal, .bottom], 16)
        }
        .background {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(fillColor)
                .matchedGeometryEffect(id: "background\(title)", in: animation)
        }
    }
}

extension AniTitleRoundedRectangle where Content == EmptyView {
    init(title: String,
         textColor: Color,
         fillColor: Color,
         animation: Namespace.ID) {
        self.title = title
        self.textColor = textColor
        self.fillColor = fillColor
        self.animation = animation
    }
}

extension AniTitleRoundedRectangle where Content: View {
    init(title: String,
         textColor: Color,
         fillColor: Color,
         animation: Namespace.ID,
         @ViewBuilder _ content: @escaping () -> Content) {
        self.title = title
        self.textColor = textColor
        self.fillColor = fillColor
        self.animation = animation
        self.content = content
    }
}

struct AniTitleRoundedRectangle_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        AniTitleRoundedRectangle(title: "타이틀", textColor: .blue, fillColor: .red, animation: animation) {
            Rectangle()
        }
    }
}
