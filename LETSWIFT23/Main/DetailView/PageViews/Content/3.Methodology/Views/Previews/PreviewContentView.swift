//
//  PreviewContentView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/02.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PreviewContentView: View {
    
    @EnvironmentObject private var store: PContentStore
    @Binding var index: Int
    
    var body: some View {
        HStack {
            hPadding()
            
            if index >= 1 && index < 5 {
                VNumberedFocusableTextView(index: $index, startIndex: 2, items: [
                    TitleSetData(title: "1. 부모 뷰가 크기 제안", subtitle: "부모 뷰는 자식 뷰에게 크기를 제안합니다."),
                    TitleSetData(title: "2. 자식 뷰는 크기를 선택", subtitle: "부모 뷰의 크기를 바탕으로 자식 뷰는 자신의 사이즈를 선택하고\n부모 뷰는 그 선택을 존중합니다."),
                    TitleSetData(title: "3. 좌표 공간에 자식 뷰를 배치", subtitle: "부모 뷰는 자식 뷰를 자신의 좌표 공간에 배치합니다.")
                ], showNumber: false)
                .padding(.top, 20)
                .roundedTitleLine("View 레이아웃 기본 규칙", showLine: index <= 1)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            if index >= 5 {
                PreviewCodeView(index: $index, startIndex: 5)
                    .roundedLine(padding: 0)
                    .padding(16)
            }
            
            PreviewCanvasView(index: $index, startIndex: 2)
                .frame(width: store.contentSize.width * 0.32, alignment: .center)
            
            hPadding()
        }
    }
    
    @ViewBuilder
    private func hPadding() -> some View {
        if index < 5 {
            Spacer()
                .frame(width: store.contentSize.width * 0.05)
        } else {
            EmptyView()
        }
    }
}

struct PreviewContentView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewContentView(index: .constant(0))
            .modifier(PreviewModifier())
    }
}
