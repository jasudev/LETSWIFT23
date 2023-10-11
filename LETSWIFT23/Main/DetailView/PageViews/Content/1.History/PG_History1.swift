//
//  PGHistory1.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PGHistory1: View {
    
    @Namespace var animation
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    
    @State private var step1: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.clear
            content()
        }
        .pagingOnKeyboardInput(index: index, maxIndex: 6)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                step1 = true
            }
        }
        .onDisappear {
            step1 = false
        }
    }
    
    @ViewBuilder
    private func content() -> some View {
        VStack {
            Spacer()
            if step1 {
                AppleHistoryView(index: index)
                    .roundedLine()
            } else {
                AppleHistoryView(index: index)
                    .hidden()
                    .roundedLine()
            }
            
            Spacer()
            HStack {
                NumberedFocusableTextView(index: index, startIndex: 1, titles: [
                    "스티브 잡스 애플에서 사임, NeXT Computer 설립",
                    "Objective-C 언어 애플 역사에 합류, 잡스 애플에 복귀",
                    "NeXTSTEP 운영체제 -> 2001년 출시된 Mac OS X의 기반",
                    "2007년에 iPhone, 2008년 iPhone SDK 발표",
                    "UIKit을 기반으로 하는 Swift 언어 2014년 발표",
                    "Swift언어를 기반으로 하는 SwiftUI WWDC19에서 발표"
                ], select: .subtitle2, normal: .description1)
                Spacer()
            }
            .opacity(step1 ? 1 : 0)
            .frame(width: 1200)
            Spacer()
        }
        .padding(.top, 30)
        .animation(ANIMATION_CONTENT_LEVEL3, value: step1)
        .setFont(sizeType: .description3, weight: .regular)
    }
}

struct PGHistory1_Previews: PreviewProvider {
    static var previews: some View {
        PGHistory1()
            .modifier(PreviewModifier())
    }
}
