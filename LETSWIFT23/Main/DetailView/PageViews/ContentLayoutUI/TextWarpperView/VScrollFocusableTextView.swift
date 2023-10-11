//
//  VScrollFocusableTextView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/03.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct VScrollFocusableTextView: View {
    
    @Binding var index: Int
    
    let startIndex: Int
    var selectColor: Color = Color.white
    var normalColor: Color = Color.primaryLevel2
    var shouldAnimate: Bool = true
    let items: [TitleSetData]
    
    var body: some View {
        ScrollViewReader { scroll in
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: 8) {
                    ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                        ScrollTextRowView(title: item.title, subtitle: item.subtitle)
                            .id(index)
                            .foregroundColor(isSelected(index) ? selectColor : normalColor)
                            .opacity(isSelected(index) ? 1 : 0.5)
                            .roundedLine(showLine: isSelected(index), padding: 16, lineWidth: 2)
                    }
                }
                .padding(20)
                .opacity(index >= startIndex ? 1 : 0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .onChange(of: index) { newValue in
                DispatchQueue.main.async {
                    let id = newValue - startIndex
                    if shouldAnimate {
                        withAnimation(.default) {
                            scroll.scrollTo(id, anchor: .center)
                        }
                    } else {
                        scroll.scrollTo(id, anchor: .center)
                    }
                }
            }
        }
    }
    
    private func isSelected(_ index: Int) -> Bool {
        return (index + startIndex) == self.index
    }
}

struct ScrollTextRowView: View {
    
    let title: String?
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            if let title = title {
                Text(title)
                    .setFont(sizeType: .description3, weight: .semibold)
                    .foregroundColor(Color.pointYellow)
            }
            Text(subtitle)
        }
    }
}

struct VScrollFocusableTextView_Previews: PreviewProvider {
    static var previews: some View {
        VScrollFocusableTextView(index: .constant(0), startIndex: 0, items: [
            TitleSetData(title: "유연한 연결", subtitle: "SwiftUI를 사용하면 모든 애플 기기에서 사용할 수 있는 인터페이스 개발 가능"),
            TitleSetData(title: "통합되는 생태계", subtitle: "Apple 생태계에서 한없이 부드럽고 유연한 연결")])
    }
}
