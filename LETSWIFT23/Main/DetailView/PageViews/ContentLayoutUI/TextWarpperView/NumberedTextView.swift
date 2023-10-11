//
//  NumberedTextView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct NumberedTextView: View {
    
    var sizeType: FontSizeType = .description1
    var prefix: String?
    let titles: [String]
    
    @State private var isFirst: Bool = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(Array(titles.enumerated()), id: \.offset) { index, text in
                HStack(alignment: .top) {
                    Group {
                        if let prefix = prefix {
                            Text("\(prefix) ")
                        } else {
                            Text("\(index + 1).")
                        }
                    }
                    Text(text)
                }
                .lineLimit(nil)
                .foregroundColor(.level2)
                .setFont(sizeType: sizeType, weight: .regular)
                .opacity(isFirst ? 0 : 1)
                .offset(x: isFirst ? 15 : 0)
                .animation(.easeInOut(duration: 0.5).delay(Double(index) * 0.15), value: isFirst)
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                isFirst = false
            }
        }
    }
}

struct NumberedTextView_Previews: PreviewProvider {
    static var previews: some View {
        NumberedTextView(sizeType: .caption3, titles: [
            "개발 효율성을 획기적으로 향상",
            "한 번의 코드 작성으로 모든 Apple 플랫폼에서 사용 가능"
        ])
        .frame(width: 300)
    }
}
