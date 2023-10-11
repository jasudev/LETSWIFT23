//
//  PGMethodology2.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PGMethodology2: View {
    
    @Namespace var animation
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .pagingOnKeyboardInput(index: index, maxIndex: 17)
    }
    
    private func content() -> some View {
        ZStack {
            switch indexValue {
            case 0..<4:
                AniDefinitionView(indexValue: indexValue, animation: animation)
                    .padding(.horizontal, store.contentSize.width * 0.15)
            case 4..<8:
                VStack {
                    AniAbove4(indexValue: indexValue, animation: animation)
                        .padding(.horizontal, store.contentSize.width * 0.07)
                        .padding(.top, indexValue >= 6 ? store.contentSize.height * 0.1 : 0)
                    
                    if indexValue >= 6 {
                        VSpaceLineView(width: 20, showTopArrow: false, dash: [4])
                            .hidden()
                            .frame(maxHeight: store.contentSize.height * 0.1)
                        AniAbove6(indexValue: indexValue)
                            .padding(.horizontal, store.contentSize.width * 0.09)
                    }
                }
            case 8..<18:
                AniAbove8(indexValue: indexValue)
                    .saturation(indexValue >= 12 ? 0 : 1)
                    .opacity(indexValue >= 12 ? 0.2 : 1)
                    .transition(.opacity)
                
                if indexValue >= 12 {
                    AniAbove12(indexValue: indexValue, width: store.contentSize.width * 0.5)
                        .frame(width: store.contentSize.width * 0.5)
                        .modifier(Drag3DModifier())
                        .transition(.scale)
                }
            default: EmptyView()
            }
        }
        .animation(.easeInOut(duration: indexValue == 3 ? 1.5 : (indexValue == 4 ? 0.8 : 0.5)), value: indexValue)
    }
}

struct PGMethodology2_Previews: PreviewProvider {
    static var previews: some View {
        PGMethodology2()
            .modifier(PreviewModifier())
            .background(Color.background)
    }
}
