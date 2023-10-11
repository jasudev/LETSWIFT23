//
//  FoldedShapeTextView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/05.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct FoldedShapeTextView: View {
    
    let text: String
    let highlighting: String?
    let size: CGSize
    
    var body: some View {
        VStack {
            Spacer()
            Text(text) { string in
                string.foregroundColor = Color.primaryLevel1
                if let range = string.range(of: highlighting ?? "") {
                    string[range].foregroundColor = Color.pointYellow
                }
            }
            .multilineTextAlignment(.center)
            Spacer()
        }
        .frame(width: size.width, height: size.height, alignment: .top)
        .foldedShape()
    }
}

struct FoldedShapeTextView_Previews: PreviewProvider {
    static var previews: some View {
        FoldedShapeTextView(text: "텍스트", highlighting: "텍", size: CGSize(width: 200, height: 230))
    }
}
