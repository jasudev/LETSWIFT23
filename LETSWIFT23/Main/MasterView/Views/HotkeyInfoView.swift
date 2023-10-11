//
//  HotkeyInfoView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct HotkeyInfoView: View {
    
    let title: String
    let option: String
    
    let normalColor = Color.white.opacity(0.2)
    let selectedColor = Color.white.opacity(0.5)
    
    var body: some View {
        HStack(spacing: 5) {
            if !title.isEmpty {
                Text(title)
                    .setFont(sizeType: .caption3, weight: .regular)
            }
            Text(option) { string in
                string.foregroundColor = selectedColor
                if let range = string.range(of: "ｌ") {
                    string[range].foregroundColor = normalColor
                }
            }
            .offset(x: containsAlphanumeric(text: option) ? -0.5 : 0,
                    y: containsAlphanumeric(text: option) ? -1 : 0)
        }
        .fixedSize(horizontal: true, vertical: false)
        .padding(5)
        .padding(.horizontal, 4)
        .overlay {
            RoundedRectangle(cornerRadius: 3, style: .continuous)
                .stroke()
                .padding(0.5)
        }
        .foregroundColor(normalColor)
    }
    
    func containsAlphanumeric(text: String) -> Bool {
        let alphanumericRegex = "^[a-zA-Z0-9]+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", alphanumericRegex)
        return predicate.evaluate(with: text)
    }
}

struct HotkeyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        HotkeyInfoView(title: "다음", option: "<")
            .modifier(PreviewModifier())
    }
}
