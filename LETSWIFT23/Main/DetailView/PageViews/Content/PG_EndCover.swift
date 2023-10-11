//
//  PGEndCover.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/10/06.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import AnimateText

struct PGEndCover: View {
    @Namespace var animation
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    
    var data: PModel {
        store.getDataByView(self)
    }
    
    @State private var text1: String = " "
    @State private var text2: String = " "
    @State private var step1: Bool = false
    
    let str1 = PContentProvider.selfIntroductionTitle1
    let str2 = PContentProvider.selfIntroductionTitle2
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        content()
            .padding(.vertical, 50)
            .padding(.horizontal, 30)
            .pagingOnKeyboardInput(index: index, maxIndex: 2)
    }
    
    func content() -> some View {
        VStack {
            HStack {
                titleView()
                if indexValue == 0 {
                    Spacer()
                }
            }
            if indexValue == 0 {
                HStack {
                    Spacer()
                    Image("logo-light")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                        .foregroundColor(Color.white)
                }
                .hidden()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.level1)
    }
    
    private func titleView() -> some View {
        VStack(alignment: indexValue == 0 ? .leading : .center, spacing: 8) {
            if indexValue == 0 {
                Spacer()
                Spacer()
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(PContentProvider.datas[0].title)") { string in
                        string.foregroundColor = .level1
                        if let range = string.range(of: "SwiftUI") {
                            string[range].foregroundColor = .pointYellow
                        }
                    }
                    .setFont(sizeType: .title, weight: .bold)
                    Text("\(PContentProvider.datas[0].subtitle)")
                        .setFont(sizeType: .subtitle, weight: .semibold)
                }
                AnimateText<TextRandomHighlightedEffect>($text1, type: .letters)
                    .matchedGeometryEffect(id: "text", in: animation)
                    .setFont(sizeType: .description2, weight: .semibold)
                    .padding(.top, 20)
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            } else {
                VStack(spacing: indexValue <= 1 ? 16 : 24) {
                    if indexValue <= 1 {
                        AnimateText<TextRandomHighlightedEffect>($text1, type: .letters)
                            .matchedGeometryEffect(id: "text", in: animation)
                    } else {
                        Text(text1) { string in
                            string.foregroundColor = .level1
                            if let range = string.range(of: "크리에이터") {
                                string[range].foregroundColor = .pointYellow
                            }
                        }
                        .matchedGeometryEffect(id: "text", in: animation)
                        .setFont(sizeType: .subtitle, weight: .semibold)
                    }
                    
                    if indexValue == 1 {
                        AnimateText<ATOpacityEffect>($text2, type: .letters)
                            .setFont(sizeType: .subtitle2, weight: .regular)
                            .transition(.asymmetric(insertion: .opacity, removal: .scale.combined(with: .opacity)))
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
                                    text2 = str2
                                }
                            }
                    }
                    if indexValue >= 2 {
                        HStack(alignment: .top, spacing: 16) {
                            quote("QuoteLeft")
                                .padding(.top, 10)
                            AnimateText<TextHangHighlightedEffect>($text2, type: .letters, userInfo: "●")
                                .setFont(sizeType: step1 ? .title : .description2, weight: .semibold)
                                .transition(.asymmetric(insertion: .scale.combined(with: .opacity), removal: .opacity))
                                .onAppear {
                                    text2 = "개발자 ● ● ●"
                                }
                            quote("QuoteRight")
                                .padding(.top, 10)
                        }
                        .frame(width: 380)
                        .padding(16)
                    }
                }
                .setFont(sizeType: step1 ? .subtitle : .description2, weight: .semibold)
                .shadow(color: Color.black, radius: 16)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            step1 = true
                        }
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                text1 = str1
            }
        }
    }
    
    private func quote(_ name: String) -> some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .frame(width: 36, height: 36, alignment: .topLeading)
    }
}

struct PGEndCover_Previews: PreviewProvider {
    static var previews: some View {
        PGEndCover()
            .modifier(PreviewModifier())
    }
}
