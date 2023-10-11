//
//  PGPresentation1.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PGPresentation1: View {
    
    @Namespace var animation
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    var isLargeIcon: Bool {
        indexValue == 0 || indexValue == 3 || indexValue == lastIndex
    }
    @State private var step1: Bool = false
    private let lastIndex: Int = 12
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .bottomLeading) {
                if indexValue == lastIndex {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Open Source Libraries")
                            .setFont(sizeType: .description3, weight: .semibold)
                            .foregroundColor(Color.primaryLevel1)
                        VStack(alignment: .leading) {
                            itemView {
                                LinkTextView("LETSWIFT23 for SwiftUI - https://github.com/jasudev/LETSWIFT23.git", path: "https://github.com/jasudev/LETSWIFT23.git")
                            }
                            itemView {
                                LinkTextView("NCDP2023 for SwiftUI - https://github.com/jasudev/NCDP2023.git", path: "https://github.com/jasudev/NCDP2023.git")
                            }
                            itemView {
                                LinkTextView("FabulaItemsProvider - https://github.com/jasudev/FabulaItemsProvider.git", path: "https://github.com/jasudev/FabulaItemsProvider.git")
                            }
                            itemView {
                                LinkTextView("SDWebImageSwiftUI - https://github.com/SDWebImage/SDWebImageSwiftUI.git", path: "https://github.com/SDWebImage/SDWebImageSwiftUI.git")
                            }
                            itemView {
                                LinkTextView("CodeHighlighter - https://github.com/mortenjust/CodeHighlighter.git", path: "https://github.com/mortenjust/CodeHighlighter.git")
                            }
                            itemView {
                                LinkTextView("SwiftPieChart - https://github.com/ilamanov/SwiftPieChart.git", path: "https://github.com/ilamanov/SwiftPieChart.git")
                            }
                        }
                        .setFont(sizeType: .caption1, weight: .regular)
                        .foregroundColor(Color.primaryLevel4)
                        .padding(.leading, 7)
                    }
                    .padding(.bottom, 40)
                }
            }
            .pagingOnKeyboardInput(index: index, maxIndex: lastIndex)
    }
    
    private func itemView(_ content: () -> some View) -> some View {
        HStack {
            Circle()
                .fill(Color.primaryLevel1)
                .frame(width: 5, height: 5)
            content()
        }
    }
    
    @ViewBuilder
    private func content() -> some View {
        HStack {
            if indexValue >= 1 && indexValue < 2 {
                launcherView(imageName: "CNEDAY_512", title: "C&EDAY22", ver: "v1.0")
                    .overlay {
                        RoundedRectangle(cornerRadius: 58)
                            .stroke()
                            .fill(Color.primaryLevel4.opacity(0.7))
                            .padding(18)
                    }
                lineView(name: "line1")
                launcherView(imageName: "NCDP_512", title: "NCDP23", ver: "v2.0")
                lineView(name: "line2")
            }
            
            VStack {
                Image("LETSWIFT_512")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: store.contentSize.height * (isLargeIcon ? 0.4 : 0.25))
                    .overlay(alignment: .bottom) {
                        if indexValue >= 1 && indexValue < 3 {
                            VStack {
                                Text("LETSWIFT23")
                                    .setFont(sizeType: .description3, weight: .bold)
                                Text("v2.1")
                                    .setFont(sizeType: .caption1, weight: .semibold)
                                    .foregroundColor(Color.primaryLevel1)
                            }
                            .offset(y: 60)
                            .opacity(step1 ? 1 : 0)
                            .transition(.opacity)
                            .onAppear {
                                step1 = true
                            }
                            .onDisappear {
                                step1 = false
                            }
                        }
                    }
                    .padding(.bottom, indexValue == lastIndex ? 150 : 0)
                    .animation(ANIMATION_CONTENT_LEVEL3.delay(0.35), value: step1)
            }
            
            if indexValue >= 2 && indexValue < 3 {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .padding(.leading, 40)
                    .padding(.trailing, 10)
                    .foregroundColor(Color.primaryLevel1)
                    .transition(.scale.combined(with: .move(edge: .trailing)).combined(with: .opacity))
                
                Image("ScriptWindow")
                    .resizable()
                    .scaledToFit()
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            }
            
            if indexValue >= 4 && indexValue < lastIndex {
                StructureView(index: index, startIndex: 4)
                    .transition(.asymmetric(insertion: .opacity, removal: .move(edge: .leading).combined(with: .scale).combined(with: .opacity)))
            }
        }
        .setFont(sizeType: .description2, weight: .regular)
        .foregroundColor(.level1)
        .frame(maxWidth: indexValue >= 2 ? .infinity : store.contentSize.width * 0.9)
    }
    
    private func lineView(name: String) -> some View {
        HSpaceLineView(height: 20, showLeftArrow: false, lineWidth: 2.0, dash: [4])
            .matchedGeometryEffect(id: name, in: animation)
            .padding(.horizontal, 20)
            .frame(height: 20)
            .transition(.scale.combined(with: .move(edge: .leading)).combined(with: .opacity))
    }
    
    private func launcherView(imageName: String, title: String, ver: String) -> some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
//            .frame(maxWidth: store.contentSize.height * 0.35)
            .overlay(alignment: .bottom) {
                VStack {
                    Text(title)
                        .setFont(sizeType: .description3, weight: .bold)
                    Text(ver)
                        .setFont(sizeType: .caption1, weight: .semibold)
                        .foregroundColor(Color.primaryLevel1)
                }
                .offset(y: 60)
            }
            .transition(.move(edge: .leading).combined(with: .opacity))
    }
}

struct PGPresentation1_Previews: PreviewProvider {
    static var previews: some View {
        PGPresentation1()
            .modifier(PreviewModifier())
    }
}
