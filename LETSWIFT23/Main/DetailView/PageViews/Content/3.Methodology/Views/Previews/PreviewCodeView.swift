//
//  PreviewCodeView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/02.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PreviewCodeView: View {
    
    @Binding var index: Int
    let startIndex: Int
    
    @State private var fileName: String = "Code_content1"
    
    var body: some View {
        CodeView(fileName: $fileName, topGap: 16, fontSize: 28)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onChange(of: index) { newValue in
                switch newValue - startIndex {
                case 0 ..< 1: fileName = "Code_content1"
                case 1: fileName = "Code_content2"
                default: fileName = "Code_content3"
                }
            }
    }
}

struct PreviewCodeView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewCodeView(index: .constant(0), startIndex: 0)
    }
}
