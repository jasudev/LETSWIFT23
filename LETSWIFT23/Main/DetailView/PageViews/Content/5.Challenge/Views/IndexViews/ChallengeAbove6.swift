//
//  ChallengeAbove6.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/08.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct ChallengeAbove6: View {
    var body: some View {
        HStack {
            LinkTextView("1997년 웹 디자인 박물관의\nFlash 1.0용 Macromedia 제품 페이지", path: "https://www.webdesignmuseum.org/web-design-history/macromedia-flash-1-0-1996")
                .setFont(sizeType: .description2, weight: .semibold)
                .foregroundColor(Color.blue)
            Image(systemName: "arrow.right")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
                .padding(.horizontal, 50)
            Image("Macromedia")
                .resizable()
                .scaledToFit()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .transition(.opacity)
    }
}

struct ChallengeAbove6_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeAbove6()
    }
}
