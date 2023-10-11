//
//  PGWorkAndPlay2.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import FabulaItemsProvider

struct PGWorkAndPlay2: View {
    
    @Namespace var animation
    
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    
    @State private var item: ItemData?
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .pagingOnKeyboardInput(index: index, maxIndex: 5)
    }
    
    @ViewBuilder
    private func content() -> some View {
        HStack {
            FabulaListView(selectedItem: $item)
            FabulaDetailView(item: $item)
                .transition(.move(edge: .trailing).combined(with: .opacity))
            
            if indexValue >= 1 && item == nil {
                VStack(alignment: .leading) {
                    Spacer()
                    NumberedFocusableTextView(index: index, startIndex: 2, titles: [
                        "다양한 결과물로 학습",
                        "SwiftUI의 메카니즘 이해",
                        "프로젝트를 시작할 때의 궁금증을 많은 부분을 해소",
                        "선언형 프로그래밍과 구조 설계 방법에 대한 개념 정리"
                    ])
                    .titleDivider(title: "Fabula 프로젝트를 통해 얻은 것", lineWidth: 2, imageName: "FabulaIcon")
                    .roundedLine(lineWidth: 2)
                    Spacer()
                }
                .padding(.leading, 30)
                .transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
        .onChange(of: indexValue) { newValue in
            if newValue >= 1 {
                item = nil
            }
        }
        .animation(ANIMATION_CONTENT_LEVEL3, value: item?.id)
    }
}

struct PGWorkAndPlay2_Previews: PreviewProvider {
    static var previews: some View {
        PGWorkAndPlay2()
            .modifier(PreviewModifier())
    }
}
