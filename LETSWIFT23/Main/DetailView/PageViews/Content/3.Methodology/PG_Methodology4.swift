//
//  PGMethodology4.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/29.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PGMethodology4: View {
    
    @Namespace var animation
    
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    
    @State private var isLeft: Bool = false
    @State private var selection: Int? = 0
    
    var datas = [
        HRadioComp1Data(title: "Standard", subtitle: "4-10 business days", price: "$5.00"),
        HRadioComp1Data(title: "Express", subtitle: "2-5 business days", price: "$16.00"),
        HRadioComp1Data(title: "Super Fast", subtitle: "1 business days", price: "$25.00")
    ]
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .animation(ANIMATION_CONTENT_LEVEL3, value: selection)
            .pagingOnKeyboardInput(index: index, maxIndex: 8)
    }
    
    @ViewBuilder
    func content() -> some View {
        if indexValue >= 4 {
            aboveIndex4()
        } else {
            aboveIndex0()
        }
    }
    
    private func aboveIndex0() -> some View {
        HStack(spacing: 35) {
            if indexValue <= 1 {
                VStack(spacing: 16) {
                    RadioBasic(isLeft: $isLeft)
                        .frame(width: 350)
                        .padding(.top, 16)
                        .roundedTitleLine("Radio 버튼의 기본 형태", showLine: true)
                    
                    Button {
                        isLeft.toggle()
                    } label: {
                        Image(systemName: "arrow.left.and.right")
                            .font(.title)
                            .foregroundColor(.level3)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 4, style: .continuous)
                                    .stroke()
                                    .fill(Color.white.opacity(0.3))
                            }
                            .contentShape(Rectangle())
                    }
                    .buttonStyle(.dsPressButtonStyle())
                    
                }
                .transition(.move(edge: .leading).combined(with: .opacity))
            }
            if indexValue >= 1 {
                Image("RadioUI")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .padding()
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            }
            if indexValue >= 2 {
                VStack(alignment: .leading, spacing: PADDING_VERTICAL) {
                    HStack(alignment: .top) {
                        Text("1.")
                        Text("여러 개의 아이템이 모여 그룹으로 사용한다.")
                    }
                    HStack(alignment: .top) {
                        Text("2.")
                        Text("특정 Item을 선택하면 이전 Item은 해제되어 단일 Item만 선택된 상태를 유지한다.")
                    }
                    
                    if indexValue >= 3 {
                        HStack(alignment: .top) {
                            Text("3.")
                                .matchedGeometryEffect(id: "3", in: animation)
                            Text("라디오 아이콘은 다른 뷰와 조합하여 구성할 수 있으며 Item들의 디자인과 Layout은 자유롭게 구성할 수 있어야 한다.")
                                .lineLimit(nil)
                                .matchedGeometryEffect(id: "text", in: animation)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .foregroundColor(Color.pointYellow)
                        .roundedLine(showLine: indexValue >= 1, padding: 16, color: Color.pointYellow)
                        .transition(.opacity)
                    } else {
                        HStack(alignment: .top) {
                            Text("3.")
                                .matchedGeometryEffect(id: "3", in: animation)
                            Text("라디오 아이콘은 다른 뷰와 조합하여 구성할 수 있으며 Item들의 디자인과 Layout은 자유롭게 구성할 수 있어야 한다.")
                                .lineLimit(nil)
                                .matchedGeometryEffect(id: "text", in: animation)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .foregroundColor(.primaryLevel2)
                    }
                    
                    Group {
                        HStack(alignment: .top) {
                            Text("4.")
                            Text("선언적 구문이 아닌 프로그래밍 방식의 이벤트 수신도 가능해야 한다.")
                        }
                        
                        HStack(alignment: .top) {
                            Text("5.")
                            Text("상태 값이 nil일 경우에는 모든 아이템이 선택 해제되어야 한다.")
                        }
                    }
                    .opacity(0.5)
                }
                .foregroundColor(.primaryLevel2)
                .setFont(sizeType: .description1, weight: .regular)
                .padding(.top, 30)
                .roundedTitleLine("Radio 컴포넌트의 사용성 정의", showLine: indexValue <= 2)
                .frame(width: 670)
                .transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
    }
    
    private func aboveIndex4() -> some View {
        HStack {
            if indexValue >= 5 {
                Spacer()
            }
            VStack {
                HRadio1()
                    .padding(.bottom, 40)
                HRadio2()
                    .padding(.bottom, 40)
                VRadio1()
            }
            .frame(maxWidth: 660)
            .padding(.vertical, 30)
            .roundedTitleLine("다양한 디자인 적용", showLine: true)
            
            if indexValue >= 5 {
                Spacer()
                VStack(alignment: .leading) {
                    if indexValue >= 6 {
                        Spacer()
                    }
                    if indexValue >= 5 {
                        VStack(alignment: .leading) {
                            Text("Delivery method")
                                .setFont(sizeType: .description3, weight: .semibold)
                                .foregroundColor(.level2)
                            
                            Radio(selection: $selection) {
                                HStack(spacing: 16) {
                                    items()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            } onTapReceive: { _ in
                                
                            }
                            .foregroundColor(.level2)
                            .setFont(sizeType: .description3, weight: .regular)
                        }
                        .padding(30)
                        .animation(.easeInOut, value: selection)
                    }
                    if indexValue >= 6 {
                        Spacer()
                        NumberedFocusableTextView(index: index, startIndex: 7, titles: [
                            "기존 명령형 방식의 UIKit에서는 어떻게 디자인 할 것인가를 먼저 고민하기 때문에 해결하기 어려운 문제",
                            "SwiftUI에서는 상태 메카니즘을 통해 UI의 자유도를 최대한 확장할 수 있음"
                        ], select: .subtitle2, normal: .description2, prefix: "●", spacing: 24)
                        .roundedLine()
                        .padding(30)
                        Spacer()
                    }
                }
                .frame(maxWidth: 1000)
                .transition(.move(edge: .trailing).combined(with: .opacity))
                Spacer()
            }
        }
        .transition(.scale.combined(with: .opacity))
    }
    
    @ViewBuilder
    private func items() -> some View {
        ForEach(Array(datas.enumerated()), id: \.offset) { index, data in
            switch selection {
            case 0: RadioButtonUI1(animation: animation, selection: $selection, index: index, data: data)
            case 1: RadioButtonUI2(animation: animation, selection: $selection, index: index, data: data)
            default: RadioButtonUI3(animation: animation, selection: $selection, index: index, data: data)
            }
        }
    }
}

struct PGMethodology4_Previews: PreviewProvider {
    static var previews: some View {
        PGMethodology4()
            .modifier(PreviewModifier())
    }
}
