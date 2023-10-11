//
//  PGMethodology3.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/29.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PGMethodology3: View {
    
    @Namespace var animation
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    
    @State private var fileName: String = ""
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .pagingOnKeyboardInput(index: index, maxIndex: 5)
    }
    
    @ViewBuilder
    private func content() -> some View {
        ZStack {
            HStack {
                if indexValue >= 2 {
                    HStack {
                        if indexValue != 5 {
                            VStack(alignment: .leading) {
                                NumberedFocusableTextView(index: index, startIndex: 3, titles: [
                                    "데이터 객체를 상위 뷰에 설정",
                                    "래퍼 속성을 선언하는 것만으로 하위 뷰에서 데이터를 참조 가능"
                                ], select: .subtitle2)
                                .padding(.vertical, 20)
                                .frame(maxHeight: store.contentSize.height * 0.2)
                                
                                GeometryReader { geo in
                                    ZStack {
                                        if indexValue >= 3 && indexValue < 5 {
                                            CodeView(fileName: $fileName, topGap: 0, fontSize: 24)
                                        }
                                        if indexValue == 2 {
                                            Image("Swiftdata")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(maxWidth: geo.size.width)
                                        }
                                    }
                                }
                                .roundedLine(padding: 0)
                                .padding(.vertical, 30)
                                .transition(.opacity)
                            }
                        } else {
                            Spacer()
                            Text("디자인에 종속적이지 않은 컴포넌트 구조 설계 가능")
                                .setFont(sizeType: .subtitle2, weight: .semibold)
                                .foregroundColor(Color.pointYellow)
                                .roundedLine()
                                .transition(.scale)
                        }
                        Spacer()
                    }
                    .frame(width: store.contentSize.width * 0.55)
                }
                
                if indexValue >= 1 {
                    EnvironmentObjectView(index: index, startIndex: 1)
                        .padding(indexValue == 1 ? 50 : 30)
                        .transition(.scale.combined(with: .opacity))
                } else {
                    VStack(spacing: 16) {
                        Image("States2")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(16)
                        LinkTextView("https://matteomanferdini.com/swiftui-data-flow", path: "https://matteomanferdini.com/swiftui-data-flow")
                            .setFont(sizeType: .caption2, weight: .regular)
                    }
                    .transition(.scale.combined(with: .opacity))
                    .padding(.top, 16)
                    .roundedTitleLine("System Property Wrappers")
                }
            }
        }
        .onChange(of: indexValue) { newValue in
            switch newValue {
            case 3: fileName = "Code_environmentObject1"
            case 4: fileName = "Code_environmentObject2"
            default: fileName = ""
            }
        }
    }
}

struct PGMethodology3_Previews: PreviewProvider {
    static var previews: some View {
        PGMethodology3()
            .modifier(PreviewModifier())
    }
}
