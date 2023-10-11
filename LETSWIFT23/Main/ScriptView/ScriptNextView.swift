//
//  ScriptNextView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/30.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct ScriptNextView: View {
    
    @EnvironmentObject private var store: PContentStore
    
    var body: some View {
        if let nextData = store.getNextData() {
            VStack(alignment: .leading, spacing: SCRIPT_SPACING) {
                ScriptTitleView(title: "다음", data: nextData)
                ZStack(alignment: nextData.depth == .section ? .center : .leading) {
                    Color.scripBackgroundLevel1
                    if nextData.depth == .section && store.currentData.script.scripts.isEmpty {
                        Text(nextData.title)
                            .setFont(sizeType: .caption1, weight: .semibold)
                            .foregroundColor(Color.white.opacity(0.2))
                    } else {
                        if !nextData.script.scripts.isEmpty {
                            ScrollView(showsIndicators: false) {
                                NumberedFocusableTextView(index: .constant(-1),
                                                          startIndex: 0,
                                                          titles: nextData.script.scripts,
                                                          normal: .caption2, prefix: "")
                                .padding(20)
                                .opacity(0.7)
                            }
                        } else {
                            Rectangle()
                                .fill(Color.clear)
                        }
                    }
                }
                .overlay(alignment: .bottomTrailing) {
                    ScriptBottomView(data: nextData)
                }
            }
        } else {
            Color.scripBackgroundLevel1
        }
    }
}

struct ScriptNextView_Previews: PreviewProvider {
    static var previews: some View {
        ScriptNextView()
    }
}
