//
//  EnvironmentObjectView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct EnvironmentObjectView: View {
    
    @Namespace var animation
    @Binding var index: Int
    let startIndex: Int
    var localIndex: Int {
        index - startIndex
    }
    
    @State private var run1: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black
                ZStack {
                    Image("State_ori")
                        .resizable()
                        .scaledToFit()
                        .opacity(currentIndex(index) == 0 ? 1 : 0)
                    
                    Image("State_rec")
                        .resizable()
                        .scaledToFit()
                        .opacity(currentIndex(index) >= 1 ? 1 : 0)
                    
                    Image("State_top")
                        .resizable()
                        .scaledToFit()
                        .opacity(currentIndex(index) >= 2 ? 1 : 0)
                }
                
                if currentIndex(index) >= 2 {
                    Image("State_line")
                        .resizable()
                        .scaledToFit()
                        .mask(alignment: .top) {
                            Rectangle()
                                .frame(height: currentIndex(index) >= 3 ? geo.size.height : 0)
                        }
                        .animation(.linear(duration: 3.0), value: index)
                }
                
                if currentIndex(index) >= 3 {
                    Image("State_ori")
                        .resizable()
                        .scaledToFit()
                        .opacity(run1 ? 1 : 0)
                        .onAppear {
                            run1 = true
                        }
                        .onDisappear {
                            run1 = false
                        }
                }
            }
        }
        .animation(.easeOut(duration: 0.5).delay(1.5), value: run1)
        .roundedTitleLine("EnvironmentObject 상태 메카니즘", showLine: true, padding: 1)
    }
    
    private func currentIndex(_ index: Int) -> Int {
        return (index - startIndex)
    }
}

struct EnvironmentObjectView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectView(index: .constant(1), startIndex: 0)
            .padding()
    }
}
