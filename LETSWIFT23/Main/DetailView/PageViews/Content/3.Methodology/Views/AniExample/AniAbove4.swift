//
//  AniAbove4.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/06.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct AniAbove4: View {
    
    let indexValue: Int
    var animation: Namespace.ID
    
    @State private var scaleToggle: Bool = false
    
    var body: some View {
        HStack {
            if indexValue >= 5 {
                FoldedShapeTitleSetView(data: TitleSetData(title: "Explicit(명시적)", subtitle: "withAnimation {…}\n클로저로 적용"), size: CGSize(width: 280, height: 200), outlineColor: indexValue >= 7 ? Color.pointYellow : Color.black, lineWidth: 2)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            }
            HSpaceLineView(height: 20, showRightArrow: false, dash: [4])
                .frame(maxWidth: indexValue >= 5 ? .infinity : 50)
                .opacity(indexValue >= 5 ? 1 : 0)
            centerAniView()
                .scaleEffect(scaleToggle ? 1.1 : 1)
                .matchedGeometryEffect(id: "view1", in: animation)
            HSpaceLineView(height: 20, showLeftArrow: false, dash: [4])
                .frame(maxWidth: indexValue >= 5 ? .infinity : 50)
                .opacity(indexValue >= 5 ? 1 : 0)
            if indexValue >= 5 {
                FoldedShapeTitleSetView(data: TitleSetData(title: "Implicit(암시적)", subtitle: ".animation(_, _)\n수정자로 적용"), size: CGSize(width: 280, height: 200), outlineColor: indexValue >= 7 ? Color.pointYellow : Color.black, lineWidth: 2)
                    .transition(.move(edge: .leading).combined(with: .opacity))
            }
        }
        .frame(maxWidth: .infinity)
        .onChange(of: indexValue) { newValue in
            if newValue == 5 {
                withAnimation(.easeOut(duration: 0.1)) {
                    scaleToggle = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.06) {
                    withAnimation(.easeInOut(duration: 0.46)) {
                        scaleToggle = false
                    }
                }
            }
        }
        .transition(.asymmetric(insertion: .opacity, removal: .move(edge: .top).combined(with: .opacity)))
    }
    
    private func centerAniView() -> some View {
        Circle()
            .fill(Color.primaryLevel5)
            .frame(width: 240, height: 240)
            .shadow(color: .black.opacity(0.3), radius: 12)
            .overlay {
                VStack {
                    SwiftUIView()
                        .frame(width: 90, height: 90)
                    Text("SwiftUI\nAnimation")
                        .multilineTextAlignment(.center)
                        .setFont(sizeType: .description3, weight: .semibold)
                        .foregroundColor(Color.primaryLevel1)
                }
                .shadow(color: Color.black.opacity(0.5), radius: scaleToggle ? 12 : 0)
            }
    }
}

struct AniAbove4_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        AniAbove4(indexValue: 4, animation: animation)
    }
}
