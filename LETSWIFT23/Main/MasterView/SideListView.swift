//
//  SideListView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct SideListView: View {
    
    @EnvironmentObject private var store: PContentStore
    
    let timerHeight: CGFloat = 36
    
    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .leading) {
                HStack {
                    sideButton()
                    Spacer()
                    control()
                        .offset(x: store.isShowSideBar ? 0 : -LIST_SIDE_BAR_WIDTH)
                        .opacity(store.isShowSideBar ? 1 : 0)
                        .mask(
                            Rectangle()
                                .frame(width: LIST_SIDE_BAR_WIDTH - 55)
                        )
                        .padding(.trailing)
                }
                .padding(.leading, 20)
                .padding(.top, 16)
                .frame(height: 44)
                
                ZStack(alignment: .leading) {
                    ListIndexView(isIndexView: false, touchable: true)
                        .animation(.easeInOut, value: store.currentId)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(width: LIST_SIDE_BAR_WIDTH)
                        .offset(x: store.isShowSideBar ? 0 : -LIST_SIDE_BAR_WIDTH)
                        .opacity(store.isShowSideBar ? 1 : 0)
                    
                    SideSmallView()
                        .frame(width: MINI_SIDE_BAR_WIDTH)
                        .offset(x: store.isShowSideBar ? -MINI_SIDE_BAR_WIDTH : 0, y: timerHeight / 2)
                }
                Spacer()
                TimerView()
                    .frame(height: 36)
            }
        }
        .background(Color.scripBackgroundLevel2)
        .overlay(alignment: .trailing) {
            HStack(spacing: 0) {
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 1)
                Rectangle()
                    .fill(Color.white.opacity(0.06))
                    .frame(width: 1)
            }
            .frame(width: 2)
            .offset(x: 1)
        }
    }
    
    private func sideButton() -> some View {
        ZStack(alignment: .leading) {
            Color.clear
            Button(action: {
                withAnimation(.easeInOut) {
                    store.isShowSideBar.toggle()
                }
            }, label: {
                Image(systemName: "sidebar.left")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                    .foregroundColor(Color.white)
            })
            .buttonStyle(.plain)
        }
    }
    
    private func control() -> some View {
        HStack(spacing: 5) {
            HotkeyInfoView(title: "", option: "o")
            HotkeyInfoView(title: "", option: "s")
            HotkeyInfoView(title: "", option: "e")
            HotkeyInfoView(title: "", option: "←")
            HotkeyInfoView(title: "", option: "→ｌ⏎")
            HotkeyInfoView(title: "", option: "⌘ 1")
                .padding(.leading, 6)
        }
        .foregroundColor(.level3)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SideListView_Previews: PreviewProvider {
    static var previews: some View {
        SideListView()
            .modifier(PreviewModifier())
    }
}
