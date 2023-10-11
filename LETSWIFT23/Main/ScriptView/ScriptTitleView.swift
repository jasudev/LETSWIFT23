//
//  ScriptTitleView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/30.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct ScriptTitleView: View {
    
    @EnvironmentObject private var store: PContentStore
    let title: String
    let data: PModel
    
    var body: some View {
        HStack(spacing: 10) {
            Text(title)
                .kerning(1)
                .setFont(sizeType: .caption1, weight: .semibold)
                .foregroundColor(Color.level3)
                .padding(.horizontal, 10)
                .frame(maxHeight: .infinity)
                .background(Color.black)
                .overlay(alignment: .trailing) {
                    Rectangle()
                        .fill(Color.scripBackgroundLevel1)
                        .frame(width: SCRIPT_SPACING)
                        .offset(x: 1)
                }
            
            titleView(data: data)
        }
        .frame(height: 70)
        .background(Color.scripBackgroundLevel3)
    }
    
    private func titleView(data: PModel) -> some View {
        VStack(alignment: .leading, spacing: 3) {
            if let sectionTitle = data.parent?.title {
                Text("\(sectionTitle)")
                    .setFont(sizeType: .caption2, weight: .semibold)
                    .foregroundColor(Color.level4)
            }
            Text("\(data.title)")
                .setFont(sizeType: .caption1, weight: .semibold)
                .foregroundColor(Color.level1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ScriptTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ScriptTitleView(title: "현재", data: .dummy())
    }
}
