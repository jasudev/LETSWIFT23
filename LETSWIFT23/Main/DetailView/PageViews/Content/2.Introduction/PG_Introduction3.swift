//
//  PGIntroduction3.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/06/03.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PGIntroduction3: View {
    
    @Namespace var animation
    @EnvironmentObject private var store: PContentStore
    var index: Binding<Int> {
        return $store.currentData.pageIndex
    }
    var indexValue: Int {
        return index.wrappedValue
    }
    
    @State private var step1: Bool = false
    
    let items = [
        TitleSetData(title: "제한된 기능",
                     subtitle: "UIKit, AppKit에 비해 상대적으로 제한된 컴포넌트 제공"),
        TitleSetData(title: "러닝 커브",
                     subtitle: "UIKit 또는 AppKit과는 다르게 새로운 개념과 패러다임을 제공"),
        TitleSetData(title: "문서 및 자료 부족",
                     subtitle: "UIKit이나 AppKit에 비해 문서와 자료가 적음"),
        TitleSetData(title: "배포 대상 제한",
                     subtitle: "SwiftUI는 최소 버전 이상만 지원")]
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .pagingOnKeyboardInput(index: index, maxIndex: 7)
    }
    
    @ViewBuilder
    private func content() -> some View {
        if indexValue < 5 {
            HStack(spacing: 40) {
                ForEach(Array(items.enumerated()), id: \.offset) { idx, item in
                    rowView(item: item, isSelected: isSelected(idx))
                }
            }
            .transition(.opacity)
        } else {
            requirementsView()
                .transition(.move(edge: .trailing).combined(with: .opacity))
        }
    }
    
    private func rowView(item: TitleSetData, isSelected: Bool) -> some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                Spacer()
                if let title = item.title {
                    Text(title)
                        .setFont(sizeType: .description1, weight: .bold)
                        .foregroundColor(isSelected ? Color.pointYellow : Color.white)
                        .overlay(alignment: .bottom) {
                            ZStack {
                                if isSelected {
                                    Rectangle()
                                        .fill(Color.pointYellow)
                                        .matchedGeometryEffect(id: "line", in: animation)
                                        .frame(height: 2)
                                        .offset(y: 8)
                                }
                            }
                        }
                }
                VStack(spacing: 0) {
                    Spacer()
                    Text(item.subtitle)
                        .setFont(sizeType: .description2, weight: .regular)
                        .multilineTextAlignment(.center)
                    Spacer()

                }
            }
            .frame(width: 260, height: 350)
        }
        .frame(width: isSelected ? 280 : 260, height: isSelected ? 370 : 350)
        .clipped()
        .foldedShape(padding: 20, outlineColor: isSelected ? Color.pointYellow : Color.black)
        .opacity(isSelected ? 1 : 0.5)
        .shadow(color: isSelected ? .black.opacity(0.5) : Color.clear, radius: 26)
    }
    
    private func isSelected(_ index: Int) -> Bool {
        return (index + 1) == indexValue
    }
    
    private func requirementsView() -> some View {
        HStack(alignment: .center) {
            Spacer()
            VStack(alignment: .leading) {
                if indexValue >= 6 {
                    Spacer()
                } else if indexValue >= 7 {
                    Spacer()
                    Spacer()
                }
                screen1()
                if indexValue >= 6 {
                    Spacer()
                }
                if indexValue >= 7 {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("지난 4년 동안 도입된 기기의 90%가\niOS 16를 사용.")
                    }
                    .setFont(sizeType: .subtitle2, weight: .semibold)
                    .foregroundColor(Color.primaryLevel2)
                    .transition(.move(edge: .leading).combined(with: .opacity))
                    .onAppear {
                        step1 = true
                    }
                    .onDisappear {
                        step1 = false
                    }
                    Spacer()
                }
            }
            .animation(.easeOut(duration: 0.5), value: step1)
            if indexValue >= 6 {
                Spacer()
                PieChartView(title: "iOS 버전별 사용 현황", percents: [90, 8, 2], names: ["iOS 16", "iOS 15", "이전 버전"], formatter: {value in String(format: "%.0f", value)}, colors: [Color.blue, Color.green, Color.orange, Color.pink, Color.red], backgroundColor: .clear, widthFraction: 0.55, innerRadiusFraction: 0.45)
                    .padding(7.0)
                    .setFont(sizeType: .description3, weight: .semibold)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            }
            Spacer()
        }
    }
    
    private func screen1() -> some View {
        VStack(alignment: .leading) {
            Text("SwiftUI로 개발된 앱을 실행하기 위한 OS별 최소 버전")
                .setFont(sizeType: .description2, weight: .regular)
                .foregroundColor(.level1)
                .padding(.bottom, 20)
            
            Text("● iPhone / iPad iOS 13\n● Mac macOS Catalina 10.15\n● Apple Watch watchOS 6\n● Apple TV tvOS 13") { string in
                string.foregroundColor = Color.white.opacity(0.8)
                if let range = string.range(of: "iOS 13") {
                    string[range].foregroundColor = Color.pointYellow
                }
                if let range = string.range(of: "Catalina 10.15") {
                    string[range].foregroundColor = Color.pointYellow
                }
                if let range = string.range(of: "watchOS 6") {
                    string[range].foregroundColor = Color.pointYellow
                }
                if let range = string.range(of: "tvOS 13") {
                    string[range].foregroundColor = Color.pointYellow
                }
            }
            .fontWeight(.regular)
            .lineSpacing(13)
            .setFont(sizeType: .description2, weight: .regular)
        }
        .titleDivider(title: "OS 버전 요구사항", isShow: true)
        .roundedLine(showLine: true)
        .frame(width: 700)
    }
    
    private func lineView() -> some View {
        Rectangle()
            .fill(Color.black.opacity(0.5))
            .frame(width: 2)
    }
}

private struct TableRow: View {
    
    let title: String
    let description: String
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color.primaryLevel4.opacity(0.5)
                    .frame(height: 80)
                Text(title)
                    .multilineTextAlignment(.center)
                    .setFont(sizeType: .description3, weight: .regular)
                    .foregroundColor(.level2)
                    .padding(7)
            }
            Rectangle()
                .fill(Color.black.opacity(0.5))
                .frame(height: 2)
            ZStack {
                Color.primaryLevel4.opacity(0.2)
                Text(description)
                    .padding()
                    .setFont(sizeType: .caption1, weight: .regular)
                    .foregroundColor(.level3)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct PGIntroduction3_Previews: PreviewProvider {
    static var previews: some View {
        PGIntroduction3()
            .modifier(PreviewModifier())
    }
}
