//
//  PGWorkAndPlay3.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PGWorkAndPlay3: View {
    
    @Namespace var animation
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    
    let packagePath: String = "https://github.com/jasudev/FabulaItemsProvider"
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .pagingOnKeyboardInput(index: index, maxIndex: 3)
    }
    
    @ViewBuilder
    private func content() -> some View {
        VStack {
            if indexValue == 0 {
                Image("FabulaTimeline")
                    .resizable()
                    .scaledToFit()
                    .transition(.opacity)
            }
            
            if indexValue >= 1 {
                ZStack {
                    VStack(alignment: .leading) {
                        if indexValue >= 2 {
                            VStack(alignment: .leading, spacing: 6) {
                                NumberedTextView(sizeType: .description1, prefix: "-", titles: [
                                    "패키지를 Fork하고 PR(Pull Request)하여 개별 아이템을 기여",
                                    "패키지는 개발자들이 자유롭게 사용할 수 있도록 공개"
                                ])
                                if indexValue >= 3 {
                                    LinkTextView(packagePath, path: packagePath)
                                        .setFont(sizeType: .description1, weight: .regular)
                                        .padding(.leading, 24)
                                        .transition(.move(edge: .bottom).combined(with: .opacity))
                                }
                            }
                            .padding(.top, 20)
                            .frame(height: store.contentSize.height * 0.2)
                        }
                        Image("FabulaWorkflow")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                            .padding(.top, 16)
                            .roundedTitleLine("Workflow", showLine: true)
                            .padding(30)
                        Spacer()
                    }
                }
                .transition(.scale.combined(with: .opacity))
            }
        }
    }
}

struct PGWorkAndPlay3_Previews: PreviewProvider {
    static var previews: some View {
        PGWorkAndPlay3()
            .modifier(PreviewModifier())
    }
}
