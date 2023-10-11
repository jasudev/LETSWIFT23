//
//  PGIntroduction1.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PGIntroduction1: View {
    
    @Namespace var animation
    
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    
    @State private var step1: Bool = false
    @State private var step2: Bool = false
    @State private var step3: Bool = false
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .pagingOnKeyboardInput(index: index, maxIndex: 6)
    }
    
    @ViewBuilder
    private func content() -> some View {
        GeometryReader { geo in
            ZStack {
                Image("SwiftUI11")
                    .resizable()
                    .scaledToFit()
                    .opacity(!step1 || indexValue >= 1 ? 0 : 1)
                if indexValue == 0 {
                    SwiftUIView()
                        .matchedGeometryEffect(id: "logo", in: animation)
                        .frame(width: geo.size.width * 0.250)
                        .shadow(radius: 8)
                } else if indexValue == 1 {
                    logoTitle()
                        .matchedGeometryEffect(id: "title", in: animation)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                step2 = true
                            }
                        }
                        .onDisappear {
                            step2 = false
                        }
                    
                } else if indexValue >= 2 {
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            logoTitle()
                                .matchedGeometryEffect(id: "title", in: animation)
                            Spacer()
                            Image("Multiplatform")
                                .resizable()
                                .scaledToFit()
                                .padding(40)
                                .hidden()
                                .overlay {
                                    if step3 {
                                        Image("Multiplatform")
                                            .resizable()
                                            .scaledToFit()
                                            .padding(40)
                                            .transition(.scale)
                                    }
                                }
                            Spacer()
                        }
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                step3 = true
                            }
                        }
                        .onDisappear {
                            step3 = false
                        }
                        .padding(.top, 60)
                        Spacer()
                        Spacer()
                        Spacer()
                        NumberedFocusableTextView(index: index, startIndex: 3, titles: [
                            "한 번의 코드 작성으로 모든 애플 플랫폼에서 사용 가능",
                            "코드 변경 사항을 즉시 프리뷰로 확인",
                            "기존 방식보다 효율적이고 매우 빠른 애니메이션 처리",
                            "선언적 구문을 사용하여 직관적이고 가독성이 좋은 코드 작성"
                        ])
                        .opacity(step3 ? 1 : 0)
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                step1 = true
            }
        }
        .onDisappear {
            step1 = false
        }
        .animation(ANIMATION_CONTENT_LEVEL1, value: step1)
        .animation(ANIMATION_CONTENT_LEVEL1, value: step2)
        .animation(ANIMATION_CONTENT_LEVEL3, value: step3)
    }
    
    private func logoTitle() -> some View {
        HStack(spacing: 30) {
            SwiftUIView()
                .matchedGeometryEffect(id: "logo", in: animation)
                .frame(width: 230, height: 230)
                .shadow(radius: 8)
            
            VStack(alignment: .leading) {
                Text("SwiftUI")
                    .font(.system(size: 70))
                    .fontWeight(.medium)
                    .foregroundColor(.level1)
                Text("Better apps. Less code.")
                    .font(.system(size: 40))
                    .fontWeight(.light)
                    .foregroundColor(.level2)
            }
            .opacity(indexValue >= 1 && step2 || step3 ? 1 : 0)
        }
    }
}

struct PGIntroduction1_Previews: PreviewProvider {
    static var previews: some View {
        PGIntroduction1()
            .modifier(PreviewModifier())
    }
}
