//
//  ScriptView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/26.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct ScriptView: View {
    
    @EnvironmentObject private var store: PContentStore
    var pageIndex: Binding<Int> {
        return $store.currentData.pageIndex
    }
    
    @State private var previewScale: Double = 0.50
    @State private var previewSize: CGSize = .zero
    @State private var enableAnimation: Bool = true
    
    var body: some View {
        HSplitView {
            ScriptContentView(pageIndex: pageIndex)
                .frame(minWidth: 450)
            VStack(alignment: .leading, spacing: SCRIPT_SPACING) {
                ScriptPreview(scale: $previewScale, size: $previewSize, enableAnimation: $enableAnimation)
                    .environment(\.isMainPresentation, false)
                TimerView(fontSize: 28)
                    .frame(height: 70)
                    .overlay(alignment: .leading) {
                        Toggle(isOn: $enableAnimation) {
                            Text("애니메이션 활성화")
                                .font(.system(size: 14))
                                .foregroundColor(Color.primaryLevel2.opacity(0.7))
                        }
                        .padding(.leading, 20)
                    }
                    .background(Color.black)
                ScriptNextView()
            }
            .frame(minWidth: 450, maxWidth: .infinity)
            .clipped()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(minWidth: MIN_SCRIPT_WINDOW_SIZE.width, minHeight: MIN_SCRIPT_WINDOW_SIZE.height)
        .onChange(of: store.screenSize) { newValue in
            previewScale = previewSize.width / newValue.width
        }
    }
}

struct ScriptView_Previews: PreviewProvider {
    static var previews: some View {
        ScriptView()
    }
}
