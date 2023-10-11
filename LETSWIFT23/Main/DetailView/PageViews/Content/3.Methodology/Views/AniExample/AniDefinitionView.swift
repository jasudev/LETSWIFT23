//
//  AniDefinitionView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/05.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct AniDefinitionView: View {
    
    let indexValue: Int
    var animation: Namespace.ID
    
    var circleForegroundView: some View {
        circleView(color: Color.primaryLevel1)
            .foregroundColor(Color.primaryLevel5)
    }
    
    var circleBackgroundView: some View {
        circleView(color: Color.primaryLevel6)
            .foregroundColor(Color.primaryLevel4)
    }
    
    var body: some View {
        HStack {
            if indexValue == 0 {
                Image("Advantages6")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .padding(50)
                    .transition(.scale.combined(with: .opacity))
            } else if indexValue == 1 {
                circleForegroundView
                    .matchedGeometryEffect(id: "view1", in: animation)
            } else {
                VStack {
                    ZStack {
                        if indexValue >= 1 {
                            if indexValue >= 3 {
                                Circle()
                                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [4]))
                                    .fill(Color.primaryLevel4.opacity(0.7))
                                    .frame(width: 240)
                                    .transition(.identity)
                            }
                            circleForegroundView
                                .matchedGeometryEffect(id: "view1", in: animation)
                        }
                    }
                    if indexValue >= 2 {
                        Text("Start")
                            .setFont(sizeType: .description3, weight: .regular)
                            .foregroundColor(Color.primaryLevel2)
                    }
                }
                
                centerLineView()
                    .foregroundColor(Color.primaryLevel2)
                    .opacity(indexValue >= 2 ? 1 : 0.5)
                    .transition(.scale.combined(with: .opacity))
                    .padding(.bottom, indexValue >= 2 ? 40 : 0)
                
                VStack {
                    ZStack {
                        if indexValue >= 1 {
                            circleBackgroundView
                                .matchedGeometryEffect(id: "view2", in: animation)
                        }
                        if indexValue >= 3 {
                            circleForegroundView
                                .matchedGeometryEffect(id: "view1", in: animation)
                        }
                    }
                    if indexValue >= 2 {
                        Text("End")
                            .setFont(sizeType: .description3, weight: .regular)
                            .foregroundColor(Color.primaryLevel2)
                    }
                }
                .transition(.move(edge: .leading).combined(with: .opacity))
            }
        }
    }
    
    private func circleView(color: Color) -> some View {
        Circle()
            .fill(color)
            .frame(width: 240)
            .overlay {
                Text("View")
                    .setFont(sizeType: .description2, weight: .semibold)
            }
    }
    
    private func centerLineView() -> some View {
        VStack {
            Spacer()
            HSpaceLineView(height: 20, showLeftArrow: false, lineWidth: 2.0, dash: [1])
                .padding(.horizontal, 20)
                .frame(height: 20)
            HLineShape()
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [6]))
                .padding(.horizontal, 40)
                .frame(height: 2)
                .overlay(alignment: .top) {
                    Text("Change")
                        .setFont(sizeType: .description3, weight: .regular)
                        .foregroundColor(Color.primaryLevel2)
                        .opacity(indexValue >= 3 ? 1 : 0)
                        .padding(.top, 20)
                }
            Spacer()
        }
    }
}

struct AniDefinitionView_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        AniDefinitionView(indexValue: 0, animation: animation)
    }
}
