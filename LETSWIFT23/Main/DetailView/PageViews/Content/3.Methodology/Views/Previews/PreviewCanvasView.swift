//
//  PreviewCanvasView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/02.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PreviewCanvasView: View {
    
    @Namespace var animation
    @Binding var index: Int
    let startIndex: Int
    
    var localIndex: Int {
        index - startIndex
    }
    let imageOriginalSize = CGSize(width: 1296.0, height: 2640.0)
    
    var body: some View {
        Image("iPhone14_black")
            .resizable()
            .scaledToFit()
            .padding(16)
            .overlay {
                GeometryReader { geo in
                    let deltaWidth = geo.size.width / imageOriginalSize.width
                    let deltaHeight = geo.size.height / imageOriginalSize.height
                    content()
                        .frame(width: geo.size.width - (250 * deltaWidth),
                               height: geo.size.height - (500 * deltaHeight))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .shadow(color: Color.black.opacity(0.3), radius: 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .setFont(sizeType: .description3, weight: .regular)
    }
    
    private func content() -> some View {
        ZStack {
            if localIndex == 0 || localIndex >= 4 {
                Rectangle()
                    .stroke(lineWidth: 2)
                    .fill(Color.red)
            }
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .overlay {
                        if localIndex == 1 || localIndex >= 5 {
                            Rectangle()
                                .stroke(lineWidth: 2)
                                .fill(Color.yellow)
                        }
                    }
                    .zIndex(1)
                Text("Hello, world!")
                    .overlay {
                        if localIndex == 1 || localIndex >= 5 {
                            Rectangle()
                                .stroke(lineWidth: 2)
                                .fill(Color.orange)
                        }
                    }
            }
            .padding()
            .overlay {
                if localIndex == 1 || localIndex >= 5 {
                    Rectangle()
                        .stroke(lineWidth: 2)
                        .fill(Color.blue)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct PreviewCanvasView_Previews: PreviewProvider {
    static let size = CGSize(width: 1296.0, height: 2640.0)
    static var previews: some View {
        PreviewCanvasView(index: .constant(6), startIndex: 0)
            .frame(width: 600, height: 900)
    }
}
