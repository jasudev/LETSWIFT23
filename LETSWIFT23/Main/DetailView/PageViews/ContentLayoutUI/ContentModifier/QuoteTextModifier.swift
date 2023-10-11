//
//  QuoteTextModifier.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct QuoteTextModifier: ViewModifier {
    
    let height: CGFloat = 50
    let color = Color.primaryLevel4
    func body(content: Content) -> some View {
        content
            .padding(30)
            .roundedLine(showLine: true, color: Color.primaryLevel4, lineWidth: 2, isDot: true)
            .overlay(alignment: .topLeading) {
                Image("QuoteLeft")
                    .resizable()
                    .scaledToFit()
                    .frame(height: height)
                    .foregroundColor(color)
                    .offset(x: -height / 3, y: -height / 1.8)
            }
            .overlay(alignment: .bottomTrailing) {
                Image("QuoteRight")
                    .resizable()
                    .scaledToFit()
                    .frame(height: height)
                    .foregroundColor(color)
                    .offset(x: height / 3, y: height / 1.8)
            }
    }
}

struct QuoteTextModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("한글을 입력합니다.")
            .setFont(sizeType: .description1, weight: .semibold)
            .modifier(QuoteTextModifier())
            .padding()
    }
}
