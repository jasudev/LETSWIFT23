//
//  PGMethodology1.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PGMethodology1: View {
    
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
            .pagingOnKeyboardInput(index: index, maxIndex: 23)
    }
    
    @ViewBuilder
    private func content() -> some View {
        ZStack {
            if indexValue < 8 {
                PreviewContentView(index: index)
                    .transition(.opacity)
            }
            
            if indexValue >= 8 {
                if indexValue > 8 {
                    if indexValue < 23 {
                        ZStack(alignment: .topLeading) {
                            Color.codeBackground
                            codeImageView()
                                .transition(.opacity)
                        }
                        .roundedLine(padding: 0)
                        .padding(16)
                    }
                }
                
                ZStack {
                    if indexValue == 8 || indexValue >= 23 {
                        LayoutExampleView()
                            .matchedGeometryEffect(id: "example1", in: animation)
                    } else if indexValue >= 9 {
                        aboveIndex9()
                    }
                }
                .transition(.scale)
            }
        }
        .animation(.easeInOut(duration: indexValue == 22 ? 1.0 : 0.5), value: indexValue)
    }
    
    private func aboveIndex9() -> some View {
        VStack {
            HStack(alignment: .top) {
                if indexValue <= 21 {
                    Spacer()
                }
                if indexValue <= 21 {
                    VStack(spacing: 0) {
                        if indexValue == 9 {
                            LayoutExampleView()
                                .matchedGeometryEffect(id: "example1", in: animation)
                        } else if indexValue == 10 {
                            LayoutExampleView(statusData: LayoutStatusData(starSymbol: (.normal, .selected),
                                                                           starText: (.normal, .selected),
                                                                           starVStack: (.normal, .selected),
                                                                           avocadoText: (.normal, .selected),
                                                                           avocadoSpace: (.normal, .selected),
                                                                           avocadoImage: (.normal, .selected),
                                                                           avocadoHStack: (.normal, .selected),
                                                                           descText: (.normal, .selected),
                                                                           avocadoVStack: (.normal, .selected),
                                                                           rootHStack: (.selected, .normal)))
                            .matchedGeometryEffect(id: "example1", in: animation)
                            .transition(.identity)
                        } else if indexValue >= 11 && indexValue < 21 {
                            LayoutAbove11(indexValue: indexValue, animation: animation)
                        }
                        
                        if indexValue == 21 {
                            LayoutAbove21(indexValue: indexValue, animation: animation)
                        }
                    }
                } else {
                    LayoutAbove22(indexValue: indexValue, animation: animation)
                }
            }
            .padding([.top, .trailing], indexValue <= 21 ? 50 : 0)
            if indexValue <= 21 {
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    private func codeImageView() -> some View {
        let localIndex = indexValue - 9
        if localIndex < 14 {
            Image("Layout\(localIndex + 1)")
                .resizable()
                .scaledToFit()
                .frame(height: store.contentSize.height * 0.85)
                .frame(height: store.contentSize.height * 0.6, alignment: .topLeading)
        } else {
            EmptyView()
        }
    }
}

struct PGMethodology1_Previews: PreviewProvider {
    static var previews: some View {
        PGMethodology1()
            .modifier(PreviewModifier())
    }
}
