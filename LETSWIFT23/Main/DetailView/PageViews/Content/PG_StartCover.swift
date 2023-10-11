//
//  PGStartCover.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import AnimateText

struct PGStartCover: View {
    
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
    
    @State private var text: String = " "
    let text1 = PContentProvider.selfIntroductionTitle1
    let text2 = PContentProvider.selfIntroductionTitle2
    let timer = Timer.publish(every: 2.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        content()
            .padding(.vertical, 50)
            .padding(.horizontal, 30)
            .pagingOnKeyboardInput(index: index, maxIndex: 0)
    }
    
    func content() -> some View {
        VStack(alignment: .leading) {
            HStack {
                titleView()
                Spacer()
            }
            HStack {
                Spacer()
                Image("logo-light")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .foregroundColor(Color.white)
            }
        }
    }
    
    private func titleView() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            Spacer()
            VStack(alignment: .leading, spacing: 0) {
                Text("\(data.title)") { string in
                    string.foregroundColor = .level1
                    if let range = string.range(of: "SwiftUI") {
                        string[range].foregroundColor = .pointYellow
                    }
                }
                .setFont(sizeType: .title, weight: .bold)
                Text("\(data.subtitle)")
                    .setFont(sizeType: .subtitle, weight: .semibold)
                    .foregroundColor(.level1)
            }
            AnimateText<TextRandomHighlightedEffect>($text, type: .letters)
                .setFont(sizeType: .description2, weight: .regular)
                .foregroundColor(.level2)
                .padding(.top, 20)
                .onAppear {
                    DispatchQueue.main.async {
                        text = text1
                    }
                }
                .onReceive(timer) { _ in
                    text = text == text1 ? text2 : text1
                }
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
    }
}

struct PGStartCover_Previews: PreviewProvider {
    static var previews: some View {
        PGStartCover()
            .modifier(PreviewModifier())
    }
}
