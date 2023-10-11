//
//  DetailView.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI
import AVKit

struct DetailView: View {
    
    @EnvironmentObject private var store: PContentStore
    @Environment(\.isMainPresentation) private var isMainPresentation: Bool
    @State private var isOnAppear: Bool = false
    
    var body: some View {
        let currentData = store.getData(id: store.currentId) ?? PModel.dummy()
        GeometryReader { geo in
            PContentWarpperView(data: currentData) {
                currentData.view
                    .padding(.horizontal, PADDING_HORIZONTAL)
                    .padding(.vertical, PADDING_VERTICAL)
                    .offset(x: setPositionX(geo: geo))
                    .onAppear {
                        isOnAppear = true
                    }
                    .onDisappear {
                        isOnAppear = false
                    }
            }
            .clipShape(Rectangle())
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .overlay {
            if let fileName = store.videoFileName {
                Color.black
                let player = AVPlayer()
                VideoPlayer(player: player)
                    .onAppear {
                        if let url = Bundle.main.url(forResource: fileName, withExtension: "mov") {
                            player.replaceCurrentItem(with: AVPlayerItem(url: url))
                            if !isMainPresentation {
                                player.volume = 0
                            }
                            player.play()
                        }
                    }
                    .id(UUID())
                    .transition(.opacity)
            }
        }
        .animation(currentData.isAnimationEnabled ? ANIMATION_SPRING_SLIDE : nil, value: isOnAppear)
        .animation(ANIMATION_CONTENT_LEVEL3, value: store.videoFileName)
    }
    
    private func setPositionX(geo: GeometryProxy) -> CGFloat {
        guard store.currentId != 0 else { return 0 }
        switch store.direction {
        case .next:
            return isOnAppear ? 0 : geo.size.width
        case .prev, .same:
            return isOnAppear ? 0 : -geo.size.width
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
            .modifier(PreviewModifier())
    }
}
