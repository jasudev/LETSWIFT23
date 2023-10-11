//
//  VNumberedFocusableTextView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct VNumberedFocusableTextView: View {
    
    @Binding var index: Int
    
    let startIndex: Int
    let items: [TitleSetData]
    var spacing: CGFloat = 36
    var showNumber: Bool = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                VNumberedTextRowView(index: index, data: item, isSelected: isSelected(index), showNumber: showNumber)
                
            }
        }
        .transition(.opacity)
        .animation(ANIMATION_CONTENT_LEVEL3, value: index)
    }
    
    private func isSelected(_ index: Int) -> Bool {
        return (index + startIndex) == self.index
    }
}

struct VNumberedTextRowView: View {
    
    let index: Int
    let data: TitleSetData
    let isSelected: Bool
    let showNumber: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if showNumber {
                Text("0\(index + 1).")
                    .lineLimit(1)
                    .setFont(sizeType: .title, weight: .semibold)
                    .foregroundColor(.primaryLevel1)
                    .padding(.bottom, 6)
            }
            VStack(alignment: .leading, spacing: 6) {
                if let title = data.title {
                    Text(title)
                        .lineLimit(1)
                        .setFont(sizeType: .description1, weight: .bold)
                        .foregroundColor(isSelected ? .pointYellow : .primaryLevel2)
                }
                Text(data.subtitle)
                    .lineLimit(nil)
                    .setFont(sizeType: .description2, weight: .regular)
                    .foregroundColor(isSelected ? .level2 : .level3)
                    .multilineTextAlignment(.leading)
            }
            .roundedLine(showLine: isSelected, padding: isSelected ? 26 : 0)
        }
    }
}

struct VNumberedFocusableTextView_Previews: PreviewProvider {
    static var previews: some View {
        VNumberedFocusableTextView(index: .constant(0), startIndex: 0, items: [
            TitleSetData(title: "유연한 연결", subtitle: "SwiftUI를 사용하면 모든 애플 기기에서 사용할 수 있는 인터페이스 개발 가능"),
            TitleSetData(title: "통합되는 생태계", subtitle: "Apple 생태계에서 한없이 부드럽고 유연한 연결")
        ])
        .frame(height: 800)
        .padding()
    }
}
