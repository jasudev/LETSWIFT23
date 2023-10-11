//
//  PGComponent3.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/09/20.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PGComponent3: View {
    
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    private let lastIndex: Int = 4
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .pagingOnKeyboardInput(index: index, maxIndex: lastIndex)
    }
    
    @ViewBuilder
    func content() -> some View {
        switch indexValue {
        case 0:
            ComponentTitleView(title: "Switch")
                .transition(.scale.combined(with: .opacity))
        case 1...lastIndex:
            HStack {
                if indexValue > 1 && indexValue != 4 {
                    if indexValue == 2 {
                        codeImageView()
                            .frame(width: store.contentSize.width * 0.7)
                            .transition(.asymmetric(insertion: .move(edge: .leading).combined(with: .opacity), removal: .identity))
                    } else {
                        ScrollView {
                            VStack(spacing: 0) {
                                Image("Switch1")
                                    .resizable()
                                    .scaledToFit()
                                Image("Switch2")
                                    .resizable()
                                    .scaledToFit()
                                Image("Switch3")
                                    .resizable()
                                    .scaledToFit()
                            }
                            .padding(.top, 50)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                        .frame(width: store.contentSize.width * 0.7)
                        .background(Color.codeBackground2)
                        .roundedTitleLine("Switch", padding: 0)
                        .transition(.asymmetric(insertion: .opacity, removal: .move(edge: .leading).combined(with: .opacity)))
                    }
                }
                ZStack {
                    SwitchExample()
                }
                .frame(maxWidth: .infinity)
            }
            .transition(.move(edge: .bottom).combined(with: .opacity))
        default:
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func codeImageView() -> some View {
        let fileName = "SwitchExample"
        ZStack(alignment: .topLeading) {
            Color.codeBackground2
            Image(fileName)
                .resizable()
                .scaledToFit()
                .padding(.top, 36)
                .padding(.leading, 12)
        }
        .roundedTitleLine(fileName, padding: 0)
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

struct PGComponent3_Previews: PreviewProvider {
    static var previews: some View {
        PGComponent3()
            .modifier(PreviewModifier())
    }
}
