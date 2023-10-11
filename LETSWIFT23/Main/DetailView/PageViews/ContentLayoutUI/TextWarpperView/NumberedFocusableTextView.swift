//
//  NumberedFocusableTextView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct NumberedFocusableTextView: View {
    
    @Binding var index: Int
    let startIndex: Int
    let titles: [String]
    var select: FontSizeType = .subtitle
    var normal: FontSizeType = .description1
    var prefix: String?
    var spacing: CGFloat = 8
    let vPadding: CGFloat = 7
    var normalColor: Color {
        return index < startIndex ? .level2 : .level4
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            ForEach(Array(titles.enumerated()), id: \.offset) { index, text in
                HStack(alignment: .top, spacing: 5) {
                    Group {
                        if let prefix = prefix {
                            Text("\(prefix) ")
                        } else {
                            Text("\(index + 1).")
                        }
                    }
                    
                    Text(text)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding(.vertical, isSelected(index) ? vPadding : 0)
                .setFont(sizeType: isSelected(index) ? select : normal, weight: .regular)
                .foregroundColor(isSelected(index) ? .pointYellow : normalColor)
                .id(index)
            }
        }
        .transition(.opacity)
    }
    
    private func isSelected(_ index: Int) -> Bool {
        let currentIndex = index + startIndex
        return currentIndex == self.index
    }
}

struct NumberedFocusableTextView_Previews: PreviewProvider {
    static var previews: some View {
        NumberedFocusableTextView(index: .constant(3), startIndex: 2, titles: [
            "스티브 잡스 애플에서 사임, NeXT Computer 설립",
            "Objective-C 언어 Apple 역사에 합류, 잡스 복귀",
            "NeXTSTEP 운영체제 2001년 출시된 Mac OS X의 기반",
            "2007년에 iPhone, 2008년 iPhone SDK 발표",
            "UIKit을 기반으로 하는 Swift 언어 2014년 발표",
            "UIKit & AppKit을 기반으로 하는 SwiftUI WWDC19에서 발표"
        ])
        .frame(height: 800)
        .padding()
    }
}
