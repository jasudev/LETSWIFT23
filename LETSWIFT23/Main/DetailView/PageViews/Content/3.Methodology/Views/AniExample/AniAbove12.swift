//
//  AniAbove12.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/08.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import FabulaItemsProvider

struct AniAbove12: View {
    
    @Namespace var animation
    
    let indexValue: Int
    let width: CGFloat
    
    var localIndex: Int {
        indexValue - 12
    }
    
    let fillColors = [Color(hex: 0x016EE7), Color(hex: 0xB5CCEF), Color(hex: 0x8FCA99), Color(hex: 0x2DAE4D)]
    let textColors = [Color(hex: 0x00006D), Color(hex: 0x035F01)]
    
    @State private var failureInterval: CGFloat = 0
    @State private var successScale: CGFloat = 1
    
    var body: some View {
        HStack(spacing: 100) {
            ZStack {
                switch localIndex {
                case 0: scene1().frame(width: width * 0.5)
                case 1: scene2()
                case 2: scene3().frame(width: width * 0.5)
                case 3: scene4().frame(width: width * 0.5)
                case 4, 5: scene5().frame(width: width * 0.5)
                default:
                    EmptyView()
                }
            }
            .frame(maxWidth: width)
            .scaleEffect(successScale)
            .warning(failureInterval)
            .onChange(of: localIndex) { newValue in
                if newValue >= 2 && newValue < 4 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
                        failureInterval += 1
                    }
                }
                
                if newValue == 4 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
                        withAnimation(.easeOut(duration: 0.2)) {
                            successScale = 1.1
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(.easeInOut(duration: 0.6)) {
                                successScale = 1
                            }
                        }
                    }
                }
            }
            
            if localIndex == 5 {
                TimingCurveView()
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
    }
    
    private func scene1() -> some View {
        VStack(spacing: 12) {
            AniTitleRoundedRectangle(title: "0", textColor: .white, fillColor: fillColors[0], animation: animation)
            AniTitleRoundedRectangle(title: "1", textColor: .white, fillColor: fillColors[0], animation: animation)
            AniTitleRoundedRectangle(title: "2", textColor: textColors[0], fillColor: fillColors[1], animation: animation)
        }
        .modifier(ContainerViewModifier(animation))
    }
    
    private func scene2() -> some View {
        HStack(spacing: 16) {
            AniTitleRoundedRectangle(title: "1-0", textColor: .white, fillColor: fillColors[3], animation: animation)
                .frame(width: width * 0.5)
                .frame(maxWidth: .infinity)
            VStack(spacing: 12) {
                AniTitleRoundedRectangle(title: "0", textColor: .white, fillColor: fillColors[0], animation: animation)
                AniTitleRoundedRectangle(title: "1", textColor: .white, fillColor: fillColors[0], animation: animation)
                AniTitleRoundedRectangle(title: "2", textColor: textColors[0], fillColor: fillColors[1], animation: animation)
            }
            .modifier(ContainerViewModifier(animation))
        }
    }
    
    private func scene3() -> some View {
        VStack(spacing: 12) {
            AniTitleRoundedRectangle(title: "0", textColor: .white, fillColor: fillColors[0], animation: animation)
            AniTitleRoundedRectangle(title: "1-0", textColor: .white, fillColor: fillColors[3], animation: animation)
            AniTitleRoundedRectangle(title: "1", textColor: .white, fillColor: fillColors[0], animation: animation)
            AniTitleRoundedRectangle(title: "2", textColor: textColors[0], fillColor: fillColors[1], animation: animation)
        }
        .modifier(ContainerViewModifier(animation, isMatched: false))
    }
    
    private func scene4() -> some View {
        VStack(spacing: 12) {
            AniTitleRoundedRectangle(title: "1-0", textColor: .white, fillColor: fillColors[3], animation: animation)
            AniTitleRoundedRectangle(title: "0", textColor: .white, fillColor: fillColors[0], animation: animation)
            AniTitleRoundedRectangle(title: "1", textColor: .white, fillColor: fillColors[0], animation: animation)
            AniTitleRoundedRectangle(title: "2", textColor: textColors[0], fillColor: fillColors[1], animation: animation)
        }
        .modifier(ContainerViewModifier(animation, isMatched: false))
    }
    
    private func scene5() -> some View {
        VStack(spacing: 12) {
            AniTitleRoundedRectangle(title: "0", textColor: .white, fillColor: fillColors[0], animation: animation)
            AniTitleRoundedRectangle(title: "1", textColor: textColors[1], fillColor: fillColors[2], animation: animation) {
                AniTitleRoundedRectangle(title: "1-0", textColor: .white, fillColor: fillColors[3], animation: animation)
            }
            AniTitleRoundedRectangle(title: "2", textColor: textColors[0], fillColor: fillColors[1], animation: animation)
        }
        .modifier(ContainerViewModifier(animation, isMatched: true))
    }
    
    struct ContainerViewModifier: ViewModifier {
        
        let animation: Namespace.ID
        let isMatched: Bool?
        
        init(_ animation: Namespace.ID, isMatched: Bool? = nil) {
            self.animation = animation
            self.isMatched = isMatched
        }
        
        func body(content: Content) -> some View {
            content
                .padding(16)
                .background {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.8), radius: 16)
                        .matchedGeometryEffect(id: "containerBackground", in: animation)
                }
        }
    }
}

extension View {
    func warning(_ interval: CGFloat) -> some View {
        self.modifier(WarningEffect(interval))
            .animation(.easeOut(duration: 0.4), value: interval)
    }
}

struct WarningEffect: GeometryEffect {
    
    var animatableData: CGFloat
    var amount: CGFloat = 6
    var shakeCount = 6
    
    init(_ interval: CGFloat) {
        self.animatableData = interval
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: amount * sin(animatableData * CGFloat(shakeCount) * .pi), y: 0))
    }
}

struct AniAbove12_Previews: PreviewProvider {
    static var previews: some View {
        AniAbove12(indexValue: 12, width: 400)
    }
}
