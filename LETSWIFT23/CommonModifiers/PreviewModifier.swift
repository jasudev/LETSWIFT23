//
//  PreviewModifier.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/23.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

struct PreviewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
//            .frame(width: MIN_FULLSCREEN_SIZE.width, height: MIN_FULLSCREEN_SIZE.height)
            .environmentObject(PContentStore.shared)
    }
}
