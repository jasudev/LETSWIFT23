//
//  PG_End.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/21.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
struct PGEnd: View {
    
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }

    @State private var step1: Bool = false
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .pagingOnKeyboardInput(index: index, maxIndex: 0)
    }
    
    func content() -> some View {
        VStack(alignment: .center, spacing: 30) {
            if !step1 {
                Text("시간을 내주셔서 감사합니다. 😊")
                    .setFont(sizeType: .title, weight: .semibold)
                    .foregroundColor(.level1)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .padding(.bottom, 80)
            }
            if step1 {
                VStack(alignment: .center, spacing: 10) {
                    Image("LETSWIFT23_QR")
                        .padding(5)
                        .background(Color.white)
                        .padding(.bottom, 50)
                    Text("프레젠테이션 GitHub")
                        .foregroundColor(.level1)
                        .setFont(sizeType: .subtitle, weight: .semibold)
                    LinkTextView("https://github.com/jasudev/LETSWIFT23.git", 
                                 path: "https://github.com/jasudev/LETSWIFT23.git",
                                 isUnderline: false)
                        .setFont(sizeType: .subtitle, weight: .semibold)
                }
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeInOut(duration: 0.6)) {
                    step1 = true
                }
            }
        }
    }
}

struct PGEnd_Previews: PreviewProvider {
    static var previews: some View {
        PGEnd()
            .modifier(PreviewModifier())
    }
}
