//
//  LinkTextView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/02.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct LinkTextView: View {
    
    let title: String
    let path: String
    let isUnderline: Bool
    
    init (_ title: String, path: String, isUnderline: Bool = true) {
        self.title = title
        self.path = path
        self.isUnderline = isUnderline
    }
    
    var body: some View {
        if let url = URL(string: path) {
            Link(destination: url) {
                Text(title)
                    .underline(isUnderline)
            }
        }
    }
}

struct LinkTextView_Previews: PreviewProvider {
    static var previews: some View {
        LinkTextView("애플 사이트", path: "https://www.apple.com")
            .foregroundColor(Color.blue)
            .padding()
    }
}
