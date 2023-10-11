//
//  ScriptContentView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/30.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct ScriptContentView: View {
    
    @EnvironmentObject private var store: PContentStore
    @Binding var pageIndex: Int
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: SCRIPT_SPACING) {
                ScriptTitleView(title: "현재", data: store.currentData)
                ZStack {
                    Color.scripBackgroundLevel2
                    if store.currentData.depth == .section && store.currentData.script.scripts.isEmpty {
                        Text(store.currentData.title)
                            .setFont(sizeType: .description2, weight: .semibold)
                            .foregroundColor(Color.white.opacity(0.2))
                    } else {
                        ScriptTextView(index: $pageIndex, script: store.currentData.script)
                            .setFont(sizeType: .description3, weight: .regular)
                            .id(UUID())
                    }
                }
                .frame(maxHeight: .infinity)
                .overlay(alignment: .bottomTrailing) {
                    ScriptBottomView(data: store.currentData)
                }
            }
        }
    }
}

struct ScriptContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScriptContentView(pageIndex: .constant(0))
            .modifier(PreviewModifier())
    }
}
