//
//  ScriptTextView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/16.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct ScriptTextView: View {
    
    @Binding var index: Int
    
    let script: PScriptModel
    var currentIndex: Int {
        (index + script.startIndex)
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.clear
                VStack(alignment: .leading) {
                    ForEach(0..<9) { index in
                        let itemIndex = currentIndex - 4 + index
                        let item = script.scripts.indices.contains(itemIndex) ? script.scripts[itemIndex] : nil
                        if let item = item {
                            Text(item)
                                .foregroundColor(itemIndex == currentIndex ? Color.white : Color.primaryLevel2.opacity(0.5))
                                .roundedLine(showLine: itemIndex == currentIndex, padding: 16, lineWidth: 2)
                        } else {
                            Spacer()
                                .frame(height: 36)
                        }
                    }
                }
                .frame(height: geo.size.height * 2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .offset(y: -geo.size.height / 2)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipped()
        .padding(16)
    }
}

struct ScriptTextView_Previews: PreviewProvider {
    static var previews: some View {
        ScriptTextView(index: .constant(0), script: .dummy())
    }
}
