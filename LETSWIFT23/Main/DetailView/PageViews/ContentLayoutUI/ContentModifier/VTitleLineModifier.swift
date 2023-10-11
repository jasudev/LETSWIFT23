//
//  VTitleLineModifier.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct VTitleLineModifier: ViewModifier {
    
    let title: String
    let showLine: Bool
    let titleTextColor: Color
    let lineWidth: CGFloat
    let isShow: Bool
    let imageName: String?
    let isLarge: Bool
    
    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: isLarge ? 4 : 12) {
                    if let imageName = self.imageName {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: isLarge ? 60 : 50)
                            .shadow(color: Color.black, radius: 5)
                    }
                    Text(title)
                        .setFont(sizeType: .description1, weight: .semibold)
                        .foregroundColor(titleTextColor)
                }
                Rectangle()
                    .fill(titleTextColor.opacity(showLine ? 0.5 : 0))
                    .frame(height: 1)
                    .padding(.vertical)
            }
            .opacity(isShow ? 1 : 0)
            content
        }
    }
}

extension View {
    func titleDivider(title: String,
                      showLine: Bool = true,
                      titleTextColor: Color = Color.primaryLevel2,
                      lineWidth: CGFloat = 3,
                      isShow: Bool = true,
                      imageName: String? = nil,
                      isLarge: Bool = false) -> some View {
        modifier(VTitleLineModifier(title: title,
                                    showLine: showLine,
                                    titleTextColor: titleTextColor,
                                    lineWidth: lineWidth,
                                    isShow: isShow,
                                    imageName: imageName,
                                    isLarge: isLarge))
    }
}

struct VTitleLineModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello\nWorld!")
            .titleDivider(title: "제목", showLine: true, titleTextColor: Color.primaryLevel2, lineWidth: 5)
            .padding()
            .frame(width: 300)
    }
}
